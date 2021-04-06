drop table EvalTests
create table EvalTests (
	etID INT IDENTITY (1,1) NOT NULL,
	etTestNum INT,
	etTestGroupID INT,
	etParamID INT,
	etValue	VARCHAR(32)
)

--Group 555
INSERT INTO EvalTests values (1234, 555, 1,'T-avg')
INSERT INTO EvalTests values (1234, 555, 3,'1')
INSERT INTO EvalTests values (1234, 555, 2,'1')
INSERT INTO EvalTests values (1234, 555, 5,'495')
INSERT INTO EvalTests values (1234, 555, 4,'900')
INSERT INTO EvalTests values (1234, 555, 7,'95')
INSERT INTO EvalTests values (1235, 555, 1,'T-avg @')
INSERT INTO EvalTests values (1235, 555, 3,'2')
INSERT INTO EvalTests values (1235, 555, 2,'1')
INSERT INTO EvalTests values (1235, 555, 6,'555')
INSERT INTO EvalTests values (1235, 555, 7,'95')
INSERT INTO EvalTests values (1236, 555, 1,'CIE')
INSERT INTO EvalTests values (1236, 555, 3,'3')
INSERT INTO EvalTests values (1236, 555, 2,'1')
INSERT INTO EvalTests values (1236, 555, 7,'95')
INSERT INTO EvalTests values (1236, 555, 8,'E:\filepath.tfd')

--Group 556
INSERT INTO EvalTests values (1237, 556, 1,'T-avg')
INSERT INTO EvalTests values (1237, 556, 3,'1')
INSERT INTO EvalTests values (1237, 556, 2,'1')
INSERT INTO EvalTests values (1237, 556, 5,'495')
INSERT INTO EvalTests values (1237, 556, 4,'900')
INSERT INTO EvalTests values (1237, 556, 7,'95')
INSERT INTO EvalTests values (1238, 556, 1,'T-avg @')
INSERT INTO EvalTests values (1238, 556, 3,'2')
INSERT INTO EvalTests values (1238, 556, 2,'1')
INSERT INTO EvalTests values (1238, 556, 6,'555')
INSERT INTO EvalTests values (1238, 556, 7,'95')
INSERT INTO EvalTests values (1239, 556, 1,'CIE')
INSERT INTO EvalTests values (1239, 556, 3,'3')
INSERT INTO EvalTests values (1239, 556, 2,'1')
INSERT INTO EvalTests values (1239, 556, 7,'95')
INSERT INTO EvalTests values (1239, 556, 8,'E:\filepath.tfd')

--Group 557
INSERT INTO EvalTests values (1240, 557, 1,'B-avg')
INSERT INTO EvalTests values (1240, 557, 3,'1')
INSERT INTO EvalTests values (1240, 557, 2,'1')
INSERT INTO EvalTests values (1240, 557, 5,'900')
INSERT INTO EvalTests values (1240, 557, 4,'1200')
INSERT INTO EvalTests values (1240, 557, 7,'OD6')
INSERT INTO EvalTests values (1241, 557, 1,'B-abs')
INSERT INTO EvalTests values (1241, 557, 3,'1')
INSERT INTO EvalTests values (1241, 557, 2,'1')
INSERT INTO EvalTests values (1241, 557, 5,'900')
INSERT INTO EvalTests values (1241, 557, 4,'1200')
INSERT INTO EvalTests values (1241, 557, 7,'OD5')

select etTestNum, etParamID, tpName, etValue
from EvalTests 
join TestParams on etParamID = tpID
where etTestNum = 1234

select * from TestParams
select * from EvalTests




where etTestNum =1234