-- ASM
-- 4/7/2021
-- CREATE TABLE FOR SYMBOLS

drop table TestSymbols;
go

create table TestSymbols (
	ID int identity(1,1) NOT NULL,
	Symbol varchar(8),
);
go


INSERT INTO TestSymbols values ('>=');
INSERT INTO TestSymbols values ('>');
INSERT INTO TestSymbols values ('=');
INSERT INTO TestSymbols values ('<=');
INSERT INTO TestSymbols values ('<');

select *
from TestSymbols;