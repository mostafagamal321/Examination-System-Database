ALTER TABLE Course --MinDegree <= Max
ADD CONSTRAINT CK_Course_MinMaxDegree 
CHECK (MinDegree <= MaxDegree);

ALTER TABLE Course --Degree > 0
ADD CONSTRAINT CK_Course_PositiveDegrees 
CHECK (MinDegree >= 0 AND MaxDegree > 0);

-- Restrict Exam Type
ALTER TABLE Exam 
ADD CONSTRAINT CK_Exam_Type 
CHECK (ExamType IN ('Normal', 'Corrective'));

-- Validate Time
ALTER TABLE Exam --End Time > start Time
ADD CONSTRAINT CK_Exam_TimeValidation 
CHECK (EndTime > StartTime);

ALTER TABLE Question --Q types
ADD CONSTRAINT CK_Question_Type 
CHECK (QType IN ('MCQ', 'TF', 'Text'));

ALTER TABLE StudentAnswer --Calculated Score Can't be negative
ADD CONSTRAINT CK_StudentExam_score 
CHECK (Degree_given >= 0);

-- Restrict Roles to the 4 system actors
ALTER TABLE [User]
ADD CONSTRAINT CK_User_Role 
CHECK (Role IN ('Admin', 'Manager', 'Instructor', 'Student'));

-- Ensure Usernames are unique for login
ALTER TABLE [User]
ADD CONSTRAINT UQ_User_Username 
UNIQUE (Username);
GO

-- Ensure Final Degrees are non-negative
ALTER TABLE [CourseResult]
ADD CONSTRAINT CK_CourseResult_FinalDegree 
CHECK (FinalDegree >= 0);
GO

-- This guarantees a student can only have ONE row per question per exam.
ALTER TABLE StudentAnswer
ADD CONSTRAINT UQ_OneAnswerPerQuestion 
UNIQUE (STID, ExamID, QID);
