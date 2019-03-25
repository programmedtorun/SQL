-- composit index.
-- an index that can be a composit of multiple columns
-- index consists of multiple attributes (limit 16 cols)
--     order of cols in index matter if you wan to partial query.

-- lets look at table dept in sample_staff db.


SELECT
	department_employee_rel.*
FROM `department_employee_rel`
WHERE 1=1
  AND `department_employee_rel`.`department_id` = 3
  /*will not work if comment employee_id out because employee_id is
  the first attribute in the composit index. data are sorted in multiple
  layers/trees. FIRST data are sorted by employee_id, then as soon as
  there are data with the same emp id and different id. if one employee is part
  of 2 depts in different days that will be the 3rd col that is ordered by
  from date and to date.

  there are cases where 5/6 attr in one index makes sense.

  you always must have first attr included - employee_id
  */
  AND `department_employee_rel`.`employee_id` IN (10005, 10006, 10007)
  AND `department_employee_rel`.`from_date` = '1989-09-12'
  AND `department_employee_rel`.`to_date` IS NULL
;

-- ignore INDEX
SELECT *
FROM `salary` IGNORE INDEX (`ak_salary`)
WHERE 1=1
  AND `salary`.`employee_id` = 499998
;

-- use index - very fast
SELECT *
FROM `salary` USE INDEX (`ak_salary`)
WHERE 1=1
  AND `salary`.`employee_id` = 499998
;
