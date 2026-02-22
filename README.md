Examination Management System – SQL Server
Project Summary

This project is a production-style relational database system that models a real academic Examination Management platform.

It was designed to demonstrate strong skills in:

Relational data modeling

Database normalization (3NF)

Complex relationship mapping

Analytical query design

Role-based data architecture

Reporting layer implementation

The system simulates how an academic institution manages structure, exams, instructors, and student performance at scale.

Business Problem Simulated

Academic institutions need a structured system to:

Manage departments, tracks, branches, and intakes

Assign instructors to courses

Organize classes and exams

Store and evaluate student answers

Monitor academic performance across branches and tracks

Provide role-based access to stakeholders

This database models that full lifecycle using a clean and scalable relational architecture.

Key Technical Highlights

Fully normalized schema (3NF)

Strong referential integrity using primary and foreign keys

Many-to-many relationships handled via junction tables

Clear separation between transactional and reporting layers

Aggregation and performance analytics using SQL Views

Scalable structure ready for BI integration

Entity Relationship Diagram (ERD)

The ERD demonstrates:

Structured academic hierarchy

Role-based entity separation

Junction table implementation

Exam and scoring workflow

Relationship Mapping

Core academic workflow modeled in the system:

Track → Course → Class → Exam → StudentExam → StudentAnswer

This reflects:

End-to-end exam lifecycle

Instructor-course assignments

Student performance tracking

Branch and intake segmentation

Architecture Overview
Core Entities

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

This design supports complex organizational structures while maintaining clean relational integrity.

Reporting & Analytics Layer

A dedicated reporting layer was built using SQL Views to simulate enterprise reporting practices.

Examples include:

System overview dashboard

Instructor workload analysis

Students per track per branch

Track performance summary

Student ranking by total score

Exam structure auditing

This separation aligns with real-world data architecture patterns where operational data is isolated from analytical consumption.
