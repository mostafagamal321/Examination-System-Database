Examination Management System – SQL Server
Overview

This project is a relational database system that simulates a real academic Examination Management System.

It manages the academic structure and exam workflow including:

Departments, Tracks, Branches, and Intakes

Course and instructor assignments

Class and exam creation

Question bank management (MCQ and True/False)

Student exam participation and scoring

Role-based monitoring and reporting

The system is implemented using Microsoft SQL Server and follows normalization and relational database best practices.

Entity Relationship Diagram (ERD)

The ERD represents the logical structure of the database including:

Primary and foreign keys

One-to-many relationships

Many-to-many relationships using junction tables

Role-based entities

The diagram reflects a normalized design (3NF) and clearly shows the academic hierarchy and exam workflow.


![2 ERD](https://github.com/user-attachments/assets/7cc2f53f-86f8-40f0-bf0d-a39af79b06ca)


Database Relationship Mapping

The relationship mapping diagram focuses on how the main academic entities connect across the system.

Example workflow:

Track → Course → Class → Exam → StudentExam → StudentAnswer

This mapping shows:

Academic structure flow

Exam lifecycle

Student performance tracking

Instructor and manager assignments


![3 Mapping_page-0001](https://github.com/user-attachments/assets/3b7e8b26-bba2-415a-aa25-0db2f06cd733)

Database Architecture

The database is designed using a normalized relational model to ensure:

Data integrity

Elimination of redundancy

Strong referential constraints

Scalability

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

Role-Based Design

The system supports four roles:

Admin

Monitors full system activity

Reviews exam structure

Monitors instructor workload

Training Manager

Monitors branch and track performance

Reviews student performance

Tracks enrollment distribution

Instructor

Manages assigned courses

Reviews student exam results

Manages question bank

Student

Views profile information

Sees exam results

Reviews submitted answers

Reporting Layer

A reporting layer was implemented using SQL Views to separate transactional logic from analytical queries.

Example views include:

System overview

Students per track per branch

Track performance summary

Student ranking by total score

Instructor workload

Student exam results

This approach follows real-world database design practices.

Row-Level Security implementation

Data warehouse layer for historical analysis
