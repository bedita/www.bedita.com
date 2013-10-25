CREATE TABLE `download_packages` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `object_id` INTEGER UNSIGNED NOT NULL,
  `ip_address` VARCHAR(15) NOT NULL COMMENT 'downloader ip address',
  `package_file` VARCHAR( 255 ) NOT NULL COMMENT 'filename of package downloaded',
  `created` datetime NOT NULL COMMENT 'creation time',
  PRIMARY KEY (`id` ) ,
  INDEX (`object_id`)
) ENGINE = InnoDB CHARACTER SET utf8 COMMENT = 'track downloaded packages';