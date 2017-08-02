\set TenantId '''2b563470-d849-408c-84cf-9f4e5ba0b483'''

create EXTENSION IF NOT EXISTS "pgcrypto";

delete from policies_evses;
delete from policy_rules;
delete from policies;

INSERT INTO policies VALUES ('b2d344e9-a3ca-4d97-8f56-7dab82a2f633', 'default policy', :TenantId);

INSERT INTO policy_rules VALUES 
  ('03e087a5-6db8-48e0-bcfb-b2528178e2c1', 'b2d344e9-a3ca-4d97-8f56-7dab82a2f633', '2016-10-14 00:00:00', '2016-10-15 00:00:00', '03:00:00', '04:00:00', '{mon,tue,wed,thu,fri,sat,sun}' :: weekday [], 'kwh', 3, 2.6),
  ('cea936ac-b0ce-4655-9af5-be396830de96', 'b2d344e9-a3ca-4d97-8f56-7dab82a2f633', '2016-10-14 00:00:00', '2016-10-15 00:00:00', '00:00:00', '23:59:59', '{mon,tue,wed,sat,sun}' :: weekday [], 'min', 5, 10),
  ('7f3ca139-68d5-471b-9d51-2373bd9c5ac9','b2d344e9-a3ca-4d97-8f56-7dab82a2f633','2016-10-14 00:00:00','2017-10-15 00:00:00','00:00:00','23:59:59','{mon,tue,wed,sat,sun}' :: weekday [],'min',5,1.123);

INSERT INTO policies_evses VALUES
  ('b2d344e9-a3ca-4d97-8f56-7dab82a2f633', 'NL*AMP*E0001*0'),
  ('b2d344e9-a3ca-4d97-8f56-7dab82a2f633', 'NL*AMP*E0001*1'),
  ('b2d344e9-a3ca-4d97-8f56-7dab82a2f633', 'NL*AMP*E0001*2'),
  ('b2d344e9-a3ca-4d97-8f56-7dab82a2f633', 'NL*AMP*E0001*3'),
  ('b2d344e9-a3ca-4d97-8f56-7dab82a2f633', 'NL*AMP*E0001*4'),
  ('b2d344e9-a3ca-4d97-8f56-7dab82a2f633', 'NL*AMP*E0002*0'),
  ('b2d344e9-a3ca-4d97-8f56-7dab82a2f633', 'NL*AMP*E0002*1'),
  ('b2d344e9-a3ca-4d97-8f56-7dab82a2f633', 'NL*AMP*E0002*2'),
  ('b2d344e9-a3ca-4d97-8f56-7dab82a2f633', 'NL*AMP*E0002*3'),
  ('b2d344e9-a3ca-4d97-8f56-7dab82a2f633', 'NL*AMP*E0002*4'),
  ('b2d344e9-a3ca-4d97-8f56-7dab82a2f633', 'NL*AMP*E0003*0'),
  ('b2d344e9-a3ca-4d97-8f56-7dab82a2f633', 'NL*AMP*E0003*1'),
  ('b2d344e9-a3ca-4d97-8f56-7dab82a2f633', 'NL*AMP*E0003*2'),
  ('b2d344e9-a3ca-4d97-8f56-7dab82a2f633', 'NL*AMP*E0003*3'),
  ('b2d344e9-a3ca-4d97-8f56-7dab82a2f633', 'NL*AMP*E0003*4');