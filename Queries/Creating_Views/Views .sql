/* Creating views for ( Admin monitoring - Training Manager operations - Instructor monitoring - Student results) */


-- 1. Admin Mointoring ---

--  view to show all users 
CREATE OR ALTER VIEW v_adm_AllUsers 
AS
SELECT * FROM dbo.[User];
GO

--  view to show all users with instructor role
CREATE OR ALTER VIEW v_adm_AllInstructor
AS
select * from dbo.[User]
WHERE Role = 'Instructor';
GO

--  view to show all users with manager role
CREATE OR ALTER VIEW v_adm_AllManager
AS
select * from dbo.[User]
WHERE Role = 'Manager';
GO
--  view to show all users with student role
CREATE OR ALTER VIEW v_adm_AllStudent
AS
select * from dbo.[User]
WHERE Role = 'Student';
GO
--  view to show system activity summary ( total students , total instructors , total Courses , total Exams , total Departments , total Tracks )
CREATE OR ALTER VIEW v_adm_SystemActivitySummary
AS
select 
	(select count(*) from dbo.Student) AS  TotalStudents , (select Count(*) FROM dbo.Instructor) AS TotalInstructors ,
	(select count(*) from dbo.Course) AS   TotalCourses , ( select Count(*) From dbo.Exam) AS TotalExams   ,
	(select count(*) from dbo.Department) AS TotalDepartments  , (select Count(*) FROM dbo.Track) AS TotalTracks;
GO
--  View to show database Usage stats 
-- Displays system usage metrics including number of exams per year, number of students per intake, and total stored student answers.


CREATE OR ALTER VIEW v_adm_DatabaseUsageStatistics
AS
-- UPDATED: Group by YEAR(edate) instead of [Year]
SELECT 'Exams Per Year' AS StatisticType , CAST(YEAR(edate) AS NVARCHAR(50)) AS Category , COUNT(*)  AS TotalCount
FROM dbo.Exam
GROUP BY YEAR(edate)

UNION ALL

SELECT  'Student Per Intake' AS StatisticType , CAST(I.IntakeID AS NVARCHAR(50)) AS Category , COUNT(S.StudentID) AS TotalCount
FROM dbo.Student S 
INNER JOIN dbo.Intake I
ON S.Intake_ID = I.IntakeID
GROUP BY I.IntakeID

UNION ALL

SELECT 'Total Answers Stored' AS StatisticType , 'All Years' AS Category , COUNT(*) AS TotalCount
from dbo.StudentAnswer

GO
--------------------------
---- 2. Training Manager Operations -----
--  View show all branches 

CREATE OR ALTER VIEW v_man_Branches
AS
SELECT * FROM dbo.Branch;

-- view show all Intakes 
GO

CREATE OR ALTER VIEW v_man_Intakes
AS 
SELECT * FROM dbo.Intake




GO
--  view to show tracks per department And their branch Name
CREATE OR ALTER VIEW v_man_TracksPerDepartment
AS
SELECT D.Dept_Name AS 'DepartmentName' ,
T.TrackName , B.BranchName 
FROM dbo.Track T
INNER JOIN dbo.TrackDepartment TD
ON  T.TrackID = TD.Track_ID
INNER JOIN DBO.Department  D
ON D.Dept_ID = TD.Dept_ID
INNER JOIN DBO.BranchTrack BT
ON T.TrackID = BT.TrackID
INNER JOIN DBO. Branch B
ON BT.BranchID = B.BranchID;

GO
/*  view to show how many studentsare in each in each branch
to compare between branches , see overloaded tracks 
and plan resources */

CREATE or Alter VIEW dbo.v_man_StudentsPerTrackBranch
AS
SELECT 
    B.BranchName,
    T.TrackName,
    COUNT(S.StudentID) AS TotalStudents
FROM dbo.Student S
INNER JOIN dbo.Track T
    ON S.Track_ID = T.TrackID
INNER JOIN dbo.BranchTrack BT
    ON T.TrackID = BT.TrackID
INNER JOIN dbo.Branch B
    ON BT.BranchID = B.BranchID
GROUP BY B.BranchName, T.TrackName;

GO
--  view to give performance summary of average total score of each track
-- good for mointering the performance and goodness of each track

CREATE OR ALTER VIEW dbo.v_man_TrackPerformanceSummary
AS
WITH StudentTotal AS (
    SELECT 
        S.StudentID,
        S.Track_ID,
        SUM(SA.Degree_Given) AS TotalScore
    FROM StudentAnswer SA
    JOIN Student S ON SA.STID = S.StudentID
    GROUP BY S.StudentID, S.Track_ID
)
SELECT
    T.TrackName,
    B.BranchName,
    AVG(ST.TotalScore) AS AverageTotalScore,
    MAX(ST.TotalScore) AS MaxTotalScore,
    MIN(ST.TotalScore) AS MinTotalScore
