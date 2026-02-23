CREATE OR ALTER PROCEDURE sp_SubmitAnswer
    @StudentID INT,
    @ExamID INT,
    @QuestionID INT,
    @AnswerText NVARCHAR(MAX) -- Changed from TEXT to allow string comparison
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @QType VARCHAR(50);
    DECLARE @FinalAnswer NVARCHAR(MAX);

    -- 1. Get the Question Type
    SELECT @QType = Qtype 
    FROM Question 
    WHERE QuestionID = @QuestionID;

    -- 2. Normalize Answer if it is True/False
    IF @QType = 'TF'
    BEGIN
        -- Remove spaces and convert to Upper Case for easy comparison
        DECLARE @CleanInput NVARCHAR(50) = UPPER(TRIM(@AnswerText));

        SET @FinalAnswer = CASE 
            WHEN @CleanInput IN ('T', 'TRUE', '1') THEN 'True'
            WHEN @CleanInput IN ('F', 'FALSE', '0') THEN 'False'
            ELSE NULL -- Invalid input becomes NULL
        END;
    END
    ELSE
    BEGIN
        -- For MCQ or Text questions, keep original input
        SET @FinalAnswer = @AnswerText;
    END

    -- 3. Insert or Update the Answer
    -- Using MERGE is safer to avoid duplicate primary key errors if they resubmit
    MERGE INTO StudentAnswer AS Target
    USING (SELECT @StudentID AS SID, @ExamID AS EID, @QuestionID AS QID) AS Source
    ON (Target.STID = Source.SID AND Target.ExamID = Source.EID AND Target.QID = Source.QID)
    
    WHEN MATCHED THEN
        UPDATE SET Answertext = @FinalAnswer
        
    WHEN NOT MATCHED THEN
        INSERT (STID, ExamID, QID, Answertext)
        VALUES (@StudentID, @ExamID, @QuestionID, @FinalAnswer);

END;
GO
-----Testing-> (STID, ExamID, QID, Answertext)----------
Exec sp_SubmitAnswer 1,1,2,'True'
go
----------------testing-----------------------
select * from StudentAnswer
select * from TrueFalseQuestion
select * from Question
select * from Exam
select * from mcq
select * from studentExam
------Time is all the day for testing-----------
