/* Make sure to create this table in a database that you will remember */
CREATE TABLE `main` (
	`id` VARCHAR(50) NULL DEFAULT NULL,
	`name` VARCHAR(50) NULL DEFAULT NULL,
	`args` VARCHAR(255) NULL DEFAULT NULL
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;