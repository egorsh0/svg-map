ALTER TABLE `Schedule` ADD INDEX `FKSchedule247577` (`Weekday`), ADD CONSTRAINT `FKSchedule247577` FOREIGN KEY (`Weekday`) REFERENCES `Weekday` (`dayCode`);
ALTER TABLE `Schedule` ADD INDEX `FKSchedule715053` (`Room`), ADD CONSTRAINT `FKSchedule715053` FOREIGN KEY (`Room`) REFERENCES `Room` (`numberHall`);
ALTER TABLE `Schedule` ADD INDEX `FKSchedule265545` (`Period`), ADD CONSTRAINT `FKSchedule265545` FOREIGN KEY (`Period`) REFERENCES `Period` (`numberLesson`);
ALTER TABLE `Schedule` ADD INDEX `FKSchedule63470` (`Teacher`), ADD CONSTRAINT `FKSchedule63470` FOREIGN KEY (`Teacher`) REFERENCES `Teacher` (`teacherCode`);
ALTER TABLE `Schedule` ADD INDEX `FKSchedule517639` (`Group`), ADD CONSTRAINT `FKSchedule517639` FOREIGN KEY (`Group`) REFERENCES `Group` (`numberGroup`);
ALTER TABLE `Schedule` ADD INDEX `FKSchedule459683` (`Subject`), ADD CONSTRAINT `FKSchedule459683` FOREIGN KEY (`Subject`) REFERENCES `Subject` (`subjectCode`);
