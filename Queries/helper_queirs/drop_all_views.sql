USE ExamsSystem;
GO

DECLARE @DropViewsSQL NVARCHAR(MAX) = N'';

-- 1. Build the dynamic SQL string
SELECT @DropViewsSQL += N'DROP VIEW ' + QUOTENAME(s.name) + N'.' + QUOTENAME(v.name) + N'; ' + CHAR(13)
FROM sys.views v
JOIN sys.schemas s ON v.schema_id = s.schema_id;

-- 2. Check if there are any views to drop
IF @DropViewsSQL = N''
BEGIN
    PRINT 'No views found to drop.';
END
ELSE
BEGIN
    -- Optional: You can PRINT @DropViewsSQL to see the exact commands before running them
    -- PRINT @DropViewsSQL; 
    
    -- 3. Execute the drop commands
    BEGIN TRY
        EXEC sp_executesql @DropViewsSQL;
        PRINT 'SUCCESS: All views have been dropped.';
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR ('Error dropping views: %s', 16, 1, @ErrorMessage);
    END CATCH
END;
GO