FROM StudentTotal ST
JOIN Track T ON ST.Track_ID = T.TrackID
JOIN Branch B ON B.BranchID = 
    (SELECT TOP 1 BranchID FROM Student WHERE StudentID = ST.StudentID)
GROUP BY T.TrackName, B.BranchName;

-- select * from dbo.v_man_TrackPerformanceSummary
GO
--  view to show student performance ranking 

CREATE OR ALTER VIEW dbo.v_man_StudentPerformanceRanking
AS
WITH StudentTotal AS (
    SELECT 
        S.StudentID,
        U.Username,
        SUM(SA.Degree_Given) AS TotalScore
    FROM dbo.Student S
    INNER JOIN [User] U ON S.UserID = U.UserID
    INNER JOIN StudentAnswer SA ON SA.STID = S.StudentID
    GROUP BY S.StudentID, U.Username
)
SELECT
    StudentID,
    Username,
    TotalScore,
    RANK() OVER (ORDER BY TotalScore DESC) AS RankPosition
FROM StudentTotal;

GO
--  view to mointer how many students are in each intake

CREATE OR ALTER VIEW v_man_IntakeDistribution AS
SELECT I.IntakeID AS IntakeNum , Count(S.StudentID) AS NumberOfStudents
FROM dbo.Intake I
LEFT JOIN Student S ON I.IntakeID = S.Intake_ID
GROUP BY I.IntakeID;

---------------------------------------------------


----------------------------------------------------


-- 3.Instructor monitoring
GO
--  View To show each instructor with the courses that he is teaching

CREATE OR ALTER VIEW dbo.v_Ins_InstructorCourses
AS
SELECT I.InstructorID , U.UserName , C.CourseName
FROM dbo.Instructor I 
INNER JOIN dbo.[User] U ON I.UserID = U.UserID
INNER JOIN dbo.Inst_course IC ON  I.instructorID = IC.inst_ID
INNER JOIN dbo.Course C ON IC.Course_ID = C.CourseID;

GO
-- 14) views to show instructors needed exams only for their courses
CREATE OR ALTER VIEW v_Ins_InstructorExamList 
AS 
SELECT 
I.Inst_Name AS InstructorName , C.CourseName  , E.ExamID ,
-- UPDATED: Use YEAR(edate) to get the year
YEAR(E.edate) AS YearOfExam , E.Allowence AS AllowedDuration ,
CASE 
    -- UPDATED: Compare full date (edate) to current date for better accuracy
    WHEN E.edate < CAST(GETDATE() AS DATE) THEN 'Completed'
    ELSE 'Upcoming'
END AS ExamStatus
FROM Instructor I
JOIN inst_course IC ON I.InstructorID = IC.inst_ID
JOIN Course C ON IC.Course_ID = C.CourseID 
JOIN Class CL ON C.CourseID = CL.CourseID
JOIN Exam E ON E.ClassID = CL.ClassID;

GO
/*  Show all questions instructor can select for their 
courses, 
with type and degree.
*/

CREATE OR ALTER VIEW v_Ins_QuestionBankByInstructor 
AS 
SELECT I.InstructorID , U.Username AS InstructorName ,
C.CourseID , C.CourseName , Q.QuestionID , Q.Qtext,
Q.Qtype,
Q.Degree
FROM Instructor I
JOIN [User] U ON I.UserID = U.UserID
JOIN Inst_course IC ON I.InstructorID = IC.Inst_ID
JOIN Course C ON IC.Course_ID = C.CourseID
JOIN CourseQuestion CQ ON CQ.CourseID = C.CourseID
JOIN Question Q ON CQ.QuestionID = Q.QuestionID;


GO

-- view to show the course details for the instructor 

CREATE OR ALTER VIEW dbo.v_ins_CourseDetails
AS
SELECT 
    c.CourseID,
    c.CourseName,
    c.MinDegree,
    it.IntakeID,
    I.Inst_Name,
    COUNT(DISTINCT s.StudentID) AS TotalStudents,
    COUNT(DISTINCT e.ExamID) AS TotalExams
FROM Course c
LEFT JOIN Instructor I 
    ON I.InstructorID = c.CourseID
LEFT JOIN Class cl
    ON c.CourseID = cl.CourseID
LEFT JOIN Intake it
    ON cl.IntakeID = it.IntakeID
LEFT JOIN Exam e
    ON cl.ClassID = e.ClassID
LEFT JOIN StudentExam se
    ON e.ExamID = se.ExamID
LEFT JOIN Student s
    ON se.StudentID = s.StudentID
GROUP BY c.CourseID,c.CourseName,c.MinDegree,it.IntakeID , I.Inst_Name;

