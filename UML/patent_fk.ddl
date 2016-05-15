ALTER TABLE `Schedule` DROP FOREIGN KEY `FKSchedule715053`;
ALTER TABLE `Schedule` ADD INDEX `FKSchedule871686` (`RoomcodeHall`), ADD CONSTRAINT `FKSchedule871686` FOREIGN KEY (`RoomcodeHall`) REFERENCES `Room` (`codeHall`);
