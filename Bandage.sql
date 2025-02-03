create database Bandage ; 
use Bandage ;
-- Service_Provider table      -- for making a relation between doctor and nurse tables 
create table Service_Provider (
    id int identity(1,1) primary key,
    provider_type varchar(50) not null check (provider_type IN ('doctor', 'nurse'))
);

-- Nurse table 
create table Nurse (
    id int identity(1,1) primary key,
    name varchar(60) not null,
    email varchar(60) not null,
    phone varchar(20) not null,
    password varchar(60) not null,
    geographical_area varchar(255) not null,
    gender varchar(20) check (gender in ('male', 'female')) not null,
    certificate varbinary(max) ,
    available_time_schedule varchar(max) not null,
    services varchar(max) not null,
	provider_id int foreign key references service_provider(id) not null,

);

-- Doctor Table
create table Doctor (
    id int identity(1,1) primary key,
    name varchar(60) not null,
    email varchar(60) not null,
    phone varchar(20) not null,
    password varchar(60) not null,
    geographical_area varchar(255) not null,
    gender varchar(20) check (gender in ('male', 'female')) not null,
    certificate varbinary(max) ,
    available_time_schedule varchar(max) not null,
    specialization varchar(70) not null,
	provider_id int foreign key references service_provider(id) not null,

);

-- Insert Two rows into Service_Provider table


insert into Service_Provider (provider_type)
values 
('nurse'), 
('doctor');

-- Insert five rows into Nurse table

INSERT INTO Nurse (name, email, phone, password, geographical_area, gender, available_time_schedule, services, provider_id) 
VALUES
('Omar Elbana', 'omarelbana2001@gmail.com', '+20 102 036 9179', 'Omar123@@@', 'Benha', 'male', 'Sunday : Thursday 5 pm : 12 PM', 'General Nursing', 1),
('Yousif Yasser', 'yousifyasserzz@gmail.com', '+20 100 526 1278', '@12Yousif', 'Benha', 'male', 'Monday : Wednesday 2 pm : 10 PM', 'General Nursing', 1),
('Mahmoud Ashour', 'mahmoudashour123@gmail.com', '+20 109 802 8578', '1234@@@@', 'Benha', 'male', 'Sunday : Wednesday 3 pm : 11 PM', 'General Nursing', 1),
('Sherif Mostafa', 'shefomostafa2002@gmail.com', '+20 115 948 9962', '@@##1234', 'Benha', 'male', 'Monday : Thursday 11 AM : 7 PM', 'General Nursing', 1),
('Ezzat Fadel', 'ezzatfadel500@gmail.com', '+20 1066319997', 'ezzat###', 'Benha', 'male', 'Sunday : Thursday 8 AM : 12 PM', 'General Nursing', 1),
('Mostafa Shedeed', 'mostafashedeed2002@gmail.com', '+20 102 312 5519', '@mostafa##', 'Benha', 'male', 'Monday : Wednesday 5 pm : 12 PM', 'General Nursing', 1);


-- Insert five rows into Doctor table

insert into Doctor (name , email , phone , password , geographical_area , gender , available_time_schedule , specialization , provider_id) 
values
('Adel Foda', 'dradelfoda@gmail.com', '+20 1153030840', 'adel#@@@', 'Benha', 'male', 'Saturday : Thursday 3 pm : 12 PM', 'Orthopedist', 2),
('Abdel Fattah', 'abdelfattah1880@gmail.com', '+20 1060998155', '@abdelfattah', 'Benha', 'male', 'Monday : Wednesday 1 pm : 10 PM', 'Surgeon', 2),
('Ahmed Shawqi', 'shawqiahmed22@gmail.com', '013 3254344', '1234$$$$', 'Benha', 'male', 'Saturday : Wednesday 2 pm : 10 PM', 'Surgeon', 2),
('Ahmed Daboor', 'ahmedahmed220@gmail.com', '013 3230037', '%%##1234', 'Benha', 'male', 'Monday : Thursday 10 AM : 8 PM', 'Internist', 2),
('Salem Azab', 'salemazab@gmail.com', '+20 1068330057', 'salem####', 'Benha', 'male', 'Sunday : Thursday 7 AM : 9 PM', 'Internist', 2),
('Ahmed Hassan', 'hassanhassan66@gmail.com', '+20 1010767418', '@hassan##', 'Benha', 'male', 'Saturday : Wednesday 4 pm : 8 PM', 'Orthopedist', 2);

-- create table User 
create table [User] (
    id int identity(1,1) primary key,
	email varchar(60) not null,
    name varchar(60) not null,
    phone varchar(20) not null,
    password varchar(60) not null,
    geographical_area varchar(255) not null,
    gender varchar(20) check (gender in ('male', 'female')) not null
);

-- insert data into user table 

insert into [user] (email, name , phone, password, geographical_area, gender)
values
('mounirelhady22@gmail.com','Mounir Elhady', '+20 1029036488', 'mounir123', 'Benha', 'male'),
('mostafagamal2002@gmail.com','Mostafa Gamal', '+20 1554013252', 'mostafa@@@', 'Benha', 'male'),
('ahmed22mohey@gmail.com','Ahmed Mohey', '+20 1003064032', 'ahmed2000', 'Benha', 'male'),
('ibrahimmohamed202@gmail.com','Mohamed Ibrahim', '+20 1093046267', 'mohamed22', 'Benha', 'male'),
('ammarmostafa222@gmail.com','Ammar Mostafa ', '+20 1063386037', 'ammar55', 'Benha', 'male');


-- create table Account  
create table Account (
    id int identity(1,1) primary key,
    email varchar(50) not null,
    password varchar(60) not null,
    User_id int,
    Doctor_id int,
    Nurse_id int,
    foreign key (user_id) references [User](id),
    foreign key (doctor_id) references Doctor(id),
    foreign key (nurse_id) references Nurse(id)
);

-- Inserting rows into the Account table from Doctor and Nurse tables
insert into Account (email, password, User_id, Doctor_id, Nurse_id)
values
-- User data
('mounirelhady22@gmail.com', 'mounir123', 1, null, null),  -- Assuming User_id 1 corresponds to 'Mounir Elhady'
('mostafagamal2002@gmail.com', 'mostafa@@@', 2, null, null),  -- Assuming User_id 2 corresponds to 'Mostafa Gamal'
('ahmed22mohey@gmail.com', 'ahmed2000', 3, null, null),  -- Assuming User_id 3 corresponds to 'Ahmed Mohey'
('ibrahimmohamed202@gmail.com', 'mohamed22', 4, null, null),  -- Assuming User_id 4 corresponds to 'Mohamed Ibrahim'
('ammarmostafa222@gmail.com', 'ammar55', 5, null, null);  -- Assuming User_id 5 corresponds to 'Ammar Mostafa'

-- Inserting rows into the Account table from Doctor table
insert into Account (email, password, User_id, Doctor_id, Nurse_id)
values
('dradelfoda@gmail.com', 'adel#@@@', null, 1, null),  -- Assuming Doctor_id 1 corresponds to 'Adel Foda'
('abdelfattah1880@gmail.com', '@abdelfattah', null, 2, null),  -- Assuming Doctor_id 2 corresponds to 'Abdel Fattah'
('shawqiahmed22@gmail.com', '1234$$$$', null, 3, null),  -- Assuming Doctor_id 3 corresponds to 'Ahmed Shawqi'
('ahmedahmed220@gmail.com', '%%##1234', null, 4, null),  -- Assuming Doctor_id 4 corresponds to 'Ahmed Daboor'
('salemazab@gmail.com', 'salem####', null, 5, null);  -- Assuming Doctor_id 5 corresponds to 'Salem Azab'

-- Inserting rows into the Account table from Nurse table
insert into Account (email, password, User_id, Doctor_id, Nurse_id)
values
('omarelbana2001@gmail.com', 'Omar123@@@', null, null, 1),  -- Assuming Nurse_id 1 corresponds to 'Omar Elbana'
('yousifyasserzz@gmail.com', '@12Yousif', null, null, 2),  -- Assuming Nurse_id 2 corresponds to 'Yousif Yasser'
('mahmoudashour123@gmail.com', '1234@@@@', null, null, 3),  -- Assuming Nurse_id 3 corresponds to 'Mahmoud Ashour'
('shefomostafa2002@gmail.com', '@@##1234', null, null, 4),  -- Assuming Nurse_id 4 corresponds to 'Sherif Mostafa'
('ezzatfadel500@gmail.com', 'ezzat###', null, null, 5);  -- Assuming Nurse_id 5 corresponds to 'Ezzat Fadel'

-- create Service table 

create table Service (
    id int identity(1,1) primary key,
    name varchar(100) not null,
    description varchar(max)
);

-- create table Nurse_service  ( many to many relation ) 


create table Nurse_Service (
    nurse_id int,
    service_id int,
    price decimal(10, 2) not null,
    primary key (nurse_id, service_id),
    foreign key (nurse_id) references Nurse(id),
    foreign key (service_id) references Service(id)
);


-- insert data to the Service table 

insert into Service (name, description)
values
('Cannula installation', 'Insertion of a thin tube (cannula) into a patient'),
('Wound Care', 'Providing care for wounds, including dressing changes and cleaning'),
('Catheterization', 'Inserting and managing catheters'),
('Intravenous Injection', 'Administering medications or fluids through intravenous infusion'),
('Intramuscular Injection', 'Administering injections into the muscle');


-- Insert data into Nurse_Service table

insert into Nurse_Service (nurse_id, service_id, price)
values
(1, 1, 80.00),
(1, 3, 250.00),
(2, 2, 100.00),
(3, 4, 75.00),
(4, 5, 55.00),
(5, 1, 90.00),
(5, 2, 120.00);



-- Create Admin table
create table Admin (
    id int identity(1,1) primary key,
    name varchar(60) not null,
    password varchar(60) not null,
    email varchar(60) not null unique
);

-- Add the Admin foreign key to the Account table 

alter table Account
add Admin_id int,
foreign key (Admin_id) references Admin(id);


-- insert data to the admin table 

insert into Admin (name, password, email)
values
('Mohamed Salah', 'mohamed123', 'mohamed1992salah@gmail.com');

insert into Admin (name, password, email)
values
('Khaled Ali', 'khaled123', 'khaledali1990@gmail.com');


-- Handling Monthly Subscriptions 
-- Create Subscription table
create table Subscription (
    id int identity(1,1) primary key,
    nurse_id int,
    doctor_id int,
    subscription_amount decimal(10, 2) not null,
    start_date date not null,
    end_date date not null,
    foreign key (nurse_id) references Nurse(id),
    foreign key (doctor_id) references Doctor(id)
);

-- Insert one row ( nurse no 1 monthly subscription ) into Subscription table
insert into Subscription (nurse_id, subscription_amount, start_date, end_date)
values
(1, 100.00, '2024-03-01', '2024-03-31'); 

-- Insert one row ( Doctor no 2 monthly subscription ) into Subscription table

insert into Subscription (doctor_id, subscription_amount, start_date, end_date)
values
(2, 150.00, '2024-03-01', '2024-03-31'); 


-- Handling the Appointments and Resrvations Process by Five tables 

-- Create Appointments table
create table Appointments (
    id int identity(1,1) primary key,
    appointment_date datetime not null,
    status varchar(20) default 'Scheduled' -- e.g., Scheduled, In Progress, Completed, Canceled
);

-- Create Doctor_Available_Appointments table
create table Doctor_Available_Appointments (
    id int identity(1,1) primary key,
    doctor_id int,
    appointment_id int,
    foreign key (doctor_id) references Doctor(id),
    foreign key (appointment_id) references Appointments(id)
);

-- Create Nurse_Available_Appointments table
create table Nurse_Available_Appointments (
    id int identity(1,1) primary key,
    nurse_id int,
    appointment_id int,
    foreign key (nurse_id) references Nurse(id),
    foreign key (appointment_id) references Appointments(id)
);

