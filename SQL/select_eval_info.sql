select * from TestParams
select * from EvalTests
select * from EvalTestSet


declare @setID int = 100
select SetID, GroupID, ET.TestID, Descritpion, ParamName, ParamValue
from EvalTestSet ETS
left join EvalTests ET on ETS.TestID = ET.TestID
left join TestParams TParam on TParam.ID = ET.ParamID
where SetID = @setID

--TestSetObj (Create Group List)
declare @setID int = 100
select distinct GroupID, Descritpion, TestID from EvalTestSet ETS where SetID = @SetID

select ET.TestID, ParamName, ParamValue
from EvalTests ET
left join TestParams TParam on TParam.ID = ET.ParamID
where TestID in (1234, 1235, 1236, 1237, 1238, 1239, 1240, 1241)



declare @setID int = 100
select distinct GroupID
from EvalTestSet ETS where SetID = @SetID

declare @groupID int = 555
select distinct TestID
from EvalTestSet ETS 
where GroupID = @GroupID

declare @TestID int = 1234
select ParamID, ParamValue
from EvalTests
where TestID = @TestID

select ParamID, ParamValue 
from EvalTests where TestID = @TestID

select ParamValue from EvalTests 
where TestID = 1234
and ParamID = 1

select ET.TestID, ParamName, ParamValue
from EvalTests ET
left join TestParams TParam on TParam.ID = ET.ParamID
where TestID in (1238)