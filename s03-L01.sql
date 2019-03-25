-- Drop the index, if exists in the table
ALTER TABLE `salary` DROP INDEX `idx_salary_amount`;

-- Select without an index takes 2-3 seconds
SELECT *
FROM `sample_staff`.`salary`
WHERE 1=1
  AND `salary`.`salary_amount` > 190000
  AND `salary`.`from_date` >= '1998-01-01'
LIMIT 100
;


-- Add a new table index
-- naming convention - index name is idx and then _column_name
ALTER TABLE `salary` ADD INDEX `idx_salary_amount` (`salary_amount`);


-- Dropping index on department table
DROP INDEX ak_department on department;

ALTER TABLE `department` ADD INDEX `idx_name` (`name`);
ALTER TABLE `department` ADD INDEX `idx_code` (`code`);
ALTER TABLE `department` ADD UNIQUE INDEX `ak_department` (`name`);
