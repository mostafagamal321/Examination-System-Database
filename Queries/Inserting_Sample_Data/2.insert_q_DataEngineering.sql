USE ExamsSystem;
GO

-- ============================================================================
-- PART 1: 20 MULTIPLE CHOICE QUESTIONS (MCQ) - Degree: 2
-- ============================================================================

EXEC sp_AddQuestion 
    @CourseID = 1, @QType = 'MCQ', @Degree = 2,
    @QText = 'What does SQL stand for?', 
    @CorrectAnswer = 'Structured Query Language', 
    @WrongAnswers = 'Strong Question Language,Structured Question Language,Standard Query Language';

EXEC sp_AddQuestion 
    @CourseID = 1, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which SQL statement is used to extract data from a database?', 
    @CorrectAnswer = 'SELECT', 
    @WrongAnswers = 'EXTRACT,OPEN,PULL';

EXEC sp_AddQuestion 
    @CourseID = 1, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which statement is used to update data in a database?', 
    @CorrectAnswer = 'UPDATE', 
    @WrongAnswers = 'SAVE,MODIFY,ALTER';

EXEC sp_AddQuestion 
    @CourseID = 1, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which SQL keyword is used to sort the result-set?', 
    @CorrectAnswer = 'ORDER BY', 
    @WrongAnswers = 'SORT BY,ALIGN BY,GROUP BY';

EXEC sp_AddQuestion 
    @CourseID = 1, @QType = 'MCQ', @Degree = 2,
    @QText = 'What is the most common type of JOIN in SQL?', 
    @CorrectAnswer = 'INNER JOIN', 
    @WrongAnswers = 'INSIDE JOIN,MATCHED JOIN,EQUAL JOIN';

EXEC sp_AddQuestion 
    @CourseID = 1, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which operator is used to search for a specified pattern in a column?', 
    @CorrectAnswer = 'LIKE', 
    @WrongAnswers = 'MATCH,PATTERN,SEARCH';

EXEC sp_AddQuestion 
    @CourseID = 1, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which SQL statement is used to create a new database table?', 
    @CorrectAnswer = 'CREATE TABLE', 
    @WrongAnswers = 'MAKE TABLE,GENERATE TABLE,BUILD TABLE';

EXEC sp_AddQuestion 
    @CourseID = 1, @QType = 'MCQ', @Degree = 2,
    @QText = 'How do you select all columns from a table named "Employees"?', 
    @CorrectAnswer = 'SELECT * FROM Employees', 
    @WrongAnswers = 'SELECT ALL FROM Employees,SELECT [all] FROM Employees,EXTRACT * FROM Employees';

EXEC sp_AddQuestion 
    @CourseID = 1, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which function returns the number of rows in a table?', 
    @CorrectAnswer = 'COUNT()', 
    @WrongAnswers = 'ROWS(),SUM(),TALLY()';

EXEC sp_AddQuestion 
    @CourseID = 1, @QType = 'MCQ', @Degree = 2,
    @QText = 'In SQL Server what is the default isolation level?', 
    @CorrectAnswer = 'READ COMMITTED', 
    @WrongAnswers = 'READ UNCOMMITTED,SERIALIZABLE,REPEATABLE READ';

EXEC sp_AddQuestion 
    @CourseID = 1, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which command is used to remove all records from a table while keeping its structure without logging individual row deletions?', 
    @CorrectAnswer = 'TRUNCATE', 
    @WrongAnswers = 'DELETE,DROP,WIPE';

EXEC sp_AddQuestion 
    @CourseID = 1, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which of the following is a DDL command?', 
    @CorrectAnswer = 'ALTER', 
    @WrongAnswers = 'UPDATE,INSERT,MERGE';

EXEC sp_AddQuestion 
    @CourseID = 1, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which clause is used to filter the results of aggregated data?', 
    @CorrectAnswer = 'HAVING', 
    @WrongAnswers = 'WHERE,FILTER,CONDITION';

EXEC sp_AddQuestion 
    @CourseID = 1, @QType = 'MCQ', @Degree = 2,
    @QText = 'What command undoes a transaction in SQL Server?', 
    @CorrectAnswer = 'ROLLBACK', 
    @WrongAnswers = 'REVERT,UNDO,CANCEL';

EXEC sp_AddQuestion 
    @CourseID = 1, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which data type is best for storing varying lengths of Unicode character data?', 
    @CorrectAnswer = 'NVARCHAR', 
    @WrongAnswers = 'VARCHAR,CHAR,TEXT';

EXEC sp_AddQuestion 
    @CourseID = 1, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which function returns the highest value in a specified column?', 
    @CorrectAnswer = 'MAX()', 
    @WrongAnswers = 'HIGHEST(),TOP(),PEAK()';

EXEC sp_AddQuestion 
    @CourseID = 1, @QType = 'MCQ', @Degree = 2,
    @QText = 'What is the purpose of the IDENTITY property in SQL Server?', 
    @CorrectAnswer = 'To auto-generate sequential numbers', 
    @WrongAnswers = 'To encrypt data,To link two tables,To prevent NULL values';

EXEC sp_AddQuestion 
    @CourseID = 1, @QType = 'MCQ', @Degree = 2,
    @QText = 'How do you return only distinct (different) values?', 
    @CorrectAnswer = 'SELECT DISTINCT', 
    @WrongAnswers = 'SELECT UNIQUE,SELECT DIFFERENT,SELECT SPECIFIC';

EXEC sp_AddQuestion 
    @CourseID = 1, @QType = 'MCQ', @Degree = 2,
    @QText = 'What system database in SQL Server stores login accounts and system configuration settings?', 
    @CorrectAnswer = 'master', 
    @WrongAnswers = 'model,msdb,tempdb';

EXEC sp_AddQuestion 
    @CourseID = 1, @QType = 'MCQ', @Degree = 2,
    @QText = 'Which keyword creates a temporary result set that can be referenced within a SELECT statement?', 
    @CorrectAnswer = 'WITH (CTE)', 
    @WrongAnswers = 'TEMP,DERIVED,ALIASES';


-- ============================================================================
-- PART 2: 20 TRUE/FALSE QUESTIONS (TF) - Degree: 1
-- ============================================================================

EXEC sp_AddQuestion @CourseID = 1, @QType = 'TF', @Degree = 1, @IsTrue = 0,
    @QText = 'SQL keywords like SELECT and UPDATE are case-sensitive by default in SQL Server.';

EXEC sp_AddQuestion @CourseID = 1, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'A Primary Key constraint automatically enforces uniqueness and does not allow NULL values.';

EXEC sp_AddQuestion @CourseID = 1, @QType = 'TF', @Degree = 1, @IsTrue = 0,
    @QText = 'The GO keyword is an official T-SQL command executed by the SQL Server Database Engine.';

EXEC sp_AddQuestion @CourseID = 1, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'An INNER JOIN returns rows only when there is at least one match in both tables.';

EXEC sp_AddQuestion @CourseID = 1, @QType = 'TF', @Degree = 1, @IsTrue = 0,
    @QText = 'The WHERE clause can be used to filter rows after the GROUP BY clause has been applied.';

EXEC sp_AddQuestion @CourseID = 1, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'A table in SQL Server can have a maximum of one Clustered Index.';

EXEC sp_AddQuestion @CourseID = 1, @QType = 'TF', @Degree = 1, @IsTrue = 0,
    @QText = 'A UNIQUE constraint cannot contain any NULL values in SQL Server.';

EXEC sp_AddQuestion @CourseID = 1, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'Views act as virtual tables whose contents are defined by a stored query.';

EXEC sp_AddQuestion @CourseID = 1, @QType = 'TF', @Degree = 1, @IsTrue = 0,
    @QText = 'A LEFT JOIN returns all rows from the right table and the matched rows from the left table.';

EXEC sp_AddQuestion @CourseID = 1, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'Transact-SQL (T-SQL) is Microsoft''s proprietary extension to standard SQL.';

EXEC sp_AddQuestion @CourseID = 1, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'Foreign keys help maintain referential integrity between related tables.';

EXEC sp_AddQuestion @CourseID = 1, @QType = 'TF', @Degree = 1, @IsTrue = 0,
    @QText = 'The DROP TABLE command only removes the data but leaves the table schema intact.';

EXEC sp_AddQuestion @CourseID = 1, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'Stored Procedures can accept input parameters and return output parameters.';

EXEC sp_AddQuestion @CourseID = 1, @QType = 'TF', @Degree = 1, @IsTrue = 0,
    @QText = 'The tempdb database is permanently saved to the hard drive and survives server reboots.';

EXEC sp_AddQuestion @CourseID = 1, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'DML stands for Data Manipulation Language and includes INSERT, UPDATE, and DELETE.';

EXEC sp_AddQuestion @CourseID = 1, @QType = 'TF', @Degree = 1, @IsTrue = 0,
    @QText = 'You must use the asterisk (*) symbol to select columns in a SELECT statement.';

EXEC sp_AddQuestion @CourseID = 1, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'A non-clustered index stores pointers to the actual data rows rather than the data itself.';

EXEC sp_AddQuestion @CourseID = 1, @QType = 'TF', @Degree = 1, @IsTrue = 0,
    @QText = 'The SUM() function can be applied to string (VARCHAR) data types.';

EXEC sp_AddQuestion @CourseID = 1, @QType = 'TF', @Degree = 1, @IsTrue = 1,
    @QText = 'UNION combines the result sets of two queries and automatically removes duplicate rows.';

EXEC sp_AddQuestion @CourseID = 1, @QType = 'TF', @Degree = 1, @IsTrue = 0,
    @QText = 'A trigger can only be fired manually by a database administrator.';


-- ============================================================================
-- PART 3: 20 TEXT / ESSAY QUESTIONS - Degree: 5
-- ============================================================================

EXEC sp_AddQuestion 
    @CourseID = 1, @QType = 'Text', @Degree = 5,
    @QText = 'Explain the main difference between DELETE and TRUNCATE.', 
    @Keywords = 'DML,DDL,log,rollback,where,fast';

EXEC sp_AddQuestion 
    @CourseID = 1, @QType = 'Text', @Degree = 5,
    @QText = 'What is the purpose of a Primary Key in a table?', 
    @Keywords = 'unique,identifier,null,record,integrity';

EXEC sp_AddQuestion 
    @CourseID = 1, @QType = 'Text', @Degree = 5,
    @QText = 'Describe how an INNER JOIN differs from a LEFT JOIN.', 
    @Keywords = 'match,both,unmatched,left,all';

EXEC sp_AddQuestion 
    @CourseID = 1, @QType = 'Text', @Degree = 5,
    @QText = 'What are Stored Procedures and why are they useful?', 
    @Keywords = 'precompiled,parameters,execution,batch,security,reuse';

EXEC sp_AddQuestion 
    @CourseID = 1, @QType = 'Text', @Degree = 5,
    @QText = 'Explain the difference between a Clustered and Non-Clustered Index.', 
    @Keywords = 'physical,sort,pointers,one,logical';

EXEC sp_AddQuestion 
    @CourseID = 1, @QType = 'Text', @Degree = 5,
    @QText = 'What is Database Normalization?', 
    @Keywords = 'redundancy,dependencies,organize,tables,relations';

EXEC sp_AddQuestion 
    @CourseID = 1, @QType = 'Text', @Degree = 5,
    @QText = 'Briefly explain the ACID properties of a database transaction.', 
    @Keywords = 'Atomicity,Consistency,Isolation,Durability,transaction';

EXEC sp_AddQuestion 
    @CourseID = 1, @QType = 'Text', @Degree = 5,
    @QText = 'What is the role of a Foreign Key?', 
    @Keywords = 'reference,primary,relationship,integrity,table';

EXEC sp_AddQuestion 
    @CourseID = 1, @QType = 'Text', @Degree = 5,
    @QText = 'Why do we use the GROUP BY statement?', 
    @Keywords = 'aggregate,functions,count,sum,category,summarize';

EXEC sp_AddQuestion 
    @CourseID = 1, @QType = 'Text', @Degree = 5,
    @QText = 'What is the specific function of the HAVING clause?', 
    @Keywords = 'filter,group,aggregate,where,condition';

EXEC sp_AddQuestion 
    @CourseID = 1, @QType = 'Text', @Degree = 5,
    @QText = 'How does a UNION operation differ from a JOIN?', 
    @Keywords = 'rows,columns,append,stack,distinct';

EXEC sp_AddQuestion 
    @CourseID = 1, @QType = 'Text', @Degree = 5,
    @QText = 'Define what a Database View is.', 
    @Keywords = 'virtual,table,query,security,abstract,complex';

EXEC sp_AddQuestion 
    @CourseID = 1, @QType = 'Text', @Degree = 5,
    @QText = 'What is the main difference between VARCHAR and NVARCHAR data types?', 
    @Keywords = 'unicode,bytes,characters,multilingual,storage';

EXEC sp_AddQuestion 
    @CourseID = 1, @QType = 'Text', @Degree = 5,
    @QText = 'What is a Database Trigger and when does it fire?', 
    @Keywords = 'automatic,event,insert,update,delete,background';

EXEC sp_AddQuestion 
    @CourseID = 1, @QType = 'Text', @Degree = 5,
    @QText = 'What is the purpose of an IDENTITY column in SQL Server?', 
    @Keywords = 'auto-increment,unique,generate,seed,number';

EXEC sp_AddQuestion 
    @CourseID = 1, @QType = 'Text', @Degree = 5,
    @QText = 'Describe what a CTE (Common Table Expression) is.', 
    @Keywords = 'temporary,result,WITH,recursion,query,readability';

EXEC sp_AddQuestion 
    @CourseID = 1, @QType = 'Text', @Degree = 5,
    @QText = 'What is a Deadlock in SQL Server?', 
    @Keywords = 'lock,mutual,wait,resource,blocked,conflict';

EXEC sp_AddQuestion 
    @CourseID = 1, @QType = 'Text', @Degree = 5,
    @QText = 'Explain the difference between DDL and DML.', 
    @Keywords = 'definition,manipulation,structure,data,create,insert';

EXEC sp_AddQuestion 
    @CourseID = 1, @QType = 'Text', @Degree = 5,
    @QText = 'What is a SQL Injection attack and how do you prevent it?', 
    @Keywords = 'malicious,vulnerability,input,parameters,security,hack';

EXEC sp_AddQuestion 
    @CourseID = 1, @QType = 'Text', @Degree = 5,
    @QText = 'What is the difference between the ISNULL() and COALESCE() functions?', 
    @Keywords = 'null,replace,multiple,arguments,standard,first';


