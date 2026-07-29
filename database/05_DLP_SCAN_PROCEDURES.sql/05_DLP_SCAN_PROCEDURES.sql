-- Step 5 here creating redaction (masking ) system where ill use update 

DELIMITER //

CREATE PROCEDURE Run_DLP_Scan()
BEGIN
    INSERT INTO Security_Audit (event_type, description) 
    VALUES ('DLP_SCAN_START', 'DLP Engine Scan Initiated.');

    UPDATE Support_Transcripts 
    SET redacted_ticket_text = original_ticket_text 
    WHERE status = 'Pending';

-- mask mobile numbers 
    UPDATE Support_Transcripts 
    SET redacted_ticket_text = REGEXP_REPLACE(redacted_ticket_text, '[0-9]{10}', '[REDACTED MOBILE]'),
        risk_level = CASE WHEN risk_level IN ('Safe') THEN 'Medium' ELSE risk_level END
    WHERE redacted_ticket_text REGEXP '[0-9]{10}' AND status = 'Pending';

-- mask email ids  
    UPDATE Support_Transcripts 
    SET redacted_ticket_text = REGEXP_REPLACE(redacted_ticket_text, '[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}', '[REDACTED EMAIL]'),
        risk_level = CASE WHEN risk_level IN ('Safe') THEN 'Medium' ELSE risk_level END
    WHERE redacted_ticket_text REGEXP '[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}' AND status = 'Pending';

-- mask pancard numbers 
    UPDATE Support_Transcripts 
    SET redacted_ticket_text = REGEXP_REPLACE(redacted_ticket_text, '[A-Z]{5}[0-9]{4}[A-Z]{1}', '[REDACTED PAN]'),
        risk_level = CASE WHEN risk_level IN ('Safe', 'Medium') THEN 'High' ELSE risk_level END
    WHERE redacted_ticket_text REGEXP '[A-Z]{5}[0-9]{4}[A-Z]{1}' AND status = 'Pending';

-- mask passport 
    UPDATE Support_Transcripts 
    SET redacted_ticket_text = REGEXP_REPLACE(redacted_ticket_text, '[A-Z]{1}[0-9]{7}', '[REDACTED PASSPORT]'),
        risk_level = CASE WHEN risk_level IN ('Safe', 'Medium') THEN 'High' ELSE risk_level END
    WHERE redacted_ticket_text REGEXP '[A-Z]{1}[0-9]{7}' AND status = 'Pending';

-- mask drivingliscene number 
    UPDATE Support_Transcripts 
    SET redacted_ticket_text = REGEXP_REPLACE(redacted_ticket_text, '[A-Z]{2}[0-9]{13}', '[REDACTED DL]'),
        risk_level = CASE WHEN risk_level IN ('Safe', 'Medium') THEN 'High' ELSE risk_level END
    WHERE redacted_ticket_text REGEXP '[A-Z]{2}[0-9]{13}' AND status = 'Pending';


-- mask bank account number 
    UPDATE Support_Transcripts 
    SET redacted_ticket_text = REGEXP_REPLACE(redacted_ticket_text, '[0-9]{9,18}', '[REDACTED BANK A/C]'),
        risk_level = CASE WHEN risk_level IN ('Safe', 'Medium') THEN 'High' ELSE risk_level END
    WHERE redacted_ticket_text REGEXP '[0-9]{9,18}' AND status = 'Pending';


-- mask ifsc 
    UPDATE Support_Transcripts 
    SET redacted_ticket_text = REGEXP_REPLACE(redacted_ticket_text, '[A-Z]{4}0[A-Z0-9]{6}', '[REDACTED IFSC]'),
        risk_level = CASE WHEN risk_level IN ('Safe', 'Medium') THEN 'High' ELSE risk_level END
    WHERE redacted_ticket_text REGEXP '[A-Z]{4}0[A-Z0-9]{6}' AND status = 'Pending';


-- mask aadhar card number 
    UPDATE Support_Transcripts 
    SET redacted_ticket_text = REGEXP_REPLACE(redacted_ticket_text, '[0-9]{4}-[0-9]{4}-[0-9]{4}', '[REDACTED AADHAAR]'),
        risk_level = 'Critical'
    WHERE redacted_ticket_text REGEXP '[0-9]{4}-[0-9]{4}-[0-9]{4}' AND status = 'Pending';


-- mask credit card 
    UPDATE Support_Transcripts 
    SET redacted_ticket_text = REGEXP_REPLACE(redacted_ticket_text, '[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}', '[REDACTED CARD]'),
        risk_level = 'Critical'
    WHERE redacted_ticket_text REGEXP '[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}' AND status = 'Pending';


-- mask upi 
    UPDATE Support_Transcripts 
    SET redacted_ticket_text = REGEXP_REPLACE(redacted_ticket_text, '[a-zA-Z0-9._-]+@[a-zA-Z]{3,}', '[REDACTED UPI]'),
        risk_level = 'Critical'
    WHERE redacted_ticket_text REGEXP '[a-zA-Z0-9._-]+@[a-zA-Z]{3,}' AND status = 'Pending' 
    AND redacted_ticket_text NOT REGEXP '[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}'; 

-- mask passwords 
    UPDATE Support_Transcripts 
    SET redacted_ticket_text = REGEXP_REPLACE(redacted_ticket_text, '(?i)(password is |password: |db_password: )["\']?[^\s"\'.,]+["\']?', 'password: [REDACTED PASSWORD]'),
        risk_level = 'Critical'
    WHERE redacted_ticket_text REGEXP '(?i)(password)' AND status = 'Pending';


-- mask api key 
    UPDATE Support_Transcripts 
    SET redacted_ticket_text = REGEXP_REPLACE(redacted_ticket_text, '(AKIA[0-9A-Z]{16}|sk_live_[a-zA-Z0-9]+)', '[REDACTED API KEY]'),
        risk_level = 'Critical'
    WHERE redacted_ticket_text REGEXP '(AKIA[0-9A-Z]{16}|sk_live_[a-zA-Z0-9]+)' AND status = 'Pending';


    UPDATE Support_Transcripts SET status = 'Scanned' WHERE status = 'Pending';

    INSERT INTO Security_Audit (event_type, description) 
    VALUES ('DLP_SCAN_COMPLETE', 'All pending tickets successfully scanned and redacted.');
END //

DELIMITER ;
-- Step 6 - executing the scanning procedure 


SET SQL_SAFE_UPDATES = 0;

CALL Run_DLP_Scan();

SET SQL_SAFE_UPDATES = 1;