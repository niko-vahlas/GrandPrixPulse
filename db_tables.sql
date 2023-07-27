CREATE TABLE Engine_Manufacturer (
	engine_model CHAR(50) PRIMARY KEY,
	company_name CHAR(100)
);

CREATE TABLE Car (
	car_model CHAR(50) PRIMARY KEY
);

CREATE TABLE Car_Engine (
	engine_model CHAR(50),
	car_model CHAR(50),
	PRIMARY KEY (engine_model, car_model),
	FOREIGN KEY (engine_model) REFERENCES Engine_Manufacturer(model) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (car_model) REFERENCES Car(model) ON DELETE CASCADE ON UPDATE CASCADE
);
	
CREATE TABLE Principal (
	name CHAR(50) PRIMARY KEY
);

CREATE TABLE Driver (
	name CHAR(50) PRIMARY KEY,
	career_points FLOAT,
	career_wins INTEGER
);

CREATE TABLE Team (
	name CHAR(50), 
	year INTEGER, 
	points INTEGER, 
	team_program CHAR(50), 
	season_year INTEGER NOT NULL, 
	car_model CHAR(50) NOT NULL, 
	principal_name CHAR(50) NOT NULL, 
	PRIMARY KEY (name, year), 
	FOREIGN KEY (principal) REFERENCES Principal(name) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (car_model) REFERENCES Car(model) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (season_year) REFERENCES Season(year) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Drives_For (
	driver_name CHAR(50),
	team_name CHAR(50),
	year INTEGER,
	PRIMARY KEY (driver_name, team_name, year),
	FOREIGN KEY (driver_name) REFERENCES Driver(name) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (team_name, year) REFERENCES Team(name, year) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Season_Champion (
	year INTEGER PRIMARY KEY,
	driver_name CHAR(50) NOT NULL,
	FOREIGN KEY (driver_name) REFERENCES Driver(name) ON DELETE CASCADE ON UPDATE CASCADE)
);

CREATE TABLE Sponsor (
	name CHAR(50) PRIMARY KEY
);

CREATE TABLE Pays_For (
	team_name CHAR(50),
	team_year INTEGER,
	sponsor_name CHAR(50),
	PRIMARY KEY (team_name, year, sponsor_name),
	FOREIGN KEY (team_name, year) REFERENCES Team(name, year) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (sponsor_name) REFERENCES Sponsor(name) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Season (
	year INTEGER
);

CREATE TABLE Race (
	p1 CHAR(50),
	p2 CHAR(50),
	p3 CHAR(50),
	qp1 CHAR(50),
	qp2 CHAR(50),
	qp3 CHAR(50),
	country CHAR(50),
	fastest_lap CHAR(8),
	circuit CHAR(50),
	year INTEGER,
	safety_car_model CHAR(50),
	PRIMARY KEY (year, circuit),
	FORIEGN KEY (year) REFERENCES Season(year) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (safety_car_model) REFERENCES Saftey_Car(model) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Lap_Record_Set (
	time CHAR(8) PRIMARY KEY,
	circuit_name CHAR(50),
	driver_name CHAR(50) NOT NULL,
	year INTEGER,
	FOREIGN KEY (driver_name) REFERENCES Driver(name) ON DELETE CASCADE ON UPDATE CASCADE
 );

CREATE TABLE Safety_Car (
	model CHAR(50) PRIMARY KEY,
	manufacturer CHAR(50))
);
