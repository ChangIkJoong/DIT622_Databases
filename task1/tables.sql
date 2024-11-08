CREATE TABLE Students (
    idnr INT (9) NOT NULL,
    name TEXT NOT NULL,
    login TEXT NOT NULL,
    program TEXT NOT NULL,
    PRIMARY KEY (idnr)



    --FOREIGN KEY (student, program) REFERENCES Students(idnr, program),
    --FOREIGN KEY (student) REFERENCES Students(idnr),
    --FOREIGN KEY (program) REFERENCES Students(program),
)

CREATE TABLE Branches (
    name TEXT,
    program TEXT,
    PRIMARY KEY (name, program)
)

CREATE TABLE Values;

CREATE TABLE Courses;

CREATE TABLE Classifications

CREATE TABLE Classified


CREATE TABLE StudentBranches


CREATE TABLE MandatoryProgram

CREATE TABLE MandatoryBranch


CREATE TABLE RecommendedBranch

CREATE TABLE Taken

CREATE TABLE Registered

CREATE TABLE WaitingList