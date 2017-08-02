DELETE FROM refresh_tokens;
DELETE FROM permissions_roles;
DELETE FROM users_roles;
DELETE FROM roles;
DELETE FROM users_tenants;
DELETE FROM users;
DELETE FROM tenants;

INSERT INTO tenants (id, name, name_key, description, default_operator_id, is_active) VALUES
  ('2b563470-d849-408c-84cf-9f4e5ba0b483', 'SpaceX', 'spacex', NULL, 'SPX', 'true'),
  ('b8229fdc-cf2c-400a-be6d-65b1ec0da209', 'Tesla', 'tesla', NULL, 'TES', 'true');

-- Daan & Alwik password: 'isuck123'
-- Bram & Hans password: 'test1234'

INSERT INTO users (id, first_name, last_name, email, password, job_title) VALUES
  ('e38fac6a-a9df-485e-8bcf-c4b958ad87c8', 'Daan', 'Debie', 'daan@example.com', 'bcrypt+sha512$b1d0d06a7c60abb07dfd808c89342053$12$cc09f7b08ac458503c32a8a48f0ebff2c5da9286a0619663', 'CEO'),
  ('cd6e9f62-7b5b-46be-892f-9eca8c291496', 'Alwik', 'Tiggelaar', 'alwik@example.com', 'bcrypt+sha512$b1d0d06a7c60abb07dfd808c89342053$12$cc09f7b08ac458503c32a8a48f0ebff2c5da9286a0619663', 'Charge Point Manager - Amsterdam'),
  ('dace15ae-d27b-4ecb-967d-51edc51a66e3', 'Bram', 'Koot', 'bram@example.com', 'bcrypt+sha512$6e1d7d27ff8f7008e1ecd49e73eeabc1$12$7f8c6b42c5bf8cfbaf2f9c65e68f35540e6eb44def22b5f1', 'Charge Point Manager - Rotterdam'),
  ('766f6456-5df9-4b86-94af-e429e0dac5c9', 'Richard', 'Hendricks', 'richard@piedpiper.com', 'bcrypt+sha512$6e1d7d27ff8f7008e1ecd49e73eeabc1$12$7f8c6b42c5bf8cfbaf2f9c65e68f35540e6eb44def22b5f1', 'Goochelaar');

INSERT INTO users_tenants (user_id, tenant_id) VALUES
  ('e38fac6a-a9df-485e-8bcf-c4b958ad87c8', '2b563470-d849-408c-84cf-9f4e5ba0b483'),
  ('cd6e9f62-7b5b-46be-892f-9eca8c291496', '2b563470-d849-408c-84cf-9f4e5ba0b483'),
  ('dace15ae-d27b-4ecb-967d-51edc51a66e3', '2b563470-d849-408c-84cf-9f4e5ba0b483'),
  ('dace15ae-d27b-4ecb-967d-51edc51a66e3', 'b8229fdc-cf2c-400a-be6d-65b1ec0da209'),
  ('766f6456-5df9-4b86-94af-e429e0dac5c9', 'b8229fdc-cf2c-400a-be6d-65b1ec0da209');

INSERT INTO roles (id, tenant_id, name, description) VALUES
  ('1e940049-94f6-4ea8-8161-ae0e875126f6', '2b563470-d849-408c-84cf-9f4e5ba0b483', 'Administrators', 'Cool Administrators'),
  ('e2ffcf04-5abe-4b21-9d87-f76ea0f2ff2f', '2b563470-d849-408c-84cf-9f4e5ba0b483', 'Users', 'Simple Users'),
  ('aa79c5b0-c075-47df-abef-7e9da4db79ef', 'b8229fdc-cf2c-400a-be6d-65b1ec0da209', 'Administrators', 'Fancy Administrators');

INSERT INTO permissions_roles (permission_id, role_id) VALUES
  ('view_tx', 'e2ffcf04-5abe-4b21-9d87-f76ea0f2ff2f'),
  ('view_tx', '1e940049-94f6-4ea8-8161-ae0e875126f6'),
  ('view_users', 'e2ffcf04-5abe-4b21-9d87-f76ea0f2ff2f'),
  ('view_users', '1e940049-94f6-4ea8-8161-ae0e875126f6'),
  ('create_user', '1e940049-94f6-4ea8-8161-ae0e875126f6'),
  ('view_roles', 'e2ffcf04-5abe-4b21-9d87-f76ea0f2ff2f'),
  ('view_roles', '1e940049-94f6-4ea8-8161-ae0e875126f6'),
  ('create_role', '1e940049-94f6-4ea8-8161-ae0e875126f6');

INSERT INTO users_roles (user_id, role_id) VALUES
  ('e38fac6a-a9df-485e-8bcf-c4b958ad87c8', '1e940049-94f6-4ea8-8161-ae0e875126f6'),
  ('e38fac6a-a9df-485e-8bcf-c4b958ad87c8', 'e2ffcf04-5abe-4b21-9d87-f76ea0f2ff2f'),
  ('cd6e9f62-7b5b-46be-892f-9eca8c291496', 'e2ffcf04-5abe-4b21-9d87-f76ea0f2ff2f'),
  ('dace15ae-d27b-4ecb-967d-51edc51a66e3', 'aa79c5b0-c075-47df-abef-7e9da4db79ef');

