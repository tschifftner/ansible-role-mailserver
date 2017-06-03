SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

REPLACE INTO `admin` (`id`, `username`, `password`, `super`, `active`, `created`, `modified`) VALUES
(1, '{{ mailserver_testadmin_email }}', '{{ mailserver_testadmin_password }}', 1, 1, 'NOW()', 'NOW()');

--
-- Daten für Tabelle `alias`
--

REPLACE INTO `alias` (`id`, `address`, `goto`, `active`, `created`, `modified`, `Domain_id`) VALUES
(1, '{{ mailserver_testuser_username }}@{{ mailserver_testuser_domain }}', '{{ mailserver_testuser_username }}@{{ mailserver_testuser_domain }}', 1, 'NOW()', NULL, 1),
(2, '{{ mailserver_testuser_aliasname }}@{{ mailserver_testuser_domain }}', '{{ mailserver_testuser_username }}@{{ mailserver_testuser_domain }}', 1, 'NOW()', NULL, 1);

--
-- Daten für Tabelle `dbversion`
--

REPLACE INTO `dbversion` (`id`, `version`, `name`, `applied_on`) VALUES
(1, 1, 'Venus', 'NOW()');

--
-- Daten für Tabelle `domain`
--

REPLACE INTO `domain` (`id`, `domain`, `description`, `max_aliases`, `alias_count`, `max_mailboxes`, `mailbox_count`, `max_quota`, `quota`, `transport`, `backupmx`, `active`, `homedir`, `maildir`, `uid`, `gid`, `created`, `modified`) VALUES
(1, '{{ mailserver_testuser_domain }}', '', 0, 0, 0, 1, 0, 0, 'virtual', 0, 1, NULL, NULL, NULL, NULL, 'NOW()', 'NOW()');

--
-- Daten für Tabelle `mailbox`
--

REPLACE INTO `mailbox` (`id`, `username`, `password`, `name`, `alt_email`, `quota`, `local_part`, `active`, `access_restriction`, `sendonly`, `homedir`, `maildir`, `uid`, `gid`, `homedir_size`, `maildir_size`, `size_at`, `delete_pending`, `created`, `modified`, `Domain_id`) VALUES
(1, '{{ mailserver_testuser_username }}@{{ mailserver_testuser_domain }}', '{{ mailserver_testuser_password }}', '{{ mailserver_testuser_username }}', '', 0, '{{ mailserver_testuser_username }}', 1, 'ALL', 0, '{{ mailserver_vmail_dir }}/{{ mailserver_testuser_domain }}/{{ mailserver_testuser_username }}', 'maildir:{{ mailserver_vmail_dir }}/{{ mailserver_testuser_domain }}/{{ mailserver_testuser_username }}/mail:LAYOUT=fs', {{ mailserver_vmail_uid }}, {{ mailserver_vmail_gid }}, NULL, NULL, NULL, 0, 'NOW()', NULL, 1);

SET FOREIGN_KEY_CHECKS=1;
COMMIT;
