-- D1.1
-- admissions: PK admission_id; FK booking_id→bookings, patient_id→patients, doctor_id→doctors, dept_id→departments
-- bill_items: PK item_id; FK bill_id→bills 
-- bills: PK bill_id; FK admission_id→admissions, payer_id→payers
-- bookings: PK booking_id; FK patient_id→patients, doctor_id→doctors, package_id→packages
-- departments: PK dept_id; no FK
-- doctors: PK doctor_id; FK dept_id→departments
-- monthly_targets: PK combination of month and dept_id (because one month is same for all the departments so it wont be unique for each department); FK dept_id→departments
-- opd_visits: PK visit_id; FK patient_id→patients, doctor_id→doctors
-- packages: PK package_id; FK dept_id→departments
-- patients: PK patient_id; no Fk 
-- payers: PK payer_id; no FK

-- D1.2
SELECT* FROM DEPARTMENTS;

-- D1.3
SELECT DOCTOR_NAME, CONSULTATION_FEE FROM DOCTORS;

-- D1.4
SELECT DOCTOR_NAME, CONSULTATION_FEE, CONSULTATION_FEE/2 AS "FOLLOWUP FEE" FROM DOCTORS;
SELECT CONSULTATION_FEE/3, CONSULTATION_FEE/3.0 FROM DOCTORS;
-- It differs as 3 just divides it into whole numbers and no decimals but if we need exactly into 3rd part with the decimal then 3.0 is the way to go

-- D1.5
SELECT FIRST_NAME || ' ' || LAST_NAME, AREA FROM PATIENTS;

-- D1.6
SELECT PACKAGE_NAME, PACKAGE_PRICE, ROUND(PACKAGE_PRICE*1.0/100000,2) FROM PACKAGES;

-- D1.7
SELECT BILL_ID, NET_AMOUNT, AMOUNT_RECEIVED, NET_AMOUNT-AMOUNT_RECEIVED AS OUTSTANDING FROM BILLS;

-- D1.8
SELECT BILL_ID, GROSS_AMOUNT, DISCOUNT, ROUND(DISCOUNT*100/GROSS_AMOUNT,1) AS "DISCOUNT PCT" FROM BILLS;

-- D1.9 
-- THE ANSWER TO EMPTY BOOKINGS.EDD IS THE PACKAGE_ID, IUI, IVF, LAPAROSCOPY ARE NOT CONCLUSIVE TO PREGNANCY.

-- D.10
SELECT (SELECT COUNT(BILL_ID) FROM BILLS) AS "BILL NOS.", (SELECT COUNT(ADMISSION_ID) FROM ADMISSIONS) AS "ADMISSION NOS.", (SELECT COUNT(PATIENT_ID) FROM PATIENTS) AS "PATIENT NOS.";
