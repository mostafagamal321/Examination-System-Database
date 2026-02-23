USE ExamsSystem;
GO

CREATE OR ALTER PROCEDURE sp_DeleteIntake_Hard
    @IntakeID INT,
    @ConfirmDelete BIT = 0 -- Safety Switch: Must be set to 1 to run
AS
BEGIN
    SET NOCOUNT ON;

    -- 1. SAFETY CHECK
    IF @ConfirmDelete = 0
    BEGIN
        RAISERROR('Safety Error: You are about to DELETE an Intake. This will wipe ALL Students, Classes, and Exams for this Intake. Set @ConfirmDelete = 1 to proceed.', 16, 1);
        RETURN;
    END

    -- Check if Intake exists
    IF NOT EXISTS (SELECT 1 FROM Intake WHERE IntakeID = @IntakeID)
    BEGIN
        RAISERROR('Error: Intake ID not found.', 16, 1);
        RETURN;
    END

    BEGIN TRY
        BEGIN TRANSACTION;

            -- =================================================================
            -- STEP A: DELETE EXAM DATA (For Exams linked to this Intake)
            -- =================================================================
            -- 1. Identify Exams belonging to this Intake (via Class)
            -- We delete the Questions attached to these specific exam papers
            DELETE FROM ExamQuestion 
            WHERE ExamID IN (
                SELECT E.ExamID 
                FROM Exam E
                JOIN Class C ON E.ClassID = C.ClassID
                WHERE C.IntakeID = @IntakeID
            );

            -- 2. Delete Student Answers for these exams (or by students in this intake)
            DELETE FROM StudentAnswer 
            WHERE STID IN (SELECT StudentID FROM Student WHERE Intake_ID = @IntakeID)
               OR ExamID IN (
                   SELECT E.ExamID 
                   FROM Exam E
                   JOIN Class C ON E.ClassID = C.ClassID
                   WHERE C.IntakeID = @IntakeID
               );

            -- 3. Delete Student Assignments (Registrations)
            DELETE FROM StudentExam 
            WHERE StudentID IN (SELECT StudentID FROM Student WHERE Intake_ID = @IntakeID)
               OR ExamID IN (
                   SELECT E.ExamID 
                   FROM Exam E
                   JOIN Class C ON E.ClassID = C.ClassID
                   WHERE C.IntakeID = @IntakeID
               );

            -- 4. Delete the Exams themselves
            DELETE FROM Exam 
            WHERE ClassID IN (SELECT ClassID FROM Class WHERE IntakeID = @IntakeID);

            -- =================================================================
            -- STEP B: DELETE ACADEMIC STRUCTURE (Classes)
            -- =================================================================
            -- Delete Classes linked to this Intake
            DELETE FROM Class 
            WHERE IntakeID = @IntakeID;

            -- =================================================================
            -- STEP C: DELETE STUDENTS
            -- =================================================================
            -- Delete all students belonging to this Intake
            DELETE FROM Student 
            WHERE Intake_ID = @IntakeID;

            -- =================================================================
            -- STEP D: DELETE THE INTAKE
            -- =================================================================
            DELETE FROM Intake 
            WHERE IntakeID = @IntakeID;

        COMMIT TRANSACTION;
        PRINT 'SUCCESS: Intake and all associated Students, Classes, and Exams have been permanently deleted.';

    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        -- Return specific error
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR ('Hard Delete Failed: %s', 16, 1, @ErrorMessage);
    END CATCH
END;
GO