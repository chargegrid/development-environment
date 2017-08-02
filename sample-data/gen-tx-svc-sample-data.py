#!/usr/bin/env python

from faker import Faker
from datetime import date, datetime, time, timedelta
import math
import calendar
import itertools
from pytz import timezone
import sys

def generate_tx_insert(tenant_id, evse_ids, day, part=1, division=1):
	amsterdam = timezone('Europe/Amsterdam')
	fake = Faker()
	tx_id = fake.uuid4()
	part_length = 24 // division
	start_hour = (part - 1) * part_length
	end_hour = (part * part_length) - 1
	min_dt = datetime.combine(day, time(start_hour, 0, 0, 0))
	max_dt = datetime.combine(day, time(end_hour, 59, 59, 999999))
	start_dt = amsterdam.localize(fake.date_time_between_dates(min_dt, max_dt))
	end_dt = amsterdam.localize(fake.date_time_between_dates(start_dt, max_dt))
	diff = end_dt - start_dt
	one_hour = timedelta(hours=1)
	total_hours = diff / one_hour
	volume = total_hours * 7.4
	price = total_hours * 2 + 1
	user_id = fake.user_name()
	evse_id = fake.random_element(evse_ids)
	return f"INSERT INTO transactions VALUES ('{tx_id}', '{tenant_id}', '{evse_id}', '{start_dt}', '{end_dt}', {volume}, {price}, '{user_id}');"

def generate_day_of_txes(tenant_id, evse_ids, day):
	fake = Faker()
	dist = {1: 0.5, 2: 0.3, 3: 0.2}
	day_parts = fake.random_element(dist)
	return [generate_tx_insert(tenant_id, evse_ids, day, i + 1, day_parts) for i in range(day_parts)]

def days_of_month(year, month, before_now=True):
	num_days = calendar.monthrange(year, month)[1]
	now = date.today()
	if before_now and now.year == year and now.month == month:
		return (date(year, month, day) for day in range(1, now.day))
	else:
		return (date(year, month, day) for day in range(1, num_days + 1))

def generate_month_of_txes(tenant_id, evse_ids, year, month):
	return itertools.chain.from_iterable(generate_day_of_txes(tenant_id, evse_ids, day) for day in days_of_month(year, month))

def month_year_iter(start_year, start_month, end_year, end_month):
    ym_start= 12 * start_year + start_month - 1
    ym_end= 12 * end_year + end_month
    for ym in range(ym_start, ym_end):
        y, m = divmod( ym, 12 )
        yield y, m + 1

def generate_past_year_txes(tenant_id, evse_ids):
	now = date.today()
	beginning = now.replace(year=(now.year - 1))
	return itertools.chain.from_iterable(generate_month_of_txes(tenant_id, evse_ids, y, m) for y, m in month_year_iter(beginning.year, beginning.month, now.year, now.month))

def generate_evses(country, serial, evse_count):
	splitted = serial.split("-")
	prefix = splitted[0]
	suffix = splitted[1]
	return [f"{country}*{prefix}*E{suffix}*{i}" for i in range(1, evse_count + 1)]
	
tenant_id = "2b563470-d849-408c-84cf-9f4e5ba0b483"
file = "sample-txservice.sql"
evse_ids_1 = generate_evses("NL", "AMP-0001", 5)
evse_ids_2 = generate_evses("NL", "AMP-0002", 5)
evse_ids_3 = generate_evses("NL", "AMP-0003", 5)

boxes = [evse_ids_1, evse_ids_2, evse_ids_3]

with open(file, 'w') as f:
	f.write("delete from transactions;\n\n")
	for idx, evse_ids in enumerate(boxes):
		print(f"Writing transactions for box {idx + 1}")
		for tx in generate_past_year_txes(tenant_id, evse_ids):
			f.write(tx + "\n")
		f.write("\n")