-- Create Doctor_Reservations table
create table Doctor_Reservations (
    id int identity(1,1) primary key,
    user_id int,
    doctor_id int,
    appointment_id int,
    status varchar(20) default 'Reserved', -- e.g., Reserved, Completed, Canceled
    foreign key (user_id) references [User](id),
    foreign key (doctor_id) references Doctor(id),
    foreign key (appointment_id) references Appointments(id)
);

-- Create Nurse_Reservations table
create table Nurse_Reservations (
    id int identity(1,1) primary key,
    user_id int,
    nurse_id int,
    appointment_id int,
    status varchar(20) default 'Reserved', -- e.g., Reserved, Completed, Canceled
    foreign key (user_id) references [User](id),
    foreign key (nurse_id) references Nurse(id),
    foreign key (appointment_id) references Appointments(id)
);



-- Insert data into Appointments table
INSERT INTO Appointments (appointment_date, status)
VALUES
('2024-03-01 10:00:00', 'Scheduled'),
('2024-03-02 14:30:00', 'Scheduled'),
('2024-03-03 11:15:00', 'Scheduled'),
('2024-03-04 09:45:00', 'Scheduled'),
('2024-03-05 16:00:00', 'Scheduled');

-- Insert data into Doctor_Available_Appointments table
INSERT INTO Doctor_Available_Appointments (doctor_id, appointment_id)
VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5);

-- Insert data into Nurse_Available_Appointments table
INSERT INTO Nurse_Available_Appointments (nurse_id, appointment_id)
VALUES
(1, 2),
(1, 4),
(2, 1),
(3, 3),
(3, 5);

-- Insert data into Doctor_Reservations table
INSERT INTO Doctor_Reservations (user_id, doctor_id, appointment_id, status)
VALUES
(1, 1, 1, 'Reserved'),
(2, 2, 3, 'Reserved'),
(3, 1, 2, 'Reserved'),
(4, 3, 5, 'Reserved'),
(5, 2, 4, 'Reserved');

-- Insert data into Nurse_Reservations table
INSERT INTO Nurse_Reservations (user_id, nurse_id, appointment_id, status)
VALUES
(1, 1, 2, 'Reserved'),
(2, 2, 1, 'Reserved'),
(3, 1, 4, 'Reserved'),
(4, 3, 5, 'Reserved'),
(5, 2, 3, 'Reserved');

-- Now we will handel the Rating process 
-- create Rating table for the nurses 

create table Nurse_Rating (
    id int identity(1,1) primary key,
    user_id int,
    nurse_id int,
    reservation_id int,
    rating int check (rating >= 1 and rating <= 5),
    feedback varchar(255),
    foreign key (user_id) references [user](id),
    foreign key (nurse_id) references nurse(id),
    foreign key (reservation_id) references nurse_reservations(id)
);

-- create Rating table for the doctors 
create table Doctor_Rating (
    id int identity(1,1) primary key,
    user_id int,
    doctor_id int,
    reservation_id int,
    rating int check (rating >= 1 and rating <= 5),
    feedback varchar(255),
    foreign key (user_id) references [user](id),
    foreign key (doctor_id) references doctor(id),
    foreign key (reservation_id) references doctor_reservations(id)
);



-- Insert data into Nurse_Ratings table
insert into Nurse_Rating (user_id, nurse_id, reservation_id, rating, feedback)
values
(1, 1, 1, 5, 'Excellent service!'),
(2, 1, 2, 4, 'Good experience overall'),
(3, 2, 3, 3, 'Average service'),
(4, 3, 4, 5, 'Highly recommended'),
(5, 3, 5, 2, 'Needs improvement');

-- Insert data into Doctor_Ratings table
insert into Doctor_Rating (user_id, doctor_id, reservation_id, rating, feedback)
values
(1, 1, 1, 4, 'Great consultation'),
(2, 1, 2, 5, 'Very knowledgeable'),
(3, 2, 3, 3, 'Satisfactory appointment'),
(4, 3, 4, 5, 'Excellent service'),
(5, 3, 5, 2, 'Not satisfied with the treatment');


-- Now we will handle the Medical Record of the user 

-- Medical Record table

create table Medical_Record (
    id int identity(1,1) primary key,
    user_id int,
    doctor_id int,
    entry_date datetime default getdate(),
    last_modified datetime default getdate(),
    foreign key (user_id) references [user](id),
    foreign key (doctor_id) references doctor(id)
);

-- History table

create table History (
    id int identity(1,1) primary key,
    medical_record_id int,
    entry_date datetime default getdate(),
    description varchar(max),
    foreign key (medical_record_id) references medical_record(id)
);

-- Symptoms table

create table Symptoms (
    id int identity(1,1) primary key,
    medical_record_id int,
    entry_date datetime default getdate(),
    description varchar(max),
    foreign key (medical_record_id) references medical_record(id)
);

-- Prescription table

create table Prescription (
    id int identity(1,1) primary key,
    medical_record_id int,
    prescription_date datetime default getdate(),
    medication varchar(max),
    dosage varchar(50),
    foreign key (medical_record_id) references medical_record(id)
);

-- Diagnoses table

create table Diagnoses (
    id int identity(1,1) primary key,
    medical_record_id int,
    diagnosis_date datetime default getdate(),
    diagnosis_text varchar(max),
    foreign key (medical_record_id) references medical_record(id)
);



-- Insert five rows data into medical_record table
INSERT INTO medical_record (user_id, doctor_id)
VALUES
(1, 1),
(2, 2),
(1, 2),
(2, 1),
(1, 1);

-- Insert five rows data into history table
INSERT INTO history (medical_record_id, description)
VALUES
(1, 'Patient had a recent history of heart palpitations.'),
(2, 'Patient reports persistent skin rash.'),
(3, 'Follow-up visit for cardiac symptoms.'),
(4, 'Follow-up visit for skin condition.'),
(5, 'Regular check-up for cardiovascular health.');

-- Insert five rows data into symptoms table
INSERT INTO symptoms (medical_record_id, description)
VALUES
(1, 'Shortness of breath during physical activity.'),
(2, 'Itching and redness on the skin.'),
(3, 'Occasional chest pain.'),
(4, 'Improved skin condition.'),
(5, 'No new symptoms reported.');

-- Insert five rows data into prescription table
INSERT INTO prescription (medical_record_id, medication, dosage)
VALUES
(1, 'Aspirin', '100mg once a day'),
(2, 'Hydrocortisone cream', 'Apply twice daily'),
(3, 'Prescribed medication for chest pain', 'Dosage for chest pain'),
(4, 'Continuation of previous treatment', 'Previous dosage'),
(5, 'No new prescriptions', 'No dosage needed');

-- Insert five rows data into diagnoses table
INSERT INTO diagnoses (medical_record_id, diagnosis_text)
VALUES
(1, 'Possible cardiac arrhythmia, further tests recommended.'),
(2, 'Contact dermatitis, prescribe topical treatment.'),
(3, 'Suspected cardiovascular issue, additional tests ordered.'),
(4, 'Improvement in skin condition, positive prognosis.'),
(5, 'Routine check-up, no significant findings.');


-- Nurse Table
ALTER TABLE Nurse
ADD description varchar(max);

-- Doctor Table
ALTER TABLE Doctor
ADD description varchar(max);

-- Update descriptions for all nurses
UPDATE Nurse
SET description = 'Experienced and dedicated nurse with a focus on patient care.'
WHERE name = 'Omar Elbana';

UPDATE Nurse
SET description = 'Compassionate nurse committed to providing quality healthcare services.'
WHERE name = 'Yousif Yasser';

UPDATE Nurse
SET description = 'Skilled nurse with a strong background in patient support and health education.'
WHERE name = 'Mahmoud Ashour';

UPDATE Nurse
SET description = 'Detail-oriented nurse dedicated to providing personalized care.'
WHERE name = 'Sherif Mostafa';

UPDATE Nurse
SET description = 'Energetic and reliable nurse with a focus on patient well-being.'
WHERE name = 'Ezzat Fadel';

UPDATE Nurse
SET description = 'Dedicated nurse with excellent interpersonal skills and a passion for healthcare.'
WHERE name = 'Mostafa Shedeed';


-- Update descriptions for all doctors
UPDATE Doctor
SET description = 'Skilled orthopedist with expertise in treating bone and joint conditions.'
WHERE name = 'Adel Foda';

UPDATE Doctor
SET description = 'Experienced surgeon specializing in various surgical procedures.'
WHERE name = 'Abdel Fattah';

UPDATE Doctor
SET description = 'Versatile surgeon with a focus on patient care.'
WHERE name = 'Ahmed Shawqi';

UPDATE Doctor
SET description = 'Internist with a commitment to providing comprehensive healthcare services.'
WHERE name = 'Ahmed Daboor';

UPDATE Doctor
SET description = 'Experienced internist with a focus on patient well-being.'
WHERE name = 'Salem Azab';

UPDATE Doctor
SET description = 'Orthopedist dedicated to providing quality care.'
WHERE name = 'Ahmed Hassan';



ALTER TABLE Doctor_Reservations
ADD repeat_count int default 1; 


ALTER TABLE Nurse_Reservations
ADD repeat_count int default 1; 


ALTER TABLE Nurse
DROP COLUMN geographical_area;

ALTER TABLE Doctor
DROP COLUMN geographical_area;


-- Create the Location table

CREATE TABLE Location (
    id INT IDENTITY(1,1) PRIMARY KEY,
    location_name VARCHAR(255) NOT NULL
);

-- Insert the three rows into the Location table

INSERT INTO Location (location_name) VALUES ('Benha'), ('Dokki'), ('Shoubra');


ALTER TABLE Nurse
ADD location_id INT;

ALTER TABLE Doctor
ADD location_id INT;


UPDATE Nurse
SET location_id = (
    SELECT id FROM Location WHERE location_name = 'Benha'
);

UPDATE Doctor
SET location_id = (
    SELECT id FROM Location WHERE location_name = 'Benha'
);


ALTER TABLE Nurse
DROP COLUMN services;



-- Temporary Nurse table
CREATE TABLE temp_nurse (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    email VARCHAR(60) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    password VARCHAR(60) NOT NULL,
    geographical_area VARCHAR(255) NOT NULL,
    gender VARCHAR(20) CHECK (gender IN ('male', 'female')) NOT NULL,
    certificate VARBINARY(MAX),
    available_time_schedule VARCHAR(MAX) NOT NULL,
    services VARCHAR(MAX) NOT NULL,
    provider_id INT,
    CONSTRAINT fk_temp_nurse_service_provider FOREIGN KEY (provider_id) REFERENCES service_provider(id)
);

-- Temporary Doctor Table
CREATE TABLE temp_doctor (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    email VARCHAR(60) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    password VARCHAR(60) NOT NULL,
    geographical_area VARCHAR(255) NOT NULL,
    gender VARCHAR(20) CHECK (gender IN ('male', 'female')) NOT NULL,
    certificate VARBINARY(MAX),
    available_time_schedule VARCHAR(MAX) NOT NULL,
    specialization VARCHAR(70) NOT NULL,
    provider_id INT,
    CONSTRAINT fk_temp_doctor_service_provider FOREIGN KEY (provider_id) REFERENCES service_provider(id)
);





-- Insert data into TempNurse table
INSERT INTO temp_nurse (name, email, phone, password, geographical_area, gender, available_time_schedule, services, provider_id) 
VALUES
('Mohamed Ali', 'mohamedali@example.com', '+20 101 234 5678', 'Mohamed123@@@', 'Benha', 'male', 'Sunday : Thursday 5 pm : 12 am', 'General Nursing', 1),
('Nora Mostafa', 'nouramostafa@example.com', '+20 100 987 6543', '@12Noura', 'Benha', 'female', 'Monday : Wednesday 2 pm : 10 pm', 'General Nursing', 1),
('Eman Ahmed', 'emanahmed@example.com', '+20 109 876 5432', '1234@@@@', 'Benha', 'female', 'Sunday : Wednesday 3 pm : 11 pm', 'General Nursing', 1),
('Yasmin Hassan', 'yasminhassan@example.com', '+20 115 678 9012', '@@##1234', 'Benha', 'female', 'Monday : Thursday 11 am : 7 pm', 'General Nursing', 1),
('Mariam Saeed', 'mariamsaeed@example.com', '+20 106 543 2109', 'mariam###', 'Benha', 'female', 'Sunday : Thursday 8 am : 12 pm', 'General Nursing', 1),
('Hussein Wael', 'husseinwael@example.com', '+20 102 321 0987', '@hussein##', 'Benha', 'male', 'Monday : Wednesday 5 pm : 12 am', 'General Nursing', 1);

