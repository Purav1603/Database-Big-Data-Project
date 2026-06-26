**#Individual Project**
**Student Name:**Purav Satish
**Student ID:** GH1050052
**Module Name:**B103A Databases & Big Data
**#University Management System**
A relational database project was developed for the Databases & Big Data Course. This project falls in the category of design and implementation of University Management System using Mysql and executes with complete database life cycle that starts from entity relationship modeling and ends with query implementation. 

**#Project Overview**
The University management system is designed to manage and store data of students, instructors, courses, departments, and grades. The databse supports operation like student enrollment tracking, grade managing, course allocation, and department organization. It demonstates the use of relational database concepts inclusing primary key and foreign keys. 

**#Database Tables:**
- **Students** – Stores student personal details including name, email, 
  date of birth, course, branch, and phone number
- **Departments** – Stores department names and their campus locations
- **Instructors** – Stores instructor information linked to their respective departments
- **Courses** – Records course details including credits, linked department, 
  and assigned instructor
- **Enrollments** – Stores which students are enrolled in which courses and when
- **Grades** – Stores grade results linked to individual enrollment records

**#Relationship Design:**
The database was designed using an ER diagram to map out relationships between 
entities before implementation. Key relationships include:
- A Department can have many Instructors and many Courses
- An Instructor can teach multiple Courses
- A Student can enroll in multiple Courses through the Enrollments table
- Each Enrollment can have one Grade recorded against it

**#Files in this Repository:**
- **"UNIVERSITY_MANAGEMENT_SYSTEM.sql"** – Full database and sample data 
- **"ER Diagram.jpeg"** – Entity-Relationship diagram illustrating table structure 
  and relationships
- **"LICENSE"** – MIT License
- **"ReadMe"** - Contains the Information o0f the Project in Github

**#Query Implementation:**
The project includes a range of SQL queries demonstrating:
- **CRUD Operations** – INSERT, UPDATE, DELETE, and SELECT statements
- **JOIN Queries** – Combining data across multiple tables 
- **Aggregation Queries** – Using COUNT, AVG, GROUP BY, and HAVING 
- **WHERE Queries** – WHERE clauses and conditional filtering

**#Video Demonstration Link:**
