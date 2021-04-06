drop table EvalTests
create table EvalTests (
	ID INT IDENTITY (1,1) NOT NULL,
	TestID INT,
	ParamID INT,
	ParamValue VARCHAR(32)
)

--Group 555
INSERT INTO EvalTests values (1234, 1,'T-avg')
INSERT INTO EvalTests values (1234, 3,'1')
INSERT INTO EvalTests values (1234, 2,'1')
INSERT INTO EvalTests values (1234, 5,'495')
INSERT INTO EvalTests values (1234, 4,'900')
INSERT INTO EvalTests values (1234, 7,'95')
INSERT INTO EvalTests values (1235, 1,'T-avg @')
INSERT INTO EvalTests values (1235, 3,'2')
INSERT INTO EvalTests values (1235, 2,'1')
INSERT INTO EvalTests values (1235, 6,'555')
INSERT INTO EvalTests values (1235, 7,'95')
INSERT INTO EvalTests values (1236, 1,'CIE')
INSERT INTO EvalTests values (1236, 3,'3')
INSERT INTO EvalTests values (1236, 2,'1')
INSERT INTO EvalTests values (1236, 7,'95')
INSERT INTO EvalTests values (1236, 8,'E:\filepath.tfd')

--Group 556
INSERT INTO EvalTests values (1237, 1,'T-avg')
INSERT INTO EvalTests values (1237, 3,'1')
INSERT INTO EvalTests values (1237, 2,'1')
INSERT INTO EvalTests values (1237, 5,'495')
INSERT INTO EvalTests values (1237, 4,'900')
INSERT INTO EvalTests values (1237, 7,'95')
INSERT INTO EvalTests values (1238, 1,'T-avg @')
INSERT INTO EvalTests values (1238, 3,'2')
INSERT INTO EvalTests values (1238, 2,'1')
INSERT INTO EvalTests values (1238, 6,'555')
INSERT INTO EvalTests values (1238, 7,'95')
INSERT INTO EvalTests values (1239, 1,'CIE')
INSERT INTO EvalTests values (1239, 3,'3')
INSERT INTO EvalTests values (1239, 2,'1')
INSERT INTO EvalTests values (1239, 7,'95')
INSERT INTO EvalTests values (1239, 8,'E:\filepath.tfd')

--Group 557
INSERT INTO EvalTests values (1240, 1,'B-avg')
INSERT INTO EvalTests values (1240, 3,'1')
INSERT INTO EvalTests values (1240, 2,'1')
INSERT INTO EvalTests values (1240, 5,'900')
INSERT INTO EvalTests values (1240, 4,'1200')
INSERT INTO EvalTests values (1240, 7,'OD6')
INSERT INTO EvalTests values (1241, 1,'B-abs')
INSERT INTO EvalTests values (1241, 3,'1')
INSERT INTO EvalTests values (1241, 2,'1')
INSERT INTO EvalTests values (1241, 5,'900')
INSERT INTO EvalTests values (1241, 4,'1200')
INSERT INTO EvalTests values (1241, 7,'OD5')

select * from TestParams
select * from EvalTests
