-- ASM
-- 3/17/2021
-- ST PATTIS DAY
-- CREATE TABLE AND DATA FOR TEST TYPES

--	KEYWORD CAPS
--create table TestTypes (
--	ID INT IDENTITY (1,1) NOT NULL,
--	TypeID VARCHAR(32),
--	ParamName VARCHAR(32),
--	FieldTypeID INTEGER;
--)

drop table TestTypes;
go

create table TestTypes (
	ID int identity(1,1) NOT NULL,
	TypeID varchar(32),
	FrameTypeID integer,
	ParamName varchar(32),
);
go


INSERT INTO TestTypes values (0, 0, '');
INSERT INTO TestTypes values (1, 1, 'CWL');
INSERT INTO TestTypes values (2, 1, 'FWHM');
INSERT INTO TestTypes values (3, 1, 'FW @ 10% T-max');
INSERT INTO TestTypes values (4, 1, 'FW @ 10% T-abs');
INSERT INTO TestTypes values (5, 2, 'T-avg');
INSERT INTO TestTypes values (6, 2, 'T-abs');
INSERT INTO TestTypes values (7, 2, 'T-max');
INSERT INTO TestTypes values (8, 4, 'T-abs@');
INSERT INTO TestTypes values (9, 2, 'T-peak');
INSERT INTO TestTypes values (10, 3, 'B-avg');
INSERT INTO TestTypes values (11, 3, 'B-abs');
INSERT INTO TestTypes values (12, 3, 'B-abs@');
INSERT INTO TestTypes values (13, 2, 'R-avg (T-scan)');
INSERT INTO TestTypes values (14, 2, 'R-abs');
INSERT INTO TestTypes values (15, 2, 'R-abs@');
INSERT INTO TestTypes values (16, 2, 'R-avg (r-scan)');
INSERT INTO TestTypes values (17, 2, 'R-abs (r-scan)');
INSERT INTO TestTypes values (18, 4, 'R-max');
INSERT INTO TestTypes values (19, 5, 'R-target');
INSERT INTO TestTypes values (20, 1, 'Cuton');
INSERT INTO TestTypes values (21, 1, 'Cutoff');
INSERT INTO TestTypes values (22, 1, 'Cuton_80-20 ');
INSERT INTO TestTypes values (23, 1, 'Cutoff_80-20');
INSERT INTO TestTypes values (24, 1, 'Ripple SD');
INSERT INTO TestTypes values (25, 6, 'Squareness');
INSERT INTO TestTypes values (26, 7, 'CIE');


select *
from TestTypes;