BEGIN TRY
    BEGIN TRANSACTION;

    INSERT INTO Department (Dept_Name) VALUES 
    ('Computer Science'),
    ('Information Systems'),
    ('Software Engineering'),
    ('Artificial Intelligence'),
    ('Cyber Security'),
    ('Embedded Systems & IoT'),
    ('Digital IC Design'),
    ('Industrial Automation & Systems'),
    ('Content Development & Digital Arts');

    COMMIT TRANSACTION;
    PRINT 'Departments inserted successfully ✅';

END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'Error occurred. Transaction rolled back ❌';
    PRINT ERROR_MESSAGE();
END CATCH;


INSERT INTO Branch (BranchName)
VALUES 
('Smart Village'),
('Alexandria'),
('Fayoum'),
('Cairo Branch'),
('Knowledge City'),
('Cairo University'),
('Mansoura'),
('Assiut'),
('Menoufia'),
('Ismailia'),
('Minya'),
('Aswan'),
('Qena'),
('Sohag'),
('Tanta'),
('Zagazig'),
('Beni Suef'),
('Port Said'),
('Damietta'),
('Banha'),
('Damanhour'),
('Al Arish'),
('New Valley'); 

--- 
-- insert into track
INSERT INTO Track (TrackName)
VALUES 
('Open Source Application Development'),
('Full Stack Web Development using .Net'),
('Full Stack Web Development using PHP'),
('Mobile Application Development'),
('Cloud Computing'),
('Cyber Security'),
('Data Science and AI'),
('Data Engineering'),
('Power BI & Data Visualization'),
('Embedded Systems'),
('Software Testing & Quality Assurance'),
('UI/UX Design'),
('Game Development'),
('ERP Solutions (Odoo/SAP)'),
('Digital Marketing'),
('System Administration');

-- Insert into Intake



-- Insert into Intake 
INSERT INTO Intake (StartDate, EnDate, BranchID)
VALUES 
('2025-10-01', '2026-06-30',  1), -- Smart Village
('2025-10-01', '2026-06-30',  2), -- Alexandria
('2025-10-15', '2026-07-15',  5), -- Knowledge City
('2025-11-01', '2026-08-01',  4), -- Cairo Branch
('2025-11-01', '2026-08-01',  7), -- Mansoura
('2026-01-15', '2026-09-15',  8); -- Assiut


-- insert into User
INSERT INTO [User] (Username, [Role], [Password])
VALUES 
('itgate_admin', 'Admin', 'Admin@123'),
('iti_manager', 'Manager', 'Mgr_Pass_2026'),
('ahmed_instructor', 'Instructor', 'Inst_Pass_2026'),
('omar_student', 'Student', 'Std_Pass_2026');


INSERT INTO [User] (Username, [Role], [Password])
VALUES 
('inst_mona', 'Instructor', 'Mona@Pass2026'),
('inst_yasser', 'Instructor', 'Yasser@Pass2026'),
('inst_hoda', 'Instructor', 'Hoda@Pass2026');

INSERT INTO [User] (Username, [Role], [Password])
VALUES 
('ahmed.aly', 'Student', 'Std@2026'), ('mona.hassan', 'Student', 'Std@2026'),
('omar.farouk', 'Student', 'Std@2026'), ('sara.mahmoud', 'Student', 'Std@2026'),
('yassin.ezzat', 'Student', 'Std@2026'), ('nour.zaki', 'Student', 'Std@2026'),
('hany.salem', 'Student', 'Std@2026'), ('mariam.ali', 'Student', 'Std@2026'),
('khaled.idris', 'Student', 'Std@2026'), ('laila.soliman', 'Student', 'Std@2026'),
('hassan.reda', 'Student', 'Std@2026'), ('dina.moussa', 'Student', 'Std@2026'),
('mostafa.nabil', 'Student', 'Std@2026'), ('reem.adel', 'Student', 'Std@2026'),
('tarek.abdelaziz', 'Student', 'Std@2026'), ('salma.bakr', 'Student', 'Std@2026'),
('fady.george', 'Student', 'Std@2026'), ('habiba.wael', 'Student', 'Std@2026'),
('sherif.gamal', 'Student', 'Std@2026'), ('aya.ibrahim', 'Student', 'Std@2026'),
('amr.diab', 'Student', 'Std@2026'), ('mai.ezz', 'Student', 'Std@2026'),
('karim.saad', 'Student', 'Std@2026'), ('ola.rashad', 'Student', 'Std@2026'),
('hazem.emam', 'Student', 'Std@2026'), ('nada.ashraf', 'Student', 'Std@2026'),
('seif.din', 'Student', 'Std@2026'), ('rana.youssef', 'Student', 'Std@2026'),
('ziad.omar', 'Student', 'Std@2026'), ('jana.hany', 'Student', 'Std@2026');


