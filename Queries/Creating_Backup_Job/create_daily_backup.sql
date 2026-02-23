USE msdb;
GO

-- Variables for customization
DECLARE @JobName NVARCHAR(128) = N'Daily Backup - ExamsSystem';
DECLARE @DatabaseName NVARCHAR(128) = N'ExamsSystem';
DECLARE @BackupDirectory NVARCHAR(256) = N'/home/mahmoud/Desktop/ITI/4.DB_Foundation, SQL, TSQL/project/db_backubs/'; 

-- 1. Check if the job already exists (Delete it to recreate cleanly)
IF EXISTS (SELECT job_id FROM msdb.dbo.sysjobs WHERE name = @JobName)
BEGIN
    EXEC msdb.dbo.sp_delete_job @job_name = @JobName;
END

-- 2. Create the SQL Server Agent Job
EXEC msdb.dbo.sp_add_job
    @job_name = @JobName,
    @enabled = 1,
    @description = N'Daily full backup of the ExamsSystem database at 6:00 AM.',
    @owner_login_name = N'sa'; -- Change 'sa' to your specific admin login if preferred

-- 3. Add the Job Step (The actual Backup Command)
-- We build a dynamic command inside the job so it appends the date to the file name (e.g., ExamsSystem_20231024.bak)
DECLARE @BackupCommand NVARCHAR(MAX) = 
N'DECLARE @FileName NVARCHAR(256);
SET @FileName = N''' + @BackupDirectory + @DatabaseName + N'_'' + FORMAT(GETDATE(), ''yyyyMMdd'') + N''.bak'';
BACKUP DATABASE [' + @DatabaseName + '] TO DISK = @FileName WITH INIT, STATS = 10;';

EXEC msdb.dbo.sp_add_jobstep
    @job_name = @JobName,
    @step_name = N'Step 1: Execute Full Backup',
    @subsystem = N'TSQL',
    @command = @BackupCommand,
    @database_name = N'master';

-- 4. Create the Schedule (Daily at 6:00 AM)
DECLARE @ScheduleName NVARCHAR(128) = @JobName + N'_Schedule';

EXEC msdb.dbo.sp_add_schedule
    @schedule_name = @ScheduleName,
    @freq_type = 4,              -- 4 = Daily
    @freq_interval = 1,          -- 1 = Every 1 day
    @active_start_time = 060000; -- 060000 = 06:00:00 AM (Format: HHMMSS)

-- 5. Attach the Schedule to the Job
EXEC msdb.dbo.sp_attach_schedule
    @job_name = @JobName,
    @schedule_name = @ScheduleName;

-- 6. Assign the Job to the Local Server
EXEC msdb.dbo.sp_add_jobserver
    @job_name = @JobName,
    @server_name = N'(LOCAL)';
GO

PRINT 'SUCCESS: Daily Backup Job created for 6:00 AM.';