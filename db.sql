-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2020-03-22 07:12:20.376

DROP DATABASE master;

drop table Student;
drop table Enrollment;
drop table Studies;
drop table RequestsLog;

-- tables
-- Table: Enrollment
CREATE TABLE Enrollment (
    IdEnrollment int  NOT NULL,
    Semester int  NOT NULL,
    IdStudy int  NOT NULL,
    StartDate date  NOT NULL,
    CONSTRAINT Enrollment_pk PRIMARY KEY  (IdEnrollment)
);

-- Table: Student
CREATE TABLE Student (
    IndexNumber nvarchar(100)  NOT NULL,
    FirstName nvarchar(100)  NOT NULL,
    LastName nvarchar(100)  NOT NULL,
    BirthDate date  NOT NULL,
    IdEnrollment int  NOT NULL,
    CONSTRAINT Student_pk PRIMARY KEY  (IndexNumber)
);

-- Table: Studies
CREATE TABLE Studies (
    IdStudy int  NOT NULL,
    Name nvarchar(100)  NOT NULL,
    CONSTRAINT Studies_pk PRIMARY KEY  (IdStudy)
);

CREATE TABLE RequestsLog(
	Id int NOT NULL,
	LogData nvarchar(100) NOT NULL,
	CONSTRAINT RequestsLog_pk PRIMARY KEY (Id)
);

-- foreign keys
-- Reference: Enrollment_Studies (table: Enrollment)
ALTER TABLE Enrollment ADD CONSTRAINT Enrollment_Studies
    FOREIGN KEY (IdStudy)
    REFERENCES Studies (IdStudy);

-- Reference: Student_Enrollment (table: Student)
ALTER TABLE Student ADD CONSTRAINT Student_Enrollment
    FOREIGN KEY (IdEnrollment)
    REFERENCES Enrollment (IdEnrollment);

insert into Studies values (1, 'studies1');
insert into Studies values (2, 'studies2');
insert into Studies values (3, 'studies3');
insert into Studies values (4, 'IT');

insert into Enrollment values (1, 2, 1, CONVERT(varchar, '2019-10-10', 23));
insert into Enrollment values (2, 1, 4, CONVERT(varchar, '2020-12-15', 23));
insert into Enrollment values (3, 3, 2, CONVERT(varchar, '2019-11-01', 23));
insert into Enrollment values (4, 3, 3, CONVERT(varchar, '2017-11-01', 23));

insert into Student values ('s19999', 'name1', 'surname1', CONVERT(varchar, '1998-07-10', 23), 1);
insert into Student values ('s18999', 'name2', 'surname2', CONVERT(varchar, '1999-10-05', 23), 2);
insert into Student values ('s17999', 'name3', 'surname3', CONVERT(varchar, '1997-07-10', 23), 3);
insert into Student values ('s16999', 'name4', 'surname4', CONVERT(varchar, '1995-08-12', 23), 4);

-- End of file.

select * from studies where IdStudy = (select IdStudy from Enrollment where IdEnrollment = 3);

select * from Student;

SELECT * FROM Studies WHERE Name='IT';

select MAX(IdEnrollment) as IdEnrollment from Enrollment;

SELECT * FROM Enrollment WHERE Semester = 1 AND IdStudy = (select s.IdStudy from Studies s where s.name = 'IT');
select * from Enrollment;

update Student Set IdEnrollment = 2 Where IdEnrollment = 
	(select e.IdEnrollment from Enrollment e 
	where e.IdStudy = 
		(select s.IdStudy from Studies s where s.Name = 'IT')
	and e.Semester = 1);

Insert into RequestsLog values (0, 'some data 0');
Insert into RequestsLog values (2, 'some data 0');
Select * from RequestsLog;
Select MAX(Id) as Id From RequestsLog;