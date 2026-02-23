USE ExamsSystem;
GO

SELECT 
    s.name AS [Schema],
    t.name AS [TableName],
    p.rows AS [RowCount]
FROM 
    sys.tables t
INNER JOIN 
    sys.schemas s ON t.schema_id = s.schema_id
INNER JOIN 
    sys.partitions p ON t.object_id = p.object_id
WHERE 
    p.index_id IN (0, 1) -- 0 = Heap (No Clustered Index), 1 = Clustered Index
ORDER BY 
    p.rows DESC, 
    t.name ASC;


