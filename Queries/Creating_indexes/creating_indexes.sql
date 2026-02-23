USE ExamsSystem;
GO
-- 1. Composite Key "Trailers" (Crucial for reverse lookups)
CREATE NONCLUSTERED INDEX I_CourseHaveQs_CourseID ON CourseQuestion(CourseID);
CREATE NONCLUSTERED INDEX I_Dept_of_track_Track_ID ON TrackDepartment(Track_ID);
CREATE NONCLUSTERED INDEX I_ExamConsistofQs_QID ON ExamQuestion(QuestionID);
CREATE NONCLUSTERED INDEX I_Inst_course_Course_ID ON Inst_course(Course_ID);
CREATE NONCLUSTERED INDEX I_Man_edit_add_Branch_BranchID ON ManagerBranch(BranchID);
CREATE NONCLUSTERED INDEX I_Man_edit_add_Track_TrackID ON ManagerTrack(TrackID);
CREATE NONCLUSTERED INDEX I_Stud_take_Exam_ExamID ON StudentExam(ExamID);

-- 2. Transaction Tables (High Impact)
CREATE NONCLUSTERED INDEX I_StudentAnswer_ExamID ON StudentAnswer(ExamID);
CREATE NONCLUSTERED INDEX I_StudentAnswer_QID ON StudentAnswer(QID);
CREATE NONCLUSTERED INDEX I_StudentAnswer_STID ON StudentAnswer(STID);

CREATE NONCLUSTERED INDEX I_CourseResult_CourseID ON CourseResult(CourseID);
CREATE NONCLUSTERED INDEX I_CourseResult_Stud_ID ON CourseResult(StudentID);

-- 3. Entity Relationships
CREATE NONCLUSTERED INDEX I_Class_BranchID ON Class(BranchID);
CREATE NONCLUSTERED INDEX I_Class_CourseID ON Class(CourseID);
CREATE NONCLUSTERED INDEX I_Class_Inst_ID ON Class(Inst_ID);
CREATE NONCLUSTERED INDEX I_Class_IntakeID ON Class(IntakeID);

CREATE NONCLUSTERED INDEX I_Student_BranchID ON Student(BranchID);
CREATE NONCLUSTERED INDEX I_Student_UserID ON Student(UserID);

CREATE NONCLUSTERED INDEX I_Instructor_UserID ON Instructor(UserID);
CREATE NONCLUSTERED INDEX I_TrainingManager_UserID ON TrainingManager(UserID);

CREATE NONCLUSTERED INDEX I_Intake_ExamID ON Intake(ExamID);

-- 4. Question Subtypes
CREATE NONCLUSTERED INDEX I_MCQ_QID ON MCQ(QID);
CREATE NONCLUSTERED INDEX I_TF_QID ON TrueFalseQuestion(QID);
GO