-- Insert data into TempDoctor table
INSERT INTO temp_doctor (name , email , phone , password , geographical_area , gender , available_time_schedule , specialization , provider_id) 
VALUES
('Ahmed Rashwan', 'ahmedrashwan@example.com', '+20 1153030840', 'ahmed#@@@', 'Benha', 'male', 'Saturday : Thursday 3 pm : 12 am', 'Orthopedist', 2),
('Amira Suleiman', 'amirasuleiman@example.com', '+20 1060998155', '@amirasuleiman', 'Benha', 'female', 'Monday : Wednesday 1 pm : 10 pm', 'Surgeon', 2),
('Hassan Abdulrahman', 'hassanabdulrahman@example.com', '+20 013 3254344', '1234$$$$', 'Benha', 'male', 'Saturday : Wednesday 2 pm : 10 pm', 'Surgeon', 2),
('Dalia Ahmed', 'daliaahmed@example.com', '+20 013 3230037', '%%##1234', 'Benha', 'female', 'Monday : Thursday 10 am : 8 pm', 'Internist', 2),
('Ramy Abdelrahim', 'ramyabdelrahim@example.com', '+20 1068330057', 'ramy####', 'Benha', 'male', 'Sunday : Thursday 7 am : 9 pm', 'Internist', 2),
('Mona Mohamed', 'monamohamed@example.com', '+20 1010767418', '@mona##', 'Benha', 'female', 'Saturday : Wednesday 4 pm : 8 pm', 'Orthopedist', 2);





ALTER TABLE Doctor
ADD price DECIMAL(10, 2) DEFAULT 150;


UPDATE Doctor
SET price = 
    CASE 
        WHEN name = 'Adel Foda' THEN 150
        WHEN name = 'Abdel Fattah' THEN 200
        WHEN name = 'Ahmed Shawqi' THEN 250
        WHEN name = 'Ahmed Daboor' THEN 100
        WHEN name = 'Salem Azab' THEN 350
        WHEN name = 'Ahmed Hassan' THEN 300 
    END;


alter table Account
alter column email varchar(60);







ALTER TABLE Nurse
ADD CONSTRAINT FK_Nurse_Location FOREIGN KEY (location_id) REFERENCES location(id);





ALTER TABLE Doctor
ADD CONSTRAINT FK_Doctor_Location FOREIGN KEY (location_id) REFERENCES location(id);



alter table Nurse
add picture varbinary(max);

alter table Doctor
add picture varbinary(max);



UPDATE Nurse
SET picture = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\Users\mounir reda\OneDrive\Desktop\nurse 1.jpg', SINGLE_BLOB) AS PictureData)
WHERE id = 1;






--update Nurse
--set picture = (select BulkColumn from OPENROWSET(BULK 'C:\Users\mounir reda\OneDrive\Desktop\nurse1.jpg', SINGLE_BLOB) as PictureData)
--where id = 1;

--update Nurse
--set picture = (select BulkColumn from OPENROWSET(BULK 'C:\Users\mounir reda\OneDrive\Desktop\nurse2.jpg', SINGLE_BLOB) as PictureData)
--where id = 2;

--update Nurse
--set picture = (select BulkColumn from OPENROWSET(BULK 'C:\Users\mounir reda\OneDrive\Desktop\nurse3.jpg', SINGLE_BLOB) as PictureData)
--where id = 3;

--update Nurse
--set picture = (select BulkColumn from OPENROWSET(BULK 'C:\Users\mounir reda\OneDrive\Desktop\nurse4.jpg', SINGLE_BLOB) as PictureData)
--where id = 4;

--update Nurse
--set picture = (select BulkColumn from OPENROWSET(BULK 'C:\Users\mounir reda\OneDrive\Desktop\nurse5.jpg', SINGLE_BLOB) as PictureData)
--where id = 5;





--update Doctor
--set picture = (select BulkColumn from OPENROWSET(BULK 'C:\Users\mounir reda\OneDrive\Desktop\doctor1.jpg', SINGLE_BLOB) as PictureData)
--where id = 1;

--update Doctor
--set picture = (select BulkColumn from OPENROWSET(BULK 'C:\Users\mounir reda\OneDrive\Desktop\doctor2.jpg', SINGLE_BLOB) as PictureData)
--where id = 2;

--update Doctor
--set picture = (select BulkColumn from OPENROWSET(BULK 'C:\Users\mounir reda\OneDrive\Desktop\doctor3.jpg', SINGLE_BLOB) as PictureData)
--where id = 3;

--update Doctor
--set picture = (select BulkColumn from OPENROWSET(BULK 'C:\Users\mounir reda\OneDrive\Desktop\doctor4.jpg', SINGLE_BLOB) as PictureData)
--where id = 4;

--update Doctor
--set picture = (select BulkColumn from OPENROWSET(BULK 'C:\Users\mounir reda\OneDrive\Desktop\doctor5.jpg', SINGLE_BLOB) as PictureData)
--where id = 5;



alter table Subscription
add ActiveStatus bit default 1;  



create table Token (
    token_id int identity(1,1) primary key,
    doctor_id int,
    nurse_id int,
    token_value varchar(255) not null,
    expiration_date datetime not null,
    foreign key (doctor_id) references Doctor(id),
    foreign key (nurse_id) references Nurse(id)
);






---- Create the Location table

--CREATE TABLE Location (
--    id INT IDENTITY(1,1) PRIMARY KEY,
--    location_name VARCHAR(255) NOT NULL
--);

---- Insert the three rows into the Location table

--INSERT INTO Location (location_name) VALUES ('Benha'), ('Dokki'), ('Shoubra');


--ALTER TABLE Nurse
--ADD location_id INT;

--ALTER TABLE Doctor
--ADD location_id INT;


--UPDATE Nurse
--SET location_id = (
--    SELECT id FROM Location WHERE location_name = 'Benha'
--);

--UPDATE Doctor
--SET location_id = (
--    SELECT id FROM Location WHERE location_name = 'Benha'
--);





ALTER TABLE History
DROP CONSTRAINT FK__History__medical__4B7734FF;

ALTER TABLE History
DROP COLUMN medical_record_id;

ALTER TABLE Symptoms
DROP CONSTRAINT FK__Symptoms__medica__4F47C5E3;

ALTER TABLE Symptoms
DROP COLUMN medical_record_id;

ALTER TABLE Prescription
DROP CONSTRAINT FK__Prescript__medic__531856C7;

ALTER TABLE Prescription
DROP COLUMN medical_record_id;

ALTER TABLE Diagnoses
DROP CONSTRAINT FK__Diagnoses__medic__56E8E7AB;

ALTER TABLE Diagnoses
DROP COLUMN medical_record_id;




-- Update Medical_Record table to include foreign key references
ALTER TABLE Medical_Record
ADD history_id int,
    symptoms_id int,
    prescription_id int,
    diagnoses_id int;

-- Add foreign key constraints
ALTER TABLE Medical_Record
ADD CONSTRAINT FK_Medical_Record_History
FOREIGN KEY (history_id) REFERENCES History(id);

ALTER TABLE Medical_Record
ADD CONSTRAINT FK_Medical_Record_Symptoms
FOREIGN KEY (symptoms_id) REFERENCES Symptoms(id);


ALTER TABLE Medical_Record
ADD CONSTRAINT FK_Medical_Record_Prescription
FOREIGN KEY (prescription_id) REFERENCES Prescription(id);


ALTER TABLE Medical_Record
ADD CONSTRAINT FK_Medical_Record_Diagnoses
FOREIGN KEY (diagnoses_id) REFERENCES Diagnoses(id);



UPDATE Medical_Record
SET history_id = 1
WHERE id = 1;

UPDATE Medical_Record
SET history_id = 2
WHERE id = 2;

UPDATE Medical_Record
SET history_id = 3
WHERE id = 3;

UPDATE Medical_Record
SET history_id = 4
WHERE id = 4;

UPDATE Medical_Record
SET history_id = 5
WHERE id = 5;


UPDATE Medical_Record
SET symptoms_id = 1
WHERE id = 1;

UPDATE Medical_Record
SET symptoms_id = 2
WHERE id = 2;

UPDATE Medical_Record
SET symptoms_id = 3
WHERE id = 3;

UPDATE Medical_Record
SET symptoms_id = 4
WHERE id = 4;

UPDATE Medical_Record
SET symptoms_id = 5
WHERE id = 5;

UPDATE Medical_Record
SET prescription_id = 1
WHERE id = 1;

UPDATE Medical_Record
SET prescription_id = 2
WHERE id = 2;

UPDATE Medical_Record
SET prescription_id = 3
WHERE id = 3;

UPDATE Medical_Record
SET prescription_id = 4
WHERE id = 4;

UPDATE Medical_Record
SET prescription_id = 5
WHERE id = 5;

UPDATE Medical_Record
SET diagnoses_id = 1
WHERE id = 1;

UPDATE Medical_Record
SET diagnoses_id = 2
WHERE id = 2;

UPDATE Medical_Record
SET diagnoses_id = 3
WHERE id = 3;

UPDATE Medical_Record
SET diagnoses_id = 4
WHERE id = 4;

UPDATE Medical_Record
SET diagnoses_id = 5
WHERE id = 5;


ALTER TABLE Diagnoses
DROP CONSTRAINT DF__Diagnoses__diagnosis_date;



ALTER TABLE Diagnoses
DROP COLUMN diagnosis_date;


ALTER TABLE Prescription
DROP CONSTRAINT DF__Prescript__presc__5224328E;

ALTER TABLE Prescription
DROP COLUMN Prescription_date;


ALTER TABLE Symptoms
DROP CONSTRAINT DF__Symptoms__entry___4E53A1AA;


ALTER TABLE Symptoms
DROP COLUMN entry_date;



ALTER TABLE History
DROP CONSTRAINT DF__History__entry_d__4A8310C6;


ALTER TABLE History
DROP COLUMN entry_date;






ALTER TABLE History
ADD Reservation_id INT;

ALTER TABLE History
ADD CONSTRAINT FK_History_Reservation
FOREIGN KEY (Reservation_id) REFERENCES Doctor_Reservations(id);


ALTER TABLE History
ADD Reservation_id INT;

ALTER TABLE History
ADD CONSTRAINT FK_History_Reservation
FOREIGN KEY (Reservation_id) REFERENCES Doctor_Reservations(id);

ALTER TABLE Diagnoses
ADD Reservation_id INT;

ALTER TABLE Diagnoses
ADD CONSTRAINT FK_Diagnoses_Reservation
FOREIGN KEY (Reservation_id) REFERENCES Doctor_Reservations(id);

ALTER TABLE Symptoms
ADD Reservation_id INT;

ALTER TABLE Symptoms
ADD CONSTRAINT FK_Symptoms_Reservation
FOREIGN KEY (Reservation_id) REFERENCES Doctor_Reservations(id);

ALTER TABLE Prescription
ADD Reservation_id INT;

ALTER TABLE Prescription
ADD CONSTRAINT FK_Prescription_Reservation
FOREIGN KEY (Reservation_id) REFERENCES Doctor_Reservations(id);





UPDATE History
SET Reservation_id = 1
WHERE id = 1;

UPDATE History
SET Reservation_id = 2
WHERE id = 2;

UPDATE History
SET Reservation_id = 3
WHERE id = 3;

UPDATE History
SET Reservation_id = 4
WHERE id = 4;

UPDATE History
SET Reservation_id = 5
WHERE id = 5;




UPDATE Diagnoses
SET Reservation_id = 1
WHERE id = 1;

UPDATE Diagnoses
SET Reservation_id = 2
WHERE id = 2;

UPDATE Diagnoses
SET Reservation_id = 3
WHERE id = 3;

UPDATE Diagnoses
SET Reservation_id = 4
WHERE id = 4;

