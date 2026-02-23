--Adding a new question
USE ExamsSystem;
GO

CREATE OR ALTER PROCEDURE sp_AddQuestion
    @CourseID INT,
    @QType VARCHAR(50),             -- 'MCQ', 'TF', 'Text'
    @QText NVARCHAR(MAX),           -- The Question Body
    @Degree INT,
    @CorrectAnswer NVARCHAR(MAX) = NULL, -- The CORRECT option
    @WrongAnswers NVARCHAR(MAX) = NULL,  -- NEW: Comma-separated WRONG options
    @IsTrue BIT = NULL,                  -- For True/False
    @Keywords NVARCHAR(MAX) = NULL       -- For Text Questions
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
            -- 1. Insert Base Question
            INSERT INTO Question (Qtext, Degree, Qtype) 
            VALUES (@QText, @Degree, @QType);
            
            DECLARE @NewQID INT = SCOPE_IDENTITY();

            -- 2. Link to Course
            INSERT INTO CourseQuestion (QuestionID, CourseID)
            VALUES (@NewQID, @CourseID);

            -- 3. Logic by Question Type
            IF @QType = 'MCQ'
            BEGIN
                -- A. Insert the Correct Option (Status = 1)
                IF @CorrectAnswer IS NOT NULL
                BEGIN
                    INSERT INTO MCQ (MCQtext, isCorrect, QID) 
                    VALUES (@CorrectAnswer, 1, @NewQID);
                END

                -- B. Insert the Wrong Options (Status = 0)
                -- We use STRING_SPLIT to break the comma-separated string into rows
                IF @WrongAnswers IS NOT NULL
                BEGIN
                    INSERT INTO MCQ (MCQtext, isCorrect, QID)
                    SELECT TRIM(value), 0, @NewQID
                    FROM STRING_SPLIT(@WrongAnswers, ',');
                END
            END
            
            ELSE IF @QType = 'TF'
            BEGIN
                INSERT INTO TrueFalseQuestion (IsTrue, QID) 
                VALUES (@IsTrue, @NewQID);
            END
            
            ELSE IF @QType = 'Text' AND @Keywords IS NOT NULL
            BEGIN
                -- Insert keywords for auto-grading
                INSERT INTO TextQuestionKeywords (QID, Keyword)
                SELECT @NewQID, TRIM(value) 
                FROM STRING_SPLIT(@Keywords, ',');
            END

        COMMIT TRANSACTION;
        
        -- Return the new ID
        SELECT @NewQID AS NewQuestionID;
        
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO
----------------------------------------------
select * from Question
select * from MCQ
select * from TrueFalseQuestion
SELECT * from TextQuestionKeywords
----------------------Testing Adding T/F Q----------------
-- Adding a Question: "HTML is a programming language" (False)
DECLARE @QID_Output INT;

EXEC sp_AddQuestion 
    @CourseID = 10,              -- The Course ID
    @QType = 'TF',               -- Type
    @QText = 'CSS is a programming language', 
    @Degree = 5, 
    @IsTrue = 0,                 -- 0 = False
    @CorrectAnswer = NULL,       -- Not needed for T/F
    @Keywords = NULL;            -- Not needed for T/F

----------------------Testing Adding TEXT Q----------------
-- Adding a Question: "Explain the difference between DELETE and TRUNCATE"
DECLARE @QID_Output INT;

EXEC sp_AddQuestion 
    @CourseID = 10, 
    @QType = 'Text', 
    @QText = 'Explain the difference between DELETE and TRUNCATE', 
    @Degree = 10, 
    @Keywords = 'Log,Rollback,Space,DML,DDL', -- Keywords for auto-grading
    @CorrectAnswer = NULL, 
    @IsTrue = NULL;


----------------------Testing MCQ Q----------------
DECLARE @NewID INT;

EXEC sp_AddQuestion 
    @CourseID = 10,
    @QType = 'MCQ',
    @QText = 'Which SQL command is used to remove a table?',
    @Degree = 5,
    -- 1. The Right Answer
    @CorrectAnswer = 'DROP',
    -- 2. The Wrong Answers (Separated by comma)
    @WrongAnswers = 'DELETE, REMOVE, TRUNCATE, ERASE',
    -- 3. Nulls for other types
    @IsTrue = NULL,
    @Keywords = NULL;