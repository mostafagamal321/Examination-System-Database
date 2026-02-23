CREATE OR ALTER PROCEDURE sp_ManageCourse
    @Action VARCHAR(10), -- 'ADD', 'EDIT', 'DELETE'
    @CourseID INT = NULL,
    @CourseName NVARCHAR(50) = NULL,
    @MinDegree INT = NULL,
    @MaxDegree INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @Action = 'ADD'
    BEGIN
        INSERT INTO Course (CourseName, MinDegree, MaxDegree)
        VALUES (@CourseName, @MinDegree, @MaxDegree);
        PRINT 'Course Added.';
    END

    ELSE IF @Action = 'EDIT'
    BEGIN
        UPDATE Course 
        SET CourseName = ISNULL(@CourseName, CourseName),
            MinDegree = ISNULL(@MinDegree, MinDegree),
            MaxDegree = ISNULL(@MaxDegree, MaxDegree)
        WHERE CourseID = @CourseID;
        PRINT 'Course Updated.';
    END
    
    ELSE IF @Action = 'DELETE' -- (Safe Delete Only)
    BEGIN
        IF EXISTS (SELECT 1 FROM Class WHERE CourseID = @CourseID)
            RAISERROR('Cannot delete course; it is assigned to classes.', 16, 1);
        ELSE
            DELETE FROM Course WHERE CourseID = @CourseID;
    END
END;
GO