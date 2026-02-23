USE ExamsSystem;
GO
--ExamID may change in your local DB
DECLARE @StudentID INT = 17;
DECLARE @ExamID INT = 13;

-- ============================================================================
-- PART 1: MULTIPLE CHOICE QUESTIONS 
-- ============================================================================

EXEC sp_SubmitAnswer @StudentID, @ExamID, @QuestionID = 4,  @AnswerText = 'Inner Join';
EXEC sp_SubmitAnswer @StudentID, @ExamID, @QuestionID = 13, @AnswerText = 'Structured Query Language';
EXEC sp_SubmitAnswer @StudentID, @ExamID, @QuestionID = 15, @AnswerText = 'UPDATE';
EXEC sp_SubmitAnswer @StudentID, @ExamID, @QuestionID = 17, @AnswerText = 'INNER JOIN';
EXEC sp_SubmitAnswer @StudentID, @ExamID, @QuestionID = 21, @AnswerText = 'COUNT()';
EXEC sp_SubmitAnswer @StudentID, @ExamID, @QuestionID = 23, @AnswerText = 'TRUNCATE';
EXEC sp_SubmitAnswer @StudentID, @ExamID, @QuestionID = 24, @AnswerText = 'ALTER';
EXEC sp_SubmitAnswer @StudentID, @ExamID, @QuestionID = 25, @AnswerText = 'HAVING';
EXEC sp_SubmitAnswer @StudentID, @ExamID, @QuestionID = 30, @AnswerText = 'SELECT DISTINCT';
EXEC sp_SubmitAnswer @StudentID, @ExamID, @QuestionID = 31, @AnswerText = 'master';

-- ============================================================================
-- PART 2: TRUE/FALSE QUESTIONS)
-- ============================================================================

EXEC sp_SubmitAnswer @StudentID, @ExamID, @QuestionID = 5,  @AnswerText = 'False';
EXEC sp_SubmitAnswer @StudentID, @ExamID, @QuestionID = 33, @AnswerText = 'False';
EXEC sp_SubmitAnswer @StudentID, @ExamID, @QuestionID = 34, @AnswerText = 'True';
EXEC sp_SubmitAnswer @StudentID, @ExamID, @QuestionID = 35, @AnswerText = 'False';
EXEC sp_SubmitAnswer @StudentID, @ExamID, @QuestionID = 36, @AnswerText = 'True';
EXEC sp_SubmitAnswer @StudentID, @ExamID, @QuestionID = 37, @AnswerText = 'False';
EXEC sp_SubmitAnswer @StudentID, @ExamID, @QuestionID = 38, @AnswerText = 'True';
EXEC sp_SubmitAnswer @StudentID, @ExamID, @QuestionID = 39, @AnswerText = 'False';
EXEC sp_SubmitAnswer @StudentID, @ExamID, @QuestionID = 40, @AnswerText = 'True';
EXEC sp_SubmitAnswer @StudentID, @ExamID, @QuestionID = 41, @AnswerText = 'False';
EXEC sp_SubmitAnswer @StudentID, @ExamID, @QuestionID = 42, @AnswerText = 'True';
EXEC sp_SubmitAnswer @StudentID, @ExamID, @QuestionID = 43, @AnswerText = 'True';
EXEC sp_SubmitAnswer @StudentID, @ExamID, @QuestionID = 44, @AnswerText = 'False';
EXEC sp_SubmitAnswer @StudentID, @ExamID, @QuestionID = 45, @AnswerText = 'True';
EXEC sp_SubmitAnswer @StudentID, @ExamID, @QuestionID = 46, @AnswerText = 'False';
EXEC sp_SubmitAnswer @StudentID, @ExamID, @QuestionID = 47, @AnswerText = 'True';
EXEC sp_SubmitAnswer @StudentID, @ExamID, @QuestionID = 49, @AnswerText = 'True';
EXEC sp_SubmitAnswer @StudentID, @ExamID, @QuestionID = 50, @AnswerText = 'False';
EXEC sp_SubmitAnswer @StudentID, @ExamID, @QuestionID = 51, @AnswerText = 'True';
EXEC sp_SubmitAnswer @StudentID, @ExamID, @QuestionID = 52, @AnswerText = 'False';

-- ============================================================================
-- PART 3: TEXT / ESSAY QUESTIONS 
-- ============================================================================

-- Q54 Keywords required: unique, identifier, null, record, integrity
EXEC sp_SubmitAnswer @StudentID, @ExamID, @QuestionID = 54, 
    @AnswerText = 'A primary key is a unique identifier for a record that ensures integrity and cannot be null.';

-- Q56 Keywords required: precompiled, parameters, execution, batch, security, reuse
EXEC sp_SubmitAnswer @StudentID, @ExamID, @QuestionID = 56, 
    @AnswerText = 'They are precompiled batch code for execution reuse, which accept parameters and improve security.';

-- Q57 Keywords required: physical, sort, pointers, one, logical
EXEC sp_SubmitAnswer @StudentID, @ExamID, @QuestionID = 57, 
    @AnswerText = 'A clustered index defines the physical sort order so there is only one per table, while non-clustered provides logical pointers to data.';

-- Q58 Keywords required: redundancy, dependencies, organize, tables, relations
EXEC sp_SubmitAnswer @StudentID, @ExamID, @QuestionID = 58, 
    @AnswerText = 'It is the process to organize tables and relations to reduce redundancy and manage dependencies.';

-- Q61 Keywords required: aggregate, functions, count, sum, category, summarize
EXEC sp_SubmitAnswer @StudentID, @ExamID, @QuestionID = 61, 
    @AnswerText = 'We use it to summarize a category of data using aggregate functions like sum or count.';

-- Q63 Keywords required: rows, columns, append, stack, distinct
EXEC sp_SubmitAnswer @StudentID, @ExamID, @QuestionID = 63, 
    @AnswerText = 'UNION will stack or append distinct rows, whereas a JOIN combines columns.';

-- Q65 Keywords required: unicode, bytes, characters, multilingual, storage
EXEC sp_SubmitAnswer @StudentID, @ExamID, @QuestionID = 65, 
    @AnswerText = 'NVARCHAR supports unicode characters for multilingual storage, which takes up more bytes than VARCHAR.';

-- Q67 Keywords required: auto-increment, unique, generate, seed, number
EXEC sp_SubmitAnswer @StudentID, @ExamID, @QuestionID = 67, 
    @AnswerText = 'It is an auto-increment feature to generate a unique sequence number based on a seed.';

-- Q68 Keywords required: temporary, result, WITH, recursion, query, readability
EXEC sp_SubmitAnswer @StudentID, @ExamID, @QuestionID = 68, 
    @AnswerText = 'A CTE provides a temporary result set using the WITH clause, improving query readability and supporting recursion.';

-- Q72 Keywords required: null, replace, multiple, arguments, standard, first
EXEC sp_SubmitAnswer @StudentID, @ExamID, @QuestionID = 72, 
    @AnswerText = 'Both replace a null value, but COALESCE is standard and evaluates multiple arguments to return the first non-null.';

GO
PRINT 'Exam 13 Submitted Successfully ';
