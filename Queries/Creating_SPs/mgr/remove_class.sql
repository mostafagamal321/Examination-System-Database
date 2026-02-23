USE ExamsSystem;
GO

CREATE OR ALTER PROCEDURE sp_DeleteClass_Hard
    @ClassID INT,
    @ConfirmDelete BIT = 0 -- Safety Switch: Must be set to 1 to run
AS
BEGIN
    SET NOCOUNT ON;

    -- 1. SAFETY CHECK
    IF @ConfirmDelete = 0
    BEGIN
        RAISERROR('Safety Error: You are about to DELETE a Class. This will wipe ALL Exams and Student Grades linked to this specific class. Set @ConfirmDelete = 1 to proceed.', 16, 1);
        RETURN;
    END

    -- Check if Class exists
    IF NOT EXISTS (SELECT 1 FROM Class WHERE ClassID = @ClassID)
    BEGIN
        RAISERROR('Error: Class ID not found.', 16, 1);
        RETURN;
    END

    BEGIN TRY
        BEGIN TRANSACTION;

            -- =================================================================
            -- STEP A: DELETE DEPENDENT EXAM DATA
            -- =================================================================
            -- We need to clean up everything related to Exams held for this Class.
            
            -- 1. Delete Questions attached to Exams of this Class
            DELETE FROM ExamQuestion 
            WHERE ExamID IN (SELECT ExamID FROM Exam WHERE ClassID = @ClassID);

            -- 2. Delete Student Answers for Exams of this Class
            DELETE FROM StudentAnswer 
            WHERE ExamID IN (SELECT ExamID FROM Exam WHERE ClassID = @ClassID);

            -- 3. Delete Student Assignments (Registrations) for Exams of this Class
            DELETE FROM StudentExam 
            WHERE ExamID IN (SELECT ExamID FROM Exam WHERE ClassID = @ClassID);

            -- 4. Delete the Exams themselves
            DELETE FROM Exam 
            WHERE ClassID = @ClassID;

            -- =================================================================
            -- STEP B: DELETE THE CLASS
            -- =================================================================
            DELETE FROM Class 
            WHERE ClassID = @ClassID;

        COMMIT TRANSACTION;
        PRINT 'SUCCESS: Class and all associated Exams/Grades have been permanently deleted.';

    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR ('Hard Delete Failed: %s', 16, 1, @ErrorMessage);
    END CATCH
END;
GO