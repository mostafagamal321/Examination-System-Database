USE ExamsSystem;
GO
CREATE OR ALTER PROCEDURE sp_CreateRandomExam
    -- Exam Details
    @CourseID INT,
    @ClassID INT,
    @StartTime TIME,
    @EndTime TIME,
    @ExamType VARCHAR(30),
    @Allowance VARCHAR(75),
    
    -- UPDATED PARAMETER: Date instead of Year
    @ExamDate DATE, 
    
    -- Structure Details
    @NumMCQ INT = 0,
    @NumTF INT = 0,
    @NumText INT = 0
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

            -- 1. CREATE THE EXAM HEADER
            -- Updated to use 'edate' instead of 'Year'
            INSERT INTO Exam (Allowence, ExamType, StartTime, EndTime, edate, ClassID)
            VALUES (@Allowance, @ExamType, @StartTime, @EndTime, @ExamDate, @ClassID);

            DECLARE @NewExamID INT = SCOPE_IDENTITY();

            -- 2. SELECT RANDOM MCQs
            IF @NumMCQ > 0
            BEGIN
                INSERT INTO ExamQuestion (ExamID, QuestionID, Stud_Degree)
                SELECT TOP (@NumMCQ) @NewExamID, Q.QuestionID, Q.Degree
                FROM Question Q
                JOIN CourseQuestion CQ ON Q.QuestionID = CQ.QuestionID
                WHERE CQ.CourseID = @CourseID AND Q.Qtype = 'MCQ'
                ORDER BY NEWID();
            END

            -- 3. SELECT RANDOM T/F
            IF @NumTF > 0
            BEGIN
                INSERT INTO ExamQuestion (ExamID, QuestionID, Stud_Degree)
                SELECT TOP (@NumTF) @NewExamID, Q.QuestionID, Q.Degree
                FROM Question Q
                JOIN CourseQuestion CQ ON Q.QuestionID = CQ.QuestionID
                WHERE CQ.CourseID = @CourseID AND Q.Qtype = 'TF'
                ORDER BY NEWID();
            END

            -- 4. SELECT RANDOM TEXT
            IF @NumText > 0
            BEGIN
                INSERT INTO ExamQuestion (ExamID, QuestionID, Stud_Degree)
                SELECT TOP (@NumText) @NewExamID, Q.QuestionID, Q.Degree
                FROM Question Q
                JOIN CourseQuestion CQ ON Q.QuestionID = CQ.QuestionID
                WHERE CQ.CourseID = @CourseID AND Q.Qtype = 'Text'
                ORDER BY NEWID();
            END

        COMMIT TRANSACTION;
        SELECT @NewExamID AS NewExamID, 'Exam Created Successfully' AS Message;

    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO
---------------Testing--------------
Exec sp_CreateRandomExam @CourseID=2, @ClassID =1, @StartTime = '14:00:00',  @EndTime = '23:59:55', @ExamType = 'Exam',
@Allowance = 'Empty Sheet', @ExamDate = '02-22-2026',
@NumMCQ =1 ,@NumTF = 1, @NumText = 1;
-- --------Extra Testing--------------
select * from Exam;
select * from Question;
select * from ExamQuestion;
select * from StudentExam;