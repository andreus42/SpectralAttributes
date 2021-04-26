drop table EvalTestParams

create table EvalTestParams (
	ID int IDENTITY (1,1) NOT NULL,
	ParamName varchar(32),
)

INSERT INTO EvalTestParams values ('Name')
INSERT INTO EvalTestParams values ('Rank')
INSERT INTO EvalTestParams values ('TestType')
INSERT INTO EvalTestParams values ('LambdaFrom')
INSERT INTO EvalTestParams values ('LambdaTo')
INSERT INTO EvalTestParams values ('LambdaAt')
INSERT INTO EvalTestParams values ('Value')
INSERT INTO EvalTestParams values ('Filepath')
INSERT INTO EvalTestParams values ('PlusTol')
INSERT INTO EvalTestParams values ('MinusTol')
INSERT INTO EvalTestParams values ('Symbol')
INSERT INTO EvalTestParams values ('RefOnly')
INSERT INTO EvalTestParams values ('NoTol')


select * from EvalTestParams


