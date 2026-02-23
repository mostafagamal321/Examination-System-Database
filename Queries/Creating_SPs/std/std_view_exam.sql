USE ExamsSystem;
GO
--------------Testing------------------
Exec sp_std_viewExam 1,1
Go
-----------------------------------
CREATE OR ALTER PROCEDURE sp_std_viewExam
    @StudentID INT,
    @ExamID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- 1. SECURITY CHECK: IS STUDENT REGISTERED?
        IF NOT EXISTS (
        SELECT 1 
        FROM StudentExam 
        WHERE StudentID = @StudentID AND ExamID = @ExamID
    )
    BEGIN
        RAISERROR('Access Denied: You are not registered for this exam.', 16, 1);
        RETURN;
    END

    -- 2. SECURITY CHECK: IS IT EXAM TIME? (UPDATED)
    -- Now checks BOTH Date (edate) AND Time
    IF NOT EXISTS (
        SELECT 1 
        FROM Exam 
        WHERE ExamID = @ExamID 
          AND edate = CAST(GETDATE() AS DATE) -- Must be TODAY
          AND CAST(GETDATE() AS TIME) BETWEEN StartTime AND EndTime -- Must be NOW
    )
    BEGIN
        RAISERROR('Access Denied: The exam is not currently active (Check Schedule).', 16, 1);
        RETURN;
    END

    -- 3. RETURN QUESTIONS
    SELECT 
        E.ExamID,
        C.CourseName,
        Q.QuestionID,
        Q.Qtext AS [Question],
        Q.Qtype AS [Type],
        Q.Degree AS [Marks],
        
        -- DYNAMIC CHOICES (Comma Separated)
        CASE 
            WHEN Q.Qtype = 'MCQ' THEN (
                SELECT STRING_AGG(M.MCQtext, ', ') 
                FROM MCQ M 
                WHERE M.QID = Q.QuestionID
            )
            WHEN Q.Qtype = 'TF' THEN 'True, False' 
            ELSE 'Written Answer' 
        END AS [Choices]

    FROM Exam E
    JOIN ExamQuestion EQ ON E.ExamID = EQ.ExamID
    JOIN Question Q ON EQ.QuestionID = Q.QuestionID
    JOIN Class Cl ON E.ClassID = Cl.ClassID
    JOIN Course C ON Cl.CourseID = C.CourseID
    WHERE E.ExamID = @ExamID;

END;
GO




