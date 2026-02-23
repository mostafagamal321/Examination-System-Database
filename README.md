# Examination System Database

## SQL Server-Based Academic Assessment Management System

---

## Project Overview

The **Examination System Database** is a fully normalized, constraint-driven relational database solution developed using **Microsoft SQL Server (T-SQL)**.

The system manages the complete lifecycle of academic assessments, including:

- Branch and track management  
- Course and class configuration  
- Question bank administration  
- Randomized exam generation  
- Student registration and assignment  
- Automated grading with rule enforcement  
- Performance analytics for administrators and managers  

The project emphasizes:

- Referential integrity  
- Transactional consistency  
- Procedural abstraction using stored procedures  
- Business rule enforcement via triggers and constraints  
- Role-based access views  

This system is suitable for academic institutions, training centers, and structured certification environments.

---

## Core Features

### Academic Structure Management

- Branch, Track, Department hierarchy  
- Intake period management  
- Instructor-course mapping  
- Class scheduling per branch/intake/year  

### Question Bank System

- Centralized `Question` repository  
- Support for:
  - MCQ (via `MCQ`)
  - True/False (via `TrueFalseQuestion`)
  - Text-based questions (with `TextQuestionKeywords`)
- Course-question linking via `CourseQuestion`

### Exam Management

- Manual and random exam creation (`sp_CreateRandomExam`, `sp_GenerateRandomExam`)  
- Exam scheduling with strict time validation  
- Automatic question allocation (`ExamQuestion`)  
- Student-exam assignment (`StudentExam`)  

### Automated Grading & Results

- Per-question marking (`StudentAnswer`)  
- Final result calculation (`sp_FinalExamResult`)  
- Course result storage (`CourseResult`)  
- Performance ranking and analytics views  

### Role-Based System Users

- Students  
- Instructors  
- Training Managers  
- Administrators  

User roles enforced via:

- `User` table  
- `CK_User_Role` constraint  
- Administrative and operational views  

### Business Rule Enforcement

- Time-window validation (`trg_CheckExamTime_Submit`)  
- Grade boundary enforcement (`trg_CheckGradeLimit`)  
- Duplicate prevention constraints  
- Exam overlap prevention (`trg_PreventExamOverlap`)  
- Max course degree enforcement (`trg_EnforceMaxCourseDegree`)  

---

## System Architecture

The system follows a layered relational architecture:

### 1. Data Layer

- 27 normalized tables  
- Primary & Foreign Keys  
- Composite relationships  
- Unique and Check Constraints  

### 2. Logic Layer

- 26 Stored Procedures  
- 8 Triggers  
- Encapsulated CRUD logic  
- Controlled API-style operations  

### 3. Reporting & Monitoring Layer
- 26 views
- Instructor Views  
- Student Views  
- Manager Views  
- Admin Monitoring Views  

---

## Database Schema

### Main Entity Groups

#### Academic Structure
- `Branch`
- `Track`
- `Department`
- `TrackDepartment`
- `Intake`
- `Class`

#### Users & Roles
- `User`
- `Student`
- `Instructor`
- `TrainingManager`
- Phone number tables

#### Courses & Questions
- `Course`
- `Question`
- `MCQ`
- `TrueFalseQuestion`
- `TextQuestionKeywords`
- `CourseQuestion`

#### Exam System
- `Exam`
- `ExamQuestion`
- `StudentExam`
- `StudentAnswer`
- `CourseResult`

---

## Relationship Highlights

- One Branch → Many Tracks  
- One Course → Many Questions  
- One Exam → Many Questions  
- One Student → Many Exams  
- One Question → Type-Specific Tables (MCQ / TF / Text)  

---

## ER Diagram

![2 ERD](https://github.com/user-attachments/assets/e7d4db45-eeea-4120-8b7b-4c75c9d36a49)

---
## Mapping ERD
![3 Mapping_page-0001](https://github.com/user-attachments/assets/52c4e56e-49ee-440c-bbd2-c36edcd37daf)

---

## Installation Instructions

### Requirements

- Microsoft SQL Server 2019+  
- SQL Server Management Studio (SSMS)  
- Windows Environment (recommended)
  
---

### Setup Steps

Clone repository:

```bash
git clone https://github.com/mostafagamal321/Examination-System-Database
```
### Create database:

CREATE DATABASE ExaminationSystem;
GO
USE ExaminationSystem;

Execute scripts in order:

- Tables
- Constraints
- Triggers
- Stored Procedures
- Views
  
---

### Verify installation:

- Usage
Verify Installation
```sql 
SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES;
```

Expected: Returns total number of created tables (30+).

- Register a Student:
```sql
EXEC sp_RegisterStudent
    @Username = 'student1',
    @Password = 'password123',
    @FullName = 'John Doe',
    @Email = 'john@email.com',
    @BranchID = 1,
    @TrackID = 2,
    @IntakeID = 3;
```
Expected: Student record inserted successfully with enforced role constraints.

Create Random Exam:
```sql
EXEC sp_CreateRandomExam
    @CourseID = 1,
    @ClassID = 2,
    @StartTime = '10:00',
    @EndTime = '12:00',
    @ExamType = 'Final',
    @Allowance = '2 Hours',
    @ExamDate = '2026-03-10',
    @NumMCQ = 10,
    @NumTF = 5,
    @NumText = 2;
```
Expected: Exam created with randomized question allocation.

Student Submit Answer:
```sql
EXEC sp_SubmitAnswer
    @StudentID = 5,
    @ExamID = 3,
    @QuestionID = 12,
    @AnswerText = 'True';
```

Expected: Answer stored if submission time is valid.

Calculate Final Result
```sql
EXEC sp_FinalExamResult
    @StudentID = 5,
    @ExamID = 3;
```
Expected: Final grade calculated and stored in CourseResult.
    
### Testing & Deployment:
#### *Testing Strategy*

- Boundary testing for grade limits
- Constraint violation testing
- Duplicate submission prevention
- Exam overlap validation
- Trigger behavior verification

#### Example negative test:
-- Attempt submission outside exam window
```sql
EXEC sp_SubmitAnswer
    @StudentID = 5,
    @ExamID = 3,
    @QuestionID = 1,
    @AnswerText = 'A';
```

Expected: Trigger rejection.

### Deployment
#### For production:
- Backup current database
- Generate full schema script

Deploy via:
- DACPAC
- SQL Migration scripts
- CI/CD pipeline
- Configure roles and permissions
- Dependencies
- Microsoft SQL Server 2019+
- T-SQL
- SQL Server Management Studio (SSMS)
- Git
- Draw.io (for ERD design)


