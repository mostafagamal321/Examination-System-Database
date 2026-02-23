SELECT 
    s.name AS [Schema],
    p.name AS [SP_Name],
    ISNULL(STRING_AGG(
        CAST(pr.name AS NVARCHAR(MAX)) + ' ' +  -- Parameter Name
        UPPER(t.name) +                         -- Data Type
        
        -- Logic to append length for text/binary types
        CASE 
            WHEN t.name IN ('varchar', 'char', 'varbinary', 'binary') 
                THEN '(' + CASE WHEN pr.max_length = -1 THEN 'MAX' ELSE CAST(pr.max_length AS VARCHAR) END + ')'
            WHEN t.name IN ('nvarchar', 'nchar') 
                THEN '(' + CASE WHEN pr.max_length = -1 THEN 'MAX' ELSE CAST(pr.max_length / 2 AS VARCHAR) END + ')'
            ELSE '' 
        END +

        -- Logic to append OUTPUT flag
        CASE WHEN pr.is_output = 1 THEN ' [OUTPUT]' ELSE '' END
    , ', ') WITHIN GROUP (ORDER BY pr.parameter_id), 'No Parameters') AS [Parameters_List]

FROM sys.procedures p
INNER JOIN sys.schemas s ON p.schema_id = s.schema_id
LEFT JOIN sys.parameters pr ON p.object_id = pr.object_id
LEFT JOIN sys.types t ON pr.user_type_id = t.user_type_id
GROUP BY s.name, p.name
ORDER BY s.name, p.name;