-- Insert Into Instrctor 

INSERT INTO Instructor (inst_Name, Email, UserID)
VALUES 
('Ahmed Ali', 'ahmed.ali@iti.gov.eg', (SELECT UserID FROM [User] WHERE Username = 'ahmed_instructor')),
('Mona Ezzat', 'mona.ezzat@iti.gov.eg', (SELECT UserID FROM [User] WHERE Username = 'inst_mona')),
('Yasser Mahmoud', 'yasser.m@iti.gov.eg', (SELECT UserID FROM [User] WHERE Username = 'inst_yasser')),
('Hoda Mansour', 'hoda.m@iti.gov.eg', (SELECT UserID FROM [User] WHERE Username = 'inst_hoda'));

-- Insert into TrainingManager

INSERT INTO TrainingManager (manName, Email, UserID, TrackID)
VALUES 
(
    'Ahmed El-Sayed', 
    'ahmed.manager@iti.gov.eg', 
    (SELECT UserID FROM [User] WHERE Username = 'iti_manager'), -- Links to the Manager user we created
    (SELECT TrackID FROM Track WHERE TrackName = 'Data Engineering') -- Links to a specific track
),
(
    'Noha Mansour', 
    'noha.m@iti.gov.eg', 
    (SELECT UserID FROM [User] WHERE Username = 'itgate_admin'),
    (SELECT TrackID FROM Track WHERE TrackName = 'Power BI & Data Visualization')
);

-- Insert into branch Track 

INSERT INTO BranchTrack (BranchID, TrackID) VALUES (1, 8);

INSERT INTO BranchTrack (BranchID, TrackID)
VALUES  
(2, 8), (2, 9), -- Alexandria: Data Engineering
(3, 8), (3, 9), -- Knowledge City: Data Engineering & Power BI
(4, 8), (4, 9); -- Cairo: Data Engineering & Power BI

INSERT INTO BranchTrack (BranchID, TrackID)
VALUES 
 (1, 9) -- Smart Village: Data Engineering & Power BI



 ---- Insert into Student

INSERT INTO Student (St_Name, Email, UserID, BranchID, TRACK_ID, Intake_ID)
VALUES 
('Ahmed Aly', 'ahmed.aly@iti.edu', (SELECT UserID FROM [User] WHERE Username = 'ahmed.aly'), 1, 8, (SELECT TOP 1 IntakeID FROM Intake)),
('Mona Hassan', 'mona.hassan@iti.edu', (SELECT UserID FROM [User] WHERE Username = 'mona.hassan'), 1, 9, (SELECT TOP 1 IntakeID FROM Intake)),
('Omar Farouk', 'omar.farouk@iti.edu', (SELECT UserID FROM [User] WHERE Username = 'omar.farouk'), 2, 8, (SELECT TOP 1 IntakeID FROM Intake)),
('Sara Mahmoud', 'sara.mahmoud@iti.edu', (SELECT UserID FROM [User] WHERE Username = 'sara.mahmoud'), 2, 9, (SELECT TOP 1 IntakeID FROM Intake)),
('Yassin Ezzat', 'yassin.ezzat@iti.edu', (SELECT UserID FROM [User] WHERE Username = 'yassin.ezzat'), 3, 8, (SELECT TOP 1 IntakeID FROM Intake)),
('Nour Zaki', 'nour.zaki@iti.edu', (SELECT UserID FROM [User] WHERE Username = 'nour.zaki'), 3, 9, (SELECT TOP 1 IntakeID FROM Intake)),
('Hany Salem', 'hany.salem@iti.edu', (SELECT UserID FROM [User] WHERE Username = 'hany.salem'), 4, 8, (SELECT TOP 1 IntakeID FROM Intake)),
('Mariam Ali', 'mariam.ali@iti.edu', (SELECT UserID FROM [User] WHERE Username = 'mariam.ali'), 4, 9, (SELECT TOP 1 IntakeID FROM Intake)),
('Khaled Idris', 'khaled.idris@iti.edu', (SELECT UserID FROM [User] WHERE Username = 'khaled.idris'), 1, 8, (SELECT TOP 1 IntakeID FROM Intake)),
('Laila Soliman', 'laila.soliman@iti.edu', (SELECT UserID FROM [User] WHERE Username = 'laila.soliman'), 1, 9, (SELECT TOP 1 IntakeID FROM Intake)),
('Hassan Reda', 'hassan.reda@iti.edu', (SELECT UserID FROM [User] WHERE Username = 'hassan.reda'), 2, 8, (SELECT TOP 1 IntakeID FROM Intake)),
('Dina Moussa', 'dina.moussa@iti.edu', (SELECT UserID FROM [User] WHERE Username = 'dina.moussa'), 2, 9, (SELECT TOP 1 IntakeID FROM Intake)),
('Mostafa Nabil', 'mostafa.nabil@iti.edu', (SELECT UserID FROM [User] WHERE Username = 'mostafa.nabil'), 3, 8, (SELECT TOP 1 IntakeID FROM Intake)),
('Reem Adel', 'reem.adel@iti.edu', (SELECT UserID FROM [User] WHERE Username = 'reem.adel'), 3, 9, (SELECT TOP 1 IntakeID FROM Intake)),
('Tarek Abdelaziz', 'tarek.abdelaziz@iti.edu', (SELECT UserID FROM [User] WHERE Username = 'tarek.abdelaziz'), 4, 8, (SELECT TOP 1 IntakeID FROM Intake)),
('Salma Bakr', 'salma.bakr@iti.edu', (SELECT UserID FROM [User] WHERE Username = 'salma.bakr'), 4, 9, (SELECT TOP 1 IntakeID FROM Intake)),
('Fady George', 'fady.george@iti.edu', (SELECT UserID FROM [User] WHERE Username = 'fady.george'), 1, 8, (SELECT TOP 1 IntakeID FROM Intake)),
('Habiba Wael', 'habiba.wael@iti.edu', (SELECT UserID FROM [User] WHERE Username = 'habiba.wael'), 1, 9, (SELECT TOP 1 IntakeID FROM Intake)),
('Sherif Gamal', 'sherif.gamal@iti.edu', (SELECT UserID FROM [User] WHERE Username = 'sherif.gamal'), 2, 8, (SELECT TOP 1 IntakeID FROM Intake)),
('Aya Ibrahim', 'aya.ibrahim@iti.edu', (SELECT UserID FROM [User] WHERE Username = 'aya.ibrahim'), 2, 9, (SELECT TOP 1 IntakeID FROM Intake)),
('Amr Diab', 'amr.diab@iti.edu', (SELECT UserID FROM [User] WHERE Username = 'amr.diab'), 3, 8, (SELECT TOP 1 IntakeID FROM Intake)),
('Mai Ezz', 'mai.ezz@iti.edu', (SELECT UserID FROM [User] WHERE Username = 'mai.ezz'), 3, 9, (SELECT TOP 1 IntakeID FROM Intake)),
('Karim Saad', 'karim.saad@iti.edu', (SELECT UserID FROM [User] WHERE Username = 'karim.saad'), 4, 8, (SELECT TOP 1 IntakeID FROM Intake)),
('Ola Rashad', 'ola.rashad@iti.edu', (SELECT UserID FROM [User] WHERE Username = 'ola.rashad'), 4, 9, (SELECT TOP 1 IntakeID FROM Intake)),
('Hazem Emam', 'hazem.emam@iti.edu', (SELECT UserID FROM [User] WHERE Username = 'hazem.emam'), 1, 8, (SELECT TOP 1 IntakeID FROM Intake)),
('Nada Ashraf', 'nada.ashraf@iti.edu', (SELECT UserID FROM [User] WHERE Username = 'nada.ashraf'), 1, 9, (SELECT TOP 1 IntakeID FROM Intake)),
('Seif Din', 'seif.din@iti.edu', (SELECT UserID FROM [User] WHERE Username = 'seif.din'), 2, 8, (SELECT TOP 1 IntakeID FROM Intake)),
('Rana Youssef', 'rana.youssef@iti.edu', (SELECT UserID FROM [User] WHERE Username = 'rana.youssef'), 2, 9, (SELECT TOP 1 IntakeID FROM Intake)),
('Ziad Omar', 'ziad.omar@iti.edu', (SELECT UserID FROM [User] WHERE Username = 'ziad.omar'), 3, 8, (SELECT TOP 1 IntakeID FROM Intake)),
('Jana Hany', 'jana.hany@iti.edu', (SELECT UserID FROM [User] WHERE Username = 'jana.hany'), 3, 9, (SELECT TOP 1 IntakeID FROM Intake));


-- Insert Into Course 
INSERT INTO Course (CourseName, [Desc.], MaxDegree, MinDegree)
VALUES 
('SQL Server Fundamentals', 'Advanced querying, indexing, and optimization.', 100, 50),
('Data Warehouse & ETL', 'SSIS and data integration techniques.', 100, 60),
('Python for Data Science', 'Data analysis using Pandas and NumPy.', 100, 50),
('Power BI Modeling', 'DAX expressions and data modeling.', 100, 60),
('Big Data Technologies', 'Introduction to Hadoop and Spark ecosystem.', 100, 50),
('Cloud Data Solutions', 'Azure and AWS data architecture.', 100, 60),
('Data Visualization', 'Storytelling with data using Tableau and Power BI.', 100, 50),
('Soft Skills', 'Communication and presentation techniques.', 100, 50);


--- Insert into Class 

INSERT INTO Class (Year, CourseID, inst_ID, BranchID, IntakeID)
VALUES 
(
    2026, 
    (SELECT CourseID FROM Course WHERE CourseName = 'SQL Server Fundamentals'), 
    (SELECT InstructorID FROM Instructor WHERE inst_Name = 'Ahmed Ali'), 
    1, -- Smart Village
    (SELECT TOP 1 IntakeID FROM Intake)
),
(
    2026, 
    (SELECT CourseID FROM Course WHERE CourseName = 'Power BI Modeling'), 
    (SELECT InstructorID FROM Instructor WHERE inst_Name = 'Mona Ezzat'), 
    2, -- Alexandria
    (SELECT TOP 1 IntakeID FROM Intake)
),
(
    2026, 
    (SELECT CourseID FROM Course WHERE CourseName = 'Python for Data Science'), 
    (SELECT InstructorID FROM Instructor WHERE inst_Name = 'Yasser Mahmoud'), 
    1, -- Smart Village
    (SELECT TOP 1 IntakeID FROM Intake)
),
(
    2026, 
    (SELECT CourseID FROM Course WHERE CourseName = 'Data Warehouse & ETL'), 
    (SELECT InstructorID FROM Instructor WHERE inst_Name = 'Hoda Mansour'), 
    3, -- Knowledge City
    (SELECT TOP 1 IntakeID FROM Intake)
);

-- Insert INto Question
INSERT INTO Question (Qtext, Degree, Qtype)
VALUES 
-- Multiple Choice Questions (MCQ)
('Which of the following is used to remove all records from a table without logging individual row deletions?', 5, 'MCQ'),
('In Python, which keyword is used to create a function?', 5, 'MCQ'),
('Which Power BI component is used to transform and clean data?', 5, 'MCQ'),
('Which join returns all rows when there is a match in one of the tables?', 5, 'MCQ'),

