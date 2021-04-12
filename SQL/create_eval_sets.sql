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


INSERT INTO EvalSet values (100, 555, 1232)
INSERT INTO EvalSet values (100, 555, 1234)
INSERT INTO EvalSet values (100, 555, 1235)
INSERT INTO EvalSet values (100, 555, 1236)
INSERT INTO EvalSet values (100, 556, 1237)
INSERT INTO EvalSet values (100, 556, 1238)
INSERT INTO EvalSet values (100, 556, 1239)
INSERT INTO EvalSet values (100, 557, 1240)
INSERT INTO EvalSet values (100, 558, 1241)
INSERT INTO EvalSet values (102, 559, 1241)
INSERT INTO EvalSet values (102, 560, 1241)



select *
from EvalSet;