UPDATE Diagnoses
SET Reservation_id = 5
WHERE id = 5;




UPDATE Symptoms
SET Reservation_id = 1
WHERE id = 1;

UPDATE Symptoms
SET Reservation_id = 2
WHERE id = 2;

UPDATE Symptoms
SET Reservation_id = 3
WHERE id = 3;

UPDATE Symptoms
SET Reservation_id = 4
WHERE id = 4;

UPDATE Symptoms
SET Reservation_id = 5
WHERE id = 5;



UPDATE Prescription
SET Reservation_id = 1
WHERE id = 1;

UPDATE Prescription
SET Reservation_id = 2
WHERE id = 2;

UPDATE Prescription
SET Reservation_id = 3
WHERE id = 3;

UPDATE Prescription
SET Reservation_id = 4
WHERE id = 4;

UPDATE Prescription
SET Reservation_id = 5
WHERE id = 5;



ALTER TABLE Appointments
ADD Weekly_Appointments varchar(200) DEFAULT 'offline' NOT NULL;


UPDATE Appointments
SET Weekly_Appointments = CONVERT(varchar(200), appointment_date, 121);  

ALTER TABLE Appointments
DROP COLUMN appointment_date;


INSERT INTO Appointments (Weekly_Appointments, status)
VALUES
('sat from 3:00 PM to 12:00 AM', 'offline'),
('sun from 2:30 PM to 11:00 PM', 'offline'),
('mon from 9:15 AM to 5:45 PM', 'offline'),
('tue from 10:45 AM to 6:30 PM', 'offline'),
('wed from 1:00 PM to 9:00 PM', 'offline');



ALTER TABLE Doctor
ADD online_price decimal(10, 2) ;  



DROP TABLE Account;

ALTER TABLE Nurse
ADD National_Id varchar(50) NULL;


ALTER TABLE Nurse
DROP COLUMN certificate;

ALTER TABLE Doctor
DROP COLUMN National_Id;

ALTER TABLE Doctor
ADD National_Id varchar(50) NOT NULL;


ALTER TABLE Doctor
ADD National_Id varchar(50) NULL;

UPDATE Doctor
SET National_Id =12354698745632
WHERE National_Id IS NULL; 

ALTER TABLE Doctor
ALTER COLUMN National_Id varchar(50) NOT NULL;

UPDATE Doctor
SET National_Id =54632198736974
WHERE id = 1 ; 

UPDATE Doctor
SET National_Id = 
    CASE id
        WHEN 2 THEN '23456789012345' -- Replace with your desired 14-digit number for id = 2
        WHEN 3 THEN '34567890123456' -- Replace with your desired 14-digit number for id = 3
        WHEN 4 THEN '45678901234567' -- Replace with your desired 14-digit number for id = 4
        WHEN 5 THEN '56789012345678' -- Replace with your desired 14-digit number for id = 5
    END
WHERE id IN ( 2, 3, 4, 5);


ALTER TABLE Nurse
ADD National_Id varchar(50)  NULL;

UPDATE Nurse
SET National_Id = '12345678901234'
WHERE National_Id IS NULL;

ALTER TABLE Nurse
ALTER COLUMN National_Id varchar(50) NOT NULL;


UPDATE Nurse
SET National_Id = 
    CASE id
        WHEN 1 THEN '54632198736974'
        WHEN 2 THEN '23456789012345'
        WHEN 3 THEN '34567890123456'
        WHEN 4 THEN '45678901234567'
        WHEN 5 THEN '56789012345678'
    END
WHERE id IN (1, 2, 3, 4, 5);



ALTER TABLE Doctor_Available_Appointments
ADD Status varchar(50) DEFAULT 'offline';

ALTER TABLE Doctor_Available_Appointments
ADD CONSTRAINT CHK_Status
CHECK (Status IN ('online', 'offline'));



------------------------------------------------------------------------------

ALTER TABLE Doctor_Reservations
ADD Reservation_date datetime; 


ALTER TABLE Nurse_Reservations
ADD Reservation_date datetime; 


UPDATE Doctor_Reservations
SET Reservation_date = 
    CASE 
        WHEN id = 1 THEN '2024-04-27 10:00:00'
        WHEN id = 2 THEN '2024-04-28 11:30:00'
        WHEN id = 3 THEN '2024-04-29 14:15:00'
        WHEN id = 4 THEN '2024-04-30 09:00:00'
        WHEN id = 5 THEN '2024-05-01 16:45:00'
        ELSE GETDATE()
    END
WHERE status = 'Reserved';



UPDATE Nurse_Reservations
SET Reservation_date = 
    CASE 
        WHEN id = 1 THEN '2024-04-27 13:00:00'
        WHEN id = 2 THEN '2024-04-28 14:30:00'
        WHEN id = 3 THEN '2024-04-29 16:45:00'
        WHEN id = 4 THEN '2024-04-30 10:30:00'
        WHEN id = 5 THEN '2024-05-01 11:15:00'
        ELSE GETDATE()
    END
WHERE status = 'Reserved';



ALTER TABLE Nurse_Rating
DROP CONSTRAINT FK__Nurse_Rat__nurse__339FAB6E ;



ALTER TABLE Nurse_Rating
DROP COLUMN nurse_id;


ALTER TABLE Doctor_Rating
DROP CONSTRAINT FK__Doctor_Ra__docto__40F9A68C;


ALTER TABLE Doctor_Rating
DROP COLUMN doctor_id;




-----------------------------------------------------------

ALTER TABLE temp_nurse
ADD Accepted BIT DEFAULT 0;

ALTER TABLE temp_doctor
ADD Accepted BIT DEFAULT 0;


UPDATE temp_nurse
SET Accepted = 1
WHERE name IN ('Nora Mostafa', 'Yasmin Hassan', 'Mariam Saeed');

UPDATE temp_doctor
SET Accepted = 1
WHERE name IN ('Ahmed Rashwan', 'Hassan Abdulrahman', 'Ramy Abdelrahim');


--------------------------------------------------------------------------------------------------

ALTER TABLE Doctor_Available_Appointments
DROP CONSTRAINT CHK_Status;


ALTER TABLE Doctor_Available_Appointments
DROP COLUMN status;



ALTER TABLE Doctor_Available_Appointments
ADD status varchar(20)  DEFAULT 'Available';


ALTER TABLE Doctor_Available_Appointments
ADD CONSTRAINT CHK_Status
CHECK (Status IN ('Available', 'Reserved '));


ALTER TABLE Nurse_Available_Appointments
ADD status varchar(20) DEFAULT 'Available';


ALTER TABLE Nurse_Available_Appointments
ADD CONSTRAINT Nurse_CHK_Status
CHECK (Status IN ('Available', 'Reserved '));




UPDATE Doctor_Available_Appointments
SET status = 'Available'
WHERE appointment_id IN (1, 2, 3);

UPDATE Doctor_Available_Appointments
SET status = 'Reserved'
WHERE appointment_id IN (4, 5);


UPDATE Nurse_Available_Appointments
SET status = 'Available'
WHERE appointment_id IN (2, 4, 5);


UPDATE Nurse_Available_Appointments
SET status = 'Reserved'
WHERE appointment_id IN (3, 1);


ALTER TABLE Nurse_Reservations
ADD CONSTRAINT Nurse_CHK_Status1
CHECK (status IN ('Reserved', 'Completed', 'Canceled'));


ALTER TABLE Doctor_Reservations
ADD CONSTRAINT Doctor_CHK_Status1
CHECK (status IN ('Reserved', 'Completed', 'Canceled'));

----------------------------------------------------------------

ALTER TABLE Medical_Record
DROP CONSTRAINT DF__Medical_R__entry__44CA3770;

ALTER TABLE Medical_Record
DROP COLUMN entry_date;

ALTER TABLE Medical_Record
DROP CONSTRAINT DF__Medical_R__last___45BE5BA9;

ALTER TABLE Medical_Record
DROP COLUMN last_modified;

ALTER TABLE Medical_Record
ADD Reservation_date datetime;



UPDATE Medical_Record
SET Reservation_date = '2024-04-30'
WHERE id = 1;

UPDATE Medical_Record
SET Reservation_date = '2024-05-05'
WHERE id = 2;

 

 -----------------------------------------------------------


ALTER TABLE Doctor
ADD SubscriptionStatus bit NOT NULL DEFAULT 0;


ALTER TABLE Nurse
ADD SubscriptionStatus bit NOT NULL DEFAULT 0;


UPDATE Nurse
SET SubscriptionStatus = 1
WHERE id IN (
    SELECT id FROM (
        VALUES
            (1),
            (2),
            (3),
            (6)
    ) AS x(id)
);


UPDATE Nurse
SET SubscriptionStatus = 1
WHERE id IN (
    SELECT id FROM (
        VALUES
            (1),
            (2),
            (3),
            (6)
    ) AS x(id)
);


UPDATE Doctor
SET SubscriptionStatus = 1
WHERE id IN (
    SELECT id FROM (
        VALUES
            (1),
            (2),
            (3),
            (4),
            (5),
            (6)
    ) AS x(id)
);




INSERT INTO Doctor (name, email, phone, password, gender, available_time_schedule, specialization, provider_id, description, location_id, price, online_price, National_Id, SubscriptionStatus) VALUES 
('Ahmed Ali', 'ahmedali2365@gmail.com', '01234567890', 'Ahmed@@12#', 'Male', 'Mon-Fri: 9am-5pm', 'Cardiology', 2, 'Experienced cardiologist with over 20 years in the field.', 1, 950,  300, '30212095501075', 0),
('Sara Nabil', 'sara.nabil22@gmail.com', '01123456789', '123###Sara', 'Female', 'Tue-Thu: 10am-4pm', 'Dermatology', 2, 'Specialist in skin diseases and treatments.', 3 , 800, 400, '30282095801069', 1);



INSERT INTO Doctor (name, email, phone, password, gender, available_time_schedule, specialization, provider_id, description, location_id, price, online_price, National_Id, SubscriptionStatus) VALUES 