-- True / False Questions (TF)
('A Primary Key can accept a single NULL value.', 5, 'TF'),
('Python is a compiled language.', 5, 'TF'),
('DAX measures recalculate based on the filter context of the report.', 5, 'TF'),
('The TRUNCATE command can be rolled back in SQL Server.', 5, 'TF'),

-- Text / Essay Questions (Text)
('Explain the concept of Normalization and its importance in database design.', 10, 'Text'),
('Describe the difference between a list and a dictionary in Python.', 10, 'Text'),
('What are the main differences between Fact tables and Dimension tables?', 10, 'Text'),
('Compare Clustered and Non-Clustered indexes.', 10, 'Text');

-- INSERT INTO MCQ TABLE 

-- Choices for: "Which join returns all rows when there is a match in one of the tables?"
INSERT INTO MCQ (MCQtext, iscorrect, QID) VALUES 
('Inner Join', 0, (SELECT QuestionID FROM Question WHERE Qtext LIKE '%Which join returns all%')),
('Full Outer Join', 1, (SELECT QuestionID FROM Question WHERE Qtext LIKE '%Which join returns all%')),
('Left Join', 0, (SELECT QuestionID FROM Question WHERE Qtext LIKE '%Which join returns all%')),
('Cross Join', 0, (SELECT QuestionID FROM Question WHERE Qtext LIKE '%Which join returns all%'));

-- Choices for: "In Python, which keyword is used to create a function?"
INSERT INTO MCQ (MCQtext, iscorrect, QID) VALUES 
('func', 0, (SELECT QuestionID FROM Question WHERE Qtext LIKE '%keyword is used to create a function%')),
('define', 0, (SELECT QuestionID FROM Question WHERE Qtext LIKE '%keyword is used to create a function%')),
('def', 1, (SELECT QuestionID FROM Question WHERE Qtext LIKE '%keyword is used to create a function%')),
('function', 0, (SELECT QuestionID FROM Question WHERE Qtext LIKE '%keyword is used to create a function%'));

-- Choices for: "Which Power BI component is used to transform and clean data?"
INSERT INTO MCQ (MCQtext, iscorrect, QID) VALUES 
('Power View', 0, (SELECT QuestionID FROM Question WHERE Qtext LIKE '%transform and clean data%')),
('Power Pivot', 0, (SELECT QuestionID FROM Question WHERE Qtext LIKE '%transform and clean data%')),
('Power Query', 1, (SELECT QuestionID FROM Question WHERE Qtext LIKE '%transform and clean data%')),
('Power Service', 0, (SELECT QuestionID FROM Question WHERE Qtext LIKE '%transform and clean data%'));

-- Choices for: "A Primary Key can accept a single NULL value." (True/False)
INSERT INTO MCQ (MCQtext, iscorrect, QID) VALUES 
('True', 0, (SELECT QuestionID FROM Question WHERE Qtext LIKE '%Primary Key can accept%')),
('False', 1, (SELECT QuestionID FROM Question WHERE Qtext LIKE '%Primary Key can accept%'));

-- INSERT INTO TrueFalseQuestion

-- "A Primary Key can accept a single NULL value." (Statement is False)
INSERT INTO TrueFalseQuestion (isTrue, QID)
VALUES (0, (SELECT QuestionID FROM Question WHERE Qtext LIKE '%Primary Key can accept%'));

