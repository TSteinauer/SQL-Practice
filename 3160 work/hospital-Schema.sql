DROP DATABASE IF EXISTS hospital;
CREATE DATABASE hospital;
USE hospital ;
create table if not exists patient (
patient_id int not null auto_increment,
 address varchar(50),
 name  varchar(20) null, 
 phone_number int, 
primary key (patient_id)
);

create table if not exists health_record(
patient_id int not null auto_increment, 
description varchar(100) null, 
date DATE null, 
status varchar(50) null,
primary key (patient_id),
foreign key (patient_id) REFERENCES patient(patient_ID) );

create table if not exists room(
room_num int not null auto_increment,
 capacity int,
 fee_per_night int,
primary key (room_num));

create table if not exists hospitalized(
room_num int auto_increment not null,
 patient_id int not null, 
 duration_days int,
primary key(room_num, patient_id),
foreign key (room_num) references room(room_num),
foreign key(patient_id) references patient(patient_ID)); 

create table if not exists invoice(
invoice_no int auto_increment not null, 
patient_id int, 
date date, 
instruction_fee int, 
room_fee int, 
room_num int,
primary key (invoice_no, patient_id),
foreign key (patient_id) references patient(patient_id),
foreign key (room_num) references room(room_num));

create table if not exists payment(
invoice_no int auto_increment not null,
 patient_id int not null,
 date date ,
 total int null,
primary key (invoice_no, patient_id),
foreign key (patient_id) references patient(patient_ID), 
foreign key (invoice_no) references invoice(invoice_no));

create table if not exists nurse(
nurse_id int not null auto_increment,
 name varchar(50),
 certification_no int,
 address varchar(50),
 phone_no int,
primary key (nurse_id));

create table if not exists physician(
physician_id int not null auto_increment,
 name varchar(50),
 phone_no int,
 certification_no int,
 field varchar(50),
 address varchar(50),
primary key(physician_id));

create table if not exists execution(
code int not null auto_increment,
 nurse_id int ,
 patient_id int,
 status varchar(50),
primary key (code),
foreign key (patient_id) references patient(patient_id),
foreign key (nurse_id) references  nurse(nurse_id));

create table if not exists instruction(
code int auto_increment not null,
 instruction_fee int, 
 description varchar(50), 
 physician_id int,
primary key (code),
foreign key (code) references execution(code),
foreign key (instruction_fee) references invoice(instruction_fee),
foreign key (physician_id) references physician(physician_id));

create table if not exists Medication(
med_id int not null auto_increment, 
name varchar(50), 
patient_num int,
 dosage int, 
 exp_date date,
Primary key (med_id, patient_num),
Foreign key (patient_num) references Patient(patient_ID));

create table if not exists pharmacy(
pharmID int not null auto_increment, 
name varchar(50), 
med_id int, 
address varchar(50), 
phone_no varchar(10), 
med_name varchar(50),
Primary key (pharmID),
Foreign key  (patient_id) references patient(patient_id), 
foreign key (med_id) references medication(med_id),
foreign key (med_name) references medication(name));










 