('Hassan Mohamed', 'hassan.mohamed1@gmail.com', '01012345601', 'Hassan123!', 'Male', 'Mon-Fri: 9am-5pm', 'General Medicine', 2, 'General practitioner.', 1, 500, 200, '30212095501001', 1),
('Fatma Youssef', 'fatma.youssef2@gmail.com', '01012345602', 'Fatma456@', 'Female', 'Mon-Fri: 10am-6pm', 'Pediatrics', 2, 'Specialized in child healthcare.', 2, 600, 250, '30212095501002', 0),
('Omar Ahmed', 'omar.ahmed3@gmail.com', '01012345603', 'Omar789#', 'Male', 'Mon-Fri: 8am-4pm', 'Orthopedics', 2, 'Experienced in bone and joint issues.', 3, 700, 300, '30212095501003', 1),
('Laila Samir', 'laila.samir4@gmail.com', '01012345604', 'Laila321$', 'Female', 'Mon-Fri: 9am-5pm', 'Neurology', 2, 'Specialized in nervous system disorders.', 1, 800, 350, '30212095501004', 0),
('Youssef Nabil', 'youssef.nabil5@gmail.com', '01012345605', 'Youssef654&', 'Male', 'Mon-Fri: 10am-6pm', 'Dermatology', 2, 'Specialized in skin treatments.', 2, 900, 400, '30212095501005', 1),
('Salma Hussein', 'salma.hussein6@gmail.com', '01012345606', 'Salma987!', 'Female', 'Mon-Fri: 8am-4pm', 'Gynecology', 2, 'Expert in womens health.', 3, 1000, 450, '30212095501006', 0),
('Khaled Ali', 'khaled.ali7@gmail.com', '01012345607', 'Khaled321%', 'Male', 'Mon-Fri: 9am-5pm', 'Cardiology', 2, 'Experienced in heart diseases.', 1, 1100, 500, '30212095501007', 1),
('Mona Ehab', 'mona.ehab8@gmail.com', '01012345608', 'Mona456$', 'Female', 'Mon-Fri: 10am-6pm', 'Ophthalmology', 2, 'Specialized in eye care.', 2, 1200, 550, '30212095501008', 0),
('Amr Mostafa', 'amr.mostafa9@gmail.com', '01012345609', 'Amr789#', 'Male', 'Mon-Fri: 8am-4pm', 'ENT', 2, 'Expert in ear, nose, and throat.', 3, 1300, 600, '30212095501009', 1),
('Nour Hany', 'nour.hany10@gmail.com', '01012345610', 'Nour321$', 'Female', 'Mon-Fri: 9am-5pm', 'Urology', 2, 'Specialized in urinary system.', 1, 1400, 650, '30212095501010', 0),
('Ahmed Yassin', 'ahmed.yassin11@gmail.com', '01012345611', 'Ahmed654&', 'Male', 'Mon-Fri: 10am-6pm', 'Oncology', 2, 'Specialized in cancer treatment.', 2, 1500, 700, '30212095501011', 1),
('Heba Fathy', 'heba.fathy12@gmail.com', '01012345612', 'Heba987!', 'Female', 'Mon-Fri: 8am-4pm', 'Endocrinology', 2, 'Expert in hormone disorders.', 3, 1600, 750, '30212095501012', 0),
('Mohamed Sami', 'mohamed.sami13@gmail.com', '01012345613', 'Mohamed321%', 'Male', 'Mon-Fri: 9am-5pm', 'Gastroenterology', 2, 'Experienced in digestive system.', 1, 1700, 800, '30212095501013', 1),
('Aya Mahmoud', 'aya.mahmoud14@gmail.com', '01012345614', 'Aya456$', 'Female', 'Mon-Fri: 10am-6pm', 'Rheumatology', 2, 'Specialized in joint diseases.', 2, 1800, 850, '30212095501014', 0),
('Ibrahim Saeed', 'ibrahim.saeed15@gmail.com', '01012345615', 'Ibrahim789#', 'Male', 'Mon-Fri: 8am-4pm', 'Hematology', 2, 'Expert in blood disorders.', 3, 1900, 900, '30212095501015', 1),
('Sara Ahmed', 'sara.ahmed16@gmail.com', '01012345616', 'Sara321$', 'Female', 'Mon-Fri: 9am-5pm', 'Immunology', 2, 'Specialized in immune system.', 1, 2000, 950, '30212095501016', 0),
('Hossam Tamer', 'hossam.tamer17@gmail.com', '01012345617', 'Hossam654&', 'Male', 'Mon-Fri: 10am-6pm', 'Nephrology', 2, 'Specialized in kidney care.', 2, 2100, 1000, '30212095501017', 1),
('Nadia Fadel', 'nadia.fadel18@gmail.com', '01012345618', 'Nadia987!', 'Female', 'Mon-Fri: 8am-4pm', 'Pulmonology', 2, 'Expert in lung diseases.', 3, 2200, 1050, '30212095501018', 0),
('Ali Nabil', 'ali.nabil19@gmail.com', '01012345619', 'Ali321%', 'Male', 'Mon-Fri: 9am-5pm', 'Hepatology', 2, 'Experienced in liver diseases.', 1, 2300, 1100, '30212095501019', 1),
('Maha Tarek', 'maha.tarek20@gmail.com', '01012345620', 'Maha456$', 'Female', 'Mon-Fri: 10am-6pm', 'Psychiatry', 2, 'Specialized in mental health.', 2, 2400, 1150, '30212095501020', 0),
('Yassin Wael', 'yassin.wael21@gmail.com', '01012345621', 'Yassin789#', 'Male', 'Mon-Fri: 8am-4pm', 'Pathology', 2, 'Expert in disease diagnosis.', 3, 2500, 1200, '30212095501021', 1),
('Hanaa Khaled', 'hanaa.khaled22@gmail.com', '01012345622', 'Hanaa321$', 'Female', 'Mon-Fri: 9am-5pm', 'Anesthesiology', 2, 'Specialized in anesthesia.', 1, 2600, 1250, '30212095501022', 0),
('Samir Kamal', 'samir.kamal23@gmail.com', '01012345623', 'Samir654&', 'Male', 'Mon-Fri: 10am-6pm', 'Radiology', 2, 'Expert in medical imaging.', 2, 2700, 1300, '30212095501023', 1),
('Yara Nader', 'yara.nader24@gmail.com', '01012345624', 'Yara987!', 'Female', 'Mon-Fri: 8am-4pm', 'Obstetrics', 2, 'Experienced in childbirth.', 3, 2800, 1350, '30212095501024', 0),
('Moustafa Sami', 'moustafa.sami25@gmail.com', '01012345625', 'Moustafa321%', 'Male', 'Mon-Fri: 9am-5pm', 'Geriatrics', 2, 'Specialized in elderly care.', 1, 2900, 1400, '30212095501025', 1),
('Amira Zaki', 'amira.zaki26@gmail.com', '01012345626', 'Amira456$', 'Female', 'Mon-Fri: 10am-6pm', 'Sports Medicine', 2, 'Expert in sports injuries.', 2, 3000, 1450, '30212095501026', 0),
('Karim Tarek', 'karim.tarek27@gmail.com', '01012345627', 'Karim789#', 'Male', 'Mon-Fri: 8am-4pm', 'Occupational Medicine', 2, 'Experienced in work-related injuries.', 3, 3100, 1500, '30212095501027', 1),
('Lamis Salah', 'lamis.salah28@gmail.com', '01012345628', 'Lamis321$', 'Female', 'Mon-Fri: 9am-5pm', 'Palliative Care', 2, 'Specialized in end-of-life care.', 1, 3200, 1550, '30212095501028', 0),
('Rami Hassan', 'rami.hassan29@gmail.com', '01012345629', 'Rami654&', 'Male', 'Mon-Fri: 10am-6pm', 'Preventive Medicine', 2, 'Expert in disease prevention.', 2, 3300, 1600, '30212095501029', 1),
('Dina Omar', 'dina.omar30@gmail.com', '01012345630', 'Dina987!', 'Female', 'Mon-Fri: 8am-4pm', 'Rehabilitation Medicine', 2, 'Experienced in patient rehabilitation.', 3, 3400, 1650, '30212095501030', 0),
('Youssef Ali', 'youssef.ali31@gmail.com', '01012345631', 'Youssef321%', 'Male', 'Mon-Fri: 9am-5pm', 'Sleep Medicine', 2, 'Specialized in sleep disorders.', 1, 3500, 1700, '30212095501031', 1),
('Hala Ehab', 'hala.ehab32@gmail.com', '01012345632', 'Hala456$', 'Female', 'Mon-Fri: 10am-6pm', 'Allergy Medicine', 2, 'Expert in allergic conditions.', 2, 3600, 1750, '30212095501032', 0),
('Khaled Adel', 'khaled.adel33@gmail.com', '01012345633', 'Khaled789#', 'Male', 'Mon-Fri: 8am-4pm', 'Genetics', 2, 'Specialized in genetic disorders.', 3, 3700, 1800, '30212095501033', 1),
('Lamia Nasser', 'lamia.nasser34@gmail.com', '01012345634', 'Lamia321$', 'Female', 'Mon-Fri: 9am-5pm', 'Adolescent Medicine', 2, 'Experienced in teenage health.', 1, 3800, 1850, '30212095501034', 0),
('Omar Khalil', 'omar.khalil35@gmail.com', '01012345635', 'Omar654&', 'Male', 'Mon-Fri: 10am-6pm', 'Pain Management', 2, 'Expert in chronic pain relief.', 2, 3900, 1900, '30212095501035', 1),
('Nour Ahmed', 'nour.ahmed36@gmail.com', '01012345636', 'Nour987!', 'Female', 'Mon-Fri: 8am-4pm', 'Clinical Pharmacology', 2, 'Specialized in drug therapy.', 3, 4000, 1950, '30212095501036', 0),
('Hassan Ali', 'hassan.ali37@gmail.com', '01012345637', 'Hassan321%', 'Male', 'Mon-Fri: 9am-5pm', 'Tropical Medicine', 2, 'Experienced in tropical diseases.', 1, 4100, 2000, '30212095501037', 1),
('Mona Ibrahim', 'mona.ibrahim38@gmail.com', '01012345638', 'Mona456$', 'Female', 'Mon-Fri: 10am-6pm', 'Travel Medicine', 2, 'Expert in travel-related health issues.', 2, 4200, 2050, '30212095501038', 0),
('Ali Karim', 'ali.karim39@gmail.com', '01012345639', 'Ali789#', 'Male', 'Mon-Fri: 8am-4pm', 'Undersea Medicine', 2, 'Specialized in underwater health.', 3, 4300, 2100, '30212095501039', 1),
('Salma Hassan', 'salma.hassan40@gmail.com', '01012345640', 'Salma321$', 'Female', 'Mon-Fri: 9am-5pm', 'Aviation Medicine', 2, 'Experienced in flight health.', 1, 4400, 2150, '30212095501040', 0),
('Mohamed Youssef', 'mohamed.youssef41@gmail.com', '01012345641', 'Mohamed654&', 'Male', 'Mon-Fri: 10am-6pm', 'Addiction Medicine', 2, 'Specialized in addiction treatment.', 2, 4500, 2200, '30212095501041', 1),
('Nadia Salem', 'nadia.salem42@gmail.com', '01012345642', 'Nadia987!', 'Female', 'Mon-Fri: 8am-4pm', 'Nuclear Medicine', 2, 'Expert in radiological health.', 3, 4600, 2250, '30212095501042', 0),
('Yasser Ali', 'yasser.ali43@gmail.com', '01012345643', 'Yasser321%', 'Male', 'Mon-Fri: 9am-5pm', 'Military Medicine', 2, 'Experienced in military health.', 1, 4700, 2300, '30212095501043', 1),
('Lina Samir', 'lina.samir44@gmail.com', '01012345644', 'Lina456$', 'Female', 'Mon-Fri: 10am-6pm', 'Occupational Health', 2, 'Specialized in workplace health.', 2, 4800, 2350, '30212095501044', 0),
('Mustafa Nasser', 'mustafa.nasser45@gmail.com', '01012345645', 'Mustafa789#', 'Male', 'Mon-Fri: 8am-4pm', 'Community Health', 2, 'Expert in community health.', 3, 4900, 2400, '30212095501045', 1),
('Heba Ali', 'heba.ali46@gmail.com', '01012345646', 'Heba321$', 'Female', 'Mon-Fri: 9am-5pm', 'Public Health', 2, 'Experienced in public health initiatives.', 1, 5000, 2450, '30212095501046', 0),
('Fady Khaled', 'fady.khaled47@gmail.com', '01012345647', 'Fady654&', 'Male', 'Mon-Fri: 10am-6pm', 'Home Health', 2, 'Specialized in home care services.', 2, 5100, 2500, '30212095501047', 1),
('Maya Omar', 'maya.omar48@gmail.com', '01012345648', 'Maya987!', 'Female', 'Mon-Fri: 8am-4pm', 'Telemedicine', 2, 'Expert in online medical services.', 3, 5200, 2550, '30212095501048', 0);

INSERT INTO Nurse (name, email, phone, password, gender, available_time_schedule, provider_id, description, location_id, National_Id, SubscriptionStatus) VALUES 
('Omar Mostafa', 'omar.mahmoud22@gmail.com', '01087654321', 'Omar##456', 'Male', 'Tue-Thu: 10am-4pm', 1, 'Skilled nurse with expertise in emergency care.', 1 , '30282095801069', 0);



