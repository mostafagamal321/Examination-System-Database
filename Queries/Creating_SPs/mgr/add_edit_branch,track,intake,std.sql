USE ExamsSystem;
GO

-- Manager adds: branches, tracks, intakes, and students.
-- 1. Add adding new Student (and their User account automatically)
CREATE OR ALTER PROCEDURE sp_RegisterStudent
    @Username VARCHAR(50),
    @Password VARCHAR(50),
    @FullName VARCHAR(50),
    @Email VARCHAR(75),
    @BranchID INT,
    @TrackID INT,
    @IntakeID INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;
            -- 1. Create General Login Account (table user)
            INSERT INTO [User] (Username, Role, [Password]) 
            VALUES (@Username, 'Student', @Password);
            
            DECLARE @NewUserID INT = SCOPE_IDENTITY();

            -- 2. Create Student Specialized Profile (table student)
            INSERT INTO Student (ST_name, Email, UserID, BranchID, Track_ID, Intake_ID)
            VALUES (@FullName, @Email, @NewUserID, @BranchID, @TrackID, @IntakeID);
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO

-- 2. Adding New Intake
CREATE OR ALTER PROCEDURE sp_AddIntake
    @StartDate DATE,
    @EndDate DATE,
    @BranchID INT
AS
BEGIN
    INSERT INTO Intake (StartDate, EnDate, BranchID)
    VALUES (@StartDate, @EndDate, @BranchID);
END;
GO

-- Adding Course to Track
CREATE OR ALTER PROCEDURE sp_AddCourseToTrack
    @CourseName VARCHAR(50),
    @Desc VARCHAR(120),
    @MaxDegree INT,
    @MinDegree INT
AS
BEGIN
    INSERT INTO Course (CourseName, [Desc.], MaxDegree, MinDegree)
    VALUES (@CourseName, @Desc, @MaxDegree, @MinDegree);
END;
GO
----------------------------------Editing------------------------------
--Edit branch
CREATE OR ALTER PROCEDURE sp_EditBranch
    @BranchID INT,
    @NewName VARCHAR(25)
AS
BEGIN
    UPDATE Branch
    SET BranchName = @NewName
    WHERE BranchID = @BranchID;
END;
GO

-- Edit Track
CREATE OR ALTER PROCEDURE sp_EditTrack
    @TrackID INT,
    @NewName NVARCHAR(140)
AS
BEGIN
    UPDATE Track
    SET TrackName = @NewName
    WHERE TrackID = @TrackID;
END;
GO

-- Edit Intake
CREATE OR ALTER PROCEDURE sp_EditIntake
    @IntakeID INT,
    @NewStartDate DATE,
    @NewEndDate DATE
AS
BEGIN
    UPDATE Intake
    SET StartDate = @NewStartDate, EnDate = @NewEndDate
    WHERE IntakeID = @IntakeID;
END;
GO