-- Unique INDEX

-- Unique index: creates a constraint such that all values in
-- index must be distinct. a unique index permits multiple null vals for
-- cols that can contain null.


-- add 'ak' or 'uk' as a prefex to a unique index name.
-- ak = alternative key
-- ak on personal code. if all employees have unique personal codes

-- dropping unique index on department table
DROP INDEX ak_department on department;

ALTER TABLE `department` ADD INDEX `idx_name` (`name`);
DROP INDEX idx_name on department;
ALTER TABLE `department` ADD INDEX `idx_code` (`code`);
DROP INDEX idx_code on department;
ALTER TABLE `department` ADD UNIQUE INDEX `ak_department` (`name`);

-- advanced techniques. select data from salary table.

SELECT * /* CHECK THE SALARY OF EMPLOYEE WITH ID = 499998 */
FROM salary
WHERE 1=1
  AND employee_id = 499998
  AND from_date = '1993-12-27'
  AND to_date = '1994-12-27'
;


-- run insert statement and insert something new if duplicate key found
-- in ak column.

INSERT INTO salary (employee_id, from_date, to_date, ins_dt, insert_proces_code)
VALUES (499998, '1993-12-27', '1994-12-27', NOW(), 'merge-insert')
-- can update in 1 query if there is a dup entry.
ON DUPLICATE KEY UPDATE
  salary.salary_amount = salary.salary_amount / 10,
  salary.update_process_code = 'merge-123123123123'
;