INSERT INTO Nurse (name, email, phone, password, gender, available_time_schedule, provider_id, description, location_id, National_Id, SubscriptionStatus) 
VALUES 
('Sara Ali', 'sara.ali1@gmail.com', '01123456789', 'Sara##123', 'Female', 'Mon-Wed: 9am-3pm', 1, 'Experienced nurse specializing in surgical care.', 2, '30212095501001', 1),
('Ahmed Hassan', 'ahmed.hassan2@gmail.com', '01012345678', 'Ahmed##789', 'Male', 'Thu-Sat: 11am-5pm', 1, 'Nurse with a background in pediatric care.', 3, '30212095501002', 0),
('Nadia Mohamed', 'nadia.mohamed3@gmail.com', '01098765432', 'Nadia##321', 'Female', 'Mon-Fri: 8am-4pm', 1, 'Registered nurse focusing on elder care.', 1, '30212095501003', 1),
('Mohamed Samir', 'mohamed.samir4@gmail.com', '01056789123', 'Mohamed##456', 'Male', 'Tue-Thu: 10am-4pm', 1, 'Emergency room nurse with critical care experience.', 2, '30212095501004', 0),
('Fatma Omar', 'fatma.omar5@gmail.com', '01067891234', 'Fatma##789', 'Female', 'Wed-Fri: 1pm-7pm', 1, 'Nurse specialized in oncology treatment.', 3, '30212095501005', 1),
('Ali Ibrahim', 'ali.ibrahim6@gmail.com', '01078912345', 'Ali##123', 'Male', 'Mon-Wed: 9am-3pm', 1, 'Intensive care unit nurse with extensive ICU training.', 1, '30212095501006', 0),
('Hana Youssef', 'hana.youssef7@gmail.com', '01089123456', 'Hana##456', 'Female', 'Thu-Sat: 11am-5pm', 1, 'Nurse practitioner skilled in primary care.', 2, '30212095501007', 1),
('Khaled Salma', 'khaled.salma8@gmail.com', '01091234567', 'Khaled##789', 'Male', 'Mon-Fri: 8am-4pm', 1, 'Cardiac nurse with expertise in heart health.', 3, '30212095501008', 0),
('Laila Yassin', 'laila.yassin9@gmail.com', '01012345678', 'Laila##123', 'Female', 'Tue-Thu: 10am-4pm', 1, 'Community health nurse dedicated to public health.', 1, '30212095501009', 1),
('Omar Mona', 'omar.mona10@gmail.com', '01023456789', 'Omar##456', 'Male', 'Wed-Fri: 1pm-7pm', 1, 'Registered nurse with a focus on mental health.', 2, '30212095501010', 0),
('Sara Amr', 'sara.amr11@gmail.com', '01034567890', 'Sara##789', 'Female', 'Mon-Wed: 9am-3pm', 1, 'Nurse practitioner specializing in family medicine.', 3, '30212095501011', 1),
('Youssef Nour', 'youssef.nour12@gmail.com', '01045678901', 'Youssef##123', 'Male', 'Thu-Sat: 11am-5pm', 1, 'Pediatric nurse dedicated to childrens health.', 1, '30212095501012', 0),
('Salma Ahmed', 'salma.ahmed13@gmail.com', '01056789012', 'Salma##456', 'Female', 'Mon-Fri: 8am-4pm', 1, 'Emergency room nurse with critical care experience.', 2, '30212095501013', 1),
('Ahmed Heba', 'ahmed.heba14@gmail.com', '01067890123', 'Ahmed##789', 'Male', 'Tue-Thu: 10am-4pm', 1, 'Geriatric nurse specialized in elder care.', 3, '30212095501014', 0),
('Mona Tamer', 'mona.tamer15@gmail.com', '01078901234', 'Mona##123', 'Female', 'Wed-Fri: 1pm-7pm', 1, 'Nurse focused on surgical recovery and care.', 1, '30212095501015', 1),
('Amr Hossam', 'amr.hossam16@gmail.com', '01089123456', 'Amr##456', 'Male', 'Mon-Wed: 9am-3pm', 1, 'Clinical nurse with expertise in acute care.', 2, '30212095501016', 0),
('Nour Maha', 'nour.maha17@gmail.com', '01091234567', 'Nour##789', 'Female', 'Thu-Sat: 11am-5pm', 1, 'Nurse specializing in diabetes management.', 3, '30212095501017', 1),
('Ali Yara', 'ali.yara18@gmail.com', '01012345678', 'Ali##123', 'Male', 'Mon-Fri: 8am-4pm', 1, 'Oncology nurse with experience in chemotherapy.', 1, '30212095501018', 0),
('Maha Yassin', 'maha.yassin19@gmail.com', '01023456789', 'Maha##456', 'Female', 'Tue-Thu: 10am-4pm', 1, 'Psychiatric nurse focusing on mental health care.', 2, '30212095501019', 1),
('Yassin Hana', 'yassin.hana20@gmail.com', '01034567890', 'Yassin##789', 'Male', 'Wed-Fri: 1pm-7pm', 1, 'Home health nurse providing care in patients homes.', 3, '30212095501020', 0),
('Hana Samir', 'hana.samir21@gmail.com', '01045678901', 'Hana##123', 'Female', 'Mon-Wed: 9am-3pm', 1, 'Critical care nurse specializing in ICU patient care.', 1, '30212095501021', 1),
('Samir Yara', 'samir.yara22@gmail.com', '01056789012', 'Samir##456', 'Male', 'Thu-Sat: 11am-5pm', 1, 'Emergency department nurse with trauma experience.', 2, '30212095501022', 0),
('Yara Hossam', 'yara.hossam23@gmail.com', '01067890123', 'Yara##789', 'Female', 'Mon-Fri: 8am-4pm', 1, 'Nurse practitioner specializing in womens health.', 3, '30212095501023', 1),
('Hossam Nada', 'hossam.nada24@gmail.com', '01078901234', 'Hossam##123', 'Male', 'Tue-Thu: 10am-4pm', 1, 'Community health nurse promoting preventive care.', 1, '30212095501024', 0),
('Nada Mahmoud', 'nada.mahmoud25@gmail.com', '01089123456', 'Nada##456', 'Female', 'Wed-Fri: 1pm-7pm', 1, 'Registered nurse with experience in chronic disease management.', 2, '30212095501025', 1),
('Mahmoud Salma', 'mahmoud.salma26@gmail.com', '01091234567', 'Mahmoud##789', 'Male', 'Mon-Wed: 9am-3pm', 1, 'Nurse educator providing training and education in healthcare settings.', 3, '30212095501026', 0),
('Salma Ali', 'salma.ali27@gmail.com', '01012345678', 'Salma##123', 'Female', 'Thu-Sat: 11am-5pm', 1, 'Pediatric nurse specializing in childhood vaccinations.', 1, '30212095501027', 1),
('Ali Hana', 'ali.hana28@gmail.com', '01023456789', 'Ali##456', 'Male', 'Mon-Fri: 8am-4pm', 1, 'Clinical nurse with a focus on patient-centered care.', 2, '30212095501028', 0),
('Hana Ahmed', 'hana.ahmed29@gmail.com', '01034567890', 'Hana##789', 'Female', 'Tue-Thu: 10am-4pm', 1, 'Emergency room nurse with trauma care experience.', 3, '30212095501029', 1),
('Ahmed Yara', 'ahmed.yara30@gmail.com', '01045678901', 'Ahmed##123', 'Male', 'Wed-Fri: 1pm-7pm', 1, 'Cardiac nurse with expertise in heart disease management.', 1, '30212095501030', 0),
('Yara Amr', 'yara.amr31@gmail.com', '01056789012', 'Yara##456', 'Female', 'Mon-Wed: 9am-3pm', 1, 'Emergency room nurse with experience in trauma care.', 2, '30212095501031', 1),
('Amr Nour', 'amr.nour32@gmail.com', '01067890123', 'Amr##789', 'Male', 'Thu-Sat: 11am-5pm', 1, 'Nurse practitioner specializing in family medicine.', 3, '30212095501032', 0),
('Nour Ali', 'nour.ali33@gmail.com', '01078901234', 'Nour##123', 'Female', 'Mon-Fri: 8am-4pm', 1, 'Psychiatric nurse providing mental health assessments and therapies.', 1, '30212095501033', 1),
('Ali Maha', 'ali.maha34@gmail.com', '01089123456', 'Ali##456', 'Male', 'Tue-Thu: 10am-4pm', 1, 'Critical care nurse trained in advanced life support techniques.', 2, '30212095501034', 0),
('Maha Yassin', 'maha.yassin35@gmail.com', '01091234567', 'Maha##789', 'Female', 'Wed-Fri: 1pm-7pm', 1, 'Home health nurse providing personalized care in patients homes.', 3, '30212095501035', 1),
('Yassin Hana', 'yassin.hana36@gmail.com', '01012345678', 'Yassin##123', 'Male', 'Mon-Wed: 9am-3pm', 1, 'Registered nurse with expertise in geriatric care.', 1, '30212095501036', 0),
('Hana Samir', 'hana.samir37@gmail.com', '01023456789', 'Hana##456', 'Female', 'Thu-Sat: 11am-5pm', 1, 'Nurse specializing in pediatric critical care.', 2, '30212095501037', 1),
('Samir Yara', 'samir.yara38@gmail.com', '01034567890', 'Samir##789', 'Male', 'Mon-Fri: 8am-4pm', 1, 'Emergency department nurse with experience in trauma care.', 3, '30212095501038', 0),
('Yara Hossam', 'yara.hossam39@gmail.com', '01045678901', 'Yara##123', 'Female', 'Tue-Thu: 10am-4pm', 1, 'Nurse practitioner specializing in womens health.', 1, '30212095501039', 1),
('Hossam Nada', 'hossam.nada40@gmail.com', '01056789012', 'Hossam##456', 'Male', 'Wed-Fri: 1pm-7pm', 1, 'Community health nurse promoting preventive care.', 2, '30212095501040', 0);



INSERT INTO [User] (email, name, phone, password, geographical_area, gender) VALUES 
('ahmedali2365@gmail.com', 'Ahmed Ali', '01234567890', 'Ahmed@@12#', 'Cairo', 'Male'),
('sara.nabil22@gmail.com', 'Sara Nabil', '01123456789', '123###Sara', 'Alexandria', 'Female'),
('amina.hassan@example.com', 'Amina Hassan', '01012345678', 'Amina@123', 'Giza', 'Female'),
('omar.mahmoud@example.com', 'Omar Mahmoud', '01087654321', 'Omar##456', 'Cairo', 'Male');


INSERT INTO [User] (email, name, phone, password, geographical_area, gender) 
VALUES 
('fatma.youssef@example.com', 'Fatma Youssef', '01098765432', 'Fatma456@', 'Alexandria', 'Female'),
('ali.ibrahim@example.com', 'Ali Ibrahim', '01087654321', 'Ali##123', 'Giza', 'Male'),
('nadia.mohamed@example.com', 'Nadia Mohamed', '01076543210', 'Nadia##789', 'Cairo', 'Female'),
('mohamed.samir@example.com', 'Mohamed Samir', '01065432109', 'Mohamed##123', 'Alexandria', 'Male'),
('nour.amr@example.com', 'Nour Amr', '01054321098', 'Nour##456', 'Giza', 'Female'),
('omar.tamer@example.com', 'Omar Tamer', '01043210987', 'Omar##789', 'Cairo', 'Male'),
('laila.ahmed@example.com', 'Laila Ahmed', '01032109876', 'Laila##123', 'Alexandria', 'Female'),
('youssef.salma@example.com', 'Youssef Salma', '01021098765', 'Youssef##456', 'Giza', 'Male'),
('heba.hassan@example.com', 'Heba Hassan', '01010987654', 'Heba##789', 'Cairo', 'Female'),
('ahmed.hassan@example.com', 'Ahmed Hassan', '01098765432', 'Ahmed##123', 'Alexandria', 'Male'),
('nada.ali@example.com', 'Nada Ali', '01087654321', 'Nada##456', 'Giza', 'Female'),
('mahmoud.yara@example.com', 'Mahmoud Yara', '01076543210', 'Mahmoud##789', 'Cairo', 'Male'),
('salma.khaled@example.com', 'Salma Khaled', '01065432109', 'Salma##123', 'Alexandria', 'Female'),
('amr.nadia@example.com', 'Amr Nadia', '01054321098', 'Amr##456', 'Giza', 'Male'),
('yara.omar@example.com', 'Yara Omar', '01043210987', 'Yara##789', 'Cairo', 'Female'),
('tamer.laila@example.com', 'Tamer Laila', '01032109876', 'Tamer##123', 'Alexandria', 'Male'),
('sara.youssef@example.com', 'Sara Youssef', '01021098765', 'Sara##456', 'Giza', 'Female'),
('omar.heba@example.com', 'Omar Heba', '01010987654', 'Omar##789', 'Cairo', 'Male'),
('nadia.ahmed@example.com', 'Nadia Ahmed', '01098765432', 'Nadia##123', 'Alexandria', 'Female'),
('mohamed.nada@example.com', 'Mohamed Nada', '01087654321', 'Mohamed##456', 'Giza', 'Male'),
('fatma.mahmoud@example.com', 'Fatma Mahmoud', '01076543210', 'Fatma##789', 'Cairo', 'Female'),
('ali.salma@example.com', 'Ali Salma', '01065432109', 'Ali##123', 'Alexandria', 'Male'),
('nour.amr2@example.com', 'Nour Amr', '01054321098', 'Nour##456', 'Giza', 'Female'),
('omar.tamer2@example.com', 'Omar Tamer', '01043210987', 'Omar##789', 'Cairo', 'Male');








