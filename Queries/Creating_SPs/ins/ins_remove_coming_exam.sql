USE ExamsSystem;
GO
--------Testing----------
EXEC sp_DeleteExam 2;
Go
select * from Exam;
Go
--------------------
CREATE OR ALTER PROCEDURE sp_DeleteExam
    @ExamID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ExamDate DATE;
    DECLARE @StartTime TIME;
    
    -- 1. Get Exam Schedule Details
    SELECT 
        @ExamDate = edate,
        @StartTime = StartTime
    FROM Exam 
    WHERE ExamID = @ExamID;

    -- Check if Exam exists
    IF @ExamDate IS NULL
    BEGIN
        RAISERROR('Error: Exam ID not found.', 16, 1);
        RETURN;
    END

    -- 2. SAFETY CHECK: Is the exam in the past?
    -- We allow deletion ONLY if the exam is in the future OR later today.
    IF @ExamDate < CAST(GETDATE() AS DATE) 
       OR (@ExamDate = CAST(GETDATE() AS DATE) AND @StartTime < CAST(GETDATE() AS TIME))
    BEGIN
        RAISERROR('Error: Cannot delete a past or ongoing exam. History must be preserved.', 16, 1);
        RETURN;
    END

    BEGIN TRY
        BEGIN TRANSACTION;

            -- 3. Delete Dependencies (The Cleanup Phase)
            
            -- A. Remove any student answers (Just in case some exist from testing)
            DELETE FROM StudentAnswer WHERE ExamID = @ExamID;
            
            -- B. Remove Student Assignments (The Registration List)
            DELETE FROM StudentExam WHERE ExamID = @ExamID;

            -- C. Remove the Questions linked to this specific Exam
            DELETE FROM ExamQuestion WHERE ExamID = @ExamID;

            -- 4. Finally, Delete the Exam itself
            DELETE FROM Exam WHERE ExamID = @ExamID;

        COMMIT TRANSACTION;
        PRINT 'Exam and all related assignments deleted successfully.';

    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO