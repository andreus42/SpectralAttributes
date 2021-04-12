-- ASM
-- 4-10-2021 "Mom's Birhtday"
-- CREATE TABLE AND DATA FOR TEST TYPES

drop table EvalTestGroups;
go

create table EvalTestGroups (
	ID int identity(1,1) NOT NULL,
	GroupID int,
	GroupNum int,
	SetID int
);
go


INSERT INTO EvalTestGroups values (555, 1, 1)
INSERT INTO EvalTestGroups values (556, 2, 1)
INSERT INTO EvalTestGroups values (557, 3, 1)
INSERT INTO EvalTestGroups values (558, 1, 2)
INSERT INTO EvalTestGroups values (559, 2, 2)
INSERT INTO EvalTestGroups values (560, 3, 2)


select *
from EvalTestGroups;

