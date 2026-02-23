
-- 1. Role Assignments For Manager
-- =============================================

-- Add Manager
ALTER ROLE ManagerRole ADD MEMBER [iti_manager];

-- Add Instructors
ALTER ROLE InstructorRole ADD MEMBER [ahmed_instructor];
ALTER ROLE InstructorRole ADD MEMBER [inst_mona];
ALTER ROLE InstructorRole ADD MEMBER [inst_yasser];
ALTER ROLE InstructorRole ADD MEMBER [inst_hoda];




-- 2. Student Assignment For Student
-- =============================================

-- Generic Student Account
ALTER ROLE StudentRole ADD MEMBER [omar_student];

-- Individual Students
ALTER ROLE StudentRole ADD MEMBER [ahmed.aly];
ALTER ROLE StudentRole ADD MEMBER [mona.hassan];
ALTER ROLE StudentRole ADD MEMBER [omar.farouk];
ALTER ROLE StudentRole ADD MEMBER [sara.mahmoud];
ALTER ROLE StudentRole ADD MEMBER [yassin.ezzat];
ALTER ROLE StudentRole ADD MEMBER [nour.zaki];
ALTER ROLE StudentRole ADD MEMBER [hany.salem];
ALTER ROLE StudentRole ADD MEMBER [mariam.ali];
ALTER ROLE StudentRole ADD MEMBER [khaled.idris];
ALTER ROLE StudentRole ADD MEMBER [laila.soliman];
ALTER ROLE StudentRole ADD MEMBER [hassan.reda];
ALTER ROLE StudentRole ADD MEMBER [dina.moussa];
ALTER ROLE StudentRole ADD MEMBER [mostafa.nabil];
ALTER ROLE StudentRole ADD MEMBER [reem.adel];
ALTER ROLE StudentRole ADD MEMBER [tarek.abdelaziz];
ALTER ROLE StudentRole ADD MEMBER [salma.bakr];
ALTER ROLE StudentRole ADD MEMBER [fady.george];
ALTER ROLE StudentRole ADD MEMBER [habiba.wael];
ALTER ROLE StudentRole ADD MEMBER [sherif.gamal];
ALTER ROLE StudentRole ADD MEMBER [aya.ibrahim];
ALTER ROLE StudentRole ADD MEMBER [amr.diab];
ALTER ROLE StudentRole ADD MEMBER [mai.ezz];
ALTER ROLE StudentRole ADD MEMBER [karim.saad];
ALTER ROLE StudentRole ADD MEMBER [ola.rashad];
ALTER ROLE StudentRole ADD MEMBER [hazem.emam];
ALTER ROLE StudentRole ADD MEMBER [nada.ashraf];
ALTER ROLE StudentRole ADD MEMBER [seif.din];
ALTER ROLE StudentRole ADD MEMBER [rana.youssef];
ALTER ROLE StudentRole ADD MEMBER [ziad.omar];
ALTER ROLE StudentRole ADD MEMBER [jana.hany];

-----Extra Login, User, adding this user to an existing role-------------
CREATE LOGIN [itgate_admin] WITH PASSWORD = 'Admin@123'
CREATE USER [itgate_admin] FOR LOGIN [itgate_admin]
----Assigning Role
ALTER ROLE AdminRole ADD MEMBER [itgate_admin];

--------New Users---------
/* Create logins/users and assign roles for extra instructors and managers */

-- Instructors
IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'inst_salma_nabil')
    CREATE LOGIN [inst_salma_nabil] WITH PASSWORD = 'Salma@Pass2026';
IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'inst_salma_nabil')
    CREATE USER [inst_salma_nabil] FOR LOGIN [inst_salma_nabil];
ALTER ROLE InstructorRole ADD MEMBER [inst_salma_nabil];

IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'inst_karim_adel')
    CREATE LOGIN [inst_karim_adel] WITH PASSWORD = 'Karim@Pass2026';
IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'inst_karim_adel')
    CREATE USER [inst_karim_adel] FOR LOGIN [inst_karim_adel];
ALTER ROLE InstructorRole ADD MEMBER [inst_karim_adel];

IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'inst_nada_sameh')
    CREATE LOGIN [inst_nada_sameh] WITH PASSWORD = 'Nada@Pass2026';
IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'inst_nada_sameh')
    CREATE USER [inst_nada_sameh] FOR LOGIN [inst_nada_sameh];
ALTER ROLE InstructorRole ADD MEMBER [inst_nada_sameh];

-- Managers
IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'mgr_laila_hassan')
    CREATE LOGIN [mgr_laila_hassan] WITH PASSWORD = 'Laila@Mgr2026';
IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'mgr_laila_hassan')
    CREATE USER [mgr_laila_hassan] FOR LOGIN [mgr_laila_hassan];
ALTER ROLE ManagerRole ADD MEMBER [mgr_laila_hassan];

IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'mgr_tamer_fathy')
    CREATE LOGIN [mgr_tamer_fathy] WITH PASSWORD = 'Tamer@Mgr2026';
IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'mgr_tamer_fathy')
    CREATE USER [mgr_tamer_fathy] FOR LOGIN [mgr_tamer_fathy];
ALTER ROLE ManagerRole ADD MEMBER [mgr_tamer_fathy];

IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'mgr_reham_ahmed')
    CREATE LOGIN [mgr_reham_ahmed] WITH PASSWORD = 'Reham@Mgr2026';
IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'mgr_reham_ahmed')
    CREATE USER [mgr_reham_ahmed] FOR LOGIN [mgr_reham_ahmed];
ALTER ROLE ManagerRole ADD MEMBER [mgr_reham_ahmed];

IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'mgr_youssef_saber')
    CREATE LOGIN [mgr_youssef_saber] WITH PASSWORD = 'Youssef@Mgr2026';
IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'mgr_youssef_saber')
    CREATE USER [mgr_youssef_saber] FOR LOGIN [mgr_youssef_saber];
ALTER ROLE ManagerRole ADD MEMBER [mgr_youssef_saber];