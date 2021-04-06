

--Create table that holds groupings of test groups that attach to a RevLogID

drop table EvalTestSet
create table EvalTestSet (
	etsID INT IDENTITY (1,1) NOT NULL,
	etsTestID INT,
	etsGroupID INT,
	etsDescritpion VARCHAR(32)
)

INSERT INTO EvalTestSet (etsTestID, etsGroupID, etsDescritpion) values (1234, 555, 'In-Process1')
INSERT INTO EvalTestSet (etsTestID, etsGroupID, etsDescritpion) values (1235, 555, 'In-Process1')
INSERT INTO EvalTestSet (etsTestID, etsGroupID, etsDescritpion) values (1236, 555, 'In-Process1')
INSERT INTO EvalTestSet (etsTestID, etsGroupID, etsDescritpion) values (1237, 555, 'In-Process1')

INSERT INTO EvalTestSet (etsTestID, etsGroupID, etsDescritpion) values (1238, 556, 'In-Process2')
INSERT INTO EvalTestSet (etsTestID, etsGroupID, etsDescritpion) values (1239, 556, 'In-Process2')
INSERT INTO EvalTestSet (etsTestID, etsGroupID, etsDescritpion) values (1240, 556, 'In-Process2')
INSERT INTO EvalTestSet (etsTestID, etsGroupID, etsDescritpion) values (1241, 556, 'In-Process2')

INSERT INTO EvalTestSet (etsTestID, etsGroupID, etsDescritpion) values (1242, 557, 'Final-QC')
INSERT INTO EvalTestSet (etsTestID, etsGroupID, etsDescritpion) values (1243, 557, 'Final-QC')
INSERT INTO EvalTestSet (etsTestID, etsGroupID, etsDescritpion) values (1244, 557, 'Final-QC')

