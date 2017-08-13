\set TenantId '''2b563470-d849-408c-84cf-9f4e5ba0b483'''

create EXTENSION IF NOT EXISTS "pgcrypto";

delete from sockets;
delete from evses;
delete from charge_boxes_groups;
delete from charge_boxes;
delete from groups;

insert into charge_boxes(id, tenant_id, serial, gps_lat, gps_lon, address_line_1, city, country_iso) VALUES
  ('993EBF4F-2C7D-4C0A-B144-A7B353B6E012', :TenantId, 'SPX-0001', 51.9190505, 4.471048, 'Van Oldenbarneveltstraat 125c', 'Rotterdam', 'NLD'),
  ('AAD7B2B4-C6E4-4276-B9B8-B0189579A4C2', :TenantId, 'SPX-0002', 51.9198782, 4.4754869, 'Schouwburgplein 101', 'Rotterdam', 'NLD'),
  ('D37BC4CF-54DB-4C63-9D31-923B64E4CD3C', :TenantId, 'SPX-0003', 51.9198782, 4.4754869, 'Lijnbaan 100', 'Rotterdam', 'NLD');

insert into groups(id, tenant_id, name, description) VALUES
  ('F3513513-67CE-4BC1-9EEB-95CEEA3CC5F8', :TenantId, 'Rotterdam', null),
  ('DBDFA6E3-FDDE-4876-B5DB-59AC866F3963', :TenantId, 'Hague', null);

insert into charge_boxes_groups(charge_box_id, group_id) VALUES
  ('993EBF4F-2C7D-4C0A-B144-A7B353B6E012', 'F3513513-67CE-4BC1-9EEB-95CEEA3CC5F8'),
  ('AAD7B2B4-C6E4-4276-B9B8-B0189579A4C2', 'F3513513-67CE-4BC1-9EEB-95CEEA3CC5F8'),
  ('D37BC4CF-54DB-4C63-9D31-923B64E4CD3C', 'F3513513-67CE-4BC1-9EEB-95CEEA3CC5F8');

insert into evses(id, tenant_id, connector_id, charge_box_id, current_type, max_power_watts) VALUES
  ('NL*SPX*E0001*1', :TenantId, 1, '993EBF4F-2C7D-4C0A-B144-A7B353B6E012', 'AC', 3700),
  ('NL*SPX*E0001*2', :TenantId, 2, '993EBF4F-2C7D-4C0A-B144-A7B353B6E012', 'AC', 5000),
  ('NL*SPX*E0001*3', :TenantId, 3, '993EBF4F-2C7D-4C0A-B144-A7B353B6E012', 'DC', 1000),
  ('NL*SPX*E0001*4', :TenantId, 4, '993EBF4F-2C7D-4C0A-B144-A7B353B6E012', 'DC', 1500),
  ('NL*SPX*E0001*5', :TenantId, 5, '993EBF4F-2C7D-4C0A-B144-A7B353B6E012', 'AC', 1500),
  ('NL*SPX*E0002*1', :TenantId, 1, 'AAD7B2B4-C6E4-4276-B9B8-B0189579A4C2', 'AC', 5000),
  ('NL*SPX*E0002*2', :TenantId, 2, 'AAD7B2B4-C6E4-4276-B9B8-B0189579A4C2', 'DC', 4000),
  ('NL*SPX*E0002*3', :TenantId, 3, 'AAD7B2B4-C6E4-4276-B9B8-B0189579A4C2', 'DC', 4000),
  ('NL*SPX*E0002*4', :TenantId, 4, 'AAD7B2B4-C6E4-4276-B9B8-B0189579A4C2', 'AC', 4000),
  ('NL*SPX*E0002*5', :TenantId, 5, 'AAD7B2B4-C6E4-4276-B9B8-B0189579A4C2', 'AC', 4000),
  ('NL*SPX*E0003*1', :TenantId, 1, 'D37BC4CF-54DB-4C63-9D31-923B64E4CD3C', 'AC', 4000),
  ('NL*SPX*E0003*2', :TenantId, 2, 'D37BC4CF-54DB-4C63-9D31-923B64E4CD3C', 'AC', 4000),
  ('NL*SPX*E0003*3', :TenantId, 3, 'D37BC4CF-54DB-4C63-9D31-923B64E4CD3C', 'AC', 4000),
  ('NL*SPX*E0003*4', :TenantId, 4, 'D37BC4CF-54DB-4C63-9D31-923B64E4CD3C', 'AC', 4000),
  ('NL*SPX*E0003*5', :TenantId, 5, 'D37BC4CF-54DB-4C63-9D31-923B64E4CD3C', 'AC', 4000);

insert into sockets(evse_id, tenant_id, type_id, cable_attached, max_power_watts) VALUES
  ('NL*SPX*E0001*1', :TenantId, 'CHAdeMO', false, null),
  ('NL*SPX*E0001*1', :TenantId, 'Type2', true, 1000),
  ('NL*SPX*E0001*2', :TenantId, 'Type2', false, null),
  ('NL*SPX*E0001*3', :TenantId, 'CHAdeMO', false, null),
  ('NL*SPX*E0001*4', :TenantId, 'Type2', true, null),
  ('NL*SPX*E0001*5', :TenantId, 'CHAdeMO', false, null),
  ('NL*SPX*E0002*1', :TenantId, 'CHAdeMO', false, null),
  ('NL*SPX*E0002*2', :TenantId, 'CHAdeMO', false, null),
  ('NL*SPX*E0002*3', :TenantId, 'CHAdeMO', false, null),
  ('NL*SPX*E0002*4', :TenantId, 'CHAdeMO', false, null),
  ('NL*SPX*E0002*5', :TenantId, 'CHAdeMO', false, null),
  ('NL*SPX*E0003*1', :TenantId, 'CHAdeMO', false, null),
  ('NL*SPX*E0003*2', :TenantId, 'CHAdeMO', false, null),
  ('NL*SPX*E0003*3', :TenantId, 'CHAdeMO', false, null),
  ('NL*SPX*E0003*4', :TenantId, 'CHAdeMO', false, null),
  ('NL*SPX*E0003*5', :TenantId, 'CHAdeMO', false, null);
