drop table EvalTestSet
create table EvalTestSet (
	ID INT IDENTITY (1,1) NOT NULL,
	SetID INT,
	GroupID INT,
	TestID INT,
	Descritpion VARCHAR(32)
)


--Test Set 100, Groups 555, 556, 557, Tests, 1234-1244
INSERT INTO EvalTestSet (SetID, GroupID, TestID, Descritpion) values (100, 555, 1234, 'In-Process1')
INSERT INTO EvalTestSet (SetID, GroupID, TestID, Descritpion) values (100, 555, 1235, 'In-Process1')
INSERT INTO EvalTestSet (SetID, GroupID, TestID, Descritpion) values (100, 555, 1236, 'In-Process1')
INSERT INTO EvalTestSet (SetID, GroupID, TestID, Descritpion) values (100, 556, 1237, 'In-Process2')
INSERT INTO EvalTestSet (SetID, GroupID, TestID, Descritpion) values (100, 556, 1238, 'In-Process2')
INSERT INTO EvalTestSet (SetID, GroupID, TestID, Descritpion) values (100, 556, 1239, 'In-Process2')
INSERT INTO EvalTestSet (SetID, GroupID, TestID, Descritpion) values (100, 557, 1240, 'Final-QC')
INSERT INTO EvalTestSet (SetID, GroupID, TestID, Descritpion) values (100, 557, 1241, 'Final-QC')


--Test Set 101, Groups 558, 559, 560 Tests, 1245-1255
INSERT INTO EvalTestSet (SetID, GroupID, TestID, Descritpion) values (101, 558, 1245, 'In-Process1')
INSERT INTO EvalTestSet (SetID, GroupID, TestID, Descritpion) values (101, 558, 1246, 'In-Process1')
INSERT INTO EvalTestSet (SetID, GroupID, TestID, Descritpion) values (101, 558, 1247, 'In-Process1')
INSERT INTO EvalTestSet (SetID, GroupID, TestID, Descritpion) values (101, 558, 1248, 'In-Process2')
INSERT INTO EvalTestSet (SetID, GroupID, TestID, Descritpion) values (101, 559, 1249, 'In-Process2')
INSERT INTO EvalTestSet (SetID, GroupID, TestID, Descritpion) values (101, 559, 1250, 'In-Process2')
INSERT INTO EvalTestSet (SetID, GroupID, TestID, Descritpion) values (101, 559, 1251, 'Final-QC')
INSERT INTO EvalTestSet (SetID, GroupID, TestID, Descritpion) values (101, 559, 1252, 'Final-QC')
INSERT INTO EvalTestSet (SetID, GroupID, TestID, Descritpion) values (101, 560, 1253, 'Final-QC')
INSERT INTO EvalTestSet (SetID, GroupID, TestID, Descritpion) values (101, 560, 1254, 'Final-QC')
INSERT INTO EvalTestSet (SetID, GroupID, TestID, Descritpion) values (101, 560, 1255, 'Final-QC')

--Test Set 102, Groups 561, 562; Tests, 1256-1265
INSERT INTO EvalTestSet (SetID, GroupID, TestID, Descritpion) values (102, 561, 1256, 'In-Process1')
INSERT INTO EvalTestSet (SetID, GroupID, TestID, Descritpion) values (102, 561, 1257, 'In-Process1')
INSERT INTO EvalTestSet (SetID, GroupID, TestID, Descritpion) values (102, 561, 1258, 'In-Process1')
INSERT INTO EvalTestSet (SetID, GroupID, TestID, Descritpion) values (102, 562, 1259, 'In-Process1')
INSERT INTO EvalTestSet (SetID, GroupID, TestID, Descritpion) values (102, 562, 1260, 'Final-QC')
INSERT INTO EvalTestSet (SetID, GroupID, TestID, Descritpion) values (102, 562, 1261, 'Final-QC')
INSERT INTO EvalTestSet (SetID, GroupID, TestID, Descritpion) values (102, 562, 1262, 'Final-QC')
INSERT INTO EvalTestSet (SetID, GroupID, TestID, Descritpion) values (102, 562, 1263, 'Final-QC')
INSERT INTO EvalTestSet (SetID, GroupID, TestID, Descritpion) values (102, 562, 1264, 'Final-QC')

