drop table TestParams

create table TestParams (
	ID int IDENTITY (1,1) NOT NULL,
	ParamName varchar(32),
)

INSERT INTO TestParams values ('Name')
INSERT INTO TestParams values ('Rank')
INSERT INTO TestParams values ('TestType')
INSERT INTO TestParams values ('LambdaFrom')
INSERT INTO TestParams values ('LambdaTo')
INSERT INTO TestParams values ('LambdaAt')
INSERT INTO TestParams values ('Value')
INSERT INTO TestParams values ('Filepath')
INSERT INTO TestParams values ('<')
INSERT INTO TestParams values ('<=')
INSERT INTO TestParams values ('=')
INSERT INTO TestParams values ('>=')
INSERT INTO TestParams values ('>')


select * from TestParams
--delete from TestParams where tpID in (11, 12, 13, 14)

