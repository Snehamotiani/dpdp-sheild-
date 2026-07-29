--  step 7 output section using select 

-- 1. Original + Redacted Tickets
SELECT
ticket_id,
customer_name,
platform,
risk_level,
status,
original_ticket_text,
redacted_ticket_text
FROM Support_Transcripts
ORDER BY ticket_id;

-- 2. Risk Summary
SELECT
risk_level,
COUNT(*) AS Total_Tickets
FROM Support_Transcripts
GROUP BY risk_level;

-- 3. Critical Tickets
SELECT *
FROM Critical_Risk_Tickets;

-- 4. Platform Report
SELECT *
FROM Platform_Risk_Report;

-- 5. Customer Dashboard
SELECT *
FROM Customer_Privacy_Dashboard;

-- 6. Audit History
SELECT *
FROM Audit_History;

-- 7. Risk Master
SELECT *
FROM Risk_Master;

-- 8. Total Records
SELECT
COUNT(*) AS Total_Tickets
FROM Support_Transcripts;

-- 9. Database Version
SELECT VERSION();
INSERT INTO Redaction_Log(ticket_id,pii_type_found,action_taken)
SELECT
ticket_id,
risk_level,
'PII Redacted Successfully'
FROM Support_Transcripts
WHERE status='Scanned';