INSERT INTO Service (name, Description) VALUES
('Physical Therapy', 'Treatment of physical impairments through exercises and manual therapy.');

INSERT INTO Service (name, Description) VALUES
('Occupational Therapy', 'Assistance with daily activities to improve independence and cognitive function.');

INSERT INTO Service (name, Description) VALUES
('Medication Management', 'Administration, monitoring, and documentation of prescribed medications.');

INSERT INTO Service (name, Description) VALUES
('Dietary Planning and Monitoring', 'Creation and monitoring of personalized meal plans for optimal health.');

INSERT INTO Service (name, Description) VALUES
('Speech Therapy', 'Treatment of communication disorders and swallowing difficulties.');






INSERT INTO Nurse_Service (nurse_id, service_id, price) VALUES (1, 6, 65.00);
INSERT INTO Nurse_Service (nurse_id, service_id, price) VALUES (1, 7, 85.00);
INSERT INTO Nurse_Service (nurse_id, service_id, price) VALUES (1, 8, 90.00);
INSERT INTO Nurse_Service (nurse_id, service_id, price) VALUES (1, 9, 95.00);

INSERT INTO Nurse_Service (nurse_id, service_id, price) VALUES (2, 3, 105.00);
INSERT INTO Nurse_Service (nurse_id, service_id, price) VALUES (2, 5, 110.00);
INSERT INTO Nurse_Service (nurse_id, service_id, price) VALUES (2, 6, 75.00);
INSERT INTO Nurse_Service (nurse_id, service_id, price) VALUES (2, 7, 65.00);

INSERT INTO Nurse_Service (nurse_id, service_id, price) VALUES (3, 1, 80.00);
INSERT INTO Nurse_Service (nurse_id, service_id, price) VALUES (3, 2, 90.00);
INSERT INTO Nurse_Service (nurse_id, service_id, price) VALUES (3, 3, 95.00);
INSERT INTO Nurse_Service (nurse_id, service_id, price) VALUES (3, 5, 70.00);

INSERT INTO Nurse_Service (nurse_id, service_id, price) VALUES (4, 1, 80.00);
INSERT INTO Nurse_Service (nurse_id, service_id, price) VALUES (4, 2, 90.00);
INSERT INTO Nurse_Service (nurse_id, service_id, price) VALUES (4, 3, 60.00);
INSERT INTO Nurse_Service (nurse_id, service_id, price) VALUES (4, 4, 85.00);

INSERT INTO Nurse_Service (nurse_id, service_id, price) VALUES (5, 3, 75.00);
INSERT INTO Nurse_Service (nurse_id, service_id, price) VALUES (5, 4, 65.00);
INSERT INTO Nurse_Service (nurse_id, service_id, price) VALUES (5, 5, 55.00);
INSERT INTO Nurse_Service (nurse_id, service_id, price) VALUES (5, 6, 95.00);

DECLARE @nurse_id INT = 6;
WHILE @nurse_id <= 47
BEGIN
    INSERT INTO Nurse_Service (nurse_id, service_id, price) VALUES (@nurse_id, 1, ROUND(RAND() * (100 - 50) + 50, 2));
    INSERT INTO Nurse_Service (nurse_id, service_id, price) VALUES (@nurse_id, 2, ROUND(RAND() * (100 - 50) + 50, 2));
    INSERT INTO Nurse_Service (nurse_id, service_id, price) VALUES (@nurse_id, 3, ROUND(RAND() * (100 - 50) + 50, 2));
    INSERT INTO Nurse_Service (nurse_id, service_id, price) VALUES (@nurse_id, 4, ROUND(RAND() * (100 - 50) + 50, 2));
    INSERT INTO Nurse_Service (nurse_id, service_id, price) VALUES (@nurse_id, 5, ROUND(RAND() * (100 - 50) + 50, 2));
    SET @nurse_id = @nurse_id + 1;
END;





UPDATE Nurse SET description = 'Omar Elbana is a highly experienced nurse providing exceptional patient care in Egypt. With a strong background in medical and surgical nursing, he excels in administering treatments, monitoring patient progress, and ensuring comfort. His compassionate approach and attention to detail make him a valuable asset in home healthcare. Omar is proficient in handling emergency situations and managing chronic illnesses, ensuring his patients receive continuous and comprehensive care. He is committed to enhancing patient quality of life and fostering a supportive environment for both patients and their families.' WHERE id = 1;

UPDATE Nurse SET description = 'Yousif Yasser is a compassionate and dedicated nurse committed to delivering top-quality care to patients in their homes. With extensive experience in chronic disease management and post-operative care, he ensures patients receive personalized attention and effective treatment plans. Yousifs empathetic nature and professionalism make him a trusted healthcare provider. He is skilled in patient education and empowerment, helping individuals manage their health conditions with confidence. Yousif also collaborates closely with other healthcare professionals to provide coordinated and holistic care.' WHERE id = 2;

UPDATE Nurse SET description = 'Mahmoud Adel is a skilled nurse with a comprehensive understanding of patient care in a home setting. His expertise includes wound care, medication administration, and patient education. Mahmoud is known for his reliability, strong communication skills, and ability to provide support and comfort to patients and their families. He takes a patient-centered approach, ensuring that each individuals unique needs and preferences are met. Mahmoud is also adept at managing complex medical conditions, providing ongoing monitoring and intervention as needed.' WHERE id = 3;

UPDATE Nurse SET description = 'Sherif Mostafa is a detail-oriented nurse who excels in providing high-quality care to patients in Egypt. His specialties include geriatric care, chronic illness management, and rehabilitation support. Sherifs dedication to patient well-being and his methodical approach ensure that each patient receives individualized and thorough care. He is experienced in developing and implementing comprehensive care plans, promoting patient autonomy and recovery. Sherif also prioritizes building strong relationships with patients and their families, fostering trust and communication.' WHERE id = 4;

UPDATE Nurse SET description = 'Ezzat Fadel is an energetic and dedicated nurse with a passion for home healthcare. He has extensive experience in emergency care, pediatrics, and chronic disease management. Ezzats proactive approach, combined with his ability to handle complex medical situations, makes him an excellent choice for home-based patient care. He focuses on providing personalized care, ensuring that each patient receives the attention and treatment they need. Ezzat is also committed to continuous learning and staying updated with the latest healthcare practices.' WHERE id = 5;

UPDATE Nurse SET description = 'Mostafa Shehata is a dedicated nurse with a strong background in patient-centered care. He specializes in post-surgical care, chronic disease management, and patient rehabilitation. Mostafas commitment to excellence and his compassionate care approach ensure that his patients receive the best possible treatment and support. He is adept at creating individualized care plans that address the unique needs of each patient. Mostafa is also skilled in educating patients and their families about health management, promoting better outcomes and well-being.' WHERE id = 6;

UPDATE Nurse SET description = 'Sara Ali is an experienced nurse providing comprehensive home healthcare services. She excels in pediatric care, chronic illness management, and patient education. Saras empathetic nature, combined with her strong clinical skills, makes her a valuable caregiver who ensures patients receive tailored and effective care. She is dedicated to building trusting relationships with her patients and their families, fostering a supportive and caring environment. Sara is also proactive in coordinating with other healthcare professionals to deliver holistic and integrated care.' WHERE id = 7;

UPDATE Nurse SET description = 'Ahmed Hassan is a nurse with extensive experience in providing home-based care for patients with a variety of medical needs. His expertise includes critical care, chronic disease management, and patient education. Ahmeds commitment to patient well-being and his ability to deliver high-quality care make him a reliable healthcare provider. He is skilled in emergency response and managing acute medical conditions, ensuring patient safety and recovery. Ahmed also focuses on continuous improvement and professional development to stay current in the field.' WHERE id = 8;

UPDATE Nurse SET description = 'Nadia Mohamed is a registered nurse specializing in home healthcare. She has a wealth of experience in wound care, medication management, and patient education. Nadias thorough and compassionate approach ensures that her patients receive the best possible care, promoting their recovery and well-being. She is dedicated to providing personalized care that meets the unique needs of each patient. Nadia is also proactive in educating patients and their families, helping them understand and manage health conditions effectively.' WHERE id = 9;

UPDATE Nurse SET description = 'Mohamed Salah is an emergency care nurse providing top-notch home healthcare services. He has extensive experience in acute care, trauma management, and chronic illness support. Mohameds proactive and responsive approach ensures that his patients receive timely and effective care. He is skilled in handling high-pressure situations and making critical decisions to ensure patient safety. Mohamed is also committed to ongoing education and training, enhancing his skills and knowledge to provide the best possible care.' WHERE id = 10;

UPDATE Nurse SET description = 'Fatma Omar is a nurse specializing in home healthcare with a focus on chronic disease management and patient rehabilitation. She has a wealth of experience in developing and implementing care plans tailored to each patients needs. Fatmas compassionate and patient-centered approach ensures that her patients receive comprehensive and empathetic care. She is also skilled in patient education, helping individuals and their families understand and manage health conditions effectively. Fatma is dedicated to continuous professional development, staying updated with the latest healthcare advancements.' WHERE id = 11;

UPDATE Nurse SET description = 'Ali Ibrahim is an intensive care nurse with extensive experience in providing home healthcare services. His expertise includes managing critical conditions, post-operative care, and chronic disease management. Alis calm and composed demeanor in high-stress situations ensures that his patients receive the best possible care. He is also skilled in patient and family education, promoting understanding and effective health management. Ali is committed to maintaining the highest standards of care and continuously improving his skills through ongoing education and training.' WHERE id = 12;

UPDATE Nurse SET description = 'Hana Youssef is a nurse practitioner with a focus on home healthcare. She has extensive experience in managing chronic illnesses, providing post-operative care, and supporting patient rehabilitation. Hanas patient-centered approach ensures that each individual receives personalized and effective care. She is also skilled in developing comprehensive care plans and educating patients and their families about health management. Hana is dedicated to fostering a supportive and caring environment, promoting patient well-being and recovery.' WHERE id = 13;

UPDATE Nurse SET description = 'Khaled Salama is a cardiac nurse providing specialized home healthcare services. He has a strong background in managing cardiac conditions, post-operative care, and patient education. Khaleds thorough and compassionate approach ensures that his patients receive the highest quality of care. He is skilled in monitoring and managing complex medical conditions, promoting patient recovery and well-being. Khaled is also dedicated to continuous learning and professional development, staying updated with the latest advancements in cardiac care.' WHERE id = 14;

UPDATE Nurse SET description = 'Laila Yassin is a community health nurse with extensive experience in providing home healthcare services. She specializes in chronic disease management, maternal and child health, and patient education. Lailas empathetic and proactive approach ensures that her patients receive comprehensive and personalized care. She is dedicated to building strong relationships with her patients and their families, fostering trust and communication. Laila is also committed to ongoing education and training, enhancing her skills and knowledge to provide the best possible care.' WHERE id = 15;

UPDATE Nurse SET description = 'Omar Mona is a registered nurse with a focus on home healthcare. He has extensive experience in wound care, medication management, and chronic disease support. Omars compassionate and patient-centered approach ensures that his patients receive the highest quality of care. He is skilled in developing individualized care plans that address each patients unique needs. Omar is also dedicated to patient education, helping individuals and their families understand and manage health conditions effectively. He is committed to continuous professional development, staying updated with the latest healthcare advancements.' WHERE id = 16;

