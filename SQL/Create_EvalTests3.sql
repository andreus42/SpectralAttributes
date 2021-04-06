drop table EvalTests
create table EvalTests (
	ID INT IDENTITY (1,1) NOT NULL,
	TestID INT,
	TestGroupID INT,
	ParamID INT,
	ParamValue VARCHAR(32)
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

--Set 101, Group 558
INSERT INTO EvalTests values (1240, 558, 1,'B-avg')
INSERT INTO EvalTests values (1240, 558, 3,'1')
INSERT INTO EvalTests values (1240, 558, 2,'1')
INSERT INTO EvalTests values (1240, 558, 5,'700')
INSERT INTO EvalTests values (1240, 558, 4,'1100')
INSERT INTO EvalTests values (1240, 558, 7,'OD5')
INSERT INTO EvalTests values (1241, 558, 1,'B-avg')
INSERT INTO EvalTests values (1241, 558, 3,'1')
INSERT INTO EvalTests values (1241, 558, 2,'2')
INSERT INTO EvalTests values (1241, 558, 5,'300')
INSERT INTO EvalTests values (1241, 558, 4,'500')
INSERT INTO EvalTests values (1241, 558, 7,'OD5')

--Group 559
INSERT INTO EvalTests values (1240, 559, 1,'B-abs')
INSERT INTO EvalTests values (1240, 559, 3,'1')
INSERT INTO EvalTests values (1240, 559, 2,'2')
INSERT INTO EvalTests values (1240, 559, 5,'900')
INSERT INTO EvalTests values (1240, 559, 4,'1200')
INSERT INTO EvalTests values (1240, 559, 7,'OD6')
INSERT INTO EvalTests values (1241, 559, 1,'B-avg')
INSERT INTO EvalTests values (1241, 559, 3,'1')
INSERT INTO EvalTests values (1241, 559, 2,'2')
INSERT INTO EvalTests values (1241, 559, 5,'900')
INSERT INTO EvalTests values (1241, 559, 4,'1200')
INSERT INTO EvalTests values (1241, 559, 7,'OD5')

--Group 560
INSERT INTO EvalTests values (1240, 560, 1,'B-avg')
INSERT INTO EvalTests values (1240, 560, 3,'1')
INSERT INTO EvalTests values (1240, 560, 2,'1')
INSERT INTO EvalTests values (1240, 560, 5,'900')
INSERT INTO EvalTests values (1240, 560, 4,'1200')
INSERT INTO EvalTests values (1240, 560, 7,'OD6')
INSERT INTO EvalTests values (1241, 560, 1,'B-abs')
INSERT INTO EvalTests values (1241, 560, 3,'1')
INSERT INTO EvalTests values (1241, 560, 2,'2')
INSERT INTO EvalTests values (1241, 560, 5,'900')
INSERT INTO EvalTests values (1241, 560, 4,'1200')
INSERT INTO EvalTests values (1241, 560, 7,'OD5')

select * from TestParams
select * from EvalTests
