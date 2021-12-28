INSERT INTO doctor(
    fname,
    lname,
    specialization,
    gender,
    email)
VALUES ('Harish', 'Raj', 'Dentist', 'Male', 'harish@hospital.com');

INSERT INTO doctor(
    fname,
    lname,
    specialization,
    gender,
    email)
VALUES ('Suresh', 'Ram', 'Oncology', 'Male', 'suresh@hospital.com');

INSERT INTO doctor(
    fname,
    lname,
    specialization,
    gender,
    email)
VALUES ('Latha', 'Bharadwaj', 'Dentist', 'Female', 'latha@hospital.com');

INSERT INTO doctor(
    fname,
    lname,
    specialization,
    gender,
    email)
VALUES ('Nikhil', 'Bharadwaj', 'Cardiology', 'Male', 'nikhil@hospital.com');

INSERT INTO doctor(
    fname,
    lname,
    specialization,
    gender,
    email)
VALUES ('Suhas', 'Kulkarni', 'Cardiology', 'Male', 'suhas@hospital.com');

INSERT INTO patient 
(
    
    docid,
    disease,
    fname,
    lname,
    DOB,
    email)
VALUES (1, 'Tooth Ache', 'Varun', 'Chakravarthy', DATE '1988-01-09','varun@hospital.com');

-- INSERT INTO patient 
-- (
--     docid,
--     disease,
--     fname,
--     mname,
--     lname,
--     DOB,
--     email)
-- VALUES (2, 'Cancer', 'Surya', 'Kumar', 'Chakravarthy', DATE '1980-03-09','suyakumar@hospital.com');

-- INSERT INTO patient 
-- (
--     docid,
--     disease,
--     fname,
--     mname,
--     lname,
--     DOB,
--     email)
-- VALUES (3, 'Tooth Ache', 'Ishan', 'Kumar', 'Bharathwaj', DATE '2000-03-09','ishankumar@hospital.com');

-- INSERT INTO patient 
-- (
--     docid,
--     disease,
--     fname,
--     lname,
--     DOB,
--     email)
-- VALUES (4, 'Heart pain', 'Ravi', 'Bharathwaj', DATE '1999-07-09','ravi@hospital.com');

-- INSERT INTO patient 
-- (
--     docid,
--     disease,
--     fname,
--     lname,
--     DOB,
--     email)
-- VALUES (5, 'Cardio Arrest', 'Ravi', 'Shastri', DATE '1987-08-03','ravshastri@hospital.com');

INSERT INTO room
(
    roomno,
    availability,
    cost,
    roomtype)
VALUES (10, TRUE, 10000, 'low-room');

INSERT INTO room
(
    roomno,
    availability,
    cost,
    roomtype)
VALUES (11, TRUE, 10000, 'low-room');

INSERT INTO room
(
    roomno,
    availability,
    cost,
    roomtype)
VALUES (12, TRUE, 10000, 'low-room');

INSERT INTO room
(
    roomno,
    availability,
    cost,
    roomtype)
VALUES (13, TRUE, 25000, 'medium-room');

INSERT INTO room
(
    roomno,
    availability,
    cost,
    roomtype)
VALUES (21, TRUE, 25000, 'medium-room');

INSERT INTO room
(
    roomno,
    availability,
    cost,
    roomtype)
VALUES (22, TRUE, 25000, 'medium-room');

INSERT INTO room
(
    roomno,
    availability,
    cost,
    roomtype)
VALUES (23, TRUE, 50000, 'luxury-room');

INSERT INTO room
(
    roomno,
    availability,
    cost,
    roomtype)
VALUES (24, TRUE, 50000, 'luxury-room');

INSERT INTO room
(
    roomno,
    availability,
    cost,
    roomtype)
VALUES (25, TRUE, 50000, 'luxury-room');

INSERT INTO room
(
    roomno,
    availability,
    cost,
    roomtype)
VALUES (31, TRUE, 50000, 'luxury-room');

INSERT INTO room
(
    roomno,
    availability,
    cost,
    roomtype)
VALUES (32, TRUE, 25000, 'medium-room');

INSERT INTO medicine
(

    availableamt,
    name,
    cost,
    mfddate,
    expperiod)
VALUES (10, 'Koforest', 150, DATE '2020-01-09', 24);

INSERT INTO medicine
(

    availableamt,
    name,
    cost,
    mfddate,
    expperiod)
VALUES (10, 'L Montus Kid', 200, DATE '2021-01-09', 12);

INSERT INTO medicine
(

    availableamt,
    name,
    cost,
    mfddate,
    expperiod)
VALUES (500, 'Crocin', 1, DATE '2021-01-09', 12);

INSERT INTO medicine
(

    availableamt,
    name,
    cost,
    mfddate,
    expperiod)
VALUES (500, 'Saridon', 1, DATE '2021-01-09', 12);

INSERT INTO medicine
(

    availableamt,
    name,
    cost,
    mfddate,
    expperiod)
VALUES (1000, 'Dolo 650', 1, DATE '2021-01-09', 12);

INSERT INTO test
(
    
    cost,
    testtype,
    testname)
VALUES (10000, 'Diabetes', 'Diabetes Test');

INSERT INTO test
(
    
    cost,
    testtype,
    testname)
VALUES (10000, 'General', 'Vital Full Body Check');


INSERT INTO test
(
    
    cost,
    testtype,
    testname)
VALUES (1600, 'General', 'AAROGYAM 1.1');

INSERT INTO test
(
    
    cost,
    testtype,
    testname)
VALUES (1775, 'General', 'AAROGYAM 1.2');

INSERT INTO test
(
    
    cost,
    testtype,
    testname)