GO

--- View ins : To show Exam Details For instructor --- 

CREATE OR ALTER VIEW dbo.v_ins_ExamDetails
AS
SELECT 
    e.ExamID,
    c.CourseName,
    cl.ClassID,
    e.[edate],
    e.StartTime,
    e.EndTime,

    COUNT(DISTINCT eq.QuestionID) AS TotalQuestions,
    COUNT(DISTINCT se.StudentID) AS RegisteredStudents,
    COUNT(DISTINCT sa.STID) AS StudentsSubmitted

FROM Exam e

LEFT JOIN Class cl
    ON e.ClassID = cl.ClassID
LEFT JOIN Course c
    ON cl.CourseID = c.CourseID
LEFT JOIN ExamQuestion eq
    ON e.ExamID = eq.ExamID
LEFT JOIN StudentExam se
    ON e.ExamID = se.ExamID
LEFT JOIN StudentAnswer sa
    ON e.ExamID = sa.ExamID
GROUP BY 
    e.ExamID,
    c.CourseName,
    cl.ClassID,
    e.[edate],
    e.StartTime,
    e.EndTime;


GO
----------------------------------------------
--  Student Views

-- View to shows the student final score for exams

CREATE OR ALTER VIEW dbo.v_Stu_StudentExamResults
AS
WITH StudentExamTotal AS (
    SELECT
        SA.STID AS StudentID,
        SA.ExamID,
        SUM(SA.Degree_Given) AS TotalScore
    FROM StudentAnswer SA
    GROUP BY SA.STID, SA.ExamID
)
SELECT
    S.StudentID,
    S.ST_name,
    C.CourseName,
    YEAR(E.edate) AS [Year],
    SETT.TotalScore AS FinalScore,
    C.MinDegree,
    CASE
        WHEN SETT.TotalScore >= C.MinDegree THEN 'Pass'
        ELSE 'Fail'
    END AS Status
FROM StudentExamTotal SETT
JOIN Student S ON SETT.StudentID = S.StudentID
JOIN [User] U ON S.UserID = U.UserID
JOIN Exam E ON SETT.ExamID = E.ExamID
JOIN Class CL ON E.ClassID = CL.ClassID
JOIN Course C ON CL.CourseID = C.CourseID
WHERE U.UserID = (
    SELECT UserID
    FROM [User]
    WHERE Username = USER_NAME()
);

-- View that allows student to see what they got wrong 
-- important for their learning aspect

CREATE OR ALTER VIEW v_stu_StudentAnswerReview
AS
SELECT
    SA.STID,
    SA.ExamID,
    Q.QText,
    SA.IsCorrect,
    CASE
        WHEN Q.Qtype = 'MCQ' THEN (SELECT TOP 1 MCQtext FROM MCQ WHERE MCQ.QID = Q.QuestionID AND isCorrect = 1)
        WHEN Q.Qtype = 'TrueFalse' THEN 
            CASE WHEN TF.IsTrue = 1 THEN 'True' ELSE 'False' END
        -- ADD THIS LINE TO HANDLE TEXT/ESSAY QUESTIONS
        ELSE 'Review Required / Subjective' 
    END AS ModelAnswer,
    SA.Answertext AS StudentAnswer
FROM StudentAnswer SA
JOIN Question Q ON SA.QID = Q.QuestionID
LEFT JOIN TrueFalseQuestion TF ON Q.QuestionID = TF.QID;
GO
----------------------------------------------------------
-- view to show exams assigned to student ,coursename , examdate and if exam is still avaliable 
CREATE OR ALTER VIEW dbo.v_stu_AvailableExams
AS
SELECT 
    se.StudentID,
    e.ExamID,
    c.CourseName,
    e.[edate],
    e.StartTime,
    e.EndTime,
    CASE 
        WHEN GETDATE() BETWEEN CAST(e.edate AS DATETIME) + CAST(e.StartTime AS DATETIME)  AND CAST(e.edate AS DATETIME) + CAST(e.EndTime AS DATETIME) 
             THEN 
                'Available'
        WHEN GETDATE() < CAST(e.edate AS DATETIME) + CAST(e.StartTime AS DATETIME) 
             THEN 
                'Upcoming'
        ELSE 
            'Closed'
    END AS ExamStatus,
    CASE 
        WHEN EXISTS (
            SELECT *
            FROM StudentAnswer sa
            WHERE sa.STID = se.StudentID
              AND sa.ExamID = se.ExamID
        )
        THEN 'Submitted'
        ELSE 'Not Submitted'
    END AS SubmissionStatus
FROM StudentExam se
INNER JOIN Exam e
    ON se.ExamID = e.ExamID
INNER JOIN Class cl
    ON e.ClassID = cl.ClassID
