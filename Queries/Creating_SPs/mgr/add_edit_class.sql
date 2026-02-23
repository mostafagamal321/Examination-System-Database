USE ExamsSystem;
GO

CREATE OR ALTER PROCEDURE sp_ManageClass
    @ClassID INT = NULL,       -- NULL = Create New Class, ID = Edit Existing
    @InstructorID INT,
    @CourseID INT,
    @IntakeID INT,
    @BranchID INT,
    @Year INT                  -- Academic Year (e.g., 2024)
AS
BEGIN
    SET NOCOUNT ON;

    -- 1. VALIDATION: PREVENT DUPLICATES
    -- We must ensure we don't create two classes for "SQL" for "Intake 42" in the same year.
    IF EXISTS (
        SELECT 1 FROM Class 
        WHERE CourseID = @CourseID 
          AND IntakeID = @IntakeID 
          AND BranchID = @BranchID 
          AND [Year] = @Year
          AND (@ClassID IS NULL OR ClassID <> @ClassID) -- Ignore self if editing
    )
    BEGIN
        RAISERROR('Error: A class for this Course, Intake, and Branch already exists in this Year.', 16, 1);
        RETURN;
    END

    BEGIN TRY
        BEGIN TRANSACTION;

            -- ======================================================
            -- SCENARIO A: CREATE NEW CLASS
            -- ======================================================
            IF @ClassID IS NULL
            BEGIN
                INSERT INTO Class (Inst_ID, CourseID, IntakeID, BranchID, [Year])
                VALUES (@InstructorID, @CourseID, @IntakeID, @BranchID, @Year);

                DECLARE @NewClassID INT = SCOPE_IDENTITY();
                
                -- Auto-Link Instructor to Course (Many-to-Many helper) if not exists
                IF NOT EXISTS (SELECT 1 FROM Inst_course WHERE Inst_ID = @InstructorID AND Course_ID = @CourseID)
                BEGIN
                    INSERT INTO Inst_course (Inst_ID, Course_ID) VALUES (@InstructorID, @CourseID);
                END

                PRINT 'New Class created successfully. Class ID: ' + CAST(@NewClassID AS VARCHAR);
            END

            -- ======================================================
            -- SCENARIO B: EDIT EXISTING CLASS
            -- ======================================================
            ELSE
            BEGIN
                -- specific check: prevent changing Course/Intake if exams exist?
                -- (Optional safety: You might want to block changing the Course if exams are already created for this Class)
                
                UPDATE Class
                SET Inst_ID = @InstructorID,
                    CourseID = @CourseID,
                    IntakeID = @IntakeID,
                    BranchID = @BranchID,
                    [Year] = @Year
                WHERE ClassID = @ClassID;

                -- Ensure the new instructor is linked to the course
                IF NOT EXISTS (SELECT 1 FROM Inst_course WHERE Inst_ID = @InstructorID AND Course_ID = @CourseID)
                BEGIN
                    INSERT INTO Inst_course (Inst_ID, Course_ID) VALUES (@InstructorID, @CourseID);
                END

                PRINT 'Class ' + CAST(@ClassID AS VARCHAR) + ' updated successfully.';
            END

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO