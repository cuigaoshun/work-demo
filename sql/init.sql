CREATE TABLE IF NOT EXISTS `users` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `works` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `user_id` BIGINT NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `users` (`id`, `name`)
VALUES (1, 'Alice')
ON DUPLICATE KEY UPDATE `name` = VALUES(`name`);

INSERT INTO `works` (`id`, `name`, `user_id`)
VALUES (1, 'First work', 1)
ON DUPLICATE KEY UPDATE
    `name` = VALUES(`name`),
    `user_id` = VALUES(`user_id`);
