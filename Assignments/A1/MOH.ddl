-- Si Tong Liu, 1004339628,liusi17
-- Jing Huang, 1003490705, huang750
CREATE TABLE IF NOT EXISTS Person(
	pid INT AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	gender VARCHAR(10) NOT NULL,
	birth_date DATE NOT NULL,
	address VARCHAR(100) NOT NULL,
	street VARCHAR(100) NOT NULL,
	city VARCHAR(50) NOT NULL,
	province VARCHAR(20) NOT NULL,
	postal_code VARCHAR(6) NOT NULL
);

CREATE TABLE IF NOT EXISTS Phone_number(
	pid INT,
	phone_number INT(10),
	type ENUM('home','work','mobile') NOT NULL,
	PRIMARY KEY(pid,phone_number),
	CONSTRAINT PERSONPHONENUMBER_FK FOREIGN KEY (pid) REFERENCES Person(pid) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Patient(
	pid INT PRIMARY KEY,
	CONSTRAINT PERSONPATIENT_FK FOREIGN KEY (pid) REFERENCES Person(pid) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Nurse(
        pid INT PRIMARY KEY,
	yearly_salary REAL NOT NULL,
	practice_year REAL NOT NULL,
        CONSTRAINT PERSONNURSE_FK FOREIGN KEY (pid) REFERENCES Person(pid) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Physician(
	pid INT PRIMARY KEY,
	yearly_salary REAL NOT NULL,
	practice_year REAL NOT NULL,
	medical_specialty VARCHAR(100) NOT NULL,
	CONSTRAINT PERSONPHYSIAN_FK FOREIGN KEY (pid) REFERENCES Person(pid) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Cares(
	nurse_id INT,
	patient_id INT,
	PRIMARY KEY(nurse_id, patient_id),
	CONSTRAINT PERSONPNURSE_FK FOREIGN KEY (nurse_id) REFERENCES Nurse(pid),
	FOREIGN KEY (patient_id) REFERENCES Patient(pid)
);


CREATE TABLE IF NOT EXISTS Hospital(
        h_name VARCHAR(100) PRIMARY KEY,
        city VARCHAR(50) NOT NULL,
        street_address VARCHAR(100) NOT NULL,
        annual_budget REAL NOT NULL
);


CREATE TABLE IF NOT EXISTS Medical_department(
	d_name VARCHAR(100) NOT NULL,
	annual_budget REAL NOT NULL,
	h_name VARCHAR(100),
	PRIMARY KEY(d_name, h_name),
	CONSTRAINT HOSPITALMEDICALDEPARTMENT_FK FOREIGN KEY (h_name) REFERENCES Hospital(h_name) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Admits(
	h_name VARCHAR(100),
	patient_id INT, 
	admit_date DATE NOT NULL,
	priority ENUM('immediate','urgent','standard','non-urgent') NOT NULL, 
	PRIMARY KEY(h_name, patient_id),
	CONSTRAINT HOSPITALPATIENT_FK FOREIGN KEY (h_name) REFERENCES Hospital(h_name),
        FOREIGN KEY (patient_id) REFERENCES Patient(pid)
);

CREATE TABLE IF NOT EXISTS Diagonse(
	patient_id INT,
	physician_id INT,
	diagonsed_disease VARCHAR(100) NOT NULL,
	date DATE NOT NULL,
	prognosis ENUM('excellent','good','fair','poor','very poor') NOT NULL,
	PRIMARY KEY (patient_id, physician_id),
	CONSTRAINT PATIENTPHYSICIANDIGAONSE_FK FOREIGN KEY (patient_id) REFERENCES Patient(pid),
        FOREIGN KEY (physician_id) REFERENCES Physician(pid)
);

CREATE TABLE IF NOT EXISTS Drug(
	d_code INT(8) PRIMARY KEY,
	generic_name VARCHAR(100) NOT NULL, 
	d_category VARCHAR(100) NOT NULL, 
	unit_cost real NOT NULL
);
	
CREATE TABLE IF NOT EXISTS Prescription(
	patient_id INT,
        physician_id INT,
	d_code INT(8),
	dosage REAL NOT NULL,
	date DATE NOT NULL,
	PRIMARY KEY(patient_id, physician_id, d_code),
	CONSTRAINT PRESCRIPTION_FK FOREIGN KEY (patient_id) REFERENCES Patient(pid),
        FOREIGN KEY (physician_id) REFERENCES Physician(pid),
	FOREIGN KEY (d_code) REFERENCES Drug(d_code)
);

CREATE TABLE IF NOT EXISTS Medical_test(
	m_id INT PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	fee REAL NOT NULL
);

CREATE TABLE IF NOT EXISTS Undergoes(
	m_id INT,
	patient_id INT,
	test_date DATE NOT NULL,
	test_result VARCHAR(100) NOT NULL, 
	PRIMARY KEY(m_id, patient_id), 
	CONSTRAINT PATIENTUNDERGOESMEDICALTEST_FK FOREIGN KEY (patient_id) REFERENCES Patient(pid),
        FOREIGN KEY (m_id) REFERENCES Medical_test(m_id)
);

CREATE TABLE IF NOT EXISTS Health_insurance(
	i_number INT, 
	patient_id INT,
	categories ENUM('public','private','self_funded') NOT NULL,
	PRIMARY KEY(patient_id, i_number),
	CONSTRAINT PATIENTHASHEALTHINSURANCE_FK FOREIGN KEY (patient_id) REFERENCES Patient(pid) ON DELETE CASCADE
);


