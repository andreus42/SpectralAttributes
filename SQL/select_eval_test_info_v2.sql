select * from EvalTests
select * from TestParams
select * from EvalTestSet


-- Complete
select *
from EvalTestSet ETS
join EvalTests ET on ETS.TestID = ET.TestID
join TestParams TParam on TParam.ID = ET.ParamID


-- Complete Eval Test Obj
select SetID, GroupID, ET.TestID, Descritpion, ParamName, ParamValue
from EvalTestSet ETS
join EvalTests ET on ETS.TestID = ET.TestID
join TestParams TParam on TParam.ID = ET.ParamID


