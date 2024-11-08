-- View: BasicInformation(idnr, name, login, program, branch) For all students, 
--their national identification number, name, login, their program and the branch (if any). 
--The branch column is the only column in any of the views that is allowed to contain NULL.

CREATE VIEW BasicInformation(idnr, name, login, program, branch) AS
SELECT
    Students.idnr,
    Students.name,
    Students.login,
    Students.program,
    Branches.name AS branch
FROM Students JOIN Branches ON Students.program = Branches.program;

-- View: FinishedCourses(student, course, courseName, grade, credits) For all students, all finished courses, 
--along with their course codes, names, number of credits and grades (grade 'U', '3', '4' or '5') 
--and number of credits. The type of the grade should be a character type, e.g. CHAR(1).

CREATE VIEW FinishedCourses(student, course, courseName, grade, credits) AS
SELECT
    Students.idnr AS student,
    Courses.code AS course,
    Courses.name AS courseName,
    Taken.grade AS grade,
    Courses.credits AS credits

FROM Students   JOIN Taken ON Students.idnr = Taken.student
                JOIN Courses ON Taken.course = Courses.code;

-- View: Registrations(student, course, status) All registered and waiting students for all courses,
-- along with their waiting status ('registered' or 'waiting').
CREATE VIEW Registrations(student, course, status) AS
SELECT
    Students.idnr AS student,
    Courses.code AS course,
    'registered' AS status
FROM
    Students    JOIN Registered ON Students.idnr = Registered.student
                JOIN Courses ON Registered.course = Courses.code

UNION ALL

SELECT
    Students.idnr AS student,
    Courses.code AS course,
    'waiting' AS status
FROM
    Students    JOIN WaitingList ON Students.idnr = WaitingList.student
                JOIN Courses ON WaitingList.course = Courses.code;



-- View: PathToGraduation(student, totalCredits, mandatoryLeft, mathCredits, seminarCourses, qualified) For all students, 
--their path to graduation, i.e. a view with columns for:
-- student: the student's national identification number.
-- totalCredits: the number of credits they have taken.
-- mandatoryLeft: the number of courses that are mandatory for a branch or a program they have yet to read.
-- mathCredits: the number of credits they have taken in courses that are classified as math courses.
-- seminarCourses: the number of seminar courses they have read.
-- qualified: whether or not they qualify for graduation (see domain description). 
--The SQL type of this field should be BOOLEAN (i.e. TRUE or FALSE).

-- Helper views for PathToGraduation (optional)
--SELECT student, course, credits FROM PassedCourses ORDER BY (student, course);
--SELECT student, course FROM UnreadMandatory ORDER BY (student, course);
--SELECT student, course, credits FROM RecommendedCourses ORDER BY (student, course);

--CREATE VIEW PathToGraduation(student, totalCredits, mandatoryLeft, mathCredits, seminarCourses, qualified) AS
