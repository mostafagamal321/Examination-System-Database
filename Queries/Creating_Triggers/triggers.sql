-----------Check given grade for a question is not negative and is not biiger than the max degree of this quesion-----------
CREATE OR ALTER TRIGGER trg_CheckGradeLimit 
ON StudentAnswer
AFTER UPDATE, INSERT
AS
BEGIN
    SET NOCOUNT ON;

    
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN Question q ON i.QID = q.QuestionID
        WHERE i.Degree_given > q.Degree OR i.Degree_given < 0
    )
    BEGIN
        RAISERROR ('Error: The grade assigned exceeds the maximum degree for this question or is negative.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO
-----------------------Submitted Answer in exam is between exam start time, end time and in the exam date----------------
CREATE OR ALTER TRIGGER trg_CheckExamTime_Submit
ON StudentAnswer
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the student's actual answer is being modified.
    -- If Answertext is NOT being updated (e.g., the system is just 
    -- updating the grade/score), skip the time check and let it pass!
    IF NOT UPDATE(Answertext)
    BEGIN
        RETURN;
    END

    -- Get Current Date and Time
    DECLARE @CurrentDate DATE = CAST(GETDATE() AS DATE);
    DECLARE @CurrentTime TIME = CAST(GETDATE() AS TIME);

    -- Logic: Block if Today is NOT the Exam Date OR Time is outside the window
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN Exam e ON i.ExamID = e.ExamID
        WHERE 
            -- 1. Check if Today matches the Exam Date
            e.edate <> @CurrentDate
            OR 
            -- 2. Check if Time is outside the allowed window
            (@CurrentTime < e.StartTime OR @CurrentTime > e.EndTime)
    )
    BEGIN
        RAISERROR ('Error: You cannot submit or change answers outside the scheduled exam date and time.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO
---------------No insert/update/delete of exam qustions during exam time---------------
CREATE OR ALTER TRIGGER trg_PreventExamModification
ON ExamQuestion
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Get Current Date and Time separately
    DECLARE @CurrentDate DATE = CAST(GETDATE() AS DATE);
    DECLARE @CurrentTime TIME = CAST(GETDATE() AS TIME);
    
    -- logic: Check if we are trying to modify an exam that is currently running
    IF EXISTS (
        SELECT 1
        FROM (
            -- Combine IDs from both inserted (for new/update) and deleted (for remove)
            SELECT ExamID FROM inserted 
            UNION 
            SELECT ExamID FROM deleted
        ) t
        JOIN Exam e ON t.ExamID = e.ExamID
        WHERE 
            -- 1. Check if TODAY is the Exam Date
            e.edate = @CurrentDate
            AND 
            -- 2. Check if NOW is within the Exam Time window
            @CurrentTime BETWEEN e.StartTime AND e.EndTime
    )
    BEGIN
        RAISERROR ('Error: Cannot modify exam questions while the exam is currently active (Date & Time match).', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO

---------------Toatl degree of the exam is not > max degree of the course Exam----------------
CREATE OR ALTER TRIGGER trg_EnforceMaxCourseDegree 
ON ExamQuestion
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Logic: 
    -- 1. Calculate the New Total Degree for the Exam(s) being modified
    -- 2. Compare it to the Course's MaxDegree
    
    IF EXISTS (
        SELECT 1
        FROM (
            SELECT 
                e.ExamID, 
                c.MaxDegree, 
                SUM(q.Degree) AS TotalExamDegree
            FROM Exam e
            JOIN Class cl ON e.ClassID = cl.ClassID
            JOIN Course c ON cl.CourseID = c.CourseID
            JOIN ExamQuestion eq ON e.ExamID = eq.ExamID
            JOIN Question q ON eq.QuestionID = q.QuestionID
            WHERE e.ExamID IN (SELECT ExamID FROM inserted) -- Check only modified exams
            GROUP BY e.ExamID, c.MaxDegree
        ) AS ExamTotals
        WHERE ExamTotals.TotalExamDegree > ExamTotals.MaxDegree
    )
    BEGIN
        RAISERROR ('Error: The total degrees of the questions exceed the Max Degree allowed for this Course.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO
-- When a student submits an answer to an exam → is the student is registered to take this exam ??
CREATE OR ALTER TRIGGER trg_CheckStudentRegistered
ON StudentAnswer
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Logic: 
    -- 1. Look at the rows trying to be inserted (from the 'inserted' table).
    -- 2. Try to find a matching registration in 'StudentExam'.
    -- 3. If any row from 'inserted' does NOT have a match, block the whole batch.

    IF EXISTS (
        SELECT 1
        FROM inserted i
        LEFT JOIN StudentExam se 
            ON i.STID = se.StudentID 
            AND i.ExamID = se.ExamID
        WHERE se.StudentID IS NULL -- This means "Registration Not Found"
    )
    BEGIN
        RAISERROR ('Access Denied: You are not registered for this exam.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO

-- Trigger to check we can’t have same instructor for the same course and the same class (Same Branch, Intake, Year, Course)
CREATE OR ALTER TRIGGER trg_PreventDuplicateInstructorPerClass
ON Class
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the (Branch + Intake + Year + Course) combination already exists
    -- We join the 'inserted' table (new data) with the existing 'Class' table
    IF EXISTS (
        SELECT 1
        FROM Class c
        JOIN inserted i ON c.BranchID = i.BranchID 
                        AND c.IntakeID = i.IntakeID
                        AND c.[Year] = i.[Year] -- [Year] is in brackets to handle reserved keyword
                        AND c.CourseID = i.CourseID
        WHERE c.ClassID <> i.ClassID -- Ignore the row itself (crucial for Updates)
    )
    BEGIN
        RAISERROR ('Error: This course is already assigned in this class (Branch/Intake/Year). Duplicates are not allowed.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO
-----------------------------Ensure Exam is within the intake inertval----------------
CREATE OR ALTER TRIGGER trg_CheckExamWithinIntake
ON Exam
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM inserted E
        JOIN Class C ON E.ClassID = C.ClassID
        JOIN Intake I ON C.IntakeID = I.IntakeID
        WHERE E.edate < I.StartDate OR E.edate > I.EnDate
    )
    BEGIN
        RAISERROR('Error: The Exam Date must fall within the Intake''s Start and End dates.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO
/* Trriger to: solve the problem of 
schedule 2 exams at the same time for the same class */

CREATE OR ALTER TRIGGER trg_PreventExamOverlap
ON Exam
AFTER INSERT , UPDATE
AS 
BEGIN
	IF EXISTS (
	SELECT * 
	FROM EXAM E
	JOIN INSERTED I
	ON E.ClassID = I.ClassID
	AND E.ExamID <> I.ExamID
	WHERE I.StartTime < E.EndTime
	AND I.EndTime > E.StartTime
    And I.edate = E.edate
	)
BEGIN 
	RAISERROR('Exam time overlaps with another exam for the same class.', 16, 1);
	ROLLBACK TRANSACTION;
END
END;
