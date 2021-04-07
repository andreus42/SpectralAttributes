
select * from TestParams
select * from TestTypes
select * from TestSymbols


-- Complete Eval Test Obj
select *, SetID, GroupID, TestID, ParamName, ParamValue
from  EvalTests ET
join TestParams TParam on TParam.ID = ET.ParamID

join TestTypes TT on TT.TypeID = ET.TypeID 
where ParamName = 'TestType'

select FrameTypeID from TestTYpes where TypeID = 1


select * from EvalTests where testID = 1234

select ParamValue from EvalTests
where ParamID = 3
and TestID = 1234

select ParamValue from EvalTests
where ParamID = 3
and TestID = 1236

select ParamName from TestTypes where TypeID = 1

select * from TestTypes

select * from EvalTests
where ParamID = 3

select * from EvalTests

declare @TestID int
set @TestID = 1234


select *, ParamValue from EvalTests
where ParamID = 3

and TestID = @TestID