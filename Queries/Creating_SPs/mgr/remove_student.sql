USE ExamsSystem;
GO

CREATE OR ALTER PROCEDURE sp_DeleteStudent_Hard
    @StudentID INT,
    @ConfirmDelete BIT = 0 -- Safety Switch
AS
BEGIN
    SET NOCOUNT ON;

    -- 1. SAFETY CHECK
    IF @ConfirmDelete = 0
    BEGIN
        RAISERROR('Safety Error: You are about to DELETE a Student and their entire exam history. Set @ConfirmDelete = 1 to proceed.', 16, 1);
        RETURN;
    END

    -- Check if Student exists
    DECLARE @UserID INT;
    SELECT @UserID = UserID FROM Student WHERE StudentID = @StudentID;

    IF @UserID IS NULL
    BEGIN
        RAISERROR('Error: Student ID not found.', 16, 1);
        RETURN;
    END

    BEGIN TRY
        BEGIN TRANSACTION;

            -- =================================================================
            -- STEP A: DELETE EXAM HISTORY (Answers & Grades)
            -- =================================================================
            DELETE FROM StudentAnswer 
            WHERE STID = @StudentID;

            -- =================================================================
            -- STEP B: DELETE EXAM REGISTRATIONS
            -- =================================================================
            DELETE FROM StudentExam 
            WHERE StudentID = @StudentID;

            -- =================================================================
            -- STEP C: DELETE THE STUDENT PROFILE
            -- =================================================================
            DELETE FROM Student 
            WHERE StudentID = @StudentID;

            -- =================================================================
            -- STEP D: DELETE THE USER LOGIN
            -- =================================================================
            -- We remove the login credential so the orphan user doesn't remain.
            DELETE FROM [User] 
            WHERE UserID = @UserID;

        COMMIT TRANSACTION;
        PRINT 'SUCCESS: Student account and all related history have been permanently deleted.';

    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR ('Hard Delete Failed: %s', 16, 1, @ErrorMessage);
    END CATCH
END;
GO