-- "Python is a compiled language." (Statement is False - it's interpreted)
INSERT INTO TrueFalseQuestion (isTrue, QID)
VALUES (0, (SELECT QuestionID FROM Question WHERE Qtext LIKE '%Python is a compiled language%'));

-- "DAX measures recalculate based on the filter context." (Statement is True)
INSERT INTO TrueFalseQuestion (isTrue, QID)
VALUES (1, (SELECT QuestionID FROM Question WHERE Qtext LIKE '%DAX measures recalculate%'));

-- "The TRUNCATE command can be rolled back in SQL Server." (Statement is True)
INSERT INTO TrueFalseQuestion (isTrue, QID)
VALUES (1, (SELECT QuestionID FROM Question WHERE Qtext LIKE '%TRUNCATE command can be rolled back%'));

-- Insert into COURSE Question 

-- SQL Server Fundamentals Questions (Course 1)
INSERT INTO CourseQuestion (QuestionID, CourseID)
VALUES 
((SELECT QuestionID FROM Question WHERE Qtext LIKE '%remove all records%'), (SELECT CourseID FROM Course WHERE CourseName = 'SQL Server Fundamentals')),
((SELECT QuestionID FROM Question WHERE Qtext LIKE '%Which join returns all%'), (SELECT CourseID FROM Course WHERE CourseName = 'SQL Server Fundamentals')),
((SELECT QuestionID FROM Question WHERE Qtext LIKE '%Primary Key can accept%'), (SELECT CourseID FROM Course WHERE CourseName = 'SQL Server Fundamentals')),
((SELECT QuestionID FROM Question WHERE Qtext LIKE '%concept of Normalization%'), (SELECT CourseID FROM Course WHERE CourseName = 'SQL Server Fundamentals'));

-- Python for Data Science Questions (Course 3)
INSERT INTO CourseQuestion (QuestionID, CourseID)
VALUES 
((SELECT QuestionID FROM Question WHERE Qtext LIKE '%create a function%'), (SELECT CourseID FROM Course WHERE CourseName = 'Python for Data Science')),
((SELECT QuestionID FROM Question WHERE Qtext LIKE '%Python is a compiled%'), (SELECT CourseID FROM Course WHERE CourseName = 'Python for Data Science')),
((SELECT QuestionID FROM Question WHERE Qtext LIKE '%list and a dictionary%'), (SELECT CourseID FROM Course WHERE CourseName = 'Python for Data Science'));

-- Power BI Modeling Questions (Course 4)
INSERT INTO CourseQuestion (QuestionID, CourseID)
VALUES 
((SELECT QuestionID FROM Question WHERE Qtext LIKE '%transform and clean data%'), (SELECT CourseID FROM Course WHERE CourseName = 'Power BI Modeling')),
((SELECT QuestionID FROM Question WHERE Qtext LIKE '%DAX measures recalculate%'), (SELECT CourseID FROM Course WHERE CourseName = 'Power BI Modeling')),
((SELECT QuestionID FROM Question WHERE Qtext LIKE '%Fact tables and Dimension%'), (SELECT CourseID FROM Course WHERE CourseName = 'Power BI Modeling'));


--- Insert into Exam

INSERT INTO EXAM (Allowence, ExamType, StartTime, EndTime, ClassID, edate)
VALUES 
(
    'Calculators allowed', 
    'Normal', -- Matches your constraint [ExamType]='Normal'
    '09:00:00', 
    '11:00:00', 
    (SELECT TOP 1 ClassID FROM Class WHERE CourseID = (SELECT CourseID FROM Course WHERE CourseName = 'SQL Server Fundamentals')), 
    '2026-05-20'
),
(
    'Open book', 
    'Normal', 
    '10:00:00', 
    '12:00:00', 
    (SELECT TOP 1 ClassID FROM Class WHERE CourseID = (SELECT CourseID FROM Course WHERE CourseName = 'Python for Data Science')), 
    '2026-05-22'
),
(
    'None', 
    'Corrective', -- Matches your constraint [ExamType]='Corrective'
    '13:00:00', 
    '15:00:00', 
    (SELECT TOP 1 ClassID FROM Class WHERE CourseID = (SELECT CourseID FROM Course WHERE CourseName = 'Power BI Modeling')), 
    '2026-06-01'
);

-- Insert Into ExamQuestion

-- SQL Fundamentals Exam (Normal)
INSERT INTO ExamQuestion (ExamID, QuestionID, stud_Degree)
VALUES 
((SELECT ExamID FROM EXAM WHERE edate = '2026-05-20'), (SELECT QuestionID FROM Question WHERE Qtext LIKE '%remove all records%'), 10),
((SELECT ExamID FROM EXAM WHERE edate = '2026-05-20'), (SELECT QuestionID FROM Question WHERE Qtext LIKE '%Which join returns all%'), 10),
((SELECT ExamID FROM EXAM WHERE edate = '2026-05-20'), (SELECT QuestionID FROM Question WHERE Qtext LIKE '%Primary Key can accept%'), 5),
((SELECT ExamID FROM EXAM WHERE edate = '2026-05-20'), (SELECT QuestionID FROM Question WHERE Qtext LIKE '%concept of Normalization%'), 15);

-- Python Exam (Normal)
INSERT INTO ExamQuestion (ExamID, QuestionID, stud_Degree)
VALUES 
((SELECT ExamID FROM EXAM WHERE edate = '2026-05-22'), (SELECT QuestionID FROM Question WHERE Qtext LIKE '%create a function%'), 10),
((SELECT ExamID FROM EXAM WHERE edate = '2026-05-22'), (SELECT QuestionID FROM Question WHERE Qtext LIKE '%Python is a compiled%'), 5),
((SELECT ExamID FROM EXAM WHERE edate = '2026-05-22'), (SELECT QuestionID FROM Question WHERE Qtext LIKE '%list and a dictionary%'), 15);

-- Power BI Exam (Corrective)
INSERT INTO ExamQuestion (ExamID, QuestionID, stud_Degree)
VALUES 
((SELECT ExamID FROM EXAM WHERE edate = '2026-06-01'), (SELECT QuestionID FROM Question WHERE Qtext LIKE '%transform and clean data%'), 10),
((SELECT ExamID FROM EXAM WHERE edate = '2026-06-01'), (SELECT QuestionID FROM Question WHERE Qtext LIKE '%DAX measures recalculate%'), 10),
((SELECT ExamID FROM EXAM WHERE edate = '2026-06-01'), (SELECT QuestionID FROM Question WHERE Qtext LIKE '%Fact tables and Dimension%'), 20);


-- insert into ( StudentExam)

-- Assign first 15 students to the SQL Normal Exam (May 20th)
INSERT INTO StudentExam (StudentID, ExamID)
SELECT TOP 15 StudentID, (SELECT ExamID FROM EXAM WHERE edate = '2026-05-20')
FROM Student
ORDER BY StudentID ASC;

-- Assign the remaining 15 students to the Python Normal Exam (May 22nd)
INSERT INTO StudentExam (StudentID, ExamID)
SELECT TOP 15 StudentID, (SELECT ExamID FROM EXAM WHERE edate = '2026-05-22')
FROM Student
ORDER BY StudentID DESC;


-- Insert into StudentAnswer
-- Use a student/exam pair from StudentExam so registration trigger passes.
-- Insert only when the exam is currently active so time trigger passes.
DECLARE @StudentID INT;
DECLARE @ExamID INT;
DECLARE @CurrentDate DATE = CAST(GETDATE() AS DATE);
DECLARE @CurrentTime TIME = CAST(GETDATE() AS TIME);

SELECT TOP 1
    @StudentID = se.StudentID,
    @ExamID = se.ExamID
FROM StudentExam se
JOIN Exam e ON e.ExamID = se.ExamID
WHERE e.edate = @CurrentDate
  AND @CurrentTime BETWEEN e.StartTime AND e.EndTime
ORDER BY se.StudentID;

IF @StudentID IS NOT NULL AND @ExamID IS NOT NULL
BEGIN
    INSERT INTO StudentAnswer (isCorrect, Degree_given, AnswerText, QID, ExamID, STID)
    VALUES 
    (1, 5, 'TRUNCATE', (SELECT QuestionID FROM Question WHERE Qtext LIKE '%remove all records%'), @ExamID, @StudentID),
    (1, 5, 'Full Outer Join', (SELECT QuestionID FROM Question WHERE Qtext LIKE '%Which join returns all%'), @ExamID, @StudentID),
    (0, 5, 'True', (SELECT QuestionID FROM Question WHERE Qtext LIKE '%Primary Key can accept%'), @ExamID, @StudentID),
    (1, 5, 'Normalization reduces redundancy...', (SELECT QuestionID FROM Question WHERE Qtext LIKE '%concept of Normalization%'), @ExamID, @StudentID);
END
ELSE
BEGIN
    PRINT 'StudentAnswer seed skipped: no active exam at current date/time for a registered student.';
END;





