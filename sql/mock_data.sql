\connect postgres;

SET TIME ZONE 'UTC';
-- Company
INSERT INTO company (name, district, province, phone_no, effective_date, expiry_date, created_at, updated_at, created_by, updated_by) VALUES
('AAA Co', 'Bangrak', 'Bangkok', '02-123-4567', '2021-01-01', '2022-01-01', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'system', 'system'),
('BBB Co', 'Bangmod', 'Bangkok', '02-321-5567', '2021-01-01', '2024-01-01', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'system', 'system'),

-- Plans
INSERT INTO plan (description, created_at, updated_at, created_by, updated_by) VALUES
('aaaa', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'system', 'system'),
('bbbb', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'system', 'system'),
('cccc', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'system', 'system');

-- Customers
INSERT INTO customers (company_id, first_name, last_name, plan_id, gender, district, province, preferred_hospital, plan_started_date, created_at, updated_at, created_by, updated_by, loaddt) VALUES
(1, 'Mary',    'One',   1, 'M', 'Wattana',  'Bangkok',    'Rajvithi', '2021-01-01', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'system', 'system','00000000'),
(1, 'Sue',     'Two',   1, 'F', 'Jatujak',  'Bangkok',    'Siriraj',  '2021-01-01', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'system', 'system','00000000'),
(1, 'Luke',    'Three', 2, 'F', 'Mae Sot',  'Tak',        'Rajvithi', '2021-01-01', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'system', 'system','00000000'),
(1, 'Charlie', 'Four',  2, 'M', 'Pak Kret', 'Nonthaburi', 'Rama',     '2021-01-01', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'system', 'system','00000000'),
(1, 'Parker',  'Five',  3, 'M', 'Bangrak',  'Bangkok',    'Siriraj',  '2021-01-01', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'system', 'system','00000000'),
(1, 'John',    'Six',   1, 'F', 'Prawet',   'Bangkok',    'Siriraj',  '2021-01-31', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'system', 'system','00000000'),
(1, 'Susan',   'Seven', 3, 'F', 'Bangna',   'Bangkok',    'Rajvithi', '2021-01-31', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'system', 'system','00000000'),
(1, 'Luke',    'Eight', 2, 'M', 'Bangrak',  'Bangkok',    'Rama',     '2021-01-31', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'system', 'system','00000000'),
(1, 'Luke',    'Eight', 3, 'M', 'Bangrak',  'Bangkok',    'Rama',     '2021-02-01', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'system', 'system','00000000'),
(1, 'Ant',     'Bird',  1, 'M', 'Bangrak',  'Bangkok',    'Rama',     '2021-02-01', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'system', 'system','00000000');