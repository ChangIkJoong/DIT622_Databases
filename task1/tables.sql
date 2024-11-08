CREATE TABLE Students (
    idnr CHAR(10) NOT NULL,
    name TEXT NOT NULL,
    login TEXT NOT NULL,
    program TEXT NOT NULL,

    PRIMARY KEY (idnr)
);

CREATE TABLE Branches (
    name TEXT NOT NULL,
    program TEXT NOT NULL,

    PRIMARY KEY (name, program)
);

CREATE TABLE Courses(
    code CHAR(6) NOT NULL,
    name TEXT NOT NULL,
    credits FLOAT NOT NULL,
    department TEXT NOT NULL,

    PRIMARY KEY (code)
);

CREATE TABLE LimitedCourses(
    code CHAR(6) NOT NULL, 
    capacity INT NOT NULL,

    PRIMARY KEY (code),

    FOREIGN KEY (code) REFERENCES Courses(code)
);

CREATE TABLE StudentBranches(
    student CHAR(10) NOT NULL,
    branch TEXT NOT NULL,
    program TEXT NOT NULL,

    PRIMARY KEY(student),

    FOREIGN KEY (student) REFERENCES Students (idnr),
    FOREIGN KEY (branch, program) REFERENCES Branches(name, program)
);

CREATE TABLE Classifications (
    name TEXT NOT NULL,
    PRIMARY KEY (name)
);

CREATE TABLE Classified(
    course CHAR(6) NOT NULL,
    classification TEXT NOT NULL,

    PRIMARY KEY (course, classification),

    FOREIGN KEY (course) REFERENCES courses(code),
    FOREIGN KEY (classification) REFERENCES Classifications(name)
);

CREATE TABLE MandatoryProgram(
    course CHAR(6) NOT NULL,
    program TEXT NOT NULL,

    PRIMARY KEY(course,program),

    FOREIGN KEY (course) REFERENCES courses(code)
);


CREATE TABLE MandatoryBranch(
    course CHAR(6) NOT NULL,
    branch TEXT NOT NULL,
    program TEXT NOT NULL,
    
    FOREIGN KEY (course) REFERENCES courses(code),
    FOREIGN KEY (branch, program) REFERENCES Branches(name, program)
);

CREATE TABLE RecommendedBranch(
    course CHAR(6) NOT NULL,
    branch TEXT NOT NULL,
    program TEXT NOT NULL,

    PRIMARY KEY(course,branch,program),

    FOREIGN KEY (course) REFERENCES courses(code),
    FOREIGN KEY (branch, program) REFERENCES Branches(name, program)
);

CREATE TABLE Registered(
    student CHAR(10) NOT NULL,
    course CHAR(6) NOT NULL,

    PRIMARY KEY (student,course),

    FOREIGN KEY (student) REFERENCES Students(idnr),
    FOREIGN KEY (course) REFERENCES Courses(code)
);

CREATE TABLE Taken(
    student CHAR(10) NOT NULL,
    course CHAR(6) NOT NULL,
    grade CHAR(1) NOT NULL CHECK (grade IN ('U','3','4','5')),

    PRIMARY KEY (student,course),

    FOREIGN KEY (student) REFERENCES Students(idnr),
    FOREIGN KEY (course) REFERENCES Courses(code)
);

CREATE TABLE WaitingList(
    student CHAR(10) NOT NULL,
    course CHAR(6) NOT NULL,
    position INT CHECK (position > 0),

    PRIMARY KEY (student, course),
    FOREIGN KEY (student) REFERENCES Students(idnr),
    FOREIGN KEY (course) REFERENCES Courses(code)
);