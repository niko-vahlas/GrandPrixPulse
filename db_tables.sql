CREATE TABLE Engine_Manufacturer
	(engine_model CHAR(50) PRIMARY KEY,
	company_name CHAR(100));

CREATE TABLE Car
	(car_model CHAR(50) PRIMARY KEY);

CREATE TABLE Car-Engine
	(car_model CHAR(50),
	engine_model CHAR(50),
	PRIMARY KEY (car_model, engine_model),
	FOREIGN KEY (car_model) REFERENCES Car(car_model),
	FOREIGN KEY (engine_model) REFERENCES Engine_Manufacturer(engine_model));
	
CREATE TABLE Principal
	(name CHAR(50) PRIMARY KEY);

CREATE TABLE Driver
	(name CHAR(50) PRIMARY KEY,
	driver_number INTEGER);

CREATE TABLE Team
	(principle_name CHAR(50) NOT NULL,
	car_model CHAR(50) NOT NULL,
	team_name CHAR(50),
	year INTEGER,
	points INTEGER,
	PRIMARY KEY (team_name, year),
	FOREIGN KEY (principle) REFERENCES Principle(name)
	FOREIGN KEY (car_model) REFERENCES Car(car_model));
