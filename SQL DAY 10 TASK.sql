USE hospital;
describe appoinments;
-- 1. Add a column to the doctors table to store each doctor's phone number.
alter TABLE doctors ADD column PHONE_NO varchar(10);
-- 2. Add a column to the patients table to store each patient's city.
alter TABLE patients  ADD column CITY varchar(50);
-- 3. Add a column to the appointments table to store the reason for the visit.
alter TABLE appoinments  ADD column Reason_for_visit  varchar(50) ;
-- 4. Change the phone number column in the doctors table so that it can store up to 15 characters.
alter TABLE doctors modify column  PHONE_NO varchar(15);
-- 5. Change the fee column in the appointments table so that it can store amounts with two digits after the decimal point.
alter TABLE appoinments  rename column fee to store_amt;
-- 6. Change the city column in the patients table so that it can store up to 50 characters.
ALTER TABLE patients MODIFY COLUMN city VARCHAR(50);
-- 7. Rename the specialty column in the doctors table to department.
alter TABLE doctors  rename column speciality to department;
-- 8. Rename the city column in the patients table to hometown.
ALTER TABLE patients rename COLUMN city to Homedown;
-- 9. Remove the reason column from the appointments table.
alter TABLE appoinments  drop column Reason_for_visit ;
-- 10. Rename the appointments table to visits.
alter TABLE appoinments  rename to visits ;
-- 11. Rename the visits table back to appointments.
alter TABLE visits  rename to appoinments ;
-- 12. Add a column to the appointments table to store the appointment status. Then set the status to "Completed" for appointments on or before 5 November 2026, and to "Scheduled" for all the others. Show the table to check the result.