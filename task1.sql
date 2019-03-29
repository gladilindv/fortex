CREATE TABLE IF NOT EXISTS `evts` (
  `RecordID` int(6) unsigned NOT NULL,
  `Date` DATE NOT NULL,
  `Time` TIME NOT NULL,
  `EventID` int(6) unsigned NOT NULL,
  `UserID` int(6) unsigned NOT NULL,
  `ClientID` int(6) unsigned NOT NULL,
  PRIMARY KEY (`RecordID`)
) DEFAULT CHARSET=utf8;

INSERT INTO `evts` (`RecordID`, `Date`, `Time`,`EventID`, `UserID`, `ClientID`) VALUES
  (1, '2019-02-01', '15:00', 2, 100, 5),
  (2, '2019-02-01', '17:00', 2, 150, 5),
  (3, '2019-02-05', '12:00', 2, 200, 5),
  (4, '2019-02-05', '15:00', 3, 100, 5),
  (5, '2019-02-06', '15:00', 2, 200, 5);
  
  
  
select UserId, min(Date) DateStart, max(Date) DateEnd, max(Date)-min(Date)+1 Days 
from `evts` 
where EventID=2 
group by UserID, ClientID 
order by UserID;
