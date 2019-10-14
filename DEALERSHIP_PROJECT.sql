CREATE DATABASE dealership

CREATE TABLE Car(
	car_id SERIAL PRIMARY KEY,
	serial_number INTEGER,
	make VARCHAR(100) NOT NULL,
	color VARCHAR(100) NOT NULL,
	model VARCHAR(100) NOT NULL,
	year INTEGER,
	sale_y_n VARCHAR(100)
);


CREATE TABLE Invoice(
	invoice_id SERIAL PRIMARY KEY,
	invoice_number INTEGER NOT NULL,
	date DATE,
	car_id SERIAL NOT NULL,
	customer_id SERIAL NOT NULL ,
	salesperson_id SERIAL NOT NULL,
	FOREIGN KEY(car_id) REFERENCES Car(car_id),
	FOREIGN KEY(customer_id) REFERENCES Customers(customer_id),
	FOREIGN KEY (salesperson_id) REFERENCES Salesperson(salesperson_id)
);

CREATE TABLE Salesperson(
	salesperson_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100)
);


CREATE TABLE Customers(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	address VARCHAR(300),
	phone_number VARCHAR(15),
	city VARCHAR(100),
	state VARCHAR(100),
	country VARCHAR(100),
	zip_code VARCHAR(15)
);

CREATE TABLE ServiceTicket(
	service_ticket_id SERIAL PRIMARY KEY,
	date_recieved Date,
	comments VARCHAR(300),
	date_returned Date,
	car_id SERIAL NOT NULL,
	mechanic_id SERIAL NOT NULL,
	FOREIGN KEY(car_id) REFERENCES Car(car_id),
	FOREIGN KEY(mechanic_id) REFERENCES Mechanic(mechanic_id)
);


CREATE TABLE Mechanic(
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100)
);
	
CREATE TABLE ServiceHistory(
	service_id SERIAL PRIMARY KEY,
	service_name VARCHAR(250),
	hour_rate NUMERIC(8,2)
);

CREATE TABLE Parts(
	part_id SERIAL PRIMARY KEY,
	part_number VARCHAR(100),
	part_used VARCHAR(100),
	number_used VARCHAR(100),
	description VARCHAR(500),
	purchase_price NUMERIC(8,2),
	rental_price NUMERIC(8,2),
	service_ticket_id INTEGER
);

CREATE TABLE CarService(
	service_mechanic_id SERIAL PRIMARY KEY,
	hours DATE,
	comments VARCHAR(300),
	rating NUMERIC(8,2),
	service_ticket_id INTEGER NOT NULL,
	service_id INTEGER NOT NULL,
	mechanic_id INTEGER NOT NULL,
	FOREIGN KEY(service_ticket_id) REFERENCES ServiceTicket(service_ticket_id),
	FOREIGN KEY(service_id) REFERENCES ServiceHistory(service_id),
	FOREIGN KEY(mechanic_id) REFERENCES Mechanic(mechanic_id)
);


INSERT INTO Car(car_id,serial_number,make,color,model,year,sale_y_n)
VALUES(1,1,'Jeep','Black','Commander',2015,'Yes');
INSERT INTO Car(car_id,serial_number,make,color,model,year,sale_y_n)
VALUES (2,2,'Voltzwagon','Blue','Beatle',2012,'No');
INSERT INTO Car(car_id,serial_number,make,color,model,year,sale_y_n)
VALUES (3,3,'Toyota','White','Corolla',2019,'Yes');

INSERT INTO Salesperson(salesperson_id,first_name,last_name)
VALUES(1,'Jimmy','Neutron');
INSERT INTO Salesperson(salesperson_id,first_name,last_name)
VALUES(2,'Albert','Einstein');
INSERT INTO Salesperson(salesperson_id,first_name,last_name)
VALUES(3,'Spongebob', 'Squarepants');
INSERT INTO Salesperson(salesperson_id,first_name,last_name)
VALUES(4,'Peter','Parker');

INSERT INTO ServiceTicket(service_ticket_id,date_recieved,comments,date_returned,car_id,mechanic_id)
VALUES(1,'2020-08-18','comments!!!!!','2021-08-18',1,1);

INSERT INTO Invoice(invoice_id,invoice_number,date,car_id,customer_id,salesperson_id)
VALUES(1,1,'2012-08-14',1,1,1);

INSERT INTO Customers(customer_id,first_name,last_name,address,phone_number,city,state,country,zip_code)
VALUES(1,'Austin','Griffin','222 E Chestnut St.','1-343-4566','St. Charles','IL','USA','60175');
INSERT INTO Customers(customer_id,first_name,last_name,address,phone_number,city,state,country,zip_code)
VALUES(2,'Buzz','Bearrick','1234 LA Cali','1-347-8886','Los Angelis','CA','USA','122456');
INSERT INTO Customers(customer_id,first_name,last_name,address,phone_number,city,state,country,zip_code)
VALUES(3,'Peter','Pabon','222 E Chestnut St.','1-555-7486','Chicago','IL','USA','60166');

INSERT INTO CarService(service_mechanic_id,hours,comments,rating,service_ticket_id,service_id,mechanic_id)
VALUES(1,'2012-05-11','Comments everywhere!',5555,1,1,1);

INSERT INTO Mechanic(mechanic_id,first_name,last_name)
VALUES(1,'Reggie','Bush');
INSERT INTO Mechanic(mechanic_id,first_name,last_name)
VALUES(2,'Rock P.','Scissors');

INSERT INTO ServiceHistory(service_id,service_name,hour_rate)
VALUES(1,'Oil change',55664);
INSERT INTO ServiceHistory(service_id,service_name,hour_rate)
VALUES(2,'Spare Tire',583849);
INSERT INTO ServiceHistory(service_id,service_name,hour_rate)
VALUES(3,'Broken Headlight',99797);


INSERT INTO Parts(part_id,part_number,part_used,number_used,description,purchase_price,rental_price,service_ticket_id)
VALUES(1,'15','muffler','15','Great condition',2445,222,4);INSERT INTO Parts(part_id,part_number,part_used,number_used,description,purchase_price,rental_price,service_ticket_id)
INSERT INTO Parts(part_id,part_number,part_used,number_used,description,purchase_price,rental_price,service_ticket_id)
VALUES(2,'18','Windshield','42','Spotless',3000,400,5);





