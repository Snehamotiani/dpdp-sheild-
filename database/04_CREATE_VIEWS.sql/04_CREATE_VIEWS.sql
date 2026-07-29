-- step4 - creating views 

CREATE VIEW Redacted_Tickets AS
SELECT ticket_id, customer_name, platform, redacted_ticket_text, risk_level 
FROM Support_Transcripts;

CREATE VIEW Critical_Risk_Tickets AS
SELECT ticket_id, customer_name, platform, original_ticket_text, redacted_ticket_text 
FROM Support_Transcripts WHERE risk_level = 'Critical';

CREATE VIEW Audit_History AS
SELECT audit_id, event_type, description, timestamp 
FROM Security_Audit ORDER BY timestamp DESC;

CREATE VIEW Platform_Risk_Report AS
SELECT platform, 
       COUNT(ticket_id) AS total_tickets,
       SUM(CASE WHEN risk_level = 'Critical' THEN 1 ELSE 0 END) AS critical_leaks,
       SUM(CASE WHEN risk_level = 'High' THEN 1 ELSE 0 END) AS high_leaks
FROM Support_Transcripts GROUP BY platform;

CREATE VIEW Customer_Privacy_Dashboard AS
SELECT customer_name, platform, risk_level, status 
FROM Support_Transcripts ORDER BY risk_level DESC;
