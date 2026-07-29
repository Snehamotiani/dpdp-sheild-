-- step 2 - creating all the tables using create 

CREATE TABLE Support_Transcripts (
    ticket_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    platform VARCHAR(50),
    original_ticket_text TEXT,
    redacted_ticket_text TEXT,
    risk_level VARCHAR(20) DEFAULT 'Safe',
    status VARCHAR(20) DEFAULT 'Pending'
);

CREATE TABLE Redaction_Log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    ticket_id INT,
    pii_type_found VARCHAR(100),
    action_taken VARCHAR(100),
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ticket_id) REFERENCES Support_Transcripts(ticket_id)
);

CREATE TABLE Security_Audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    event_type VARCHAR(50),
    description TEXT,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Risk_Master (
    risk_id INT AUTO_INCREMENT PRIMARY KEY,
    risk_level VARCHAR(20),
    description TEXT
);

CREATE TABLE Admin (
    admin_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    password_hash VARCHAR(255)
);