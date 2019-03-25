--functions on indexed columns
-- an index can't be used if you use some function on the indexed col

-- transforming data i.e. with function lower() in this case. will null
-- out the index. the engine will use where. 
SELECT *
FROM `employee`
WHERE 1=1
  AND 'ff-975616' = lower(`employee`.`personal_code`)
;

EXPLAIN SELECT *
FROM `employee`
WHERE 1=1
  AND 'ff-975616' = lower(`employee`.`personal_code`)
;
