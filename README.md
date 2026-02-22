🎓 Examination Management System – SQL Server
📌 Overview

This project is a production-style relational database system that simulates a real academic Examination Management System.

It manages the complete academic lifecycle including:

Departments, Tracks, Branches, and Intakes

Course and instructor assignments

Class scheduling and exam creation

Question bank management (MCQ and True/False)

Student exam participation and scoring

Role-based monitoring and reporting

The system is implemented using Microsoft SQL Server and follows relational modeling and database normalization best practices (3NF).

🗺 Entity Relationship Diagram (ERD)

The ERD represents the logical structure of the database including:

Primary and foreign keys

One-to-many relationships

Many-to-many relationships using junction tables

Clear role-based entity separation

The design reflects a normalized schema and structured academic hierarchy.

🔗 Database Relationship Mapping

The relationship mapping diagram highlights how the main academic entities interact throughout the system.

Core workflow:

Track → Course → Class → Exam → StudentExam → StudentAnswer

This structure demonstrates:

Academic structure flow

Exam lifecycle management

Student performance tracking

Instructor and manager assignments

🏗 Database Architecture

The database is designed using a normalized relational model to ensure:

Data integrity

Elimination of redundancy

Strong referential constraints

Scalability and maintainability

Core Tables

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

Junction Tables

BranchTrack
TrackDepartment
ManagerBranch
ManagerTrack
Inst_course
ExamQuestion

This structure supports complex organizational modeling while maintaining clean relational integrity.

👥 Role-Based Design

The system supports four main roles:

Admin

Monitors overall system activity

Reviews exam structure

Tracks instructor workload

Maintains data integrity

Training Manager

Monitors branch and track performance

Reviews student academic results

Tracks enrollment distribution

Analyzes performance trends

Instructor

Manages assigned courses

Reviews student exam results

Manages question bank

Tracks class performance

Student

Views profile information

Accesses exam results

Reviews submitted answers

📊 Reporting Layer

A dedicated reporting layer was implemented using SQL Views to separate transactional logic from analytical queries.

Example analytical views include:

System overview dashboard

Students per track per branch

Track performance summary

Student ranking by total score

Instructor workload analysis

Student exam history

This separation aligns with real-world data architecture patterns where operational data is isolated from analytical consumption.
