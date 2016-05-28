ALTER TABLE `Schedule` 
  DROP COLUMN `room`;
ALTER TABLE `room` 
  modify column numberHall int(10) NOT NULL;
ALTER TABLE `room` 
  DROP PRIMARY KEY;
ALTER TABLE `Room` 
  ADD COLUMN `codeHall` int(10) NOT NULL;
ALTER TABLE `Room` 
  ADD PRIMARY KEY(`codeHall`);
ALTER TABLE `Room` 
  modify column codeHall int(10) NOT NULL AUTO_INCREMENT;
ALTER TABLE `Schedule` 
  ADD COLUMN `RoomcodeHall` int(10);
