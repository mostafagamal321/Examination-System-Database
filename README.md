🎓 Examination Management System – SQL Server
📌 Overview

This project is a fully designed relational database system that simulates a real-world academic Examination Management System.

It manages the complete academic workflow including:

Organizational structure (Departments, Tracks, Branches, Intakes)

Course and instructor assignment

Exam creation and question bank management

Student participation and scoring

Role-based monitoring and reporting

The system is built using Microsoft SQL Server and follows database normalization and enterprise design best practices.

🏗️ Database Architecture

The database is designed using a normalized relational model (3NF) to ensure:

Data integrity

Elimination of redundancy

Strong referential constraints

Scalable structure

🔹 Core Tables

User

Student

Instructor

TrainingManager

Branch

Department

Track

Course

Class

Intake

Exam

Question

MCQ

TrueFalseQuestion

StudentExam

StudentAnswer

🔹 Junction Tables (Many-to-Many Relationships)

BranchTrack

TrackDepartment

ManagerBranch

ManagerTrack

Inst_course

ExamQuestion

This design ensures flexibility and reflects real academic systems.

👥 Role-Based System Design

The system supports four main roles:

🔵 Admin

Monitors full system activity

Audits exam structure

Monitors instructor workload

Validates data integrity

🟢 Training Manager

Monitors branch and track performance

Analyzes student performance

Tracks enrollment distribution

Reviews academic activity per year

🟡 Instructor

Manages assigned courses

Reviews student performance

Monitors exam results

Manages question bank

🟣 Student

Views profile information

Sees assigned courses

Views exam results

Reviews submitted answers

📊 Reporting & Analytics Layer

A complete reporting layer was implemented using SQL Views to simulate a production-level analytics system.

Example Analytical Views

System overview dashboard

Students per track per branch

Track performance summary

Student ranking by total score

Instructor workload monitoring

Exam structure audit

Student exam result history

This separation between transactional tables and reporting views follows enterprise data architecture principles.