VALUES (2738, 'General', 'AAROGYAM 1.3');


INSERT INTO nurse
(
    
    fname,
    lname,
    qualification,
    email)
VALUES ('Jaya', 'Lakshmi', 'Auxiliary Nurse & Midwife', 'jaya@hospital.com');

INSERT INTO nurse
(
    
    fname,
    lname,
    qualification,
    email)
VALUES ('Sneha', 'Kumari', 'B. Sc (Basic)', 'sneha@hospital.com');

INSERT INTO nurse
(
    
    fname,
    lname,
    qualification,
    email)
VALUES ('Hamsa', 'Geetha', 'B.Sc (Post Basic)', 'hamsa@hospital.com');

INSERT INTO nurse
(
    
    fname,
    lname,
    qualification,
    email)
VALUES ('Shreya', 'Bargav', 'General Nursing & Midwifery', 'shreya@hospital.com');

INSERT INTO nurse
(
    
    fname,
    lname,
    qualification,
    email)
VALUES ('neha', 'Bargav', 'General Nursing & Midwifery', 'neha@hospital.com');


INSERT INTO bill
(
   
    patid,
    
    medicinecost,
    roomcost,
    testcost)
VALUES (1, 0, 20000, 0);

INSERT INTO bill
(
   
    patid,
    
    medicinecost,
    roomcost,
    testcost)
VALUES (2, 10000, 50000, 10000);

INSERT INTO bill
(
   
    patid,
    
    medicinecost,
    roomcost,
    testcost)
VALUES (3, 0, 10000, 0);

INSERT INTO bill
(
   
    patid,
    
    medicinecost,
    roomcost,
    testcost)
VALUES (4, 15000, 60000, 10000);

INSERT INTO bill
(
   
    patid,
    
    medicinecost,
    roomcost,
    testcost)
VALUES (5, 20000, 70000, 15000);


INSERT INTO inpatient
(
    inpatid,
    roomid,
    admdate,
    disdate)
VALUES (1, 10, DATE '2021-11-07', DATE '2021-11-08');


INSERT INTO inpatient
(
    inpatid,
    roomid,
    admdate,
    disdate)
VALUES (2, 11, DATE '2021-11-06', DATE '2021-11-08');

INSERT INTO inpatient
(
    inpatid,
    roomid,
    admdate,
    disdate)
VALUES (3, 12, DATE '2021-11-07', DATE '2021-11-08');

INSERT INTO inpatient
(
    inpatid,
    roomid,
    admdate,
    disdate)
VALUES (4, 13, DATE '2021-11-05', DATE '2021-11-08');

INSERT INTO inpatient
(
    inpatid,
    roomid,
    admdate,
    disdate)
VALUES (5, 21, DATE '2021-11-03', DATE '2021-11-07');


-- INSERT INTO appointment
-- (
    
--     patid,
--     docname,
--     appointmenttime,
--     appointmentdate,
--     appointmenttype)
-- VALUES (1, 'Harish Raj' , '09:00:00', DATE '2021-11-07', 'Online');

-- INSERT INTO appointment
-- (
    
--     patid,
--     docname,
--     appointmenttime,
--     appointmentdate,
--     appointmenttype)
-- VALUES (2, 'Suresh Ram' , '10:00:00', DATE '2021-11-06', 'Online');

-- INSERT INTO appointment
-- (
    
--     patid,
--     docname,
--     appointmenttime,
--     appointmentdate,
--     appointmenttype)
-- VALUES (3, 'Latha Bharadwaj' , '10:00:00', DATE '2021-11-07', 'Offline');

-- INSERT INTO appointment
-- (
    
--     patid,
--     docname,
--     appointmenttime,
--     appointmentdate,
--     appointmenttype)
-- VALUES (4, 'Nikhil Bharadwaj' , '10:00:00', DATE '2021-11-05', 'Online');

-- INSERT INTO appointment
-- (
    
--     patid,
--     docname,
--     appointmenttime,
--     appointmentdate,
--     appointmenttype)
-- VALUES (5, 'Suhas Kulkarni' , '11:00:00', DATE '2021-11-03', 'Online');



INSERT INTO nursegovernsroom
(
    rid,
    nid)
VALUES (10, 1);

INSERT INTO nursegovernsroom
(
    rid,
    nid)
VALUES (11, 1);

INSERT INTO nursegovernsroom
(
    rid,
    nid)
VALUES (12, 1);

INSERT INTO nursegovernsroom
(
    rid,
    nid)
VALUES (13, 2);

INSERT INTO nursegovernsroom
(
    rid,
    nid)
VALUES (21, 2);

INSERT INTO nursegovernsroom
(
    rid,
    nid)
VALUES (22, 2);

INSERT INTO nursegovernsroom
(
    rid,
    nid)
VALUES (23, 3);

INSERT INTO nursegovernsroom
(
    rid,
    nid)
VALUES (24, 4);

INSERT INTO nursegovernsroom
(
    rid,
    nid)
VALUES (25, 4);

INSERT INTO nursegovernsroom
(
    rid,
    nid)
VALUES (31, 5);

INSERT INTO nursegovernsroom
(
    rid,
    nid)
VALUES (32, 5);

INSERT INTO patienttakesmedicine
(
    patid,
    mid)
VALUES (1, 5);

INSERT INTO patienttakesmedicine
(
    patid,
    mid)
VALUES (4, 1);

INSERT INTO patientistested
(
    patid,
    tid)
VALUES (2, 2);

INSERT INTO patientistested
(
    patid,
    tid)
VALUES (4, 2);

INSERT INTO patientistested
(
    patid,
    tid)
VALUES (5, 2);

