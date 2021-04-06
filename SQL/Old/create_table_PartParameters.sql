-- ASM
-- Create table script
-- Add actual test values to Eval Tests


--drop table PartParameters 
--create table PartParameters (
--	ppID int IDENTITY (1,1) NOT NULL,
--	ppParameter varchar(32),
--	ppType int, --Test, Val, Tol
--	CONSTRAINT PK_PartParameters_ppID PRIMARY KEY CLUSTERED (ppID)
--)

---- Test Set: Rev 1000, Test 1
--INSERT INTO PartParameters values ('T-avg', 1);
--INSERT INTO PartParameters values ('T-abs', 1);
--INSERT INTO PartParameters values ('R-avg', 1);
--INSERT INTO PartParameters values ('R-abs', 1);
--INSERT INTO PartParameters values ('B-avg', 1);
--INSERT INTO PartParameters values ('B-abs', 1);

INSERT INTO PartParameters values ('T-abs-At', 2)
INSERT INTO PartParameters values ('R-abs-At', 2);

select * from PartParameters-- where ppType = 1


