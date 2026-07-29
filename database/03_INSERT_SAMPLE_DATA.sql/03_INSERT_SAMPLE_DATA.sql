-- step 3 inserting the sample data of customers using insert sql command 

INSERT INTO Risk_Master (risk_level, description) VALUES 
('Safe', 'No PII detected.'),
('Medium', 'Low-risk PII detected (e.g., Email, Mobile).'),
('High', 'High-risk PII detected (e.g., PAN, Bank Account, Passport).'),
('Critical', 'Severe PII leakage (e.g., Passwords, API Keys, Aadhaar, Credit Card).');

INSERT INTO Support_Transcripts (customer_name, platform, original_ticket_text) VALUES 
('Amit Sharma', 'Email', 'My app keeps crashing after the new update. Please help.'),
('Priya Singh', 'Chat', 'How do I change my subscription plan?'),
('Rahul Dev', 'Portal', 'The screen goes black when I click on settings.'),
('Sneha Patel', 'Social Media', 'Love the new features in the latest patch!'),
('Vikram Joshi', 'Email', 'Can you send me the user manual for the dashboard?'),
('Neha Gupta', 'Chat', 'Please contact me at neha.g@gmail.com for updates.'),
('Rohan Das', 'Portal', 'My alternative number is 9876543210. Call me.'),
('Karan Verma', 'Email', 'I forgot my username, email is karan99@yahoo.in.'),
('Pooja Nair', 'Chat', 'Update my phone number to 8765432109.'),
('Aditya Rao', 'Email', 'Send the invoice to aditya.rao@company.com.'),
('Suresh Kumar', 'Portal', 'My KYC failed. My PAN is ABCDE1234F. Check it.'),
('Meera Reddy', 'Email', 'Booking failed. My passport number is Z1234567. Please refund.'),
('Arjun Das', 'Chat', 'I need to update my Driving Licence. DL number is MH1220110001234.'),
('Sunita Sharma', 'Email', 'Refund the money to my Bank Account 123456789012. IFSC is SBIN0001234.'),
('Kabir Khan', 'Portal', 'Here is my PAN details: BQZPK9876A for the vendor registration.'),
('Anjali Tiwari', 'Chat', 'Can you wire transfer to HDFC? A/C 987654321000, IFSC HDFC0004321.'),
('Deepak Jain', 'Email', 'My passport is P9876543. Why is my travel profile blocked?'),
('Riya Sen', 'Portal', 'Uploaded my DL RJ1420210098765 for driver verification.'),
('Vikas Dubey', 'Chat', 'My Aadhaar 1234-5678-9012 is not linking to the account.'),
('Tanya Arora', 'Email', 'Charged twice on my Card 4123-4567-8901-2345. Fix this ASAP!'),
('Manish Goyal', 'Portal', 'Payment stuck. My UPI is manish99@ybl.'),
('Kriti Sanon', 'Chat', 'I cannot login. My password is "SuperSecret@123".'),
('Dev Patel', 'API', 'My production API key AKIAIOSFODNN7EXAMPLE is returning a 403 error.'),
('Nisha Singh', 'Email', 'My Aadhaar is 9876-5432-1098. Please verify my profile.'),
('Sameer Jain', 'Portal', 'Deduction on my debit card 5123-4567-8901-2345. Cancel it.'),
('Gaurav Khurana', 'Chat', 'I am sharing my UPI gaurav.k@okicici to receive the cashback.'),
('Anita Desai', 'Email', 'Help! Accidentally pasted my db_password: "Admin@Password2024".'),
('Tarun Bajaj', 'API', 'Why is api_key=sk_live_1234567890abcdef not working today?'),
('Sanya Malhotra', 'Portal', 'KYC rejection issue. Aadhaar 1111-2222-3333 and PAN ABCD1111E provided.'),
('Rohit Sharma', 'Chat', 'My payment from Card 4444-5555-6666-7777 failed, but money was deducted.');