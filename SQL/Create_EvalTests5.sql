drop table EvalTests
create table EvalTests (
	ID INT IDENTITY (1,1) NOT NULL,
	TestID INT,
	GroupID INT,
	SetID INT,
	ParamID INT,
	ParamValue VARCHAR(32)
)

--Group 555
INSERT INTO EvalTests values (1234, 555, 1, 1,'T-avg')
INSERT INTO EvalTests values (1234, 555, 1, 3,'1')
INSERT INTO EvalTests values (1234, 555, 1, 2,'1')
INSERT INTO EvalTests values (1234, 555, 1, 5,'495')
INSERT INTO EvalTests values (1234, 555, 1, 4,'900')
INSERT INTO EvalTests values (1234, 555, 1, 7,'95')
INSERT INTO EvalTests values (1235, 555, 1, 1,'T-avg @')
INSERT INTO EvalTests values (1235, 555, 1, 3,'2')
INSERT INTO EvalTests values (1235, 555, 1, 2,'1')
INSERT INTO EvalTests values (1235, 555, 1, 6,'555')
INSERT INTO EvalTests values (1235, 555, 1, 7,'95')
INSERT INTO EvalTests values (1236, 555, 1, 1,'CIE')
INSERT INTO EvalTests values (1236, 555, 1, 3,'3')
INSERT INTO EvalTests values (1236, 555, 1, 2,'1')
INSERT INTO EvalTests values (1236, 555, 1, 7,'95')
INSERT INTO EvalTests values (1236, 555, 1, 8,'E:\filepath.tfd')

--Group 556
INSERT INTO EvalTests values (1237, 556, 1, 1,'T-avg')
INSERT INTO EvalTests values (1237, 556, 1, 3,'1')
INSERT INTO EvalTests values (1237, 556, 1, 2,'1')
INSERT INTO EvalTests values (1237, 556, 1, 5,'495')
INSERT INTO EvalTests values (1237, 556, 1, 4,'900')
INSERT INTO EvalTests values (1237, 556, 1, 7,'95')
INSERT INTO EvalTests values (1238, 556, 1, 1,'T-avg @')
INSERT INTO EvalTests values (1238, 556, 1, 3,'2')
INSERT INTO EvalTests values (1238, 556, 1, 2,'1')
INSERT INTO EvalTests values (1238, 556, 1, 6,'555')
INSERT INTO EvalTests values (1238, 556, 1, 7,'95')
INSERT INTO EvalTests values (1239, 556, 1, 1,'CIE')
INSERT INTO EvalTests values (1239, 556, 1, 3,'3')
INSERT INTO EvalTests values (1239, 556, 1, 2,'1')
INSERT INTO EvalTests values (1239, 556, 1, 7,'95')
INSERT INTO EvalTests values (1239, 556, 1, 8,'E:\filepath.tfd')

--Group 557
INSERT INTO EvalTests values (1240, 557, 1, 1,'B-avg')
INSERT INTO EvalTests values (1240, 557, 1, 3,'1')
INSERT INTO EvalTests values (1240, 557, 1, 2,'1')
INSERT INTO EvalTests values (1240, 557, 1, 5,'900')
INSERT INTO EvalTests values (1240, 557, 1, 4,'1200')
INSERT INTO EvalTests values (1240, 557, 1, 7,'OD6')
INSERT INTO EvalTests values (1241, 557, 1, 1,'B-abs')
INSERT INTO EvalTests values (1241, 557, 1, 3,'1')
INSERT INTO EvalTests values (1241, 557, 1, 2,'1')
INSERT INTO EvalTests values (1241, 557, 1, 5,'900')
INSERT INTO EvalTests values (1241, 557, 1, 4,'1200')
INSERT INTO EvalTests values (1241, 557, 1, 7,'OD5')

--Set 101, Group 558
INSERT INTO EvalTests values (1240, 558, 1, 1,'B-avg')
INSERT INTO EvalTests values (1240, 558, 1, 3,'1')
INSERT INTO EvalTests values (1240, 558, 1, 2,'1')
INSERT INTO EvalTests values (1240, 558, 1, 5,'700')
INSERT INTO EvalTests values (1240, 558, 1, 4,'1100')
INSERT INTO EvalTests values (1240, 558, 1, 7,'OD5')
INSERT INTO EvalTests values (1241, 558, 1, 1,'B-avg')
INSERT INTO EvalTests values (1241, 558, 1, 3,'1')
INSERT INTO EvalTests values (1241, 558, 1, 2,'2')
INSERT INTO EvalTests values (1241, 558, 1, 5,'300')
INSERT INTO EvalTests values (1241, 558, 1, 4,'500')
INSERT INTO EvalTests values (1241, 558, 1, 7,'OD5')

--Group 559
INSERT INTO EvalTests values (1240, 559, 1, 1,'B-abs')
INSERT INTO EvalTests values (1240, 559, 1, 3,'1')
INSERT INTO EvalTests values (1240, 559, 1, 2,'2')
INSERT INTO EvalTests values (1240, 559, 1, 5,'900')
INSERT INTO EvalTests values (1240, 559, 1, 4,'1200')
INSERT INTO EvalTests values (1240, 559, 1, 7,'OD6')
INSERT INTO EvalTests values (1241, 559, 1, 1,'B-avg')
INSERT INTO EvalTests values (1241, 559, 1, 3,'1')
INSERT INTO EvalTests values (1241, 559, 1, 2,'2')
INSERT INTO EvalTests values (1241, 559, 1, 5,'900')
INSERT INTO EvalTests values (1241, 559, 1, 4,'1200')
INSERT INTO EvalTests values (1241, 559, 1, 7,'OD5')

--Group 560
INSERT INTO EvalTests values (1240, 560, 1, 1,'B-avg')
INSERT INTO EvalTests values (1240, 560, 1, 3,'1')
INSERT INTO EvalTests values (1240, 560, 1, 2,'1')
INSERT INTO EvalTests values (1240, 560, 1, 5,'900')
INSERT INTO EvalTests values (1240, 560, 1, 4,'1200')
INSERT INTO EvalTests values (1240, 560, 1, 7,'OD6')
INSERT INTO EvalTests values (1241, 560, 1, 1,'B-abs')
INSERT INTO EvalTests values (1241, 560, 1, 3,'1')
INSERT INTO EvalTests values (1241, 560, 1, 2,'2')
INSERT INTO EvalTests values (1241, 560, 1, 5,'900')
INSERT INTO EvalTests values (1241, 560, 1, 4,'1200')
INSERT INTO EvalTests values (1241, 560, 1, 7,'OD5')

select * from TestParams
select * from EvalTests