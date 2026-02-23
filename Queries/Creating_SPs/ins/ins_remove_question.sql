USE ExamsSystem;
GO
--------Testing----------
Exec sp_RemoveQuestion 4;
Go
select * from ExamQuestion
Go
--------------------
CREATE OR ALTER PROCEDURE sp_RemoveQuestion
    @QuestionID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- 1. SECURITY CHECK: IS QUESTION USED IN ANY EXAM?
    -- We cannot delete a question that is part of an exam paper (past or future),
    -- as this would break the history of that exam.
    IF EXISTS (
        SELECT 1 
        FROM ExamQuestion 
        WHERE QuestionID = @QuestionID
    )
    BEGIN
        RAISERROR('Error: Cannot delete this question because it is attached to one or more exams.', 16, 1);
        RETURN;
    END

    -- Check if question exists at all
    IF NOT EXISTS (SELECT 1 FROM Question WHERE QuestionID = @QuestionID)
    BEGIN
        RAISERROR('Error: Question ID not found.', 16, 1);
        RETURN;
    END

    BEGIN TRY
        BEGIN TRANSACTION;

            -- 2. DELETE CHILD DATA (Specific Details)
            -- We delete from all potential child tables. 
            -- (SQL will just ignore the delete if the row doesn't exist in that specific table)
            
            DELETE FROM MCQ WHERE QID = @QuestionID;
            DELETE FROM TrueFalseQuestion WHERE QID = @QuestionID;
            DELETE FROM TextQuestionKeywords WHERE QID = @QuestionID;

            -- 3. DELETE LINK TO COURSE
            DELETE FROM CourseQuestion WHERE QuestionID = @QuestionID;

            -- 4. DELETE THE QUESTION ITSELF
            DELETE FROM Question WHERE QuestionID = @QuestionID;

        COMMIT TRANSACTION;
        PRINT 'Question deleted successfully from the bank.';

    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        -- Re-throw the error for the application
        THROW;
    END CATCH
END;
GO