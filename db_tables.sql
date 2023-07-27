CREATE TABLE Engine_Manufacturer (
	engine_model CHAR(50) PRIMARY KEY,
	company_name CHAR(100)
);

CREATE TABLE Car (
	car_model CHAR(50) PRIMARY KEY
);

CREATE TABLE Car_Engine (
	engine_model CHAR(50) NOT NULL,
	car_model CHAR(50),
	PRIMARY KEY (engine_model, car_model),
	FOREIGN KEY (engine_model) REFERENCES Engine_Manufacturer(engine_model) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (car_model) REFERENCES Car(car_model) ON DELETE CASCADE ON UPDATE CASCADE
);
	
CREATE TABLE Principal (
	name CHAR(50) PRIMARY KEY
);

CREATE TABLE Driver (
	name CHAR(50),
	driver_number INTEGER,
	points INTEGER,
	PRIMARY KEY (name)
);

CREATE TABLE Team (
	principle_name CHAR(50) NOT NULL,
	car_model CHAR(50) NOT NULL,
	team_name CHAR(50),
	year YEAR ON DELETE CASCADE,
	season_year YEAR,
	points INTEGER,
	PRIMARY KEY (team_name, year),
	FOREIGN KEY (principle) REFERENCES Principle(name) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (car_model) REFERENCES Car(car_model) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (session_yaer) REFERENCES Season(season_year) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Team_Driver (
	driver_name CHAR(50),
	team_name CHAR(50),
	year YEAR,
	PRIMARY KEY (driver_name, team_name, year),
	FOREIGN KEY (driver_name) REFERENCES Driver(name) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (team_name, year) REFERENCES Team(team_name, year) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Season_Champion (
	year INTEGER PRIMARY KEY,
	driver_name CHAR(50) NOT NULL,
	FOREIGN KEY (driver_name) REFERENCES Driver(name) ON DELETE CASCADE ON UPDATE CASCADE)
);

CREATE TABLE Sponsor (
	sponsor_name CHAR(50) PRIMARY KEY
);

CREATE TABLE Team_Sponsor (
	team_name CHAR(50),
	year YEAR,
	sponsor_name,
	PRIMARY KEY (team_name, year, sponsor_name),
	FOREIGN KEY (team_name, year) REFERENCES Team(team_name, year) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (sponsor_name) REFERENCES Sponsor(sponsor_name) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Season (
	season_year YEAR
);

CREATE TABLE Race (
	p1 CHAR(50),
	p2 CHAR(50),
	p3 CHAR(50),
	qp1 CHAR(50),
	qp2 CHAR(50),
	qp3 CHAR(50),
	country CHAR(50),
	fastest_lap INTEGER,
	circuit_name CHAR(50),
	season_year YEAR,
	sc_model CHAR(50),
	PRIMARY KEY (season_year, circuit_name),
	FORIEGN KEY (season_year) REFERENCES Season(season_year) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (sc_model) REFERENCES Saftey_Car(model) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Lap_Record_Set
	(time CHAR(8) PRIMARY KEY,
	circuit_name CHAR(50),
	driver_name CHAR(50) NOT NULL,
	year INTEGER,
	FOREIGN KEY (driver_name) REFERENCES Driver(name) ON DELETE CASCADE ON UPDATE CASCADE
 );

CREATE TABLE Safety_Car (
	model CHAR(50) PRIMARY KEY,
	manufacturer CHAR(50))
);
