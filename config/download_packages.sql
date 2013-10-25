CREATE TABLE IF NOT EXISTS `download_packages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(15) NOT NULL COMMENT 'downloader ip address',
  `package_file` varchar(255) NOT NULL COMMENT 'filename of package downloaded',
  `created` datetime NOT NULL COMMENT 'creation time',
  PRIMARY KEY (`id`),
  KEY `object_id` (`object_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='track downloaded packages';