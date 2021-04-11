-- ASM
-- 4-10-2021 "Mom's Birhtday"
-- CREATE TABLE AND DATA FOR TEST TYPES

drop table EvalTestGroup;
go

create table EvalTestGroup (
	ID int identity(1,1) NOT NULL,
	GroupID int,
	SetID int,
	Description VARCHAR(16)
);
go


INSERT INTO EvalTestGroup values 


select *
from EvalTestGroup;