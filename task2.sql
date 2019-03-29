-- job contest gladilindv

CREATE TABLE IF NOT EXISTS `buildings` (
  `BuildID` int(6) unsigned NOT NULL,
  `Address` varchar(50) NOT NULL,
  PRIMARY KEY (`BuildID`)
) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `persons` (
  `PersonID` int(6) unsigned NOT NULL,
  `Name` varchar(50) NOT NULL,
  `BuildID` int(6) unsigned NOT NULL,
  PRIMARY KEY (`PersonID`),
  FOREIGN KEY (`BuildID`) REFERENCES `buildings` (`BuildID`)
) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `contacts` (
  `ContactID` int(6) unsigned NOT NULL,
  `PersonID` int(6) unsigned NOT NULL,
  `Contact` varchar(12) NOT NULL,
  PRIMARY KEY (`ContactID`),
  FOREIGN KEY (`PersonID`) REFERENCES `persons` (`PersonID`)
) DEFAULT CHARSET=utf8;

INSERT INTO `buildings` (`BuildID`, `Address`) VALUES
  (101, 'Тестовская, 11'), (102, 'Протестовская, 18')
  , (103, 'Мультитестовская, 42')
  ;
  
INSERT INTO `persons` (`PersonID`, `Name`, `BuildID`) VALUES
  (10, 'Иван Петров', 101), (20, 'Администратор 1', 102)
  , (30, 'Администратор 2', 102)
  , (40, 'Администратор 3', 102)
  , (50, 'Администратор 4', 103)
  , (60, 'Петя Иванов', 101)
  ;
  
INSERT INTO `contacts` (`ContactID`, `PersonID`, `Contact`) VALUES
  (15, 10, '901-23456789'), (25, 20, '901-23456789')
  , (35, 30, '901-23456788')
  , (45, 20, '901-23456788')
  , (55, 40, '901-23456790')
  , (65, 50, '901-23456790')
  , (75, 60, '901-23456789')
  , (85, 60, '901-23456788')
  ;
  
  
select b.BuildID, c.Contact
from buildings b, persons p, contacts c 
where p.PersonID=c.PersonID and b.BuildID=p.BuildID
group by b.BuildID, Contact
having c.Contact not in (
  -- get unique contacts
  select * from (
  select c.Contact
  from buildings b, persons p, contacts c 
  where p.PersonID=c.PersonID and b.BuildID=p.BuildID
  group by b.BuildID, Contact
  ) a group by Contact
  having count(*) = 1
)
