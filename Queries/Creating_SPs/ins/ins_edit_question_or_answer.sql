USE ExamsSystem;
GO
--------Testing----------

Go
--------------------
CREATE OR ALTER PROCEDURE sp_EditQuestion
    @QuestionID INT,
    
    -- Common details
    @NewQText NVARCHAR(MAX),
    @NewDegree INT,

    -- Specific details (Pass NULL if not applicable)
    @NewCorrectAnswer NVARCHAR(MAX) = NULL, -- For MCQ (Correct Option)
    @NewWrongAnswers NVARCHAR(MAX) = NULL,  -- For MCQ (Comma-separated Wrong Options)
    @NewIsTrue BIT = NULL,                  -- For TF (1 or 0)
    @NewKeywords NVARCHAR(MAX) = NULL       -- For Text (Comma-separated)
AS
BEGIN
    SET NOCOUNT ON;
    
    -- 1. Check if Question Exists & Get Type
    DECLARE @QType VARCHAR(50);
    SELECT @QType = Qtype FROM Question WHERE QuestionID = @QuestionID;

    IF @QType IS NULL
    BEGIN
        RAISERROR('Error: Question ID not found.', 16, 1);
        RETURN;
    END

    BEGIN TRY
        BEGIN TRANSACTION;

            -- 2. Update Base Question Details (Text & Degree)
            UPDATE Question 
            SET Qtext = @NewQText, 
                Degree = @NewDegree 
            WHERE QuestionID = @QuestionID;

            -- 3. Update Specific Answers based on Type
            
            -- =================================================
            -- TYPE: MCQ (Wipe and Replace Strategy)
            -- =================================================
            IF @QType = 'MCQ'
            BEGIN
                -- A. Delete ALL existing options for this question
                DELETE FROM MCQ WHERE QID = @QuestionID;

                -- B. Insert the NEW Correct Option
                IF @NewCorrectAnswer IS NOT NULL
                BEGIN
                    INSERT INTO MCQ (QID, MCQtext, isCorrect)
                    VALUES (@QuestionID, @NewCorrectAnswer, 1);
                END

                -- C. Insert the NEW Wrong Options (Distractors)
                IF @NewWrongAnswers IS NOT NULL
                BEGIN
                    INSERT INTO MCQ (QID, MCQtext, isCorrect)
                    SELECT @QuestionID, TRIM(value), 0
                    FROM STRING_SPLIT(@NewWrongAnswers, ',');
                END
            END

            -- =================================================
            -- TYPE: True / False
            -- =================================================
            ELSE IF @QType = 'TF'
            BEGIN
                IF @NewIsTrue IS NOT NULL
                BEGIN
                    UPDATE TrueFalseQuestion
                    SET IsTrue = @NewIsTrue
                    WHERE QID = @QuestionID;
                END
            END

            -- =================================================
            -- TYPE: Text (Keywords)
            -- =================================================
            ELSE IF @QType = 'Text'
            BEGIN
                IF @NewKeywords IS NOT NULL
                BEGIN
                    -- A. Delete old keywords
                    DELETE FROM TextQuestionKeywords WHERE QID = @QuestionID;

                    -- B. Insert new keywords
                    INSERT INTO TextQuestionKeywords (QID, Keyword)
                    SELECT @QuestionID, TRIM(value)
                    FROM STRING_SPLIT(@NewKeywords, ',');
                END
            END

        COMMIT TRANSACTION;
        PRINT 'Question and Answer updated successfully.';

    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO