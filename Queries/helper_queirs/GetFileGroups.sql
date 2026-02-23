USE ExamsSystem;
GO

SELECT 
    fg.name AS [Filegroup Name],
    t.name AS [Table Name],
    i.name AS [Index / Object Name],
    i.type_desc AS [Type]
FROM sys.indexes i
JOIN sys.filegroups fg ON i.data_space_id = fg.data_space_id
JOIN sys.tables t ON i.object_id = t.object_id
WHERE i.is_primary_key = 1            -- Shows tables with PKs (Clustered)
   OR i.index_id = 0                  -- Shows Heaps (Tables without Clustered Index)
ORDER BY fg.name, t.name;