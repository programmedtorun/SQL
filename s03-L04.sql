-- Session 3 lesson 4 partial index.
-- instead of indexing the entire last name you might index the first 4 bytes.

ALTER TABLE table_name ADD INDEX (last_name(4))

-- for example if you select on a where condition last_name = 'smith'
-- you will get smitty smiten etc because index is only on first 4 chars.


--ex
ALTER TABLE `sample_ip`.`ip_address_varchar20` DROP INDEX `idx_ip_address_3chars`;
ALTER TABLE `sample_ip`.`ip_address_varchar20` DROP INDEX `idx_ip_address_7chars`;
ALTER TABLE `sample_ip`.`ip_address_varchar20` DROP INDEX `idx_ip_address_all_chars`;

-- first 3 characters create index
CREATE INDEX idx_ip_address_3chars ON sample_ip.ip_address_varchar20 (ip_address(3));

-- first 7 characters create index
CREATE INDEX idx_ip_address_7chars ON sample_ip.ip_address_varchar20 (ip_address(7));

-- all characters create index
CREATE INDEX idx_ip_address_all_chars ON sample_ip.ip_address_varchar20 (ip_address);

-- cardniality of index if high means the data are really granular.
-- if cardniality is low it means data are pretty much the same.
-- cardinaliry on PRIMARY key is the highest because there are no two same
-- values so the cardinality shows basically # of rows in table.

-- see differences in performance.....
SELECT *
FROM `sample_ip`.`ip_address_varchar20` IGNORE INDEX
(`idx_ip_address_3chars`) IGNORE INDEX (`idx_ip_address_7chars`) IGNORE INDEX
(`idx_ip_address_all_chars`)
WHERE 1=1
AND `ip_address_varchar20`.`ip_address` = '123.194.160.219'
;
-- Execution time: 4 seconds
SELECT *
FROM `sample_ip`.`ip_address_varchar20` USE INDEX (`idx_ip_address_3chars`)
WHERE 1=1
AND `ip_address_varchar20`.`ip_address` = '123.194.160.219'
;
-- Execution time: 40ms
SELECT *
FROM `sample_ip`.`ip_address_varchar20` USE INDEX (`idx_ip_address_7chars`)
WHERE 1=1
AND `ip_address_varchar20`.`ip_address` = '123.194.160.219'
;
-- Execution time: 1ms
SELECT *
FROM `sample_ip`.`ip_address_varchar20` USE INDEX
(`idx_ip_address_all_chars`)
WHERE 1=1
AND `ip_address_varchar20`.`ip_address` = '123.194.160.219'
;
