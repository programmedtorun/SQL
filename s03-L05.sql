-- index hints.
-- multiple index hints can be a part of sql query. update. select. delete.
-- use INDEX
-- force index
-- ignore index
-- focus just on use and ignor index

EXPLAIN SELECT *
FROM `sample_staff`.`salary` IGNORE INDEX (`ak_salary`) IGNORE INDEX (`idx_employee_id`)
WHERE 1=1
  AND `salary`.`employee_id` = 499997
  AND `salary`.`from_date` = '1993-12-27'
  AND `salary`.`to_date` = '1994-12-27'
;

-- Add a new index
EXPLAIN SELECT * /* Check the salary of employee with ID = 499998 */
FROM `sample_staff`.`salary` USE INDEX (`ak_salary`)
WHERE 1=1
AND `salary`.`employee_id` = 499998
AND `salary`.`from_date` = '1993-12-27'
AND `salary`.`to_date` = '1994-12-27'
;


EXPLAIN SELECT * /* Check the salary of employee with ID = 499998 */
FROM `sample_staff`.`salary` USE INDEX (`idx_employee_id`)
WHERE 1=1
AND `salary`.`employee_id` = 499997
AND `salary`.`from_date` = '1993-12-27'
AND `salary`.`to_date` = '1994-12-27'
;
