USE ExamsSystem;
GO

CREATE OR ALTER PROCEDURE sp_AssignStudentsToExam
    @ExamID INT,
    @StudentID INT = NULL, -- Optional: If provided, assigns only this student
    @TrackID INT = NULL    -- Optional: If provided (and StudentID is null), assigns whole track
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ExamBranchID INT;
    DECLARE @ExamIntakeID INT;

    -- 1. GET EXAM CONTEXT (Branch & Intake)
    -- We need to know which Branch/Intake this exam belongs to via the Class table
    SELECT 
        @ExamBranchID = C.BranchID,
        @ExamIntakeID = C.IntakeID
    FROM Exam E
    JOIN Class C ON E.ClassID = C.ClassID
    WHERE E.ExamID = @ExamID;

    IF @ExamBranchID IS NULL
    BEGIN
        RAISERROR('Exam ID not found or not linked to a valid Class.', 16, 1);
        RETURN;
    END

    BEGIN TRY
        BEGIN TRANSACTION;

            -- SCENARIO A: ASSIGN A SINGLE SPECIFIC STUDENT
            IF @StudentID IS NOT NULL
            BEGIN
                -- Validation: Ensure Student belongs to the same Branch/Intake as the Exam
                -- (Prevents assigning a Cairo student to an Alex exam)
                IF NOT EXISTS (
                    SELECT 1 FROM Student 
                    WHERE StudentID = @StudentID 
                      AND BranchID = @ExamBranchID 
                      AND Intake_ID = @ExamIntakeID
                )
                BEGIN
                    RAISERROR('Error: Student does not belong to the Class Branch/Intake.', 16, 1);
                END
                ELSE
                BEGIN
                    -- Insert if not already assigned
                    IF NOT EXISTS (SELECT 1 FROM StudentExam WHERE StudentID = @StudentID AND ExamID = @ExamID)
                    BEGIN
                        INSERT INTO StudentExam (StudentID, ExamID)
                        VALUES (@StudentID, @ExamID);
                        PRINT 'Student ' + CAST(@StudentID AS VARCHAR) + ' assigned successfully.';
                    END
                    ELSE
                    BEGIN
                        PRINT 'Student ' + CAST(@StudentID AS VARCHAR) + ' is already assigned.';
                    END
                END
            END

            -- SCENARIO B: BULK ASSIGN (WHOLE CLASS / TRACK)
            ELSE
            BEGIN
                -- Insert all students matching Exam's Branch & Intake (and Track if filtered)
                INSERT INTO StudentExam (StudentID, ExamID)
                SELECT S.StudentID, @ExamID
                FROM Student S
                WHERE S.BranchID = @ExamBranchID 
                  AND S.Intake_ID = @ExamIntakeID
                  -- If TrackID is passed, filter by it. If NULL, ignore this filter.
                  AND (@TrackID IS NULL OR S.Track_ID = @TrackID)
                  -- Exclude those already assigned to avoid PK errors
                  AND NOT EXISTS (
                      SELECT 1 FROM StudentExam SE 
                      WHERE SE.StudentID = S.StudentID AND SE.ExamID = @ExamID
                  );

                DECLARE @Count INT = @@ROWCOUNT;
                PRINT CAST(@Count AS VARCHAR) + ' students assigned to Exam ' + CAST(@ExamID AS VARCHAR) + '.';
            END

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO
--------------------Testing---------------------
EXEC sp_AssignStudentsToExam 2, 2
    -- @ExamID INT,
    -- @StudentID INT = NULL, -- Optional: If provided, assigns only this student
    -- @TrackID INT = NULL    -- Optional: If provided (and StudentID is null), assigns whole track
select * from StudentExam