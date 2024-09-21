--USERTABLE--
create table userr(email_id varchar(100) primary key, contact int,gender varchar(1),username varchar(50),dob int, fname varchar(50), mname varchar(50),lname varchar(50) );
select * from userr;
ALTER TABLE userr ADD COLUMN t_id INT;
ALTER TABLE userr ADD CONSTRAINT fk_t_id FOREIGN KEY (t_id) REFERENCES Transaction_t(trans_id);
ALTER TABLE userr ADD CONSTRAINT unique_username UNIQUE (username);


--Transcation table--
Create table Transaction_t(trans_id varchar(15)primary key ,amount int,time_of_transaction int );
select * from Transaction_t;
ALTER TABLE Transaction_t ADD COLUMN user_id VARCHAR(50);
ALTER TABLE Transaction_t ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES userr(username);

--Ticket Table--
CREATE TABLE ticket (
    Ticket_no INT PRIMARY KEY,
    date INT,
    time INT,
    airport VARCHAR(50),
    seat_no VARCHAR(5),
    trans_id VARCHAR(15),
    Flight_id VARCHAR(10),
    user_id VARCHAR(50),
    FOREIGN KEY (trans_id) REFERENCES Transaction_t(trans_id),
    FOREIGN KEY (Flight_id) REFERENCES Flight(Flight_id),
    FOREIGN KEY (user_id) REFERENCES userr(username)
);

SELECT * FROM ticket;



--flight Table--
create table flight( Flight_id varchar(10), sourcee char(40), destination char(40));
select * from flight;
ALTER TABLE flight ADD CONSTRAINT uq_flight_id UNIQUE (Flight_id);

--office table--
create table office (
loc_id int primary key, 
dept_id int,
ssn int, 
superlocation int,
name char(50),
trans_id varchar(15), 
user_id varchar(50),
FOREIGN KEY (trans_id) REFERENCES Transaction_t(trans_id),
 FOREIGN KEY (user_id) REFERENCES userr(username),
 FOREIGN KEY (dept_id) REFERENCES depatment(dept_id),
 FOREIGN KEY (ssn) REFERENCES employee(ssn),
 foreign key (superlocation) references office(Loc_id) );

 select * from office;


--Department table--


