SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

REPLACE INTO `domains` (`id`, `domain`)
VALUES (1, '{{ mailserver_testuser_domain }}');


REPLACE INTO `accounts` (`id`, `username`, `domain`, `password`, `quota`, `enabled`, `sendonly`)
VALUES (1, '{{ mailserver_testuser_username }}', '{{ mailserver_testuser_domain }}', '{{ mailserver_testuser_username }}', 2048, 1, 0);


REPLACE INTO `aliases` (`id`, `source_username`, `source_domain`, `destination_username`, `destination_domain`, `enabled`)
VALUES (1, '{{ mailserver_testuser_aliasname }}', '{{ mailserver_testuser_domain }}', '{{ mailserver_testuser_username }}', '{{ mailserver_testuser_domain }}', 1);

SET FOREIGN_KEY_CHECKS=1;
COMMIT;
