CREATE TABLE Weekday (dayCode int(10) NOT NULL AUTO_INCREMENT, dayName varchar(10), parity int(1), PRIMARY KEY (dayCode), INDEX (dayCode));
CREATE TABLE Room (numberHall int(10) NOT NULL AUTO_INCREMENT, nameHall varchar(10), PRIMARY KEY (numberHall));
CREATE TABLE Period (numberLesson int(10) NOT NULL AUTO_INCREMENT, start timestamp NULL, `end` timestamp NULL, PRIMARY KEY (numberLesson));
CREATE TABLE Teacher (teacherCode int(10) NOT NULL AUTO_INCREMENT, surname varchar(10), name varchar(10), patronymic varchar(10), PRIMARY KEY (teacherCode));
CREATE TABLE `Group` (numberGroup int(10) NOT NULL AUTO_INCREMENT, department varchar(10), course int(1), PRIMARY KEY (numberGroup));
CREATE TABLE Subject (subjectCode int(10) NOT NULL AUTO_INCREMENT, nameSubject varchar(10), PRIMARY KEY (subjectCode));
CREATE TABLE Schedule (scheduleCode int(10) NOT NULL AUTO_INCREMENT, Weekday int(10), Room int(10), Period int(10), Teacher int(10), `Group` int(10), Subject int(10), PRIMARY KEY (scheduleCode));
CREATE TABLE Weekday2 (dayCode int(10) NOT NULL AUTO_INCREMENT, dayName int(10), parity int(1), PRIMARY KEY (dayCode), INDEX (dayCode));
CREATE TABLE lectureHall2 (numberHall int(10) NOT NULL AUTO_INCREMENT, nameHall varchar(10), SchedulescheduleCode int(10) NOT NULL, PRIMARY KEY (numberHall));
CREATE TABLE Period2 (numberLesson int(10) NOT NULL AUTO_INCREMENT, start int(10), `end` int(10), PRIMARY KEY (numberLesson));
CREATE TABLE Teacher2 (teacherCode int(10) NOT NULL AUTO_INCREMENT, surname varchar(10), name varchar(10), patronymic varchar(10), PRIMARY KEY (teacherCode));
CREATE TABLE Group2 (numberGroup int(10) NOT NULL AUTO_INCREMENT, department varchar(10), course int(1), PRIMARY KEY (numberGroup));
CREATE TABLE Subject2 (subjectCode int(10) NOT NULL AUTO_INCREMENT, nameSubject varchar(10), PRIMARY KEY (subjectCode));
CREATE TABLE Schedule2 (scheduleCode int(10) NOT NULL AUTO_INCREMENT, WeekdayCode int(10), lectureHallnumberHall int(10), PeriodnumberLesson int(10), TeacherteacherCode int(10), GroupnumberGroup int(10), SubjectsubjectCode int(10), PRIMARY KEY (scheduleCode));
ALTER TABLE Schedule ADD INDEX FKSchedule247577 (Weekday), ADD CONSTRAINT FKSchedule247577 FOREIGN KEY (Weekday) REFERENCES Weekday (dayCode);
ALTER TABLE Schedule ADD INDEX FKSchedule715053 (Room), ADD CONSTRAINT FKSchedule715053 FOREIGN KEY (Room) REFERENCES Room (numberHall);
ALTER TABLE Schedule ADD INDEX FKSchedule265545 (Period), ADD CONSTRAINT FKSchedule265545 FOREIGN KEY (Period) REFERENCES Period (numberLesson);
ALTER TABLE Schedule ADD INDEX FKSchedule63470 (Teacher), ADD CONSTRAINT FKSchedule63470 FOREIGN KEY (Teacher) REFERENCES Teacher (teacherCode);
ALTER TABLE Schedule ADD INDEX FKSchedule517639 (`Group`), ADD CONSTRAINT FKSchedule517639 FOREIGN KEY (`Group`) REFERENCES `Group` (numberGroup);
ALTER TABLE Schedule ADD INDEX FKSchedule459683 (Subject), ADD CONSTRAINT FKSchedule459683 FOREIGN KEY (Subject) REFERENCES Subject (subjectCode);
