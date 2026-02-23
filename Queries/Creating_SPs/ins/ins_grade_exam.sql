USE ExamsSystem;
GO

CREATE PROCEDURE sp_FinalExamResult
    @StudentID INT,
    @ExamID INT
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Variables for grading
    DECLARE @CourseID INT;
    DECLARE @MinDegree INT;
    DECLARE @TotalScore INT = 0;
    DECLARE @StudentStatus VARCHAR(50);

    -- ======================================================
    -- 1. IDENTIFY COURSE INFO
    -- ======================================================
    -- We link Exam -> Class -> Course to find which course this exam belongs to
    SELECT 
        @CourseID = C.CourseID, 
        @MinDegree = Co.MinDegree
    FROM Exam E
    JOIN Class C ON E.ClassID = C.ClassID
    JOIN Course Co ON C.CourseID = Co.CourseID
    WHERE E.ExamID = @ExamID;

    IF @CourseID IS NULL
    BEGIN
        PRINT 'Error: Could not find Course associated with this Exam.';
        RETURN;
    END
    -- ======================================================
    -- 2. BATCH GRADE: MCQ QUESTIONS
    -- ======================================================
    -- Updates StudentAnswer by comparing text with the correct MCQ option
    -- select * from StudentAnswer
    -- select * from mcq
    -- select * from Question
    -- GO
    -- alter TABLE StudentAnswer alter column Answertext NVARCHAR(150)
    -- alter table MCQ alter column MCQtext NVARCHAR(150)
    -- Go
    UPDATE SA
    SET --grading MCQ
        SA.isCorrect = CASE --is the answer correct ?
            WHEN M.MCQtext = SA.Answertext THEN 1 
            ELSE 0 
        END,
        SA.Degree_given = CASE --if the answer is correct give the full degree of the mcq
            WHEN M.MCQtext = SA.Answertext THEN Q.Degree 
            ELSE 0 
        END
    FROM StudentAnswer SA
    JOIN Question Q ON SA.QID = Q.QuestionID
    JOIN MCQ M ON Q.QuestionID = M.QID
    WHERE SA.STID = @StudentID 
      AND SA.ExamID = @ExamID 
      AND Q.Qtype = 'MCQ'
      AND M.isCorrect = 1; -- Filter only correct MCQ answers

    -- ======================================================
    -- 3. BATCH GRADE: TRUE/FALSE QUESTIONS
    -- ======================================================
    -- Updates StudentAnswer by comparing text ('True'/'False') with the bit value
    UPDATE SA
    SET 
        SA.isCorrect = CASE --Std answer matches model answer for T/F ?
            WHEN (SA.Answertext = 'True' AND TF.IsTrue = 1) OR 
                 (SA.Answertext = 'False' AND TF.IsTrue = 0) THEN 1 
            ELSE 0 
        END,
        SA.Degree_given = CASE -- If the ans is correct give tje full degree
            WHEN (SA.Answertext = 'True' AND TF.IsTrue = 1) OR 
                 (SA.Answertext = 'False' AND TF.IsTrue = 0) THEN Q.Degree 
            ELSE 0 
        END
    FROM StudentAnswer SA
    JOIN Question Q ON SA.QID = Q.QuestionID
    JOIN TrueFalseQuestion TF ON Q.QuestionID = TF.QID
    WHERE SA.STID = @StudentID 
      AND SA.ExamID = @ExamID 
      AND Q.Qtype = 'TF';

    -- ======================================================
    -- 4. BATCH GRADE: TEXT QUESTIONS (Keyword Match)
    -- ======================================================
    -- We calculate the score based on how many keywords match
    -- Note: Requires the 'TextQuestionKeywords' table created previously
    UPDATE SA
    SET 
        SA.Degree_given = (
            SELECT ISNULL(
                (COUNT(*) * Q.Degree) / NULLIF((SELECT COUNT(*) FROM TextQuestionKeywords WHERE QID = SA.QID), 0)
            , 0)
            FROM TextQuestionKeywords K
            WHERE K.QID = SA.QID 
              AND SA.Answertext LIKE '%' + K.Keyword + '%'
        ),
        SA.isCorrect = CASE 
            WHEN (SELECT COUNT(*) FROM TextQuestionKeywords WHERE QID = SA.QID AND SA.Answertext LIKE '%' + Keyword + '%') 
                 = (SELECT COUNT(*) FROM TextQuestionKeywords WHERE QID = SA.QID) THEN 1 
            ELSE 0 
        END
    FROM StudentAnswer SA
    JOIN Question Q ON SA.QID = Q.QuestionID
    WHERE SA.STID = @StudentID 
      AND SA.ExamID = @ExamID 
      AND Q.Qtype = 'Text';

    -- ======================================================
    -- 5. CALCULATE TOTAL SCORE
    -- ======================================================
    SELECT @TotalScore = ISNULL(SUM(Degree_given), 0)
    FROM StudentAnswer
    WHERE STID = @StudentID AND ExamID = @ExamID;

    -- Determine Pass/Fail Status
    IF @TotalScore >= @MinDegree
        SET @StudentStatus = 'Passed';
    ELSE
        SET @StudentStatus = 'Failed';

    -- ======================================================
    -- 6. UPDATE COURSE RESULT
    -- ======================================================
    -- Use MERGE to Insert if new, Update if exists
    MERGE INTO CourseResult AS Target
    USING (SELECT @StudentID AS SID, @CourseID AS CID) AS Source
    ON (Target.StudentID = Source.SID AND Target.CourseID = Source.CID)
    
    WHEN MATCHED THEN
        UPDATE SET 
            FinalDegree = @TotalScore,
            Status = @StudentStatus

    WHEN NOT MATCHED THEN
        INSERT (StudentID, CourseID, FinalDegree, Status)
        VALUES (@StudentID, @CourseID, @TotalScore, @StudentStatus);

    -- ======================================================
    -- 7. RETURN REPORT
    -- ======================================================
    SELECT 
        S.ST_name AS StudentName,
        C.CourseName,
        @TotalScore AS ScoreObtained,
        Co.MaxDegree AS MaxScore,
        @StudentStatus AS Status
    FROM Student S
    JOIN Course C ON C.CourseID = @CourseID
    JOIN Course Co ON Co.CourseID = @CourseID
    WHERE S.StudentID = @StudentID;

END;
GO 

------------------Testing---------------------
EXEC sp_FinalExamResult @StudentID = 500, @ExamID = 1;
-- --------Extra Testing--------------
select * from courseResult;
select * from class;
select * from Exam;
select * from Course;
select * from Student;
select * from StudentAnswer;
select * from StudentExam;
-- update class set Year = 2026
-- update exam set ClassID =1