select * from EvalTests
select * from TestParams
select * from EvalTestSet

select * 
from EvalTestSet
join EvalTests on etsEvalTestGroupID = etTestGroupID
join TestParams on etParamID = tpID
order by etTestNum, etParamID

select etTestGroupID, etTestNum, etsEvalTestGroupName,  tpName, etValue 
from EvalTestSet
join EvalTests on etsEvalTestGroupID = etTestGroupID
join TestParams on etParamID = tpID
where etsRevLogID = 44500
order by etTestNum, etParamID


select etTestGroupID, etTestNum, etsEvalTestGroupName,  tpName, etValue 
from EvalTestSet
join EvalTests on etsEvalTestGroupID = etTestGroupID
join TestParams on etParamID = tpID
where etTestGroupID = 555
order by etTestNum, etParamID

select distinct etTestNum from EvalTests where etTestGroupID = 555

select etTestNum, etsEvalTestGroupName,  tpName, etValue 
from EvalTestSet
join EvalTests on etsEvalTestGroupID = etTestGroupID
join TestParams on etParamID = tpID
where etTestNum = 1234
order by etTestNum, etParamID