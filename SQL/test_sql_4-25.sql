--alter table EvalTests add Rank integer;

select * from EvalTests
order by rank

select distinct TestID, [rank]
from EvalTests where GroupID = 44
order by [Rank]

delete from EvalTests
delete from EvalGroups

select * from EvalTests
select * from EvalTestTypes
select * from EvalTestParams
select * from EvalGroups

--// Select test type query
select *
from EvalTests ET
join EvalTestParams ETP on ETP.ID = ET.ParamID 
join EvalTestTypes ETT on ETT.TypeID = ET.ParamValue
where ETP.ParamName = 'TestType'
order by TestID
--join EvalTestTypes ETT on ETT.TypeID = 

SELECT *
FROM EvalGroups WHERE SetID = 2
ORDER BY GroupID, GroupNum

select distinct TestID, [rank]
from EvalTests where GroupID = 2
order by [Rank]

select FrameTypeID, ParamName from EvalTestTypes where TypeID = 1