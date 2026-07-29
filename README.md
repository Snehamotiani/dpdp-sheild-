🛡️ DPDP Shield

SQL-Based Privacy Protection System for Customer Support Data

📌 Project Overview

DPDP Shield is a MySQL-based project inspired by the Digital Personal Data Protection (DPDP) Act, 2023. The objective of this project is to identify and automatically mask sensitive personal information shared by customers in support tickets before the data is viewed or processed further.

Instead of storing sensitive information in plain text, the system scans each ticket, detects Personally Identifiable Information (PII), redacts sensitive data, classifies the privacy risk, and maintains an audit history of the scanning process.

I built this project as part of my SQL learning journey. Rather than starting directly with advanced SQL concepts, I first learned and implemented the basics using commands such as CREATE DATABASE, CREATE TABLE, INSERT, SELECT, UPDATE, CREATE VIEW, and CALL. After building a strong foundation, I gradually combined these concepts with Stored Procedures and Regular Expressions (REGEXP_REPLACE) to automate the privacy scanning process.

To make this repository beginner-friendly, the SQL files are organized in the same sequence in which I developed the project. Anyone learning SQL can follow the files step by step—from creating the database and tables to inserting data, creating views, building the stored procedure, and finally running the complete privacy scanning workflow.

My goal was not only to build a practical cybersecurity project but also to create a repository that helps beginners understand how basic SQL concepts can be combined to solve a real-world data privacy problem.

---

🎯 Problem Statement

Customer support tickets often contain confidential information such as:

- Email Addresses
- Mobile Numbers
- PAN Numbers
- Aadhaar Numbers
- Passport Numbers
- Driving Licence Numbers
- Bank Account Details
- IFSC Codes
- Debit/Credit Card Numbers
- UPI IDs
- Passwords
- API Keys

If this information is stored without protection, it may lead to privacy breaches, unauthorized access, and data leaks.

DPDP Shield helps reduce this risk by automatically detecting and masking sensitive information before further processing.

---

✨ Features

- Detects multiple types of Personally Identifiable Information (PII)
- Automatically redacts sensitive information using SQL Regular Expressions
- Assigns risk levels (Safe, Medium, High, Critical)
- Maintains complete audit history
- Generates privacy reports using SQL Views
- Uses Stored Procedures to automate the scanning process
- Includes realistic customer support ticket data
- Built by starting with basic SQL concepts and gradually implementing advanced automation

---

🎓 Beginner Friendly

This repository is designed for students who are learning SQL.

The SQL files are organized in the same order in which I built the project, making it easy to understand how a complete SQL project is developed from scratch.

If you're new to SQL, simply follow the files in numerical order:

1. Create the database
2. Create the tables
3. Insert sample data
4. Create SQL Views
5. Create the Stored Procedure
6. Execute the project and view the reports

---

🛠 Technologies Used

- MySQL 8.0
- SQL
- CREATE DATABASE
- CREATE TABLE
- INSERT
- SELECT
- UPDATE
- CREATE VIEW
- Stored Procedures
- Regular Expressions (REGEXP_REPLACE)
- Git
- GitHub

---

📂 Project Structure

DPDP-Shield
│
├── README.md
├── database
│   ├── 01_create_database.sql
│   ├── 02_create_tables.sql
│   ├── 03_insert_sample_data.sql
│   ├── 04_create_views.sql
│   ├── 05_dlp_scan_procedure.sql
│   └── 06_run_project.sql
│
├── screenshots
│
├── docs
│
└── assets

---

🔒 PII Detected

The scanner currently detects:

- Email Address
- Mobile Number
- PAN Card
- Aadhaar Number
- Passport Number
- Driving Licence Number
- Bank Account Number
- IFSC Code
- Debit/Credit Card Number
- UPI ID
- Password
- API Keys

---

📊 Risk Levels

Risk Level| Description
Safe| No sensitive information found
Medium| Email Address or Mobile Number detected
High| PAN, Passport, Driving Licence or Bank Account detected
Critical| Aadhaar, Card Details, Passwords, API Keys or UPI IDs detected

---

🚀 How to Run

1. Open MySQL Workbench.
2. Run the SQL files in the following order:

- "01_create_database.sql"
- "02_create_tables.sql"
- "03_insert_sample_data.sql"
- "04_create_views.sql"
- "05_dlp_scan_procedure.sql"
- "06_run_project.sql"

3. Execute the stored procedure:

CALL Run_DLP_Scan();

4. View the generated reports using:

SELECT * FROM Support_Transcripts;
SELECT * FROM Redacted_Tickets;
SELECT * FROM Critical_Risk_Tickets;
SELECT * FROM Platform_Risk_Report;
SELECT * FROM Customer_Privacy_Dashboard;
SELECT * FROM Audit_History;

---


📚 Learning Outcomes

While building this project, I learned:

- Database Design
- SQL Queries
- SQL Views
- Stored Procedures
- Regular Expressions
- Data Privacy Concepts
- Risk Classification
- SQL Project Organization
- How to build a complete SQL project step by step using basic concepts before moving to advanced automation

---

🔮 Future Improvements

- Machine Learning-based PII Detection
- OCR Support for Uploaded Documents
- Real-time Scanning API
- Admin Login System
- Web Dashboard
- Email Alert System

---

👩‍💻 Author

Sneha Motiani

B.Tech Cyber Security Student

Learning cybersecurity by building practical projects and sharing my learning journey through real-world projects.

---

⭐ If you're learning SQL, I hope this project helps you understand how basic SQL concepts can be combined to build a practical cybersecurity solution. Feel free to explore the files in order and learn step by step.