INNER JOIN Course c
    ON cl.CourseID = c.CourseID;
    
GO
  
--StudName, CourseName, FinalResult, Statues(Success/Fail/NotGraded) for (manager, instructor)
CREATE or Alter VIEW View_StudentGrades AS
SELECT 
    S.ST_name AS [Student Name], 
    C.CourseName AS [Course Name], 
    CR.FinalDegree AS [Final Grade],
    CR.Status AS [Status]
FROM Student S
JOIN CourseResult CR ON S.StudentID = CR.StudentID
JOIN Course C ON CR.CourseID = C.CourseID;
GO
--------------Testing---------
select * from View_StudentGrades
Go
------------------------------
--View Exam Quesions for (manager,instructor)
CREATE OR ALTER VIEW View_ExamQuestions AS
SELECT 
    E.ExamID,
    C.CourseName,
    Q.QuestionID,
    Q.Qtext AS [Question],
    Q.Qtype AS [Type],
    Q.Degree AS [Marks],
    
    -- DYNAMIC CHOICES COLUMN
    CASE 
        -- If MCQ: Go fetch all choices, separate them with comma, and put in one cell
        WHEN Q.Qtype = 'MCQ' THEN (
            SELECT STRING_AGG(M.MCQtext, ', ') WITHIN GROUP (ORDER BY M.MCQID)
            FROM MCQ M 
            WHERE M.QID = Q.QuestionID
        )
        -- If True/False: Hardcoded text
        WHEN Q.Qtype = 'TF' THEN 'True, False' 
        -- If Text: Placeholder
        ELSE 'Written Answer' 
    END AS [Choices]

FROM Exam E
JOIN ExamQuestion EQ ON E.ExamID = EQ.ExamID
JOIN Question Q ON EQ.QuestionID = Q.QuestionID
JOIN Class Cl ON E.ClassID = Cl.ClassID
JOIN Course C ON Cl.CourseID = C.CourseID
;
GO
--------------Testing---------
select * from View_ExamQuestions;
Go
------------------------------

--IntructorName, Courses he teachs, number of students for each course for (manager)
CREATE or ALTER VIEW View_InstructorCourses AS
SELECT 
    I.InstructorID,
    I.Inst_Name AS [Instructor Name],
    C.CourseName AS [Course Name],
    COUNT(S.StudentID) AS [Number of Students]
FROM Instructor I
JOIN Class Cl ON I.InstructorID = Cl.Inst_ID
JOIN Course C ON Cl.CourseID = C.CourseID
-- For the same branch,intake 
JOIN Student S ON Cl.BranchID = S.BranchID AND Cl.IntakeID = S.Intake_ID
GROUP BY I.InstructorID, I.Inst_Name, C.CourseName;
GO
--------------Testing---------
select * from View_InstructorCourses;
Go
------------------------------
--View Model Answer for (instuctor)
CREATE OR ALTER VIEW View_QuestionsWithModelAnswers AS
SELECT 
    C.CourseName,
    Q.Qtext AS [Question],
    Q.Qtype AS [Type],
    Q.Degree,
    -- Dynamic Model Answer based on Question Type
    CASE 
        -- 1. MCQ: Show the text of the Correct Option
        WHEN Q.Qtype = 'MCQ' THEN M.MCQtext
        
        -- 2. True/False: Show '1' or '0' (or cast to True/False text if preferred)
        WHEN Q.Qtype = 'TF' THEN CAST(TF.IsTrue AS VARCHAR(5))
        
        -- 3. Text: Aggregate all associated Keywords into one string
        WHEN Q.Qtype = 'Text' THEN (
            SELECT STRING_AGG(K.Keyword, ', ') 
            FROM TextQuestionKeywords K 
            WHERE K.QID = Q.QuestionID
        )
        
        ELSE 'N/A'
    END AS [Model Answer]

FROM Question Q
JOIN CourseQuestion CQ ON Q.QuestionID = CQ.QuestionID
JOIN Course C ON CQ.CourseID = C.CourseID
-- Join for MCQ Correct Answer
LEFT JOIN MCQ M ON Q.QuestionID = M.QID AND M.isCorrect = 1
-- Join for True/False Answer
LEFT JOIN TrueFalseQuestion TF ON Q.QuestionID = TF.QID;
GO
--------Course->Opened classes
CREATE OR ALTER VIEW vw_CourseClasses
AS
SELECT 
    C.CourseID,
    C.CourseName,
    
    CL.ClassID,
    -- Dynamically generating a "Name" for the class since tables usually lack one
    CONCAT(C.CourseName, ' - Class ', CL.ClassID, ' (', CL.Year, ')') AS ClassName

FROM 
    Class CL
JOIN 
    Course C ON CL.CourseID = C.CourseID 
GO