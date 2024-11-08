-- View: BasicInformation(idnr, name, login, program, branch) For all students, 
--their national identification number, name, login, their program and the branch (if any). 
--The branch column is the only column in any of the views that is allowed to contain NULL.

--CREATE VIEW BasicInformation AS 


-- View: FinishedCourses(student, course, courseName, grade, credits) For all students, all finished courses, 
--along with their course codes, names, number of credits and grades (grade 'U', '3', '4' or '5') 
--and number of credits. The type of the grade should be a character type, e.g. CHAR(1).


-- View: Registrations(student, course, status) All registered and waiting students for all courses,
-- along with their waiting status ('registered' or 'waiting').


-- View: PathToGraduation(student, totalCredits, mandatoryLeft, mathCredits, seminarCourses, qualified) For all students, 
--their path to graduation, i.e. a view with columns for


-- student: the student's national identification number.


-- totalCredits: the number of credits they have taken.


-- mandatoryLeft: the number of courses that are mandatory for a branch or a program they have yet to read.


-- mathCredits: the number of credits they have taken in courses that are classified as math courses.


-- seminarCourses: the number of seminar courses they have read.


-- qualified: whether or not they qualify for graduation (see domain description). 
--The SQL type of this field should be BOOLEAN (i.e. TRUE or FALSE).