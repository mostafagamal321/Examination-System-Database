USE ExamsSystem;
GO

CREATE OR ALTER PROCEDURE sp_SaveInstructor
    @InstructorID INT = NULL,       -- NULL = ADD NEW, Value = EDIT EXISTING
    -- Personal Details
    @Name NVARCHAR(50),
    @Email VARCHAR(75),             -- Matches Instructor.Email
    -- Login Details
    @Username VARCHAR(50) = NULL,
    @Password VARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

            -- ======================================================
            -- CASE 1: ADD NEW INSTRUCTOR
            -- ======================================================
            IF @InstructorID IS NULL
            BEGIN
                -- Validate Inputs
                IF @Username IS NULL OR @Password IS NULL
                BEGIN
                    RAISERROR('Error: Username and Password are required for new instructors.', 16, 1);
                END

                -- 1. Create User Account (Email is NOT in User table per your JSON)
                INSERT INTO [User] (Username, Password, Role)
                VALUES (@Username, @Password, 'Instructor');

                DECLARE @NewUserID INT = SCOPE_IDENTITY();

                -- 2. Create Instructor Profile (Email IS here)
                INSERT INTO Instructor (Inst_Name, Email, UserID)
                VALUES (@Name, @Email, @NewUserID);

                PRINT 'New Instructor created successfully.';
            END

            -- ======================================================
            -- CASE 2: EDIT EXISTING INSTRUCTOR
            -- ======================================================
            ELSE
            BEGIN
                -- 1. Update Instructor Profile
                UPDATE Instructor
                SET Inst_Name = @Name,
                    Email = @Email
                WHERE InstructorID = @InstructorID;

                -- 2. Update User Login if needed
                IF @Username IS NOT NULL OR @Password IS NOT NULL
                BEGIN
                    DECLARE @LinkedUserID INT;
                    SELECT @LinkedUserID = UserID FROM Instructor WHERE InstructorID = @InstructorID;

                    UPDATE [User]
                    SET Username = ISNULL(@Username, Username),
                        Password = ISNULL(@Password, Password)
                    WHERE UserID = @LinkedUserID;
                END

                PRINT 'Instructor details updated successfully.';
            END

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO