-- Testing

-- 1. Switch context to a student
EXECUTE AS USER = 'ahmed.aly';

-- 2. Try to select from a table (This should work if StudentRole has SELECT)
SELECT * FROM dbo.Student;

--- 3. try to select a view from student view 
Select * from v_stu_StudentAnswerReview;
-- 3. Try to drop a table (This should FAIL with a permission error)
DROP TABLE Student;

-- 4. IMPORTANT: Always go back to your Admin account
REVERT;