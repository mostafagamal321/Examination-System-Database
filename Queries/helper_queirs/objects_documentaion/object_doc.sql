USE ExamsSystem;
GO

WITH ObjectDocumentation AS (

    -- ==========================================
    -- 1. TABLES
    -- ==========================================
    SELECT 
        s.name + '.' + o.name AS [Object Name],
        '1. Table' AS [Object Type],
        ISNULL(CAST(ep.value AS NVARCHAR(MAX)), 'Stores the core data records for the [' + o.name + '] entity.') AS [Why we need this object],
        ISNULL((
            SELECT STRING_AGG(c.name + ' (' + ty.name + ')', ', ') WITHIN GROUP (ORDER BY c.column_id)
            FROM sys.columns c 
            JOIN sys.types ty ON c.user_type_id = ty.user_type_id 
            WHERE c.object_id = o.object_id
        ), 'No columns') AS [Parameters / Columns / Details]
    FROM sys.objects o
    JOIN sys.schemas s ON o.schema_id = s.schema_id
    LEFT JOIN sys.extended_properties ep ON ep.major_id = o.object_id AND ep.minor_id = 0 AND ep.name = 'MS_Description'
    WHERE o.type = 'U'

    UNION ALL

    -- ==========================================
    -- 2. VIEWS
    -- ==========================================
    SELECT 
        s.name + '.' + o.name AS [Object Name],
        '2. View' AS [Object Type],
        ISNULL(CAST(ep.value AS NVARCHAR(MAX)), 'Provides a simplified, joined, or filtered data projection for [' + o.name + '].') AS [Why we need this object],
        ISNULL((
            SELECT STRING_AGG(c.name + ' (' + ty.name + ')', ', ') WITHIN GROUP (ORDER BY c.column_id)
            FROM sys.columns c 
            JOIN sys.types ty ON c.user_type_id = ty.user_type_id 
            WHERE c.object_id = o.object_id
        ), 'No columns') AS [Parameters / Columns / Details]
    FROM sys.objects o
    JOIN sys.schemas s ON o.schema_id = s.schema_id
    LEFT JOIN sys.extended_properties ep ON ep.major_id = o.object_id AND ep.minor_id = 0 AND ep.name = 'MS_Description'
    WHERE o.type = 'V'

    UNION ALL

    -- ==========================================
    -- 3. STORED PROCEDURES
    -- ==========================================
    SELECT 
        s.name + '.' + o.name AS [Object Name],
        '3. Stored Procedure' AS [Object Type],
        ISNULL(CAST(ep.value AS NVARCHAR(MAX)), 'Executes business logic, automation, or secure data manipulation.') AS [Why we need this object],
        ISNULL((
            SELECT STRING_AGG(p.name + ' (' + ty.name + CASE WHEN p.is_output = 1 THEN ' OUTPUT' ELSE '' END + ')', ', ') WITHIN GROUP (ORDER BY p.parameter_id)
            FROM sys.parameters p
            JOIN sys.types ty ON p.user_type_id = ty.user_type_id
            WHERE p.object_id = o.object_id
        ), 'No Parameters') AS [Parameters / Columns / Details]
    FROM sys.objects o
    JOIN sys.schemas s ON o.schema_id = s.schema_id
    LEFT JOIN sys.extended_properties ep ON ep.major_id = o.object_id AND ep.minor_id = 0 AND ep.name = 'MS_Description'
    WHERE o.type = 'P'

    UNION ALL

    -- ==========================================
    -- 4. TRIGGERS
    -- ==========================================
    SELECT 
        s.name + '.' + o.name AS [Object Name],
        '4. Trigger' AS [Object Type],
        ISNULL(CAST(ep.value AS NVARCHAR(MAX)), 'Automates validation or cascaded background actions on table [' + OBJECT_NAME(o.parent_object_id) + '].') AS [Why we need this object],
        'Listens to Table: ' + OBJECT_NAME(o.parent_object_id) AS [Parameters / Columns / Details]
    FROM sys.objects o
    JOIN sys.schemas s ON o.schema_id = s.schema_id
    LEFT JOIN sys.extended_properties ep ON ep.major_id = o.object_id AND ep.minor_id = 0 AND ep.name = 'MS_Description'
    WHERE o.type = 'TR'

    UNION ALL

    -- ==========================================
    -- 5. CONSTRAINTS
    -- ==========================================
    SELECT 
        s.name + '.' + o.name AS [Object Name],
        '5. Constraint (' + 
            CASE o.type 
                WHEN 'C' THEN 'Check'
                WHEN 'D' THEN 'Default'
                WHEN 'UQ' THEN 'Unique'
            END + ')' AS [Object Type],
        ISNULL(CAST(ep.value AS NVARCHAR(MAX)), 'Enforces strict data integrity and structural rules on table [' + OBJECT_NAME(o.parent_object_id) + '].') AS [Why we need this object],
        'Applied to Table: ' + OBJECT_NAME(o.parent_object_id) AS [Parameters / Columns / Details]
    FROM sys.objects o
    JOIN sys.schemas s ON o.schema_id = s.schema_id
    LEFT JOIN sys.extended_properties ep ON ep.major_id = o.object_id AND ep.minor_id = 0 AND ep.name = 'MS_Description'
    WHERE o.type IN ('C', 'D', 'UQ')

)
-- ==========================================
-- FINAL OUTPUT
-- ==========================================
SELECT * FROM ObjectDocumentation
ORDER BY [Object Type], [Object Name];