UPDATE Nurse SET description = 'Sara Amr is a nurse practitioner providing comprehensive home healthcare services. She has extensive experience in managing chronic illnesses, providing post-operative care, and supporting patient rehabilitation. Saras patient-centered approach ensures that each individual receives personalized and effective care. She is skilled in developing and implementing comprehensive care plans, promoting patient autonomy and recovery. Sara is also dedicated to building strong relationships with her patients and their families, fostering trust and communication.' WHERE id = 17;

UPDATE Nurse SET description = 'Youssef Nour is a pediatric nurse with extensive experience in providing home healthcare services. He specializes in pediatric care, chronic illness management, and patient education. Youssefs empathetic and proactive approach ensures that his young patients receive comprehensive and personalized care. He is dedicated to building strong relationships with his patients and their families, fostering trust and communication. Youssef is also committed to ongoing education and training, enhancing his skills and knowledge to provide the best possible care.' WHERE id = 18;

UPDATE Nurse SET description = 'Salma Ahmed is a registered nurse with a focus on home healthcare. She has extensive experience in wound care, medication management, and chronic disease support. Salmas compassionate and patient-centered approach ensures that her patients receive the highest quality of care. She is skilled in developing individualized care plans that address each patients unique needs. Salma is also dedicated to patient education, helping individuals and their families understand and manage health conditions effectively. She is committed to continuous professional development, staying updated with the latest healthcare advancements.' WHERE id = 19;




UPDATE Doctor SET available_time_schedule = 'Mon: 9am-1pm, Wed: 2pm-6pm, Fri: 9am-12pm' WHERE name = 'Adel Foda';
UPDATE Doctor SET available_time_schedule = 'Tue: 10am-2pm, Thu: 1pm-5pm, Sat: 9am-12pm' WHERE name = 'Abdel Fattah';
UPDATE Doctor SET available_time_schedule = 'Wed: 8am-12pm, Fri: 1pm-4pm, Sun: 10am-1pm' WHERE name = 'Ahmed Shawqi';
UPDATE Doctor SET available_time_schedule = 'Mon: 1pm-4pm, Tue: 9am-12pm, Thu: 3pm-6pm' WHERE name = 'Ahmed Dabash';
UPDATE Doctor SET available_time_schedule = 'Wed: 10am-1pm, Fri: 2pm-5pm, Sat: 10am-1pm' WHERE name = 'Salem Azab';
UPDATE Doctor SET available_time_schedule = 'Mon: 8am-11am, Thu: 9am-12pm, Sun: 1pm-4pm' WHERE name = 'Ahmed Hassan';
UPDATE Doctor SET available_time_schedule = 'Tue: 2pm-5pm, Fri: 9am-12pm, Sat: 2pm-5pm' WHERE name = 'Ahmed Ali';
UPDATE Doctor SET available_time_schedule = 'Wed: 9am-12pm, Thu: 2pm-5pm, Sun: 10am-1pm' WHERE name = 'Sara Nabil';
UPDATE Doctor SET available_time_schedule = 'Mon: 9am-1pm, Wed: 2pm-6pm, Fri: 10am-2pm' WHERE name = 'Hassan Mohamed';
UPDATE Doctor SET available_time_schedule = 'Tue: 8am-12pm, Thu: 1pm-5pm, Sat: 9am-1pm' WHERE name = 'Fatma Youssef';
UPDATE Doctor SET available_time_schedule = 'Mon: 10am-2pm, Wed: 8am-12pm, Fri: 1pm-5pm' WHERE name = 'Omar Ahmed';
UPDATE Doctor SET available_time_schedule = 'Tue: 9am-1pm, Thu: 2pm-6pm, Sun: 10am-2pm' WHERE name = 'Laila Samir';
UPDATE Doctor SET available_time_schedule = 'Mon: 11am-3pm, Wed: 1pm-5pm, Sat: 8am-12pm' WHERE name = 'Youssef Nabil';
UPDATE Doctor SET available_time_schedule = 'Tue: 10am-2pm, Thu: 9am-1pm, Sun: 1pm-5pm' WHERE name = 'Salma Hussein';
UPDATE Doctor SET available_time_schedule = 'Mon: 12pm-4pm, Wed: 8am-12pm, Fri: 2pm-6pm' WHERE name = 'Khaled Ali';
UPDATE Doctor SET available_time_schedule = 'Tue: 11am-3pm, Thu: 10am-2pm, Sat: 1pm-5pm' WHERE name = 'Mona Ehab';
UPDATE Doctor SET available_time_schedule = 'Mon: 8am-12pm, Wed: 11am-3pm, Sun: 9am-1pm' WHERE name = 'Amr Mostafa';
UPDATE Doctor SET available_time_schedule = 'Tue: 9am-1pm, Thu: 2pm-6pm, Fri: 10am-2pm' WHERE name = 'Nour Hany';
UPDATE Doctor SET available_time_schedule = 'Mon: 10am-2pm, Wed: 9am-1pm, Sat: 2pm-6pm' WHERE name = 'Ahmed Yassin';
UPDATE Doctor SET available_time_schedule = 'Tue: 8am-12pm, Thu: 1pm-5pm, Sun: 10am-2pm' WHERE name = 'Heba Fathy';
UPDATE Doctor SET available_time_schedule = 'Mon: 11am-3pm, Wed: 2pm-6pm, Fri: 9am-1pm' WHERE name = 'Mohamed Sami';
UPDATE Doctor SET available_time_schedule = 'Tue: 9am-1pm, Thu: 8am-12pm, Sun: 1pm-5pm' WHERE name = 'Aya Mahmoud';
UPDATE Doctor SET available_time_schedule = 'Mon: 10am-2pm, Wed: 1pm-5pm, Sat: 8am-12pm' WHERE name = 'Ibrahim Saeed';
UPDATE Doctor SET available_time_schedule = 'Tue: 11am-3pm, Thu: 9am-1pm, Fri: 2pm-6pm' WHERE name = 'Sara Ahmed';
UPDATE Doctor SET available_time_schedule = 'Mon: 8am-12pm, Wed: 10am-2pm, Sun: 9am-1pm' WHERE name = 'Hossam Tamer';
UPDATE Doctor SET available_time_schedule = 'Tue: 10am-2pm, Thu: 11am-3pm, Sat: 1pm-5pm' WHERE name = 'Nadia Fadel';
UPDATE Doctor SET available_time_schedule = 'Mon: 9am-1pm, Wed: 8am-12pm, Fri: 11am-3pm' WHERE name = 'Ali Nabil';
UPDATE Doctor SET available_time_schedule = 'Tue: 12pm-4pm, Thu: 10am-2pm, Sun: 8am-12pm' WHERE name = 'Maha Tarek';
UPDATE Doctor SET available_time_schedule = 'Mon: 1pm-5pm, Wed: 9am-1pm, Fri: 10am-2pm' WHERE name = 'Yassin Wael';
UPDATE Doctor SET available_time_schedule = 'Tue: 8am-12pm, Thu: 2pm-6pm, Sat: 9am-1pm' WHERE name = 'Hanaa Khaled';
UPDATE Doctor SET available_time_schedule = 'Mon: 2pm-6pm, Wed: 10am-2pm, Fri: 8am-12pm' WHERE name = 'Samir Kamal';
UPDATE Doctor SET available_time_schedule = 'Tue: 11am-3pm, Thu: 9am-1pm, Sun: 10am-2pm' WHERE name = 'Yara Nader';
UPDATE Doctor SET available_time_schedule = 'Mon: 9am-1pm, Wed: 2pm-6pm, Fri: 1pm-5pm' WHERE name = 'Moustafa Sami';
UPDATE Doctor SET available_time_schedule = 'Tue: 10am-2pm, Thu: 11am-3pm, Sat: 8am-12pm' WHERE name = 'Amira Zaki';
UPDATE Doctor SET available_time_schedule = 'Mon: 11am-3pm, Wed: 8am-12pm, Sun: 2pm-6pm' WHERE name = 'Karim Tarek';
UPDATE Doctor SET available_time_schedule = 'Tue: 9am-1pm, Thu: 1pm-5pm, Fri: 10am-2pm' WHERE name = 'Lamis Salah';
UPDATE Doctor SET available_time_schedule = 'Mon: 8am-12pm, Wed: 9am-1pm, Sat: 1pm-5pm' WHERE name = 'Rami Hassan';
UPDATE Doctor SET available_time_schedule = 'Tue: 12pm-4pm, Thu: 8am-12pm, Sun: 10am-2pm' WHERE name = 'Dina Omar';
UPDATE Doctor SET available_time_schedule = 'Mon: 10am-2pm, Wed: 11am-3pm, Fri: 9am-1pm' WHERE name = 'Youssef Ali';
UPDATE Doctor SET available_time_schedule = 'Tue: 9am-1pm, Thu: 2pm-6pm, Sat: 10am-2pm' WHERE name = 'Hala Ehab';
UPDATE Doctor SET available_time_schedule = 'Mon: 1pm-5pm, Wed: 8am-12pm, Fri: 11am-3pm' WHERE name = 'Khaled Adel';
UPDATE Doctor SET available_time_schedule = 'Tue: 8am-12pm, Thu: 10am-2pm, Sun: 1pm-5pm' WHERE name = 'Lamia Nasser';
UPDATE Doctor SET available_time_schedule = 'Mon: 9am-1pm, Wed: 1pm-5pm, Sat: 8am-12pm' WHERE name = 'Omar Khalil';
UPDATE Doctor SET available_time_schedule = 'Tue: 10am-2pm, Thu: 9am-1pm, Fri: 2pm-6pm' WHERE name = 'Nour Ahmed';
UPDATE Doctor SET available_time_schedule = 'Mon: 11am-3pm, Wed: 10am-2pm, Sun: 9am-1pm' WHERE name = 'Hassan Ali';
UPDATE Doctor SET available_time_schedule = 'Tue: 9am-1pm, Thu: 8am-12pm, Sat: 2pm-6pm' WHERE name = 'Mona Ibrahim';
UPDATE Doctor SET available_time_schedule = 'Mon: 10am-2pm, Wed: 11am-3pm, Fri: 8am-12pm' WHERE name = 'Ali Karim';
UPDATE Doctor SET available_time_schedule = 'Tue: 8am-12pm, Thu: 1pm-5pm, Sun: 10am-2pm' WHERE name = 'Salma Hassan';
UPDATE Doctor SET available_time_schedule = 'Mon: 1pm-5pm, Wed: 9am-1pm, Fri: 10am-2pm' WHERE name = 'Mohamed Youssef';
UPDATE Doctor SET available_time_schedule = 'Tue: 12pm-4pm, Thu: 2pm-6pm, Sat: 9am-1pm' WHERE name = 'Nadia Salem';
UPDATE Doctor SET available_time_schedule = 'Mon: 8am-12pm, Wed: 10am-2pm, Sun: 11am-3pm' WHERE name = 'Yasser Ali';
UPDATE Doctor SET available_time_schedule = 'Tue: 9am-1pm, Thu: 11am-3pm, Fri: 8am-12pm' WHERE name = 'Lina Samir';
UPDATE Doctor SET available_time_schedule = 'Mon: 11am-3pm, Wed: 1pm-5pm, Sat: 9am-1pm' WHERE name = 'Mustafa Nasser';
UPDATE Doctor SET available_time_schedule = 'Tue: 8am-12pm, Thu: 9am-1pm, Sun: 10am-2pm' WHERE name = 'Heba Ali';
UPDATE Doctor SET available_time_schedule = 'Mon: 12pm-4pm, Wed: 10am-2pm, Fri: 9am-1pm' WHERE name = 'Fady Khaled';
UPDATE Doctor SET available_time_schedule = 'Tue: 9am-1pm, Thu: 2pm-6pm, Sat: 10am-2pm' WHERE name = 'Maya Omar';




Update Location Set location_name = 'Toukh' Where id = 2 ; 
Update Location Set location_name = 'kafr shukr' Where id = 3 ; 





