DROP DATABASE IF EXISTS NHL;
CREATE DATABASE NHL;
USE NHL;

CREATE TABLE IF NOT EXISTS customer (
driver_id int auto_increment not null, 
driver_name varchar(50) not null, 
address varchar(100) not null,
primary key(driver_id)
);

CREATE TABLE IF NOT EXISTS car(
 license_number int auto_increment not null ,
 model varchar(50) null, 
 year int  null,
 driver_id int not null,
 PRIMARY KEY(license_number),
 FOREIGN KEY(driver_id) REFERENCES customer(driver_id));
 
CREATE TABLE IF NOT EXISTS accident(
report_number int not null auto_increment, 
date datetime null,
location varchar(50) not null,
primary key(report_number));

create table participated(
license int, 
report_number int,
driver_ID int,
damage_amount int,
PRIMARY KEY(driver_ID,license,report_number),
FOREIGN KEY(license) REFERENCES car(license_number),
FOREIGN KEY(driver_ID) REFERENCES customer(driver_id),
FOREIGN KEY(report_number) REFERENCES accident(report_number));
