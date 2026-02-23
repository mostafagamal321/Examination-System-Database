USE ExamsSystem;
GO
--------Testing----------
Exec sp_std_viewExam 1,1;
Go
--------------------
CREATE OR ALTER PROCEDURE sp_RemoveStudentFromExam
    @ExamID INT,
    @StudentID INT = NULL, -- Optional: Remove just this student
    @TrackID INT = NULL    -- Optional: Remove ALL students of this track
AS
BEGIN
    SET NOCOUNT ON;

    -- 1. GET EXAM SCHEDULE
    DECLARE @ExamDate DATE;
    DECLARE @StartTime TIME;

    SELECT 
        @ExamDate = edate,
        @StartTime = StartTime
    FROM Exam 
    WHERE ExamID = @ExamID;

    IF @ExamDate IS NULL
    BEGIN
        RAISERROR('Error: Exam ID not found.', 16, 1);
        RETURN;
    END

    -- 2. SAFETY CHECK: IS EXAM IN THE PAST?
    -- We cannot modify the attendance list of an exam that has already happened.
    IF @ExamDate < CAST(GETDATE() AS DATE) 
       OR (@ExamDate = CAST(GETDATE() AS DATE) AND @StartTime <= CAST(GETDATE() AS TIME))
    BEGIN
        RAISERROR('Error: Cannot remove students from a past or ongoing exam.', 16, 1);
        RETURN;
    END

    BEGIN TRY
        BEGIN TRANSACTION;

            -- SCENARIO A: REMOVE SINGLE STUDENT
            IF @StudentID IS NOT NULL
            BEGIN
                DELETE FROM StudentExam 
                WHERE ExamID = @ExamID AND StudentID = @StudentID;

                IF @@ROWCOUNT = 0
                    PRINT 'Warning: Student was not assigned to this exam.';
                ELSE
                    PRINT 'Student removed successfully.';
            END

            -- SCENARIO B: REMOVE ALL STUDENTS IN A TRACK
            ELSE IF @TrackID IS NOT NULL
            BEGIN
                -- Delete from StudentExam WHERE the student belongs to the specific Track
                DELETE FROM StudentExam 
                WHERE ExamID = @ExamID 
                  AND StudentID IN (
                      SELECT StudentID 
                      FROM Student 
                      WHERE Track_ID = @TrackID
                  );

                PRINT 'All students from Track ' + CAST(@TrackID AS VARCHAR) + ' removed from Exam ' + CAST(@ExamID AS VARCHAR) + '.';
            END
            
            ELSE
            BEGIN
                RAISERROR('Error: Please provide either a StudentID or a TrackID.', 16, 1);
            END

        COMMIT TRANSACTION;

    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO