USE ExamsSystem;
GO

CREATE OR ALTER PROCEDURE sp_DeleteTrack_Hard
    @TrackID INT,
    @ConfirmDelete BIT = 0 -- Safety Switch: Must be set to 1 to run
AS
BEGIN
    SET NOCOUNT ON;

    -- 1. SAFETY CHECK
    IF @ConfirmDelete = 0
    BEGIN
        RAISERROR('Safety Error: You are about to DELETE a Track and ALL its Students + History. To proceed, set @ConfirmDelete = 1.', 16, 1);
        RETURN;
    END

    -- Check if Track exists
    IF NOT EXISTS (SELECT 1 FROM Track WHERE TrackID = @TrackID)
    BEGIN
        RAISERROR('Error: Track ID not found.', 16, 1);
        RETURN;
    END

    BEGIN TRY
        BEGIN TRANSACTION;

            -- =================================================================
            -- STEP A: DELETE STUDENT HISTORY (Answers & Exam Assignments)
            -- =================================================================
            -- 1. Delete Answers given by students in this specific Track
            DELETE FROM StudentAnswer 
            WHERE STID IN (
                SELECT StudentID FROM Student WHERE Track_ID = @TrackID
            );

            -- 2. Delete Exam Registrations for students in this Track
            DELETE FROM StudentExam 
            WHERE StudentID IN (
                SELECT StudentID FROM Student WHERE Track_ID = @TrackID
            );

            -- =================================================================
            -- STEP B: DELETE THE STUDENTS
            -- =================================================================
            -- Now that their history is gone, we can safely delete the students.
            DELETE FROM Student 
            WHERE Track_ID = @TrackID;

            -- =================================================================
            -- STEP C: DELETE TRACK RELATIONSHIPS
            -- =================================================================
            -- 1. Remove link to Departments
            DELETE FROM TrackDepartment 
            WHERE Track_ID = @TrackID;

            -- 2. Remove link to Branches (If the table exists)
            IF OBJECT_ID('BranchTrack', 'U') IS NOT NULL
            BEGIN
                DELETE FROM BranchTrack WHERE TrackID = @TrackID;
            END

            -- =================================================================
            -- STEP D: DELETE THE TRACK ITSELF
            -- =================================================================
            DELETE FROM Track 
            WHERE TrackID = @TrackID;

        COMMIT TRANSACTION;
        PRINT 'SUCCESS: Track and all enrolled Students/History have been permanently deleted.';

    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        -- Return specific error
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR ('Hard Delete Failed: %s', 16, 1, @ErrorMessage);
    END CATCH
END;
GO