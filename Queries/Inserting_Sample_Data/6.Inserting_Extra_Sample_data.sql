SET XACT_ABORT ON;
BEGIN TRANSACTION;
    /* 1) Create new login users first (FK parent for Instructor/TrainingManager). */
    INSERT INTO [User] (Username, [Role], [Password])
    VALUES
        ('inst_salma_nabil', 'Instructor', 'Salma@Pass2026'),
        ('inst_karim_adel', 'Instructor', 'Karim@Pass2026'),
        ('inst_nada_sameh', 'Instructor', 'Nada@Pass2026'),
        ('mgr_laila_hassan', 'Manager', 'Laila@Mgr2026'),
        ('mgr_tamer_fathy', 'Manager', 'Tamer@Mgr2026'),
        ('mgr_reham_ahmed', 'Manager', 'Reham@Mgr2026'),
        ('mgr_youssef_saber', 'Manager', 'Youssef@Mgr2026');

    /* 2) Insert Instructor: 3 rows. */
    INSERT INTO Instructor (Inst_Name, Email, UserID)
    VALUES
        ('Salma Nabil', 'salma.nabil@iti.gov.eg', (SELECT UserID FROM [User] WHERE Username = 'inst_salma_nabil')),
        ('Karim Adel', 'karim.adel@iti.gov.eg', (SELECT UserID FROM [User] WHERE Username = 'inst_karim_adel')),
        ('Nada Sameh', 'nada.sameh@iti.gov.eg', (SELECT UserID FROM [User] WHERE Username = 'inst_nada_sameh'));

    /* 3) Insert TrainingManager: 4 rows. */
    INSERT INTO TrainingManager (ManName, Email, UserID, TrackID)
    VALUES
        (
            'Laila Hassan',
            'laila.hassan.manager@iti.gov.eg',
            (SELECT UserID FROM [User] WHERE Username = 'mgr_laila_hassan'),
            (SELECT TrackID FROM Track WHERE TrackName = 'Data Engineering')
        ),
        (
            'Tamer Fathy',
            'tamer.fathy.manager@iti.gov.eg',
            (SELECT UserID FROM [User] WHERE Username = 'mgr_tamer_fathy'),
            (SELECT TrackID FROM Track WHERE TrackName = 'Power BI & Data Visualization')
        ),
        (
            'Reham Ahmed',
            'reham.ahmed.manager@iti.gov.eg',
            (SELECT UserID FROM [User] WHERE Username = 'mgr_reham_ahmed'),
            (SELECT TrackID FROM Track WHERE TrackName = 'Cloud Computing')
        ),
        (
            'Youssef Saber',
            'youssef.saber.manager@iti.gov.eg',
            (SELECT UserID FROM [User] WHERE Username = 'mgr_youssef_saber'),
            (SELECT TrackID FROM Track WHERE TrackName = 'Cyber Security')
        );

    /* 4) Insert Inst_course: 10 rows. */
    INSERT INTO Inst_course (Inst_ID, Course_ID)
    VALUES
        ((SELECT InstructorID FROM Instructor WHERE Email = 'salma.nabil@iti.gov.eg'), (SELECT CourseID FROM Course WHERE CourseName = 'SQL Server Fundamentals')),
        ((SELECT InstructorID FROM Instructor WHERE Email = 'salma.nabil@iti.gov.eg'), (SELECT CourseID FROM Course WHERE CourseName = 'Data Warehouse & ETL')),
        ((SELECT InstructorID FROM Instructor WHERE Email = 'salma.nabil@iti.gov.eg'), (SELECT CourseID FROM Course WHERE CourseName = 'Big Data Technologies')),
        ((SELECT InstructorID FROM Instructor WHERE Email = 'karim.adel@iti.gov.eg'), (SELECT CourseID FROM Course WHERE CourseName = 'Python for Data Science')),
        ((SELECT InstructorID FROM Instructor WHERE Email = 'karim.adel@iti.gov.eg'), (SELECT CourseID FROM Course WHERE CourseName = 'Cloud Data Solutions')),
        ((SELECT InstructorID FROM Instructor WHERE Email = 'karim.adel@iti.gov.eg'), (SELECT CourseID FROM Course WHERE CourseName = 'Soft Skills')),
        ((SELECT InstructorID FROM Instructor WHERE Email = 'nada.sameh@iti.gov.eg'), (SELECT CourseID FROM Course WHERE CourseName = 'Power BI Modeling')),
        ((SELECT InstructorID FROM Instructor WHERE Email = 'nada.sameh@iti.gov.eg'), (SELECT CourseID FROM Course WHERE CourseName = 'Data Visualization')),
        ((SELECT InstructorID FROM Instructor WHERE Email = 'nada.sameh@iti.gov.eg'), (SELECT CourseID FROM Course WHERE CourseName = 'SQL Server Fundamentals')),
        ((SELECT InstructorID FROM Instructor WHERE Email = 'nada.sameh@iti.gov.eg'), (SELECT CourseID FROM Course WHERE CourseName = 'Data Warehouse & ETL'));

    /* 5) Insert Inst_PhoneNum: 10 rows. */
    INSERT INTO Inst_PhoneNum (InstructorID, PhoneNum)
    VALUES
        ((SELECT InstructorID FROM Instructor WHERE Email = 'salma.nabil@iti.gov.eg'), 2015501001),
        ((SELECT InstructorID FROM Instructor WHERE Email = 'salma.nabil@iti.gov.eg'), 2015501002),
        ((SELECT InstructorID FROM Instructor WHERE Email = 'salma.nabil@iti.gov.eg'), 2015501003),
        ((SELECT InstructorID FROM Instructor WHERE Email = 'karim.adel@iti.gov.eg'), 2015502001),
        ((SELECT InstructorID FROM Instructor WHERE Email = 'karim.adel@iti.gov.eg'), 2015502002),
        ((SELECT InstructorID FROM Instructor WHERE Email = 'karim.adel@iti.gov.eg'), 2015502003),
        ((SELECT InstructorID FROM Instructor WHERE Email = 'nada.sameh@iti.gov.eg'), 2015503001),
        ((SELECT InstructorID FROM Instructor WHERE Email = 'nada.sameh@iti.gov.eg'), 2015503002),
        ((SELECT InstructorID FROM Instructor WHERE Email = 'nada.sameh@iti.gov.eg'), 2015503003),
        ((SELECT InstructorID FROM Instructor WHERE Email = 'nada.sameh@iti.gov.eg'), 2015503004);

    /* 6) Insert ManagerBranch: 10 rows. */
    INSERT INTO ManagerBranch (ManID, BranchID)
    VALUES
        ((SELECT ManID FROM TrainingManager WHERE Email = 'laila.hassan.manager@iti.gov.eg'), (SELECT BranchID FROM Branch WHERE BranchName = 'Smart Village')),
        ((SELECT ManID FROM TrainingManager WHERE Email = 'laila.hassan.manager@iti.gov.eg'), (SELECT BranchID FROM Branch WHERE BranchName = 'Alexandria')),
        ((SELECT ManID FROM TrainingManager WHERE Email = 'tamer.fathy.manager@iti.gov.eg'), (SELECT BranchID FROM Branch WHERE BranchName = 'Knowledge City')),
        ((SELECT ManID FROM TrainingManager WHERE Email = 'tamer.fathy.manager@iti.gov.eg'), (SELECT BranchID FROM Branch WHERE BranchName = 'Cairo Branch')),
        ((SELECT ManID FROM TrainingManager WHERE Email = 'reham.ahmed.manager@iti.gov.eg'), (SELECT BranchID FROM Branch WHERE BranchName = 'Mansoura')),
        ((SELECT ManID FROM TrainingManager WHERE Email = 'reham.ahmed.manager@iti.gov.eg'), (SELECT BranchID FROM Branch WHERE BranchName = 'Assiut')),
        ((SELECT ManID FROM TrainingManager WHERE Email = 'youssef.saber.manager@iti.gov.eg'), (SELECT BranchID FROM Branch WHERE BranchName = 'Fayoum')),
        ((SELECT ManID FROM TrainingManager WHERE Email = 'youssef.saber.manager@iti.gov.eg'), (SELECT BranchID FROM Branch WHERE BranchName = 'Cairo University')),
        ((SELECT ManID FROM TrainingManager WHERE Email = 'youssef.saber.manager@iti.gov.eg'), (SELECT BranchID FROM Branch WHERE BranchName = 'Menoufia')),
        ((SELECT ManID FROM TrainingManager WHERE Email = 'laila.hassan.manager@iti.gov.eg'), (SELECT BranchID FROM Branch WHERE BranchName = 'Ismailia'));

    /* 7) Insert ManagerTrack: 10 rows. */
    INSERT INTO ManagerTrack (ManID, TrackID)
    VALUES
        ((SELECT ManID FROM TrainingManager WHERE Email = 'laila.hassan.manager@iti.gov.eg'), (SELECT TrackID FROM Track WHERE TrackName = 'Data Engineering')),
        ((SELECT ManID FROM TrainingManager WHERE Email = 'laila.hassan.manager@iti.gov.eg'), (SELECT TrackID FROM Track WHERE TrackName = 'Data Science and AI')),
        ((SELECT ManID FROM TrainingManager WHERE Email = 'tamer.fathy.manager@iti.gov.eg'), (SELECT TrackID FROM Track WHERE TrackName = 'Power BI & Data Visualization')),
        ((SELECT ManID FROM TrainingManager WHERE Email = 'tamer.fathy.manager@iti.gov.eg'), (SELECT TrackID FROM Track WHERE TrackName = 'UI/UX Design')),
        ((SELECT ManID FROM TrainingManager WHERE Email = 'reham.ahmed.manager@iti.gov.eg'), (SELECT TrackID FROM Track WHERE TrackName = 'Cloud Computing')),
        ((SELECT ManID FROM TrainingManager WHERE Email = 'reham.ahmed.manager@iti.gov.eg'), (SELECT TrackID FROM Track WHERE TrackName = 'System Administration')),
        ((SELECT ManID FROM TrainingManager WHERE Email = 'youssef.saber.manager@iti.gov.eg'), (SELECT TrackID FROM Track WHERE TrackName = 'Cyber Security')),
        ((SELECT ManID FROM TrainingManager WHERE Email = 'youssef.saber.manager@iti.gov.eg'), (SELECT TrackID FROM Track WHERE TrackName = 'Embedded Systems')),
        ((SELECT ManID FROM TrainingManager WHERE Email = 'youssef.saber.manager@iti.gov.eg'), (SELECT TrackID FROM Track WHERE TrackName = 'Software Testing & Quality Assurance')),
        ((SELECT ManID FROM TrainingManager WHERE Email = 'laila.hassan.manager@iti.gov.eg'), (SELECT TrackID FROM Track WHERE TrackName = 'Full Stack Web Development using .Net'));

    /* 8) Insert Stud_PhoneNum: 10 rows. */
    ;WITH StudentPhones AS (
        SELECT 'ahmed.aly' AS Username, 2015600001 AS PhoneNum UNION ALL
        SELECT 'mona.hassan', 2015600002 UNION ALL
        SELECT 'omar.farouk', 2015600003 UNION ALL
        SELECT 'sara.mahmoud', 2015600004 UNION ALL
        SELECT 'yassin.ezzat', 2015600005 UNION ALL
        SELECT 'nour.zaki', 2015600006 UNION ALL
        SELECT 'hany.salem', 2015600007 UNION ALL
        SELECT 'mariam.ali', 2015600008 UNION ALL
        SELECT 'khaled.idris', 2015600009 UNION ALL
        SELECT 'laila.soliman', 2015600010
    )
    INSERT INTO Stud_PhoneNum (StudentID, PhoneNum)
    SELECT s.StudentID, sp.PhoneNum
    FROM StudentPhones sp
    INNER JOIN [User] u
        ON u.Username = sp.Username
    INNER JOIN Student s
        ON s.UserID = u.UserID;

