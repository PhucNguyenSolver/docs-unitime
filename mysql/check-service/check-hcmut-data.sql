USE register_course_check;

INSERT INTO `course` (`id`, `course_name`, `num_credits`, `faculty`) VALUES
  ('ALG', 'Algebra', 3, 'Demo'),
  ('BAND', 'Band', 3, 'Demo'),
  ('BIOL', 'Biology', 3, 'Demo'),
  ('C S', 'Computer Science', 3, 'Demo'),
  ('CALC', 'Calculus', 3, 'Demo'),
  ('CHIN', 'Chinese', 3, 'Demo'),
  ('CHM', 'Chemistry', 3, 'Demo'),
  ('CO1', 'AAA', 3, 'MT'),
  ('CO2', 'BBB', 4, 'HH'),
  ('CO3', 'CCC', 5, 'MT'),
  ('CO4', 'DDD', 3, 'CK'),
  ('CO5', 'New', 2, 'MT'),
  ('CO6', 'Test', 3, 'MT'),
  ('COM', 'Communications', 3, 'Demo'),
  ('ECON', 'Economics', 3, 'Demo'),
  ('ENGL', 'English', 3, 'Demo'),
  ('ENGR', 'Engineering', 3, 'Demo'),
  ('GER', 'German', 3, 'Demo'),
  ('HIST', 'History', 3, 'Demo'),
  ('LING', 'Linguistics', 3, 'Demo'),
  ('MBIO', 'Microbiology', 3, 'Demo'),
  ('PHAR', 'Pharmacy', 3, 'Demo'),
  ('PHIL', 'Philosophy', 3, 'Demo'),
  ('PHYS', 'Physics', 3, 'Demo'),
  ('POL', 'Political Science', 3, 'Demo'),
  ('PSY', 'Psychology', 3, 'Demo'),
  ('SOC', 'Solciology', 3, 'Demo'),
  ('SPAN', 'Spanish', 3, 'Demo'),
  ('test', 'test', 3, 'Demo'),
  ('test1', 'test1', 3, 'Demo');


INSERT INTO `course_condition` (`id`, `course_id`, `course_condition`) VALUES
(105, 'C S', '{\"course\": {\"type\": 1, \"courseDesId\": \"ENGL\"}}'),
(106, 'ENGR', '{\"course\": {\"type\": 1, \"courseDesId\": \"GER\"}}'),
(107, 'PHYS', '{\"course\": {\"type\": 1, \"courseDesId\": \"SPAN\"}}'),
(108, 'BIOL', '{\"course\": {\"type\": 2, \"courseDesId\": \"CHM\"}}'),
(109, 'MBIO', '{\"course\": {\"type\": 2, \"courseDesId\": \"BIOL\"}}'),
(110, 'ALG', '{\"course\": {\"type\": 3, \"courseDesId\": \"CALC\"}}'),
(111, 'CALC', '{\"course\": {\"type\": 3, \"courseDesId\": \"ALG\"}}'),
(112, 'COM', '{\"op\": \"OR\", \"leaves\": [{\"course\": {\"type\": 1, \"courseDesId\": \"ENGL\"}}, {\"course\": {\"type\": 1, \"courseDesId\": \"GER\"}}, {\"op\": \"AND\", \"leaves\": [{\"course\": {\"type\": 1, \"courseDesId\": \"SPAN\"}}, {\"course\": {\"type\": 1, \"courseDesId\": \"CHIN\"}}]}]}'),
(113, 'PHAR', '{\"op\": \"AND\", \"leaves\": [{\"course\": {\"type\": 1, \"courseDesId\": \"CHM\"}}, {\"course\": {\"type\": 1, \"courseDesId\": \"BIOL\"}}]}'),
(114, 'test', '{\"course\": {\"type\": 1, \"courseDesId\": \"ENGL\"}}'),
(115, 'test1', '{\"op\": \"OR\", \"leaves\": [{\"course\": {\"type\": 1, \"courseDesId\": \"ENGL\"}}, {\"course\": {\"type\": 1, \"courseDesId\": \"GER\"}}, {\"op\": \"AND\", \"leaves\": [{\"course\": {\"type\": 1, \"courseDesId\": \"SPAN\"}}, {\"course\": {\"type\": 1, \"courseDesId\": \"CHIN\"}}]}]}');

INSERT INTO `min_max_credit` (`id`, `academic_program`, `semester`, `min_credit`, `max_credit`) VALUES
(1, 'DT', 191, 14, 21),
(2, 'CLC', 191, 12, 22);

INSERT INTO `teaching_plan` (`id`, `faculty`, `speciality`, `academic_program`, `semester_order`, `course_list`, `free_credit_info`) VALUES
(1, 'KHMT', 'KHM', 'DT', 3, '[\"C S\", \"CALC\"]', '[\n  {\n    \"nums\": 3,\n    \"group\": \"C\"\n  },\n  {\n    \"nums\": 6,\n    \"group\": \"D\"\n  }\n]');


INSERT INTO `white_list` (`id`, `student_id`, `semester`, `min_credit`, `max_credit`, `description`) VALUES
(1, '1915983', 191, 1, 20, 'test'),
(2, '1915983', 192, 4, 15, NULL);