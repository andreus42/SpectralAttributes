-- ASM
-- 4-12-2021 
-- CREATE TABLE AND DATA FOR TEST Sets

drop table EvalSet;
go

create table EvalSet (
	ID int identity(1,1) NOT NULL,
	SetID int,
	GroupNum int,
	TestID int
);
go


INSERT INTO EvalSet values (101, 555, 1232)
INSERT INTO EvalSet values (101, 555, 1233)
INSERT INTO EvalSet values (101, 555, 1234)
INSERT INTO EvalSet values (101, 555, 1235)
INSERT INTO EvalSet values (101, 555, 1236)
INSERT INTO EvalSet values (101, 556, 1237)
INSERT INTO EvalSet values (101, 556, 1238)
INSERT INTO EvalSet values (101, 556, 1239)
INSERT INTO EvalSet values (101, 557, 1240)
INSERT INTO EvalSet values (102, 557, 1241)
INSERT INTO EvalSet values (102, 558, 1242)
INSERT INTO EvalSet values (102, 568, 1243)
INSERT INTO EvalSet values (102, 559, 1244)
INSERT INTO EvalSet values (102, 559, 1245)
INSERT INTO EvalSet values (102, 560, 1246)
INSERT INTO EvalSet values (102, 560, 1247)



select *
from EvalSet;