GO --Inserting new rows into classes
SET XACT_ABORT ON;
BEGIN TRANSACTION;

/* Insert 10 extra Class rows (safe with FK lookups and duplicate guard). */
;WITH ClassSeed AS (
    SELECT 'salma.nabil@iti.gov.eg' AS InstEmail, 'SQL Server Fundamentals' AS CourseName, 'Smart Village' AS BranchName, 2027 AS ClassYear UNION ALL
    SELECT 'salma.nabil@iti.gov.eg', 'Data Warehouse & ETL', 'Alexandria', 2027 UNION ALL
    SELECT 'salma.nabil@iti.gov.eg', 'Big Data Technologies', 'Knowledge City', 2027 UNION ALL
    SELECT 'karim.adel@iti.gov.eg', 'Python for Data Science', 'Cairo Branch', 2027 UNION ALL
    SELECT 'karim.adel@iti.gov.eg', 'Cloud Data Solutions', 'Mansoura', 2027 UNION ALL
    SELECT 'karim.adel@iti.gov.eg', 'Soft Skills', 'Assiut', 2027 UNION ALL
    SELECT 'nada.sameh@iti.gov.eg', 'Power BI Modeling', 'Smart Village', 2028 UNION ALL
    SELECT 'nada.sameh@iti.gov.eg', 'Data Visualization', 'Alexandria', 2028 UNION ALL
    SELECT 'nada.sameh@iti.gov.eg', 'SQL Server Fundamentals', 'Cairo Branch', 2028 UNION ALL
    SELECT 'salma.nabil@iti.gov.eg', 'Power BI Modeling', 'Knowledge City', 2028
)
INSERT INTO Class ([Year], CourseID, Inst_ID, BranchID, IntakeID)
SELECT
    cs.ClassYear,
    c.CourseID,
    i.InstructorID,
    b.BranchID,
    ia.IntakeID
FROM ClassSeed cs
INNER JOIN Instructor i
    ON i.Email = cs.InstEmail
INNER JOIN Course c
    ON c.CourseName = cs.CourseName
INNER JOIN Branch b
    ON b.BranchName = cs.BranchName
CROSS APPLY (
    SELECT TOP 1 it.IntakeID
    FROM Intake it
    WHERE it.BranchID = b.BranchID
    ORDER BY it.IntakeID
) ia
WHERE NOT EXISTS (
    SELECT 1
    FROM Class x
    WHERE x.BranchID = b.BranchID
      AND x.IntakeID = ia.IntakeID
      AND x.[Year] = cs.ClassYear
      AND x.CourseID = c.CourseID
);

COMMIT TRANSACTION;
PRINT 'inserted successfully.';