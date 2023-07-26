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
	FOREIGN KEY (engine_model) REFERENCES Engine_Manufacturer(engine_model),
	FOREIGN KEY (car_model) REFERENCES Car(car_model)
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
	FOREIGN KEY (principle) REFERENCES Principle(name),
	FOREIGN KEY (car_model) REFERENCES Car(car_model),
	FOREIGN KEY (session_yaer) REFERENCES Season(season_year)
);

CREATE TABLE Team_Driver (
	driver_name CHAR(50),
	team_name CHAR(50),
	year YEAR,
	PRIMARY KEY (driver_name, team_name, year),
	FOREIGN KEY (driver_name) REFERENCES Driver(name),
	FOREIGN KEY (team_name, year) REFERENCES Team(team_name, year)
);

CREATE TABLE Sponsor (
	sponsor_name CHAR(50) PRIMARY KEY
);

CREATE TABLE Team_Sponsor (
	team_name CHAR(50),
	year YEAR,
	sponsor_name,
	PRIMARY KEY (team_name, year, sponsor_name),
	FOREIGN KEY (team_name, year) REFERENCES Team(team_name, year),
	FOREIGN KEY (sponsor_name) REFERENCES Sponsor(sponsor_name)
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
	fastest_lap INTEGER,
	circuit_name CHAR(50),
	season_year YEAR,
	PRIMARY KEY (season_year, circuit_name),
	FORIEGN KEY (season_year) REFERENCES Season(season_year)
);

CREATE TABLE Lap_Record (
	time REAL,
	year YEAR,
	circuit_name CHAR(50),
	PRIMARY KEY (time, circuit_name)
);

CREATE TABLE Set_Record (
	driver_name CHAR(50),
	time REAL,
	PRIMARY KEY (driver_name, time),
	FOREIGN KEY (driver_name) REFERENCES Driver(name),
	FOREIGN KEY (time) REFERENCES Lap_Record(time)
);
