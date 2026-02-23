-- Creating roles and adding members to it

CREATE ROLE AdminRole;
CREATE ROLE ManagerRole;
CREATE ROLE InstructorRole;
CREATE ROLE StudentRole;


-- GRANT / DENY permissions per Role
-- Give admin everythin
GRANT CONTROL ON DATABASE::ExamsSystem TO AdminRole;

-- Grant  select For admin Views 
GRANT SELECT ON dbo.v_adm_AllInstructor TO AdminRole;
GRANT SELECT ON dbo.v_adm_AllManager TO AdminRole;
GRANT SELECT ON dbo.v_adm_AllStudent TO AdminRole;
GRANT SELECT ON dbo.v_adm_AllUsers TO AdminRole;
GRANT SELECT ON dbo.v_adm_DatabaseUsageStatistics TO AdminRole;
GRANT SELECT ON dbo.v_adm_SystemActivitySummary TO AdminRole;


-- ManagerRole : training manager can add/edit students , branches , tracks and view reports

-- deny access of all schema first .
DENY SELECT, INSERT, UPDATE, DELETE ON SCHEMA::dbo TO ManagerRole;

---- grant update on his tables 
GRANT SELECT , INSERT , UPDATE ON student To ManagerRole;

GRANT SELECT , INSERT , UPDATE ON Branch To ManagerRole;

GRANT SELECT , INSERT , UPDATE ON Track To ManagerRole;

-- Grant Views Permission To Manager Role

GRANT SELECT ON dbo.v_man_Branches TO ManagerRole;
GRANT SELECT ON dbo.v_man_Intakes TO ManagerRole;
GRANT SELECT ON dbo.v_man_IntakeDistribution TO ManagerRole;
GRANT SELECT ON dbo.v_man_StudentPerformanceRanking TO ManagerRole;
GRANT SELECT ON dbo.v_man_StudentsPerTrackBranch TO ManagerRole;
GRANT SELECT ON dbo.v_man_TrackPerformanceSummary TO ManagerRole;
GRANT SELECT ON dbo.v_man_TracksPerDepartment TO ManagerRole;
GRANT SELECT ON dbo.vw_CourseClasses To ManagerRole;

-- Grant Execute Permissions To manager Role -------

GRANT EXECUTE ON sp_ADDCourseToTrack To ManagerRole;

GRANT EXECUTE ON sp_AddIntake To ManagerRole;

GRANT EXECUTE ON sp_AssignStudentsToExam To ManagerRole;

GRANT EXECUTE ON sp_CreateRandomExam To ManagerRole;

GRANT EXECUTE ON sp_DeleteBranch_Hard To ManagerRole;

GRANT EXECUTE ON sp_DeleteClass_Hard To ManagerRole;

GRANT EXECUTE ON sp_DeleteExam To ManagerRole;

GRANT EXECUTE ON sp_DeleteIntake_Hard To ManagerRole;

GRANT EXECUTE ON sp_DeleteStudent_Hard To ManagerRole;

GRANT EXECUTE ON sp_DeleteTrack_Hard To ManagerRole;

GRANT EXECUTE ON sp_EditBranch To ManagerRole;

GRANT EXECUTE ON sp_EditIntake To ManagerRole;

GRANT EXECUTE ON sp_EditTrack To ManagerRole;

GRANT EXECUTE ON sp_FinalExamResult To ManagerRole;

GRANT EXECUTE ON sp_GenerateRandomExam To ManagerRole;

GRANT EXECUTE ON sp_GetStudentResult To ManagerRole;

GRANT EXECUTE ON sp_ins_viewExam To ManagerRole;


GRANT EXECUTE ON sp_ManageCourse To ManagerRole;

GRANT EXECUTE ON sp_RegisterStudent To ManagerRole;

GRANT EXECUTE ON sp_RemoveStudentFromExam To ManagerRole;

GRANT EXECUTE ON sp_SaveInstructor To ManagerRole;

--------------------------------------------------------------------------------
------------------ INSTRUCTOR PERMISSONS ---------------------------------------

-- DENY EVERYTHING first
DENY SELECT, INSERT, UPDATE, DELETE ON SCHEMA::dbo TO InstructorRole;

------------- GRANT instructor Views Permissions --------------------

GRANT SELECT ON dbo.v_Ins_InstructorCourses To InstructorRole;
GRANT SELECT ON dbo.v_Ins_InstructorExamlist To InstructorRole;
GRANT SELECT ON dbo.v_Ins_CourseDetails To InstructorRole;
GRANT SELECT ON dbo.v_Ins_ExamDetails To InstructorRole;
GRANT SELECT ON dbo.v_Ins_QuestionBankByInstructor To InstructorRole;
GRANT SELECT ON dbo.v_stu_StudentExamResults To InstructorRole;
GRANT SELECT ON dbo.View_ExamQuestions To InstructorRole;
GRANT SELECT ON dbo.View_QuestionsWithModelAnswers To InstructorRole;
GRANT SELECT ON dbo.View_StudentGrades To InstructorRole;
GRANT SELECT ON dbo.vw_CourseClasses To InstructorRole;


------------- GRANT instructor Stored Poredurce Permissions --------------------

GRANT EXECUTE ON sp_AddQuestion To InstructorRole;
GRANT EXECUTE ON sp_AssignStudentsToExam To InstructorRole;
GRANT EXECUTE ON sp_CreateRandomExam To InstructorRole;
GRANT EXECUTE ON sp_DeleteExam To InstructorRole;
GRANT EXECUTE ON sp_EditQuestion To InstructorRole;
GRANT EXECUTE ON sp_FinalExamResult To InstructorRole;
GRANT EXECUTE ON sp_GenerateRandomExam To InstructorRole;
GRANT EXECUTE ON sp_GetStudentResult To InstructorRole;
GRANT EXECUTE ON sp_ins_viewExam To InstructorRole;
GRANT EXECUTE ON sp_RemoveQuestion To InstructorRole;
GRANT EXECUTE ON sp_RemoveStudentFromExam To InstructorRole;




--------------------------------------------------------------------------------
------------------ Student PERMISSONS ---------------------------------------

DENY SELECT, INSERT, UPDATE, DELETE ON SCHEMA::dbo TO StudentRole;

------------- GRANT Student Views Permissions --------------------
GRANT SELECT ON dbo.v_stu_StudentAnswerReview TO StudentRole;
GRANT SELECT ON dbo.v_stu_AvailableExams TO StudentRole;
GRANT SELECT ON dbo.v_Stu_StudentExamResults TO StudentRole;


------------- GRANT Student Stored Poredurce Permissions --------------------

GRANT EXECUTE ON sp_std_viewExam TO StudentRole;
GRANT EXECUTE ON sp_SubmitAnswer TO StudentRole;






