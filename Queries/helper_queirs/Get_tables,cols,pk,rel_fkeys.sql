USE ExamsSystem;
GO

SELECT 
    t.name AS [TableName],
    ISNULL(c.ColumnList, '') AS [Columns],
    ISNULL(pk.ConstraintName, 'None') AS [PrimaryKey],
    ISNULL(pk.KeyColumns, '') AS [PK_Columns],
    ISNULL(fk.FK_List, 'None') AS [ForeignKeys]
FROM sys.tables t
LEFT JOIN (
    -- 1. Get all Columns per Table
    SELECT 
        c.object_id,
        STRING_AGG(c.name + ' (' + UPPER(ty.name) + 
            CASE 
                WHEN ty.name IN ('nvarchar', 'varchar', 'char') AND c.max_length = -1 THEN '(MAX)'
                WHEN ty.name IN ('nvarchar', 'varchar', 'char') THEN '(' + CAST(c.max_length AS VARCHAR(10)) + ')'
                ELSE '' 
            END + ')', ', ') WITHIN GROUP (ORDER BY c.column_id) AS ColumnList
    FROM sys.columns c
    JOIN sys.types ty ON c.user_type_id = ty.user_type_id
    GROUP BY c.object_id
) c ON t.object_id = c.object_id
LEFT JOIN (
    -- 2. Get Primary Keys
    SELECT 
        i.object_id,
        i.name AS ConstraintName,
        STRING_AGG(c.name, ', ') WITHIN GROUP (ORDER BY ic.key_ordinal) AS KeyColumns
    FROM sys.indexes i
    JOIN sys.index_columns ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id
    JOIN sys.columns c ON ic.object_id = c.object_id AND ic.column_id = c.column_id
    WHERE i.is_primary_key = 1
    GROUP BY i.object_id, i.name
) pk ON t.object_id = pk.object_id
LEFT JOIN (
    -- 3. Get Foreign Keys (FIXED)
    SELECT 
        fk.parent_object_id AS object_id,  -- <--- FIXED ALIAS HERE
        STRING_AGG(
            fk.name + ': ' + pc.name + ' references ' + rt.name + '(' + rc.name + ')', 
            '; '
        ) WITHIN GROUP (ORDER BY fk.name) AS FK_List
    FROM sys.foreign_keys fk
    JOIN sys.foreign_key_columns fkc ON fk.object_id = fkc.constraint_object_id
    JOIN sys.tables rt ON fk.referenced_object_id = rt.object_id
    JOIN sys.columns pc ON fkc.parent_object_id = pc.object_id AND fkc.parent_column_id = pc.column_id
    JOIN sys.columns rc ON fkc.referenced_object_id = rc.object_id AND fkc.referenced_column_id = rc.column_id
    GROUP BY fk.parent_object_id
) fk ON t.object_id = fk.object_id
ORDER BY t.name