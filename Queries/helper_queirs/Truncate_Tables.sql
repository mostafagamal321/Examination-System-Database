USE ExamsSystem;
GO

-- =============================================
-- STEP 1: DISABLE ALL CONSTRAINTS
-- =============================================
-- Allows us to delete data in any order
EXEC sp_msforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL';
GO

-- =============================================
-- STEP 2: DELETE ALL DATA & RESET IDs
-- =============================================
DECLARE @sql NVARCHAR(MAX) = '';

-- Generate DELETE statements for every table
SELECT @sql += 'DELETE FROM ' + QUOTENAME(s.name) + '.' + QUOTENAME(t.name) + '; '
FROM sys.tables t
JOIN sys.schemas s ON t.schema_id = s.schema_id
WHERE t.type = 'U';

EXEC sp_executesql @sql;

-- Reset Identity Counters (so new IDs start at 1 again)
-- This makes DELETE behave exactly like TRUNCATE
EXEC sp_msforeachtable 'IF OBJECTPROPERTY(OBJECT_ID(''?''), ''TableHasIdentity'') = 1 DBCC CHECKIDENT (''?'', RESEED, 0)';
GO

-- =============================================
-- STEP 3: RE-ENABLE ALL CONSTRAINTS
-- =============================================
-- Now that tables are 100% empty, this will succeed
EXEC sp_msforeachtable 'ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL';
GO

PRINT 'SUCCESS: All tables wiped, IDs reset, and constraints re-enabled.';