CREATE TABLE Students (
    idnr INT (10) NOT NULL,
    name TEXT NOT NULL,
    login TEXT NOT NULL,
    program TEXT NOT NULL,

    PRIMARY KEY (idnr)
)

CREATE TABLE Branches (
    name TEXT NOT NULL,
    program TEXT NOT NULL,

    PRIMARY KEY (name, program)
)


--INSERT INTO Courses VALUES ('CCC111','C1',22.5,'Dep1');
CREATE TABLE Courses(
    code TEXT NOT NULL,
    name TEXT NOT NULL,
    credits FLOAT NOT NULL,
    department TEXT NOT NULL,

    PRIMARY KEY (code)
    )
--code → Courses.code
CREATE TABLE LimitedCourses(
    code TEXT NOT NULL, 
    capacity INT NOT NULL,

    PRIMARY KEY (code),

    FOREIGN KEY (code) REFERENCES Courses(code)
) 

CREATE TABLE StudentBranches(
    student TEXT NOT NULL,
    branch TEXT NOT NULL,
    program TEXT NOT NULL,

    PRIMARY KEY(student),

    FOREIGN KEY (student) REFERENCES Students (idnr),
    FOREIGN KEY (branch, program) REFERENCES Branches(name, program)
    )

CREATE TABLE Classifications (
    name TEXT NOT NULL,
    PRIMARY KEY (name)
)

CREATE TABLE Classified(
    course TEXT NOT NULL,
    classification TEXT NOT NULL,

    PRIMARY KEY (course, classification),

    FOREIGN KEY (course) REFERENCES courses(code),
    FOREIGN KEY (classification) REFERENCES Classifications(name)
)

CREATE TABLE MandatoryProgram(
    course TEXT NOT NULL,
    program TEXT NOT NULL,

    PRIMARY KEY(course,program),

    FOREIGN KEY (course) REFERENCES courses(code)
    )


MandatoryBranch(
    course TEXT NOT NULL,
    branch TEXT NOT NULL,
    program TEXT NOT NULL,
    
    FOREIGN KEY (course) REFERENCES courses(code),
    FOREIGN KEY (branch, program) REFERENCES Branches(name, program)
    )



RecommendedBranch(
    course TEXT NOT NULL,
    branch TEXT NOT NULL,
    program TEXT NOT NULL,

    PRIMARY KEY(course,branch,program)

    FOREIGN KEY (course) REFERENCES courses(code),
    FOREIGN KEY (branch, program) → Branches(name, program)

)

CREATE TABLE Registered(
    student TEXT NOT NULL,
    course TEXT NOT NULL,

    PRIMARY KEY (student,course),

    FOREIGN KEY (student) REFERENCES Students(idnr),
    FOREIGN KEY (course) REFERENCES Courses(code)
)



CREATE TABLE Taken(
    student TEXT NOT NULL,
    course TEXT NOT NULL,
    grade TEXT NOT NULL,

    PRIMARY KEY (student,course),

    FOREIGN KEY (student) REFERENCES Students(idnr),
    FOREIGN KEY (course) REFERENCES Courses(code)
)

CREATE TABLE WaitingList(
    student TEXT NOT NULL,
    course TEXT NOT NULL,
    position INT CHECK (position >= 0),

    PRIMARY KEY (student, course),
    FOREIGN KEY (student) REFERENCES Students(idnr),
    FOREIGN KEY (course) REFERENCES Courses(code)
)