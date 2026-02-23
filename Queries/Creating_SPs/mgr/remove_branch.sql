USE ExamsSystem;
GO

CREATE OR ALTER PROCEDURE sp_DeleteBranch_Hard
    @BranchID INT,
    @ConfirmDelete BIT = 0 -- Safety Switch: Must be set to 1 to run
AS
BEGIN
    SET NOCOUNT ON;

    -- 1. SAFETY CHECK: PREVENT ACCIDENTS
    IF @ConfirmDelete = 0
    BEGIN
        RAISERROR('Safety Error: You are about to perform a HARD DELETE on a Branch. This will wipe all Students, Grades, Exams, and Classes associated with it. To proceed, set @ConfirmDelete = 1.', 16, 1);
        RETURN;
    END

    -- Check if Branch exists
    IF NOT EXISTS (SELECT 1 FROM Branch WHERE BranchID = @BranchID)
    BEGIN
        RAISERROR('Error: Branch ID not found.', 16, 1);
        RETURN;
    END

    BEGIN TRY
        BEGIN TRANSACTION;

            -- STEP A: IDENTIFY TARGET DATA (For logging or logic)
            -- We don't need to store them in temp tables if we delete carefully,
            -- but knowing the logic helps.
            -- Target Classes: SELECT ClassID FROM Class WHERE BranchID = @BranchID
            -- Target Exams: SELECT ExamID FROM Exam WHERE ClassID IN (Target Classes)
            -- Target Students: SELECT StudentID FROM Student WHERE BranchID = @BranchID

            -- STEP B: DELETE STUDENT-LEVEL DATA (Answers & Assignments)

            -- Delete Answers given by students of this branch OR for exams in this branch
            DELETE FROM StudentAnswer 
            WHERE STID IN (SELECT StudentID FROM Student WHERE BranchID = @BranchID)
               OR ExamID IN (
                   SELECT E.ExamID FROM Exam E 
                   JOIN Class C ON E.ClassID = C.ClassID 
                   WHERE C.BranchID = @BranchID
               );

            -- Delete Exam Assignments (StudentRegistrations)
            DELETE FROM StudentExam 
            WHERE StudentID IN (SELECT StudentID FROM Student WHERE BranchID = @BranchID)
               OR ExamID IN (
                   SELECT E.ExamID FROM Exam E 
                   JOIN Class C ON E.ClassID = C.ClassID 
                   WHERE C.BranchID = @BranchID
               );

            -- STEP C: DELETE EXAM DATA (Questions & Headers)

            -- Delete Questions from Exams held in this branch
            DELETE FROM ExamQuestion 
            WHERE ExamID IN (
                SELECT E.ExamID FROM Exam E 
                JOIN Class C ON E.ClassID = C.ClassID 
                WHERE C.BranchID = @BranchID
            );

            -- Delete the Exams themselves
            DELETE FROM Exam 
            WHERE ClassID IN (SELECT ClassID FROM Class WHERE BranchID = @BranchID);

            -- STEP D: DELETE CORE ENTITIES (Students, Classes, Branch Links)

            -- Delete Students registered in this Branch
            DELETE FROM Student WHERE BranchID = @BranchID;

            -- Delete Classes (Schedule/Instructor assignments) in this Branch
            DELETE FROM Class WHERE BranchID = @BranchID;

            -- Delete Branch-Track Associations
            -- (Assuming you created the BranchTrack table discussed earlier)
            IF OBJECT_ID('BranchTrack', 'U') IS NOT NULL
                DELETE FROM BranchTrack WHERE BranchID = @BranchID;

            -- STEP E: DELETE THE BRANCH
            DELETE FROM Branch WHERE BranchID = @BranchID;

        COMMIT TRANSACTION;
        PRINT 'SUCCESS: Branch and all linked history (Students, Exams, Grades) have been permanently deleted.';

    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        -- Return the exact SQL error to help debug foreign key issues
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR ('Hard Delete Failed: %s', 16, 1, @ErrorMessage);
    END CATCH
END;
GO