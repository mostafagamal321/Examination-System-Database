--------Testing----------
Exec sp_ins_viewExam 1,1;
Go
--------------------

CREATE OR ALTER PROCEDURE sp_ins_viewExam
    @InstructorID INT,
    @ExamID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Optional: Check if this instructor actually teaches the course for this exam
    -- (You can remove this block if you want any instructor to see any exam)
    IF NOT EXISTS (
        SELECT 1
        FROM Exam E
        JOIN Class C ON E.ClassID = C.ClassID
        JOIN Inst_Course IC ON C.CourseID = IC.Course_ID
        WHERE E.ExamID = @ExamID AND IC.Inst_ID = @InstructorID
    )
    BEGIN
        PRINT 'Warning: You are viewing an exam for a course you are not explicitly assigned to.';
    END

    -- Return Exam Content (No Time/Date Restrictions)
    SELECT 
        E.ExamID,
        C.CourseName,
        E.edate AS [Exam Date], -- Show the scheduled date
        E.StartTime,
        Q.QuestionID,
        Q.Qtext AS [Question],
        Q.Qtype AS [Type],
        Q.Degree AS [Marks],

        -- 1. SHOW CHOICES (For context)
        CASE 
            WHEN Q.Qtype = 'MCQ' THEN (
                SELECT STRING_AGG(M.MCQtext, ', ') 
                FROM MCQ M WHERE M.QID = Q.QuestionID
            )
            WHEN Q.Qtype = 'TF' THEN 'True, False'
            ELSE 'N/A'
        END AS [Choices],

        -- 2. SHOW MODEL ANSWER (Exclusive to Instructor)
        CASE 
            WHEN Q.Qtype = 'MCQ' THEN (
                SELECT TOP 1 M.MCQtext 
                FROM MCQ M WHERE M.QID = Q.QuestionID AND M.isCorrect = 1
            )
            WHEN Q.Qtype = 'TF' THEN (
                SELECT TOP 1 CASE WHEN IsTrue=1 THEN 'True' ELSE 'False' END
                FROM TrueFalseQuestion WHERE QID = Q.QuestionID
            )
            WHEN Q.Qtype = 'Text' THEN (
                 SELECT STRING_AGG(Keyword, ', ') 
                 FROM TextQuestionKeywords WHERE QID = Q.QuestionID
            )
        END AS [Model Answer]

    FROM Exam E
    JOIN ExamQuestion EQ ON E.ExamID = EQ.ExamID
    JOIN Question Q ON EQ.QuestionID = Q.QuestionID
    JOIN Class Cl ON E.ClassID = Cl.ClassID
    JOIN Course C ON Cl.CourseID = C.CourseID
    WHERE E.ExamID = @ExamID;

END;
GO