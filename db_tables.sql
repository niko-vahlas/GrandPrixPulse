CREATE TABLE Engine_Manufacturer (
	model CHAR(50) PRIMARY KEY,
	company_name CHAR(100)
);

CREATE TABLE Car (
	model CHAR(50) PRIMARY KEY
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

CREATE TABLE Season (
	year INTEGER PRIMARY KEY
);

CREATE TABLE Team1 (
	name CHAR(50), 
	year INTEGER, 
	points INTEGER, 
	car_model CHAR(50) NOT NULL, 
	principal_name CHAR(50) NOT NULL, 
	PRIMARY KEY (name, year), 
	FOREIGN KEY (principal_name) REFERENCES Principal(name) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (car_model) REFERENCES Car(model) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Team2 (
	year INTEGER PRIMARY KEY, 
	season_year INTEGER NOT NULL, 
	FOREIGN KEY (season_year) REFERENCES Season(year) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Team3 (
	name CHAR(50) PRIMARY KEY, 
	team_program CHAR(50)
);

CREATE TABLE Drives_For (
	driver_name CHAR(50),
	team_name CHAR(50),
	year INTEGER,
	PRIMARY KEY (driver_name, team_name, year),
	FOREIGN KEY (driver_name) REFERENCES Driver(name) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (team_name, year) REFERENCES Team1(name, year) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Season_Champion (
	year INTEGER PRIMARY KEY,
	driver_name CHAR(50) NOT NULL,
	FOREIGN KEY (driver_name) REFERENCES Driver(name) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Sponsor (
	name CHAR(50) PRIMARY KEY
);

CREATE TABLE Pays_For (
	team_name CHAR(50),
	team_year INTEGER,
	sponsor_name CHAR(50),
	PRIMARY KEY (team_name, team_year, sponsor_name),
	FOREIGN KEY (team_name, team_year) REFERENCES Team1(name, year) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (sponsor_name) REFERENCES Sponsor(name) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Safety_Car (
	model CHAR(50) PRIMARY KEY,
	manufacturer CHAR(50)
);

CREATE TABLE Race1 (
	p1 CHAR(50),
	p2 CHAR(50),
	p3 CHAR(50),
	qp1 CHAR(50),
	qp2 CHAR(50),
	qp3 CHAR(50),
	fastest_lap CHAR(50),
	circuit CHAR(50),
	year INTEGER,
	safety_car_model CHAR(50),
	PRIMARY KEY (year, circuit),
	FOREIGN KEY (year) REFERENCES Season(year) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (safety_car_model) REFERENCES Safety_Car(model) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Race2 (
	circuit CHAR(50) PRIMARY KEY, 
	country CHAR(50)
	);

CREATE TABLE Lap_Record_Set (
	time CHAR(9),
	circuit_name CHAR(50),
	driver_name CHAR(50) NOT NULL,
	year INTEGER,
	PRIMARY KEY (circuit_name, year),
	FOREIGN KEY (driver_name) REFERENCES Driver(name) ON DELETE CASCADE ON UPDATE CASCADE
 );

INSERT INTO Driver (name, career_points, career_wins) VALUES ('Michael Schumacher', '996.0', '56');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Mika Hakkinen', '126.0', '6');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('David Coulthard', '314.0', '7');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Rubens Barrichello', '581.0', '11');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Ralf Schumacher', '267.0', '6');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Giancarlo Fisichella', '226.0', '3');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Jacques Villeneuve', '55.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Jenson Button', '1235.0', '15');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Heinz-Harald Frentzen', '32.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Jarno Trulli', '235.5', '1');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Mika Salo', '8.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Jos Verstappen', '6.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Eddie Irvine', '18.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Ricardo Zonta', '3.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Alexander Wurz', '21.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Pedro de la Rosa', '34.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Pedro Diniz', '0.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Johnny Herbert', '0.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Marc Gene', '4.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Gaston Mazzacane', '0.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Nick Heidfeld', '259.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Jean Alesi', '5.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Luciano Burti', '0.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Juan Pablo Montoya', '307.0', '7');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Kimi Räikkönen', '1873.0', '21');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Olivier Panis', '20.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Felipe Massa', '1167.0', '11');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Takuma Sato', '44.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Mark Webber', '1047.5', '9');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Allan McNish', '0.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Alex Yoong', '0.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Enrique Bernoldi', '0.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Fernando Alonso', '2061.0', '32');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Cristiano da Matta', '13.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Ralph Firman', '1.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Justin Wilson', '1.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Antonio Pizzonia', '8.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Nicolas Kiesa', '0.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Zsolt Baumgartner', '1.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Christian Klien', '14.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Timo Glock', '51.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Giorgio Pantano', '0.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Gianmaria Bruni', '0.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Tiago Monteiro', '7.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Narain Karthikeyan', '5.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Christijan Albers', '4.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Patrick Friesacher ', '3.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Vitantonio Liuzzi', '26.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Robert Doornbos', '0.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Robert Kubica', '274.0', '1');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Nico Rosberg', '1594.5', '23');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Scott Speed', '0.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Yuji Ide', '0.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Sakon Yamamoto', '0.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Franck Montagny', '0.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Lewis Hamilton', '4405.5', '103');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Heikki Kovalainen', '105.0', '1');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Sebastian Vettel', '3098.0', '53');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Adrian Sutil', '124.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Kazuki Nakajima', '9.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Anthony Davidson', '0.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Nelson Piquet', '19.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Sebastien Bourdais', '6.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Sebastien Buemi', '29.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Kamui Kobayashi', '125.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Romain Grosjean', '391.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Jaime Alguersuari', '31.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Luca Badoer', '0.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Vitaly Petrov', '64.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Nico Hulkenberg', '521.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Karun Chandhok', '0.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Bruno Senna', '33.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Lucas di Grassi', '0.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Paul di Resta', '121.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Sergio Perez', '1201.0', '4');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Pastor Maldonado', '76.0', '1');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Jerome d.Ambrosio', '0.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Daniel Ricciardo', '1311.0', '8');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Jean-Eric Vergne', '51.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Charles Pic', '0.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Esteban Gutierrez ', '6.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Valtteri  Bottas', '716.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Jules Bianchi', '2.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Giedo van der Garde', '0.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Max Chilton', '0.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Kevin Magnussen', '183.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Daniil Kvyat', '202.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Marcus Ericsson', '18.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Will Stevens', '0.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Max Verstappen', '2011.5', '35');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Felipe Nasr', '29.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Carlos Sainz', '782.5', '1');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Roberto Merhi', '0.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Alexander Rossi', '0.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Jolyon Palmer', '9.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Pascal Wehrlein', '6.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Stoffel Vandoorne', '26.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Esteban Ocon', '364.0', '1');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Rio Haryanto', '0.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Lance Stroll', '194.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Pierre Gasly', '332.0', '1');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Antonio Giovinazzi', '21.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Brendon Hartley', '4.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Valtteri Bottas', '1071.0', '10');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Charles Leclerc', '868.0', '5');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Sergey Sirotkin', '1.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Alexander Albon', '201.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Lando Norris', '428.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('George Russell', '294.0', '1');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Nicholas Latifi', '9.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Jack Aitken', '0.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Pietro Fittipaldi', '0.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Yuki Tsunoda', '44.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Mick Schumacher', '12.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Nikita Mazepin', '0.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Guanyu Zhou', '6.0', '0');
INSERT INTO Driver (name, career_points, career_wins) VALUES ('Nyck De Vries', '2.0', '0');





INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2000', 'Australia', 'Rubens Barrichello', '1:31.481');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2000', 'Brazil', 'Michael Schumacher', '1:14.755');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2000', 'San Marino', 'Mika Hakkinen', '1:26.523');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2000', 'Great Britain', 'Mika Hakkinen', '1:26.217');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2000', 'Spain', 'Mika Hakkinen', '1:24.470');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2000', 'Europe', 'Michael Schumacher', '1:22.269');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2000', 'Monaco', 'Mika Hakkinen', '1:21.571');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2000', 'Canada', 'Mika Hakkinen', '1:19.049');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2000', 'France', 'David Coulthard', '1:19.479');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2000', 'Austria', 'David Coulthard', '1:11.783');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2000', 'Germany', 'Rubens Barrichello', '1:44.300');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2000', 'Hungary', 'Mika Hakkinen', '1:20.028');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2000', 'Belgium', 'Rubens Barrichello', '1:53.803');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2000', 'Italy', 'Mika Hakkinen', '1:25.595');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2000', 'United States  ', 'David Coulthard', '1:14.711');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2000', 'Japan', 'Mika Hakkinen', '1:39.189');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2000', 'Malaysia', 'Mika Hakkinen', '1:38.543');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2001', 'Australia', 'Michael Schumacher', '1:28.214');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2001', 'Malaysia', 'Mika Hakkinen', '1:40.962');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2001', 'Brazil', 'Ralf Schumacher', '1:15.693');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2001', 'San Marino', 'Ralf Schumacher', '1:25.524');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2001', 'Spain', 'Michael Schumacher', '1:21.151');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2001', 'Austria', 'David Coulthard', '1:10.843');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2001', 'Monaco', 'David Coulthard', '1:19.424');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2001', 'Canada', 'Ralf Schumacher', '1:17.205');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2001', 'Europe', 'Juan Pablo Montoya', '1:18.354');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2001', 'France', 'David Coulthard', '1:16.088');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2001', 'Great Britain', 'Mika Hakkinen', '1:23.405');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2001', 'Germany', 'Juan Pablo Montoya', '1:41.808');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2001', 'Hungary', 'Mika Hakkinen', '1:16.723');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2001', 'Belgium', 'Michael Schumacher', '1:49.758');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2001', 'Italy', 'Ralf Schumacher', '1:25.073');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2001', 'United States ', 'Juan Pablo Montoya', '1:14.448');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2001', 'Japan', 'Ralf Schumacher', '1:36.944');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2002', 'Australia', 'Kimi Räikkönen', '1:28.541');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2002', 'Malaysia', 'Juan Pablo Montoya', '1:38.049');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2002', 'Brazil', 'Juan Pablo Montoya', '1:16.079');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2002', 'San Marino', 'Rubens Barrichello', '1:24.170');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2002', 'Spain', 'Michael Schumacher', '1:20.355');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2002', 'Austria', 'Michael Schumacher', '1:09.298');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2002', 'Monaco', 'Rubens Barrichello', '1:18.023');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2002', 'Canada', 'Juan Pablo Montoya', '1:15.960');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2002', 'Europe', 'Michael Schumacher', '1:32.226');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2002', 'Great Britain', 'Rubens Barrichello', '1:23.083');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2002', 'France', 'David Coulthard', '1:15.045');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2002', 'Germany', 'Michael Schumacher', '1:16.462');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2002', 'Hungary', 'Michael Schumacher', '1:16.207');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2002', 'Belgium', 'Michael Schumacher', '1:47.176');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2002', 'Italy', 'Rubens Barrichello', '1:23.657');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2002', 'United States ', 'Rubens Barrichello', '1:12.738');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2002', 'Japan', 'Michael Schumacher', '1:36.125');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2003', 'Australia', 'Kimi Räikkönen', '1:27.724');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2003', 'Malaysia', 'Michael Schumacher', '1:36.412');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2003', 'Brazil', 'Rubens Barrichello', '1:22.032');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2003', 'San Marino', 'Michael Schumacher', '1:22.491');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2003', 'Spain', 'Rubens Barrichello', '1:20.143');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2003', 'Austria', 'Michael Schumacher', '1:08.337');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2003', 'Monaco', 'Kimi Räikkönen', '1:14.545');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2003', 'Canada', 'Fernando Alonso', '1:16.040');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2003', 'Europe', 'Kimi Räikkönen', '1:32.621');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2003', 'France', 'Juan Pablo Montoya', '1:15.512');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2003', 'Great Britain', 'Rubens Barrichello', '1:22.236');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2003', 'Germany', 'Juan Pablo Montoya', '1:14.917');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2003', 'Hungary', 'Juan Pablo Montoya', '1:22.095');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2003', 'Italy', 'Michael Schumacher', '1:21.832');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2003', 'United States ', 'Michael Schumacher', '1:11.473');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2003', 'Japan', 'Ralf Schumacher', '1:33.408');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2004', 'Australia', 'Michael Schumacher', '1:24.125');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2004', 'Malaysia', 'Juan Pablo Montoya', '1:34.223');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2004', 'Bahrain', 'Michael Schumacher', '1:30.252');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2004', 'San Marino', 'Michael Schumacher', '1:20.411');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2004', 'Spain', 'Michael Schumacher', '1:17.450');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2004', 'Monaco', 'Michael Schumacher', '1:14.439');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2004', 'Europe', 'Michael Schumacher', '1:29.468');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2004', 'Canada', 'Rubens Barrichello', '1:13.622');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2004', 'United States ', 'Rubens Barrichello', '1:10.399');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2004', 'France', 'Michael Schumacher', '1:15.377');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2004', 'Great Britain', 'Michael Schumacher', '1:18.739');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2004', 'Germany', 'Kimi Räikkönen', '1:13.780');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2004', 'Hungary', 'Michael Schumacher', '1:19.071');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2004', 'Belgium', 'Kimi Räikkönen', '1:45.108');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2004', 'Italy', 'Rubens Barrichello', '1:21.046');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2004', 'China', 'Michael Schumacher', '1:32.238');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2004', 'Japan', 'Rubens Barrichello', '1:32.730');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2004', 'Brazil', 'Juan Pablo Montoya', '1:11.473');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2005', 'Australia', 'Fernando Alonso', '1:25.683');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2005', 'Malaysia', 'Kimi Räikkönen', '1:35.483');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2005', 'Bahrain', 'Pedro de la Rosa', '1:31.447');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2005', 'San Marino', 'Michael Schumacher', '1:21.858');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2005', 'Spain', 'Giancarlo Fisichella', '1:15.641');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2005', 'Monaco', 'Michael Schumacher', '1:15.842');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2005', 'Europe', 'Fernando Alonso', '1:30.711');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2005', 'Canada', 'Kimi Räikkönen', '1:14.384');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2005', 'United States ', 'Michael Schumacher', '1:11.497');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2005', 'France', 'Kimi Räikkönen', '1:16.423');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2005', 'Great Britain', 'Kimi Räikkönen', '1:20.502');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2005', 'Germany', 'Kimi Räikkönen', '1:14.873');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2005', 'Hungary', 'Kimi Räikkönen', '1:21.219');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2005', 'Turkey', 'Juan Pablo Montoya', '1:24.770');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2005', 'Italy', 'Kimi Räikkönen', '1:21.504');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2005', 'Belgium', 'Ralf Schumacher', '1:51.453');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2005', 'Brazil', 'Kimi Räikkönen', '1:12.268');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2005', 'Japan', 'Kimi Räikkönen', '1:31.540');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2005', 'China', 'Kimi Räikkönen', '1:33.242');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2006', 'Bahrain', 'Nico Rosberg', '1:32.408');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2006', 'Malaysia', 'Fernando Alonso', '1:34.803');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2006', 'Australia', 'Kimi Räikkönen', '1:26.045');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2006', 'San Marino', 'Fernando Alonso', '1:24.569');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2006', 'Europe', 'Michael Schumacher', '1:32.099');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2006', 'Spain', 'Felipe Massa', '1:16.648');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2006', 'Monaco', 'Michael Schumacher', '1:15.143');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2006', 'Great Britain', 'Fernando Alonso', '1:21.599');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2006', 'Canada', 'Kimi Räikkönen', '1:15.841');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2006', 'United States ', 'Michael Schumacher', '1:12.719');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2006', 'France', 'Michael Schumacher', '1:17.111');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2006', 'Germany', 'Michael Schumacher', '1:16.357');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2006', 'Hungary', 'Felipe Massa', '1:23.516');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2006', 'Turkey', 'Michael Schumacher', '1:28.005');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2006', 'Italy', 'Kimi Räikkönen', '1:22.559');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2006', 'China', 'Fernando Alonso', '1:37.586');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2006', 'Japan', 'Fernando Alonso', '1:32.676');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2006', 'Brazil', 'Michael Schumacher', '1:12.162');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2007', 'Australia', 'Kimi Räikkönen', '1:25.235');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2007', 'Malaysia', 'Lewis Hamilton', '1:36.701');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2007', 'Bahrain', 'Felipe Massa', '1:34.067');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2007', 'Spain', 'Felipe Massa', '1:22.680');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2007', 'Monaco', 'Fernando Alonso', '1:15.284');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2007', 'Canada', 'Fernando Alonso', '1:16.367');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2007', 'United States ', 'Kimi Räikkönen', '1:13.117');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2007', 'France', 'Felipe Massa', '1:16.099');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2007', 'Great Britain', 'Kimi Räikkönen', '1:20.638');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2007', 'Europe', 'Felipe Massa', '1:32.853');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2007', 'Hungary', 'Kimi Räikkönen', '1:20.047');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2007', 'Turkey', 'Kimi Räikkönen', '1:27.295');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2007', 'Italy', 'Fernando Alonso', '1:22.871');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2007', 'Belgium', 'Felipe Massa', '1:48.036');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2007', 'Japan', 'Lewis Hamilton', '1:28.193');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2007', 'China', 'Felipe Massa', '1:37.454');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2007', 'Brazil', 'Kimi Räikkönen', '1:12.445');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2008', 'Australia', 'Heikki Kovalainen', '1:27.418');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2008', 'Malaysia', 'Nick Heidfeld', '1:35.366');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2008', 'Bahrain', 'Heikki Kovalainen', '1:33.193');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2008', 'Spain', 'Kimi Räikkönen', '1:21.670');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2008', 'Turkey', 'Kimi Räikkönen', '1:26.506');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2008', 'Monaco', 'Kimi Räikkönen', '1:16.689');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2008', 'Canada', 'Kimi Räikkönen', '1:17.387');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2008', 'France', 'Kimi Räikkönen', '1:16.630');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2008', 'Great Britain', 'Kimi Räikkönen', '1:32.150');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2008', 'Germany', 'Nick Heidfeld', '1:15.987');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2008', 'Hungary', 'Kimi Räikkönen', '1:21.195');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2008', 'Europe', 'Felipe Massa', '1:38.708');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2008', 'Belgium', 'Kimi Räikkönen', '1:47.930');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2008', 'Italy', 'Kimi Räikkönen', '1:28.047');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2008', 'Singapore', 'Kimi Räikkönen', '1:45.599');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2008', 'Japan', 'Felipe Massa', '1:18.426');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2008', 'China', 'Lewis Hamilton', '1:36.325');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2008', 'Brazil', 'Felipe Massa', '1:13.736');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2009', 'Australia', 'Nico Rosberg', '1:27.706');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2009', 'Malaysia', 'Jenson Button', '1:36.641');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2009', 'China', 'Rubens Barrichello', '1:52.592');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2009', 'Bahrain', 'Jarno Trulli', '1:34.556');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2009', 'Spain', 'Rubens Barrichello', '1:22.762');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2009', 'Monaco', 'Felipe Massa', '1:15.154');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2009', 'Turkey', 'Jenson Button', '1:27.579');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2009', 'Great Britain', 'Sebastian Vettel', '1:20.735');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2009', 'Germany', 'Fernando Alonso', '1:33.365');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2009', 'Hungary', 'Mark Webber', '1:21.931');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2009', 'Europe', 'Timo Glock', '1:38.683');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2009', 'Belgium', 'Sebastian Vettel', '1:47.263');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2009', 'Italy', 'Adrian Sutil', '1:24.739');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2009', 'Singapore', 'Fernando Alonso', '1:48.240');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2009', 'Japan', 'Mark Webber', '1:32.569');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2009', 'Brazil', 'Mark Webber', '1:13.733');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2009', 'Abu Dhabi', 'Sebastian Vettel', '1:40.279');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2010', 'Bahrain', 'Fernando Alonso', '1:58.287');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2010', 'Australia', 'Mark Webber', '1:28.358');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2010', 'Malaysia', 'Mark Webber', '1:37.054');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2010', 'China', 'Lewis Hamilton', '1:42.061');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2010', 'Spain', 'Lewis Hamilton', '1:24.357');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2010', 'Monaco', 'Sebastian Vettel', '1:15.192');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2010', 'Turkey', 'Vitaly Petrov', '1:29.165');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2010', 'Canada', 'Robert Kubica', '1:16.972');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2010', 'Europe', 'Jenson Button', '1:38.766');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2010', 'Great Britain', 'Fernando Alonso', '1:30.874');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2010', 'Germany', 'Sebastian Vettel', '1:15.824');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2010', 'Hungary', 'Sebastian Vettel', '1:22.362');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2010', 'Belgium', 'Lewis Hamilton', '1:49.069');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2010', 'Italy', 'Fernando Alonso', '1:24.139');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2010', 'Singapore', 'Fernando Alonso', '1:47.976');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2010', 'Japan', 'Mark Webber', '1:33.474');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2010', 'South Korea', 'Fernando Alonso', '1:50.257');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2010', 'Brazil', 'Lewis Hamilton', '1:13.851');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2010', 'Abu Dhabi', 'Lewis Hamilton', '1:41.274');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2011', 'Australia', 'Felipe Massa', '1:28.947');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2011', 'Malaysia', 'Mark Webber', '1:40.571');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2011', 'China', 'Mark Webber', '1:38.993');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2011', 'Turkey', 'Mark Webber', '1:29.703');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2011', 'Spain', 'Lewis Hamilton', '1:26.727');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2011', 'Monaco', 'Mark Webber', '1:16.234');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2011', 'Canada', 'Jenson Button', '1:16.956');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2011', 'Europe', 'Sebastian Vettel', '1:41.852');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2011', 'Great Britain', 'Fernando Alonso', '1:34.908');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2011', 'Germany', 'Lewis Hamilton', '1:34.302');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2011', 'Hungary', 'Felipe Massa', '1:23.415');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2011', 'Belgium', 'Mark Webber', '1:49.883');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2011', 'Italy', 'Lewis Hamilton', '1:26.187');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2011', 'Singapore', 'Jenson Button', '1:48.454');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2011', 'Japan', 'Jenson Button', '1:36.568');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2011', 'South Korea', 'Sebastian Vettel', '1:39.605');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2011', 'India', 'Sebastian Vettel', '1:27.249');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2011', 'Abu Dhabi', 'Mark Webber', '1:42.612');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2011', 'Brazil', 'Mark Webber', '1:15.324');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2012', 'Australia', 'Jenson Button', '1:29.187');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2012', 'Malaysia', 'Kimi Räikkönen', '1:40.722');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2012', 'China', 'Kamui Kobayashi', '1:39.960');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2012', 'Bahrain', 'Sebastian Vettel', '1:36.379');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2012', 'Spain', 'Romain Grosjean', '1:26.250');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2012', 'Monaco', 'Sergio Perez', '1:17.296');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2012', 'Canada', 'Sebastian Vettel', '1:15.752');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2012', 'Europe', 'Nico Rosberg', '1:42.163');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2012', 'Great Britain', 'Kimi Räikkönen', '1:34.661');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2012', 'Germany', 'Michael Schumacher', '1:18.725');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2012', 'Hungary', 'Sebastian Vettel', '1:24.136');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2012', 'Belgium', 'Bruno Senna', '1:52.822');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2012', 'Italy', 'Nico Rosberg', '1:27.239');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2012', 'Singapore', 'Nico Hulkenberg', '1:51.033');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2012', 'Japan', 'Sebastian Vettel', '1:35.774');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2012', 'South Korea', 'Mark Webber', '1:42.037');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2012', 'India', 'Jenson Button', '1:28.203');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2012', 'Abu Dhabi', 'Sebastian Vettel', '1:43.964');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2012', 'United States  ', 'Sebastian Vettel', '1:39.347');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2012', 'Brazil', 'Lewis Hamilton', '1:18.069');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2013', 'Australia', 'Kimi Räikkönen', '1:29.274');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2013', 'Malaysia', 'Sergio Perez', '1:39.199');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2013', 'China', 'Sebastian Vettel', '1:36.808');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2013', 'Bahrain', 'Sebastian Vettel', '1:36.961');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2013', 'Spain', 'Esteban Gutierrez ', '1:26.217');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2013', 'Monaco', 'Sebastian Vettel', '1:16.577');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2013', 'Canada', 'Mark Webber', '1:16.182');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2013', 'Great Britain', 'Mark Webber', '1:33.401');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2013', 'Germany', 'Fernando Alonso', '1:33.468');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2013', 'Hungary', 'Mark Webber', '1:24.069');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2013', 'Belgium', 'Sebastian Vettel', '1:50.756');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2013', 'Italy', 'Lewis Hamilton', '1:25.849');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2013', 'Singapore', 'Sebastian Vettel', '1:48.574');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2013', 'South Korea', 'Sebastian Vettel', '1:41.380');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2013', 'Japan', 'Mark Webber', '1:34.587');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2013', 'India', 'Kimi Räikkönen', '1:27.679');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2013', 'Abu Dhabi', 'Fernando Alonso', '1:43.434');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2013', 'United States ', 'Sebastian Vettel', '1:39.856');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2013', 'Brazil', 'Mark Webber', '1:15.436');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2014', 'Australia', 'Nico Rosberg', '1:32.478');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2014', 'Malaysia', 'Lewis Hamilton', '1:43.066');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2014', 'Bahrain', 'Nico Rosberg', '1:37.020');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2014', 'China', 'Nico Rosberg', '1:40.402');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2014', 'Spain', 'Sebastian Vettel', '1:28.918');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2014', 'Monaco', 'Kimi Räikkönen', '1:18.479');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2014', 'Canada', 'Felipe Massa', '1:18.504');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2014', 'Austria', 'Sergio Perez', '1:12.142');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2014', 'Great Britain', 'Lewis Hamilton', '1:37.176');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2014', 'Germany', 'Lewis Hamilton', '1:19.908');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2014', 'Hungary', 'Nico Rosberg', '1:25.724');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2014', 'Belgium', 'Nico Rosberg', '1:50.511');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2014', 'Italy', 'Lewis Hamilton', '1:28.004');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2014', 'Singapore', 'Lewis Hamilton', '1:50.417');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2014', 'Japan', 'Lewis Hamilton', '1:51.600');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2014', 'Russia', 'Valtteri Bottas', '1:40.896');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2014', 'United States ', 'Sebastian Vettel', '1:41.379');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2014', 'Brazil', 'Lewis Hamilton', '1:13.555');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2014', 'Abu Dhabi', 'Daniel Ricciardo', '1:44.496');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2015', 'Australia', 'Lewis Hamilton', '1:30.945');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2015', 'Malaysia', 'Nico Rosberg', '1:42.062');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2015', 'China', 'Lewis Hamilton', '1:42.208');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2015', 'Bahrain', 'Kimi Räikkönen', '1:36.311');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2015', 'Spain', 'Lewis Hamilton', '1:28.270');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2015', 'Monaco', 'Daniel Ricciardo', '1:18.063');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2015', 'Canada', 'Kimi Räikkönen', '1:16.987');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2015', 'Austria', 'Nico Rosberg', '1:11.235');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2015', 'Great Britain', 'Lewis Hamilton', '1:37.093');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2015', 'Hungary', 'Daniel Ricciardo', '1:24.821');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2015', 'Belgium', 'Nico Rosberg', '1:52.416');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2015', 'Italy', 'Lewis Hamilton', '1:26.672');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2015', 'Singapore', 'Daniel Ricciardo', '1:50.041');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2015', 'Japan', 'Lewis Hamilton', '1:36.145');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2015', 'Russia', 'Sebastian Vettel', '1:40.071');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2015', 'United States ', 'Nico Rosberg', '1:40.666');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2015', 'Mexico', 'Nico Rosberg', '1:20.521');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2015', 'Brazil', 'Lewis Hamilton', '1:14.832');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2015', 'Abu Dhabi', 'Lewis Hamilton', '1:44.517');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2016', 'Australia', 'Daniel Ricciardo', '1:28.997');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2016', 'Bahrain', 'Nico Rosberg', '1:34.482');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2016', 'China', 'Nico Hulkenberg', '1:39.824');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2016', 'Russia', 'Nico Rosberg', '1:39.094');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2016', 'Spain', 'Daniil Kvyat', '1:26.948');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2016', 'Monaco', 'Lewis Hamilton', '1:17.939');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2016', 'Canada', 'Nico Rosberg', '1:15.599');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2016', 'Europe', 'Nico Rosberg', '1:46.485');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2016', 'Austria', 'Lewis Hamilton', '1:08.411');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2016', 'Great Britain', 'Nico Rosberg', '1:35.548');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2016', 'Hungary', 'Kimi Räikkönen', '1:23.086');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2016', 'Germany', 'Daniel Ricciardo', '1:18.442');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2016', 'Belgium', 'Lewis Hamilton', '1:51.583');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2016', 'Italy', 'Fernando Alonso', '1:25.340');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2016', 'Singapore', 'Daniel Ricciardo', '1:47.187');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2016', 'Malaysia', 'Nico Rosberg', '1:36.424');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2016', 'Japan', 'Sebastian Vettel', '1:35.118');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2016', 'United States ', 'Sebastian Vettel', '1:39.877');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2016', 'Mexico', 'Daniel Ricciardo', '1:21.134');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2016', 'Brazil', 'Max Verstappen', '1:25.305');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2016', 'Abu Dhabi', 'Sebastian Vettel', '1:43.729');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2017', 'Australia', 'Kimi Räikkönen', '1:26.538');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2017', 'China', 'Lewis Hamilton', '1:35.378');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2017', 'Bahrain', 'Lewis Hamilton', '1:32.798');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2017', 'Russia', 'Kimi Räikkönen', '1:36.844');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2017', 'Spain', 'Lewis Hamilton', '1:23.593');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2017', 'Monaco', 'Sergio Perez', '1:14.820');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2017', 'Canada', 'Lewis Hamilton', '1:14.551');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2017', 'Azerbaijan', 'Sebastian Vettel', '1:43.441');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2017', 'Austria', 'Lewis Hamilton', '1:07.411');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2017', 'Great Britain', 'Lewis Hamilton', '1:30.621');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2017', 'Hungary', 'Fernando Alonso', '1:20.182');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2017', 'Belgium', 'Sebastian Vettel', '1:46.577');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2017', 'Italy', 'Daniel Ricciardo', '1:23.361');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2017', 'Singapore', 'Lewis Hamilton', '1:45.008');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2017', 'Malaysia', 'Sebastian Vettel', '1:34.080');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2017', 'Japan', 'Valtteri Bottas', '1:33.144');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2017', 'United States ', 'Sebastian Vettel', '1:37.766');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2017', 'Mexico', 'Sebastian Vettel', '1:18.785');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2017', 'Brazil', 'Max Verstappen', '1:11.044');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2017', 'Abu Dhabi', 'Valtteri Bottas', '1:40.650');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2018', 'Australia', 'Daniel Ricciardo', '1:25.945');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2018', 'Bahrain', 'Valtteri Bottas', '1:33.740');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2018', 'China', 'Daniel Ricciardo', '1:35.785');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2018', 'Azerbaijan', 'Valtteri Bottas', '1:45.149');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2018', 'Spain', 'Daniel Ricciardo', '1:18.441');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2018', 'Monaco', 'Max Verstappen', '1:14.260');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2018', 'Canada', 'Max Verstappen', '1:13.864');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2018', 'France', 'Valtteri Bottas', '1:34.225');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2018', 'Austria', 'Kimi Räikkönen', '1:06.957');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2018', 'Great Britain', 'Sebastian Vettel', '1:30.696');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2018', 'Germany', 'Lewis Hamilton', '1:15.545');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2018', 'Hungary', 'Daniel Ricciardo', '1:20.012');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2018', 'Belgium', 'Valtteri Bottas', '1:46.286');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2018', 'Italy', 'Lewis Hamilton', '1:22.497');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2018', 'Singapore', 'Kevin Magnussen', '1:41.905');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2018', 'Russia', 'Valtteri Bottas', '1:35.861');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2018', 'Japan', 'Sebastian Vettel', '1:32.318');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2018', 'United States ', 'Lewis Hamilton', '1:37.392');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2018', 'Mexico', 'Valtteri Bottas', '1:18.741');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2018', 'Brazil', 'Valtteri Bottas', '1:10.540');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2018', 'Abu Dhabi', 'Sebastian Vettel', '1:40.867');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2019', 'Australia', 'Valtteri Bottas', '1:25.580');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2019', 'Bahrain', 'Charles Leclerc', '1:33.411');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2019', 'China', 'Pierre Gasly', '1:34.742');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2019', 'Azerbaijan', 'Charles Leclerc', '1:43.009');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2019', 'Spain', 'Lewis Hamilton', '1:18.492');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2019', 'Monaco', 'Pierre Gasly', '1:14.279');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2019', 'Canada', 'Valtteri Bottas', '1:13.078');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2019', 'France', 'Sebastian Vettel', '1:32.740');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2019', 'Austria', 'Max Verstappen', '1:07.475');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2019', 'Great Britain', 'Lewis Hamilton', '1:27.369');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2019', 'Germany', 'Max Verstappen', '1:16.645');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2019', 'Hungary', 'Max Verstappen', '1:17.103');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2019', 'Belgium', 'Sebastian Vettel', '1:46.409');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2019', 'Italy', 'Lewis Hamilton', '1:21.779');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2019', 'Singapore', 'Kevin Magnussen', '1:42.301');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2019', 'Russia', 'Lewis Hamilton', '1:35.761');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2019', 'Japan', 'Lewis Hamilton', '1:30.983');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2019', 'Mexico', 'Charles Leclerc', '1:19.232');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2019', 'United States ', 'Charles Leclerc', '1:36.169');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2019', 'Brazil', 'Valtteri Bottas', '1:10.698');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2019', 'Abu Dhabi', 'Lewis Hamilton', '1:39.283');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2020', 'Austria', 'Lando Norris', '1:07.475');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2020', 'Styria', 'Carlos Sainz', '1:05.619');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2020', 'Hungary', 'Lewis Hamilton', '1:16.627');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2020', 'Great Britain', 'Max Verstappen', '1:27.097');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2020', '70th Anniversary', 'Lewis Hamilton', '1:28.451');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2020', 'Spain', 'Valtteri Bottas', '1:18.183');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2020', 'Belgium', 'Daniel Ricciardo', '1:47.483');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2020', 'Italy', 'Lewis Hamilton', '1:22.746');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2020', 'Tuscany', 'Lewis Hamilton', '1:18.833');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2020', 'Russia', 'Valtteri Bottas', '1:37.030');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2020', 'Eifel', 'Max Verstappen', '1:28.139');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2020', 'Portugal', 'Lewis Hamilton', '1:18.750');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2020', 'Emilia Romagna', 'Lewis Hamilton', '1:15.484');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2020', 'Turkey', 'Lando Norris', '1:36.806');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2020', 'Bahrain', 'Max Verstappen', '1:32.014');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2020', 'Sakhir', 'George Russell', '55.404');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2020', 'Abu Dhabi', 'Daniel Ricciardo', '1:40.926');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2021', 'Bahrain', 'Valtteri Bottas', '1:32.090');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2021', 'Emilia Romagna', 'Lewis Hamilton', '1:16.702');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2021', 'Portugal', 'Valtteri Bottas', '1:19.865');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2021', 'Spain', 'Max Verstappen', '1:18.149');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2021', 'Monaco', 'Lewis Hamilton', '1:12.909');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2021', 'Azerbaijan', 'Max Verstappen', '1:44.481');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2021', 'France', 'Max Verstappen', '1:36.404');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2021', 'Styria', 'Lewis Hamilton', '1:07.058');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2021', 'Austria', 'Max Verstappen', '1:06.200');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2021', 'Great Britain', 'Sergio Perez', '1:28.617');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2021', 'Hungary', 'Pierre Gasly', '1:18.394');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2021', 'Netherlands', 'Lewis Hamilton', '1:11.097');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2021', 'Italy', 'Daniel Ricciardo', '1:24.812');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2021', 'Russia', 'Lando Norris', '1:37.423');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2021', 'Turkey', 'Valtteri Bottas', '1:30.432');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2021', 'United States ', 'Lewis Hamilton', '1:38.485');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2021', 'Mexico', 'Valtteri Bottas', '1:17.774');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2021', 'Brazil', 'Sergio Perez', '1:11.010');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2021', 'Qatar', 'Max Verstappen', '1:23.196');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2021', 'Saudi Arabia', 'Lewis Hamilton', '1:30.734');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2021', 'Abu Dhabi', 'Max Verstappen', '1:26.103');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2022', 'Bahrain', 'Charles Leclerc', '1:34.570');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2022', 'Saudi Arabia', 'Charles Leclerc', '1:31.634');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2022', 'Australia', 'Charles Leclerc', '1:20.260');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2022', 'Emilia Romagna', 'Max Verstappen', '1:18.446');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2022', 'Miami ', 'Max Verstappen', '1:31.361');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2022', 'Spain', 'Sergio Perez', '1:24.108');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2022', 'Monaco', 'Lando Norris', '1:14.693');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2022', 'Azerbaijan', 'Sergio Perez', '1:46.046');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2022', 'Canada', 'Carlos Sainz', '1:15.749');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2022', 'Great Britain', 'Lewis Hamilton', '1:30.510');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2022', 'Austria', 'Max Verstappen', '1:07.275');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2022', 'France', 'Carlos Sainz', '1:35.781');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2022', 'Hungary', 'Lewis Hamilton', '1:21.386');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2022', 'Belgium', 'Max Verstappen', '1:49.354');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2022', 'Netherlands', 'Max Verstappen', '1:13.652');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2022', 'Italy', 'Sergio Perez', '1:24.030');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2022', 'Singapore', 'George Russell', '1:46.458');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2022', 'Japan', 'Guanyu Zhou', '1:44.411');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2022', 'United States ', 'George Russell', '1:38.788');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2022', 'Mexico', 'George Russell', '1:20.153');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2022', 'Brazil', 'George Russell', '1:13.785');
INSERT INTO Lap_Record_Set (year, circuit_name, driver_name, time) VALUES ('2022', 'Abu Dhabi', 'Lando Norris', '1:28.391');





INSERT INTO Principal (name) VALUES ('Jean Todt');
INSERT INTO Principal (name) VALUES ('Christian Horner');
INSERT INTO Principal (name) VALUES ('Toto Wolff');
INSERT INTO Principal (name) VALUES ('Guenther Steiner');
INSERT INTO Principal (name) VALUES ('Andreas Seidl');





INSERT INTO Car (model) VALUES ('F2004');
INSERT INTO Car (model) VALUES ('RB16');
INSERT INTO Car (model) VALUES ('W10');
INSERT INTO Car (model) VALUES ('VF-18');
INSERT INTO Car (model) VALUES ('MCL35');





INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Ferrari', '170', '2000', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('McLaren Mercedes', '152', '2000', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Williams BMW', '36', '2000', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Benetton Playlife', '20', '2000', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('BAR Honda', '20', '2000', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Jordan Mugen Honda', '17', '2000', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Arrows Supertec', '7', '2000', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Sauber Petronas', '6', '2000', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Jaguar Cosworth', '4', '2000', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Ferrari', '179', '2001', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('McLaren Mercedes', '102', '2001', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Williams BMW', '80', '2001', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Sauber Petronas', '21', '2001', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Jordan Honda', '19', '2001', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('BAR Honda', '17', '2001', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Benetton Renault', '10', '2001', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Jaguar Cosworth', '9', '2001', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Prost Acer', '4', '2001', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Arrows Asiatech', '1', '2001', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Ferrari', '221', '2002', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Williams BMW', '92', '2002', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('McLaren Mercedes', '65', '2002', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Renault', '23', '2002', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Sauber Petronas', '11', '2002', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Jordan Honda', '9', '2002', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Jaguar Cosworth', '8', '2002', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('BAR Honda', '7', '2002', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Minardi Asiatech', '2', '2002', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Toyota', '2', '2002', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Arrows Cosworth', '2', '2002', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Ferrari', '158', '2003', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Williams BMW', '144', '2003', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('McLaren Mercedes', '142', '2003', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Renault', '88', '2003', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('BAR Honda', '26', '2003', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Sauber Petronas', '19', '2003', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Jaguar Cosworth', '18', '2003', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Toyota', '16', '2003', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Jordan Ford', '13', '2003', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Minardi Cosworth', '0', '2003', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Ferrari', '262', '2004', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('BAR Honda', '119', '2004', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Renault', '105', '2004', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Williams BMW', '88', '2004', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('McLaren Mercedes', '69', '2004', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Sauber Petronas', '34', '2004', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Jaguar Cosworth', '10', '2004', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Toyota', '9', '2004', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Jordan Ford', '5', '2004', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Minardi Cosworth', '1', '2004', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Renault', '191', '2005', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('McLaren Mercedes', '182', '2005', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Ferrari', '100', '2005', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Toyota', '88', '2005', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Williams BMW', '66', '2005', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('BAR Honda', '38', '2005', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('RBR Cosworth', '34', '2005', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Sauber Petronas', '20', '2005', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Jordan Toyota', '12', '2005', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Minardi Cosworth', '7', '2005', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Renault', '206', '2006', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Ferrari', '201', '2006', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('McLaren Mercedes', '110', '2006', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Honda', '86', '2006', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Sauber BMW', '36', '2006', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Toyota', '35', '2006', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('RBR Ferrari', '16', '2006', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Williams Cosworth', '11', '2006', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('STR Cosworth', '1', '2006', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('MF1 Toyota', '0', '2006', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Super Aguri Honda', '0', '2006', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Ferrari', '204', '2007', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Sauber BMW', '101', '2007', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Renault', '51', '2007', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Williams Toyota', '33', '2007', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Red Bull Renault', '24', '2007', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Toyota', '13', '2007', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('STR Ferrari', '8', '2007', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Honda', '6', '2007', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Super Aguri Honda', '4', '2007', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Spyker Ferrari', '1', '2007', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('McLaren Mercedes', '0', '2007', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Ferrari', '172', '2008', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('McLaren Mercedes', '151', '2008', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Sauber BMW', '135', '2008', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Renault', '80', '2008', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Toyota', '56', '2008', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('STR Ferrari', '39', '2008', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Red Bull Renault', '29', '2008', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Williams Toyota', '26', '2008', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Honda', '14', '2008', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Force India Ferrari', '0', '2008', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Super Aguri Honda', '0', '2008', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Brawn Mercedes', '172', '2009', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('RBR Renault', '153.5', '2009', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('McLaren Mercedes', '71', '2009', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Ferrari', '70', '2009', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Toyota', '59.5', '2009', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Sauber BMW', '36', '2009', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Williams Toyota', '34.5', '2009', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Renault', '26', '2009', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Force India Mercedes', '13', '2009', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('STR Ferrari', '8', '2009', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('RBR Renault', '498', '2010', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('McLaren Mercedes', '454', '2010', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Ferrari', '396', '2010', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Mercedes', '214', '2010', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Renault', '163', '2010', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Williams Cosworth', '69', '2010', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Force India Mercedes', '68', '2010', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Sauber Ferrari', '44', '2010', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('STR Ferrari', '13', '2010', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Lotus Cosworth', '0', '2010', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('HRT Cosworth', '0', '2010', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Virgin Cosworth', '0', '2010', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Red Bull Racing Renault', '650', '2011', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('McLaren Mercedes', '497', '2011', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Ferrari', '375', '2011', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Mercedes', '165', '2011', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Renault', '73', '2011', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Force India Mercedes', '69', '2011', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Sauber Ferrari', '44', '2011', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('STR Ferrari', '41', '2011', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Williams Cosworth', '5', '2011', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Lotus Renault', '0', '2011', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('HRT Cosworth', '0', '2011', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Virgin Cosworth', '0', '2011', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Red Bull Racing Renault', '460', '2012', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Ferrari', '400', '2012', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('McLaren Mercedes', '378', '2012', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Lotus Renault', '303', '2012', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Mercedes', '142', '2012', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Sauber Ferrari', '126', '2012', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Force India Mercedes', '109', '2012', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Williams Renault', '76', '2012', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('STR Ferrari', '26', '2012', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Caterham Renault', '0', '2012', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Marussia Cosworth', '0', '2012', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('HRT Cosworth', '0', '2012', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Red Bull Racing Renault', '596', '2013', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Mercedes', '360', '2013', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Ferrari', '354', '2013', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Lotus Renault', '315', '2013', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('McLaren Mercedes', '122', '2013', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Force India Mercedes', '77', '2013', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Sauber Ferrari', '57', '2013', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('STR Ferrari', '33', '2013', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Williams Renault', '5', '2013', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Marussia Cosworth', '0', '2013', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Caterham Renault', '0', '2013', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Mercedes', '701', '2014', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Red Bull Racing Renault', '405', '2014', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Williams Mercedes', '320', '2014', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Ferrari', '216', '2014', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('McLaren Mercedes', '181', '2014', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Force India Mercedes', '155', '2014', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('STR Renault', '30', '2014', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Lotus Renault', '10', '2014', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Marussia Ferrari', '2', '2014', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Sauber Ferrari', '0', '2014', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Caterham Renault', '0', '2014', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Mercedes', '703', '2015', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Ferrari', '428', '2015', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Williams Mercedes', '257', '2015', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Red Bull Racing Renault', '187', '2015', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Force India Mercedes', '136', '2015', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Lotus Mercedes', '78', '2015', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('STR Renault', '67', '2015', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Sauber Ferrari', '36', '2015', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('McLaren Honda', '27', '2015', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Marussia Ferrari', '0', '2015', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Mercedes', '765', '2016', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Red Bull Racing TAG Heuer', '468', '2016', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Ferrari', '398', '2016', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Force India Mercedes', '173', '2016', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Williams Mercedes', '138', '2016', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('McLaren Honda', '76', '2016', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Toro Rosso Ferrari', '63', '2016', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Haas Ferrari', '29', '2016', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Renault', '8', '2016', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Sauber Ferrari', '2', '2016', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('MRT Mercedes', '1', '2016', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Mercedes', '668', '2017', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Ferrari', '522', '2017', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Red Bull Racing TAG Heuer', '368', '2017', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Force India Mercedes', '187', '2017', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Williams Mercedes', '83', '2017', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Renault', '57', '2017', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Toro Rosso', '53', '2017', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Haas Ferrari', '47', '2017', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('McLaren Honda', '30', '2017', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Sauber Ferrari', '5', '2017', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Mercedes', '655', '2018', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Ferrari', '571', '2018', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Red Bull Racing TAG Heuer', '419', '2018', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Renault', '122', '2018', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Haas Ferrari', '93', '2018', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('McLaren Renault', '62', '2018', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Force India Mercedes', '52', '2018', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Sauber Ferrari', '48', '2018', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Scuderia Toro Rosso Honda', '33', '2018', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Williams Mercedes', '7', '2018', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Force India Sahara', '0', '2018', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Mercedes', '739', '2019', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Ferrari', '504', '2019', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Red Bull Racing Honda', '417', '2019', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('McLaren Renault', '145', '2019', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Renault', '91', '2019', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Scuderia Toro Rosso Honda', '85', '2019', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Racing Point BWT Mercedes', '73', '2019', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Alfa Romeo Racing Ferrari', '57', '2019', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Haas Ferrari', '28', '2019', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Williams Mercedes', '1', '2019', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Mercedes', '573', '2020', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Red Bull Racing Honda', '319', '2020', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('McLaren Renault', '202', '2020', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Racing Point BWT Mercedes', '195', '2020', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Renault', '181', '2020', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Ferrari', '131', '2020', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('AlphaTauri Honda', '107', '2020', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Alfa Romeo Racing Ferrari', '8', '2020', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Haas Ferrari', '3', '2020', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Williams Mercedes', '0', '2020', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Mercedes', '613.5', '2021', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Red Bull Racing Honda', '585.5', '2021', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Ferrari', '323.5', '2021', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('McLaren Mercedes', '275', '2021', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Alpine Renault', '155', '2021', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('AlphaTauri Honda', '142', '2021', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Aston Martin Mercedes', '77', '2021', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Williams Mercedes', '23', '2021', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Alfa Romeo Racing Ferrari', '13', '2021', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Haas Ferrari', '0', '2021', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Red Bull Racing RBPT', '759', '2022', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Ferrari', '554', '2022', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Mercedes', '515', '2022', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Alpine Renault', '173', '2022', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('McLaren Mercedes', '159', '2022', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Alfa Romeo Ferrari', '55', '2022', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Aston Martin Aramco Mercedes', '55', '2022', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Haas Ferrari', '37', '2022', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('AlphaTauri RBPT', '35', '2022', 'W10', 'Guenther Steiner');
INSERT INTO Team1 (name, points, year, car_model, principal_name) VALUES ('Williams Mercedes', '8', '2022', 'W10', 'Guenther Steiner');






INSERT INTO Team3 (name, team_program) VALUES ('Jordan Honda', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('RBR Renault', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Lotus Cosworth', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('McLaren Mercedes', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Super Aguri Honda', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Sauber Ferrari', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Arrows Cosworth', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Lotus Renault', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Alfa Romeo Racing Ferrari', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('RBR Cosworth', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Force India Sahara', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Alfa Romeo Ferrari', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Jaguar Cosworth', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Mercedes', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Marussia Cosworth', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Force India Ferrari', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('MRT Mercedes', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Racing Point BWT Mercedes', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Caterham Renault', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Jordan Toyota', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Force India Mercedes', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('AlphaTauri Honda', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Williams BMW', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('STR Renault', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Sauber Petronas', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Scuderia Toro Rosso Honda', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Ferrari', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Jordan Mugen Honda', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('HRT Cosworth', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('McLaren Honda', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Red Bull Racing RBPT', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Williams Mercedes', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Red Bull Racing Honda', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Arrows Supertec', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Arrows Asiatech', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Spyker Ferrari', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Aston Martin Mercedes', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Red Bull Racing TAG Heuer', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Jordan Ford', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('RBR Ferrari', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Williams Renault', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Brawn Mercedes', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Williams Cosworth', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Minardi Asiatech', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Red Bull Renault', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('STR Cosworth', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('STR Ferrari', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('MF1 Toyota', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Sauber BMW', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Marussia Ferrari', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Toyota', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Alpine Renault', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Benetton Renault', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Lotus Mercedes', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Williams Toyota', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Red Bull Racing Renault', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Toro Rosso', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Benetton Playlife', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Minardi Cosworth', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Virgin Cosworth', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Renault', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('McLaren Renault', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Toro Rosso Ferrari', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Honda', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Haas Ferrari', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Prost Acer', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('Aston Martin Aramco Mercedes', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('BAR Honda', 'Scuderia Ferrari');
INSERT INTO Team3 (name, team_program) VALUES ('AlphaTauri RBPT', 'Scuderia Ferrari');





INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Michael Schumacher', 'Ferrari', '2000');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Mika Hakkinen', 'McLaren Mercedes', '2000');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('David Coulthard', 'McLaren Mercedes', '2000');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Rubens Barrichello', 'Ferrari', '2000');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Ralf Schumacher', 'Williams BMW', '2000');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Giancarlo Fisichella', 'Benetton Playlife', '2000');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jacques Villeneuve', 'BAR Honda', '2000');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jenson Button', 'Williams BMW', '2000');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Heinz-Harald Frentzen', 'Jordan Mugen Honda', '2000');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jarno Trulli', 'Jordan Mugen Honda', '2000');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Mika Salo', 'Sauber Petronas', '2000');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jos Verstappen', 'Arrows Supertec', '2000');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Eddie Irvine', 'Jaguar Cosworth', '2000');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Ricardo Zonta', 'BAR Honda', '2000');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Alexander Wurz', 'Benetton Playlife', '2000');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Pedro de la Rosa', 'Arrows Supertec', '2000');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Pedro Diniz', 'Sauber Petronas', '2000');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Johnny Herbert', 'Jaguar Cosworth', '2000');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Luciano Burti', 'Jaguar Cosworth', '2000');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Michael Schumacher', 'Ferrari', '2001');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('David Coulthard', 'McLaren Mercedes', '2001');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Rubens Barrichello', 'Ferrari', '2001');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Ralf Schumacher', 'Williams BMW', '2001');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Mika Hakkinen', 'McLaren Mercedes', '2001');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Juan Pablo Montoya', 'Williams BMW', '2001');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jacques Villeneuve', 'BAR Honda', '2001');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Nick Heidfeld', 'Sauber Petronas', '2001');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jarno Trulli', 'Jordan Honda', '2001');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Kimi Räikkönen', 'Sauber Petronas', '2001');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Giancarlo Fisichella', 'Benetton Renault', '2001');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Eddie Irvine', 'Jaguar Cosworth', '2001');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Heinz-Harald Frentzen', 'Prost Acer', '2001');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Olivier Panis', 'BAR Honda', '2001');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jean Alesi', 'Jordan Honda', '2001');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Pedro de la Rosa', 'Jaguar Cosworth', '2001');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jenson Button', 'Benetton Renault', '2001');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jos Verstappen', 'Arrows Asiatech', '2001');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Michael Schumacher', 'Ferrari', '2002');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Rubens Barrichello', 'Ferrari', '2002');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Juan Pablo Montoya', 'Williams BMW', '2002');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Ralf Schumacher', 'Williams BMW', '2002');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('David Coulthard', 'McLaren Mercedes', '2002');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Kimi Räikkönen', 'McLaren Mercedes', '2002');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jenson Button', 'Renault', '2002');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jarno Trulli', 'Renault', '2002');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Eddie Irvine', 'Jaguar Cosworth', '2002');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Nick Heidfeld', 'Sauber Petronas', '2002');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Giancarlo Fisichella', 'Jordan Honda', '2002');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jacques Villeneuve', 'BAR Honda', '2002');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Felipe Massa', 'Sauber Petronas', '2002');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Olivier Panis', 'BAR Honda', '2002');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Takuma Sato', 'Jordan Honda', '2002');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Mark Webber', 'Minardi Asiatech', '2002');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Mika Salo', 'Toyota', '2002');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Heinz-Harald Frentzen', 'Sauber Petronas', '2002');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Allan McNish', 'Toyota', '2002');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Alex Yoong', 'Minardi Asiatech', '2002');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Pedro de la Rosa', 'Jaguar Cosworth', '2002');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Enrique Bernoldi', 'Arrows Cosworth', '2002');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Michael Schumacher', 'Ferrari', '2003');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Kimi Räikkönen', 'McLaren Mercedes', '2003');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Juan Pablo Montoya', 'Williams BMW', '2003');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Rubens Barrichello', 'Ferrari', '2003');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Ralf Schumacher', 'Williams BMW', '2003');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Fernando Alonso', 'Renault', '2003');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('David Coulthard', 'McLaren Mercedes', '2003');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jarno Trulli', 'Renault', '2003');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jenson Button', 'BAR Honda', '2003');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Mark Webber', 'Jaguar Cosworth', '2003');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Heinz-Harald Frentzen', 'Sauber Petronas', '2003');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Giancarlo Fisichella', 'Jordan Ford', '2003');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Cristiano da Matta', 'Toyota', '2003');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Nick Heidfeld', 'Sauber Petronas', '2003');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Olivier Panis', 'Toyota', '2003');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jacques Villeneuve', 'BAR Honda', '2003');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Marc Gene', 'Williams BMW', '2003');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Takuma Sato', 'BAR Honda', '2003');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Ralph Firman', 'Jordan Ford', '2003');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Justin Wilson', 'Jaguar Cosworth', '2003');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Antonio Pizzonia', 'Jaguar Cosworth', '2003');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jos Verstappen', 'Minardi Cosworth', '2003');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Nicolas Kiesa', 'Minardi Cosworth', '2003');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Zsolt Baumgartner', 'Jordan Ford', '2003');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Michael Schumacher', 'Ferrari', '2004');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Rubens Barrichello', 'Ferrari', '2004');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jenson Button', 'BAR Honda', '2004');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Fernando Alonso', 'Renault', '2004');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Juan Pablo Montoya', 'Williams BMW', '2004');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jarno Trulli', 'Toyota', '2004');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Kimi Räikkönen', 'McLaren Mercedes', '2004');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Takuma Sato', 'BAR Honda', '2004');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Ralf Schumacher', 'Williams BMW', '2004');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('David Coulthard', 'McLaren Mercedes', '2004');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Giancarlo Fisichella', 'Sauber Petronas', '2004');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Felipe Massa', 'Sauber Petronas', '2004');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Mark Webber', 'Jaguar Cosworth', '2004');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Olivier Panis', 'Toyota', '2004');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Antonio Pizzonia', 'Williams BMW', '2004');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Christian Klien', 'Jaguar Cosworth', '2004');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Cristiano da Matta', 'Toyota', '2004');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Nick Heidfeld', 'Jordan Ford', '2004');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Timo Glock', 'Jordan Ford', '2004');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Zsolt Baumgartner', 'Minardi Cosworth', '2004');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jacques Villeneuve', 'Renault', '2004');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Ricardo Zonta', 'Toyota', '2004');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Marc Gene', 'Williams BMW', '2004');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Giorgio Pantano', 'Jordan Ford', '2004');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Gianmaria Bruni', 'Minardi Cosworth', '2004');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Fernando Alonso', 'Renault', '2005');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Kimi Räikkönen', 'McLaren Mercedes', '2005');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Michael Schumacher', 'Ferrari', '2005');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Juan Pablo Montoya', 'McLaren Mercedes', '2005');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Giancarlo Fisichella', 'Renault', '2005');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Ralf Schumacher', 'Toyota', '2005');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jarno Trulli', 'Toyota', '2005');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Rubens Barrichello', 'Ferrari', '2005');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jenson Button', 'BAR Honda', '2005');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Mark Webber', 'Williams BMW', '2005');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Nick Heidfeld', 'Williams BMW', '2005');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('David Coulthard', 'RBR Cosworth', '2005');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Felipe Massa', 'Sauber Petronas', '2005');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jacques Villeneuve', 'Sauber Petronas', '2005');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Christian Klien', 'RBR Cosworth', '2005');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Tiago Monteiro', 'Jordan Toyota', '2005');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Alexander Wurz', 'McLaren Mercedes', '2005');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Narain Karthikeyan', 'Jordan Toyota', '2005');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Christijan Albers', 'Minardi Cosworth', '2005');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Pedro de la Rosa', 'McLaren Mercedes', '2005');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Patrick Friesacher ', 'Minardi Cosworth', '2005');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Antonio Pizzonia', 'Williams BMW', '2005');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Takuma Sato', 'BAR Honda', '2005');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Vitantonio Liuzzi', 'RBR Cosworth', '2005');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Robert Doornbos', 'Minardi Cosworth', '2005');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Fernando Alonso', 'Renault', '2006');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Michael Schumacher', 'Ferrari', '2006');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Felipe Massa', 'Ferrari', '2006');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Giancarlo Fisichella', 'Renault', '2006');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Kimi Räikkönen', 'McLaren Mercedes', '2006');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jenson Button', 'Honda', '2006');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Rubens Barrichello', 'Honda', '2006');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Juan Pablo Montoya', 'McLaren Mercedes', '2006');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Nick Heidfeld', 'Sauber BMW', '2006');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Ralf Schumacher', 'Toyota', '2006');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Pedro de la Rosa', 'McLaren Mercedes', '2006');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jarno Trulli', 'Toyota', '2006');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('David Coulthard', 'RBR Ferrari', '2006');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Mark Webber', 'Williams Cosworth', '2006');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jacques Villeneuve', 'Sauber BMW', '2006');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Robert Kubica', 'Sauber BMW', '2006');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Nico Rosberg', 'Williams Cosworth', '2006');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Christian Klien', 'RBR Ferrari', '2006');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Vitantonio Liuzzi', 'STR Cosworth', '2006');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Scott Speed', 'STR Cosworth', '2006');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Tiago Monteiro', 'MF1 Toyota', '2006');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Christijan Albers', 'MF1 Toyota', '2006');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Takuma Sato', 'Super Aguri Honda', '2006');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Robert Doornbos', 'RBR Ferrari', '2006');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Yuji Ide', 'Super Aguri Honda', '2006');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Sakon Yamamoto', 'Super Aguri Honda', '2006');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Franck Montagny', 'Super Aguri Honda', '2006');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Kimi Räikkönen', 'Ferrari', '2007');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Lewis Hamilton', 'McLaren Mercedes', '2007');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Fernando Alonso', 'McLaren Mercedes', '2007');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Felipe Massa', 'Ferrari', '2007');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Nick Heidfeld', 'Sauber BMW', '2007');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Robert Kubica', 'Sauber BMW', '2007');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Heikki Kovalainen', 'Renault', '2007');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Giancarlo Fisichella', 'Renault', '2007');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Nico Rosberg', 'Williams Toyota', '2007');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('David Coulthard', 'Red Bull Renault', '2007');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Alexander Wurz', 'Williams Toyota', '2007');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Mark Webber', 'Red Bull Renault', '2007');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jarno Trulli', 'Toyota', '2007');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Sebastian Vettel', 'STR Ferrari', '2007');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jenson Button', 'Honda', '2007');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Ralf Schumacher', 'Toyota', '2007');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Takuma Sato', 'Super Aguri Honda', '2007');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Vitantonio Liuzzi', 'STR Ferrari', '2007');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Adrian Sutil', 'Spyker Ferrari', '2007');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Rubens Barrichello', 'Honda', '2007');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Scott Speed', 'STR Ferrari', '2007');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Kazuki Nakajima', 'Williams Toyota', '2007');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Anthony Davidson', 'Super Aguri Honda', '2007');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Sakon Yamamoto', 'Spyker Ferrari', '2007');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Christijan Albers', 'Spyker Ferrari', '2007');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Lewis Hamilton', 'McLaren Mercedes', '2008');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Felipe Massa', 'Ferrari', '2008');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Kimi Räikkönen', 'Ferrari', '2008');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Robert Kubica', 'Sauber BMW', '2008');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Fernando Alonso', 'Renault', '2008');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Nick Heidfeld', 'Sauber BMW', '2008');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Heikki Kovalainen', 'McLaren Mercedes', '2008');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Sebastian Vettel', 'STR Ferrari', '2008');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jarno Trulli', 'Toyota', '2008');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Timo Glock', 'Toyota', '2008');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Mark Webber', 'Red Bull Renault', '2008');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Nelson Piquet', 'Renault', '2008');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Nico Rosberg', 'Williams Toyota', '2008');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Rubens Barrichello', 'Honda', '2008');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Kazuki Nakajima', 'Williams Toyota', '2008');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('David Coulthard', 'Red Bull Renault', '2008');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Sebastien Bourdais', 'STR Ferrari', '2008');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jenson Button', 'Honda', '2008');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Giancarlo Fisichella', 'Force India Ferrari', '2008');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Adrian Sutil', 'Force India Ferrari', '2008');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Takuma Sato', 'Super Aguri Honda', '2008');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Anthony Davidson', 'Super Aguri Honda', '2008');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jenson Button', 'Brawn Mercedes', '2009');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Sebastian Vettel', 'RBR Renault', '2009');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Rubens Barrichello', 'Brawn Mercedes', '2009');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Mark Webber', 'RBR Renault', '2009');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Lewis Hamilton', 'McLaren Mercedes', '2009');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Kimi Räikkönen', 'Ferrari', '2009');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Nico Rosberg', 'Williams Toyota', '2009');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jarno Trulli', 'Toyota', '2009');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Fernando Alonso', 'Renault', '2009');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Timo Glock', 'Toyota', '2009');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Felipe Massa', 'Ferrari', '2009');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Heikki Kovalainen', 'McLaren Mercedes', '2009');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Nick Heidfeld', 'Sauber BMW', '2009');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Robert Kubica', 'Sauber BMW', '2009');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Giancarlo Fisichella', 'Ferrari', '2009');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Sebastien Buemi', 'STR Ferrari', '2009');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Adrian Sutil', 'Force India Mercedes', '2009');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Kamui Kobayashi', 'Toyota', '2009');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Sebastien Bourdais', 'STR Ferrari', '2009');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Kazuki Nakajima', 'Williams Toyota', '2009');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Nelson Piquet', 'Renault', '2009');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Vitantonio Liuzzi', 'Force India Mercedes', '2009');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Romain Grosjean', 'Renault', '2009');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jaime Alguersuari', 'STR Ferrari', '2009');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Luca Badoer', 'Ferrari', '2009');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Sebastian Vettel', 'RBR Renault', '2010');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Fernando Alonso', 'Ferrari', '2010');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Mark Webber', 'RBR Renault', '2010');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Lewis Hamilton', 'McLaren Mercedes', '2010');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jenson Button', 'McLaren Mercedes', '2010');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Felipe Massa', 'Ferrari', '2010');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Nico Rosberg', 'Mercedes', '2010');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Robert Kubica', 'Renault', '2010');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Michael Schumacher', 'Mercedes', '2010');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Rubens Barrichello', 'Williams Cosworth', '2010');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Adrian Sutil', 'Force India Mercedes', '2010');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Kamui Kobayashi', 'Sauber Ferrari', '2010');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Vitaly Petrov', 'Renault', '2010');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Nico Hulkenberg', 'Williams Cosworth', '2010');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Vitantonio Liuzzi', 'Force India Mercedes', '2010');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Sebastien Buemi', 'STR Ferrari', '2010');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Pedro de la Rosa', 'Sauber Ferrari', '2010');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Nick Heidfeld', 'Sauber Ferrari', '2010');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jaime Alguersuari', 'STR Ferrari', '2010');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Heikki Kovalainen', 'Lotus Cosworth', '2010');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jarno Trulli', 'Lotus Cosworth', '2010');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Karun Chandhok', 'HRT Cosworth', '2010');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Bruno Senna', 'HRT Cosworth', '2010');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Lucas di Grassi', 'Virgin Cosworth', '2010');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Timo Glock', 'Virgin Cosworth', '2010');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Sakon Yamamoto', 'HRT Cosworth', '2010');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Christian Klien', 'HRT Cosworth', '2010');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Sebastian Vettel', 'Red Bull Racing Renault', '2011');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jenson Button', 'McLaren Mercedes', '2011');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Mark Webber', 'Red Bull Racing Renault', '2011');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Fernando Alonso', 'Ferrari', '2011');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Lewis Hamilton', 'McLaren Mercedes', '2011');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Felipe Massa', 'Ferrari', '2011');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Nico Rosberg', 'Mercedes', '2011');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Michael Schumacher', 'Mercedes', '2011');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Adrian Sutil', 'Force India Mercedes', '2011');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Vitaly Petrov', 'Renault', '2011');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Nick Heidfeld', 'Renault', '2011');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Kamui Kobayashi', 'Sauber Ferrari', '2011');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Paul di Resta', 'Force India Mercedes', '2011');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jaime Alguersuari', 'STR Ferrari', '2011');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Sebastien Buemi', 'STR Ferrari', '2011');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Sergio Perez', 'Sauber Ferrari', '2011');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Rubens Barrichello', 'Williams Cosworth', '2011');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Bruno Senna', 'Renault', '2011');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Pastor Maldonado', 'Williams Cosworth', '2011');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Pedro de la Rosa', 'Sauber Ferrari', '2011');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jarno Trulli', 'Lotus Renault', '2011');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Heikki Kovalainen', 'Lotus Renault', '2011');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Vitantonio Liuzzi', 'HRT Cosworth', '2011');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jerome d.Ambrosio', 'Virgin Cosworth', '2011');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Timo Glock', 'Virgin Cosworth', '2011');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Narain Karthikeyan', 'HRT Cosworth', '2011');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Daniel Ricciardo', 'HRT Cosworth', '2011');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Karun Chandhok', 'Lotus Renault', '2011');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Sebastian Vettel', 'Red Bull Racing Renault', '2012');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Fernando Alonso', 'Ferrari', '2012');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Kimi Räikkönen', 'Lotus Renault', '2012');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Lewis Hamilton', 'McLaren Mercedes', '2012');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jenson Button', 'McLaren Mercedes', '2012');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Mark Webber', 'Red Bull Racing Renault', '2012');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Felipe Massa', 'Ferrari', '2012');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Romain Grosjean', 'Lotus Renault', '2012');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Nico Rosberg', 'Mercedes', '2012');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Sergio Perez', 'Sauber Ferrari', '2012');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Nico Hulkenberg', 'Force India Mercedes', '2012');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Kamui Kobayashi', 'Sauber Ferrari', '2012');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Michael Schumacher', 'Mercedes', '2012');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Paul di Resta', 'Force India Mercedes', '2012');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Pastor Maldonado', 'Williams Renault', '2012');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Bruno Senna', 'Williams Renault', '2012');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jean-Eric Vergne', 'STR Ferrari', '2012');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Daniel Ricciardo', 'STR Ferrari', '2012');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Vitaly Petrov', 'Caterham Renault', '2012');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Timo Glock', 'Marussia Cosworth', '2012');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Charles Pic', 'Marussia Cosworth', '2012');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Heikki Kovalainen', 'Caterham Renault', '2012');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jerome d.Ambrosio', 'Lotus Renault', '2012');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Narain Karthikeyan', 'HRT Cosworth', '2012');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Pedro de la Rosa', 'HRT Cosworth', '2012');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Sebastian Vettel', 'Red Bull Racing Renault', '2013');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Fernando Alonso', 'Ferrari', '2013');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Mark Webber', 'Red Bull Racing Renault', '2013');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Lewis Hamilton', 'Mercedes', '2013');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Kimi Räikkönen', 'Lotus Renault', '2013');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Nico Rosberg', 'Mercedes', '2013');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Romain Grosjean', 'Lotus Renault', '2013');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Felipe Massa', 'Ferrari', '2013');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jenson Button', 'McLaren Mercedes', '2013');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Nico Hulkenberg', 'Sauber Ferrari', '2013');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Sergio Perez', 'McLaren Mercedes', '2013');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Paul di Resta', 'Force India Mercedes', '2013');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Adrian Sutil', 'Force India Mercedes', '2013');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Daniel Ricciardo', 'STR Ferrari', '2013');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jean-Eric Vergne', 'STR Ferrari', '2013');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Esteban Gutierrez ', 'Sauber Ferrari', '2013');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Valtteri  Bottas', 'Williams Renault', '2013');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Pastor Maldonado', 'Williams Renault', '2013');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jules Bianchi', 'Marussia Cosworth', '2013');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Charles Pic', 'Caterham Renault', '2013');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Heikki Kovalainen', 'Lotus Renault', '2013');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Giedo van der Garde', 'Caterham Renault', '2013');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Max Chilton', 'Marussia Cosworth', '2013');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Lewis Hamilton', 'Mercedes', '2014');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Nico Rosberg', 'Mercedes', '2014');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Daniel Ricciardo', 'Red Bull Racing Renault', '2014');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Valtteri  Bottas', 'Williams Mercedes', '2014');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Sebastian Vettel', 'Red Bull Racing Renault', '2014');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Fernando Alonso', 'Ferrari', '2014');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Felipe Massa', 'Williams Mercedes', '2014');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jenson Button', 'McLaren Mercedes', '2014');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Nico Hulkenberg', 'Force India Mercedes', '2014');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Sergio Perez', 'Force India Mercedes', '2014');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Kevin Magnussen', 'McLaren Mercedes', '2014');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Kimi Räikkönen', 'Ferrari', '2014');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jean-Eric Vergne', 'STR Renault', '2014');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Romain Grosjean', 'Lotus Renault', '2014');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Daniil Kvyat', 'STR Renault', '2014');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Pastor Maldonado', 'Lotus Renault', '2014');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jules Bianchi', 'Marussia Ferrari', '2014');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Adrian Sutil', 'Sauber Ferrari', '2014');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Marcus Ericsson', 'Caterham Renault', '2014');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Esteban Gutierrez ', 'Sauber Ferrari', '2014');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Max Chilton', 'Marussia Ferrari', '2014');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Kamui Kobayashi', 'Caterham Renault', '2014');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Will Stevens', 'Caterham Renault', '2014');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Lewis Hamilton', 'Mercedes', '2015');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Nico Rosberg', 'Mercedes', '2015');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Sebastian Vettel', 'Ferrari', '2015');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Kimi Räikkönen', 'Ferrari', '2015');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Valtteri  Bottas', 'Williams Mercedes', '2015');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Felipe Massa', 'Williams Mercedes', '2015');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Daniil Kvyat', 'Red Bull Racing Renault', '2015');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Daniel Ricciardo', 'Red Bull Racing Renault', '2015');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Sergio Perez', 'Force India Mercedes', '2015');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Nico Hulkenberg', 'Force India Mercedes', '2015');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Romain Grosjean', 'Lotus Mercedes', '2015');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Max Verstappen', 'STR Renault', '2015');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Felipe Nasr', 'Sauber Ferrari', '2015');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Pastor Maldonado', 'Lotus Mercedes', '2015');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Carlos Sainz', 'STR Renault', '2015');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jenson Button', 'McLaren Honda', '2015');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Fernando Alonso', 'McLaren Honda', '2015');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Marcus Ericsson', 'Sauber Ferrari', '2015');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Roberto Merhi', 'Marussia Ferrari', '2015');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Alexander Rossi', 'Marussia Ferrari', '2015');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Will Stevens', 'Marussia Ferrari', '2015');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Nico Rosberg', 'Mercedes', '2016');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Lewis Hamilton', 'Mercedes', '2016');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Daniel Ricciardo', 'Red Bull Racing TAG Heuer', '2016');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Sebastian Vettel', 'Ferrari', '2016');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Max Verstappen', 'Red Bull Racing TAG Heuer', '2016');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Kimi Räikkönen', 'Ferrari', '2016');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Sergio Perez', 'Force India Mercedes', '2016');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Valtteri  Bottas', 'Williams Mercedes', '2016');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Nico Hulkenberg', 'Force India Mercedes', '2016');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Fernando Alonso', 'McLaren Honda', '2016');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Felipe Massa', 'Williams Mercedes', '2016');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Carlos Sainz', 'Toro Rosso Ferrari', '2016');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Romain Grosjean', 'Haas Ferrari', '2016');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Daniil Kvyat', 'Toro Rosso Ferrari', '2016');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jenson Button', 'McLaren Honda', '2016');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Kevin Magnussen', 'Renault', '2016');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Felipe Nasr', 'Sauber Ferrari', '2016');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jolyon Palmer', 'Renault', '2016');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Pascal Wehrlein', 'MRT Mercedes', '2016');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Stoffel Vandoorne', 'McLaren Honda', '2016');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Esteban Gutierrez ', 'Haas Ferrari', '2016');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Marcus Ericsson', 'Sauber Ferrari', '2016');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Esteban Ocon', 'MRT Mercedes', '2016');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Rio Haryanto', 'MRT Mercedes', '2016');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Lewis Hamilton', 'Mercedes', '2017');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Sebastian Vettel', 'Ferrari', '2017');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Valtteri  Bottas', 'Mercedes', '2017');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Kimi Räikkönen', 'Ferrari', '2017');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Daniel Ricciardo', 'Red Bull Racing TAG Heuer', '2017');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Max Verstappen', 'Red Bull Racing TAG Heuer', '2017');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Sergio Perez', 'Force India Mercedes', '2017');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Esteban Ocon', 'Force India Mercedes', '2017');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Carlos Sainz', 'Renault', '2017');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Nico Hulkenberg', 'Renault', '2017');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Felipe Massa', 'Williams Mercedes', '2017');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Lance Stroll', 'Williams Mercedes', '2017');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Romain Grosjean', 'Haas Ferrari', '2017');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Kevin Magnussen', 'Haas Ferrari', '2017');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Fernando Alonso', 'McLaren Honda', '2017');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Stoffel Vandoorne', 'McLaren Honda', '2017');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jolyon Palmer', 'Renault', '2017');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Pascal Wehrlein', 'Sauber Ferrari', '2017');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Daniil Kvyat', 'Toro Rosso', '2017');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Marcus Ericsson', 'Sauber Ferrari', '2017');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Pierre Gasly', 'Toro Rosso', '2017');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Antonio Giovinazzi', 'Sauber Ferrari', '2017');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Brendon Hartley', 'Toro Rosso', '2017');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Lewis Hamilton', 'Mercedes', '2018');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Sebastian Vettel', 'Ferrari', '2018');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Kimi Räikkönen', 'Ferrari', '2018');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Max Verstappen', 'Red Bull Racing TAG Heuer', '2018');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Valtteri Bottas', 'Mercedes', '2018');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Daniel Ricciardo', 'Red Bull Racing TAG Heuer', '2018');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Nico Hulkenberg', 'Renault', '2018');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Sergio Perez', 'Force India Mercedes', '2018');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Kevin Magnussen', 'Haas Ferrari', '2018');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Carlos Sainz', 'Renault', '2018');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Fernando Alonso', 'McLaren Renault', '2018');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Esteban Ocon', 'Force India Mercedes', '2018');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Charles Leclerc', 'Sauber Ferrari', '2018');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Romain Grosjean', 'Haas Ferrari', '2018');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Pierre Gasly', 'Scuderia Toro Rosso Honda', '2018');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Stoffel Vandoorne', 'McLaren Renault', '2018');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Marcus Ericsson', 'Sauber Ferrari', '2018');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Lance Stroll', 'Williams Mercedes', '2018');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Brendon Hartley', 'Scuderia Toro Rosso Honda', '2018');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Sergey Sirotkin', 'Williams Mercedes', '2018');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Lewis Hamilton', 'Mercedes', '2019');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Valtteri Bottas', 'Mercedes', '2019');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Max Verstappen', 'Red Bull Racing Honda', '2019');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Charles Leclerc', 'Ferrari', '2019');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Sebastian Vettel', 'Ferrari', '2019');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Carlos Sainz', 'McLaren Renault', '2019');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Pierre Gasly', 'Scuderia Toro Rosso Honda', '2019');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Alexander Albon', 'Red Bull Racing Honda', '2019');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Daniel Ricciardo', 'Renault', '2019');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Sergio Perez', 'Racing Point BWT Mercedes', '2019');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Lando Norris', 'McLaren Renault', '2019');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Kimi Räikkönen', 'Alfa Romeo Racing Ferrari', '2019');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Daniil Kvyat', 'Scuderia Toro Rosso Honda', '2019');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Nico Hulkenberg', 'Renault', '2019');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Lance Stroll', 'Racing Point BWT Mercedes', '2019');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Kevin Magnussen', 'Haas Ferrari', '2019');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Antonio Giovinazzi', 'Alfa Romeo Racing Ferrari', '2019');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Romain Grosjean', 'Haas Ferrari', '2019');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Robert Kubica', 'Williams Mercedes', '2019');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('George Russell', 'Williams Mercedes', '2019');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Lewis Hamilton', 'Mercedes', '2020');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Valtteri Bottas', 'Mercedes', '2020');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Max Verstappen', 'Red Bull Racing Honda', '2020');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Sergio Perez', 'Racing Point BWT Mercedes', '2020');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Daniel Ricciardo', 'Renault', '2020');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Carlos Sainz', 'McLaren Renault', '2020');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Alexander Albon', 'Red Bull Racing Honda', '2020');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Charles Leclerc', 'Ferrari', '2020');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Lando Norris', 'McLaren Renault', '2020');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Pierre Gasly', 'AlphaTauri Honda', '2020');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Lance Stroll', 'Racing Point BWT Mercedes', '2020');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Esteban Ocon', 'Renault', '2020');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Sebastian Vettel', 'Ferrari', '2020');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Daniil Kvyat', 'AlphaTauri Honda', '2020');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Nico Hulkenberg', 'Racing Point BWT Mercedes', '2020');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Kimi Räikkönen', 'Alfa Romeo Racing Ferrari', '2020');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Antonio Giovinazzi', 'Alfa Romeo Racing Ferrari', '2020');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('George Russell', 'Williams Mercedes', '2020');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Romain Grosjean', 'Haas Ferrari', '2020');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Kevin Magnussen', 'Haas Ferrari', '2020');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Nicholas Latifi', 'Williams Mercedes', '2020');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Jack Aitken', 'Williams Mercedes', '2020');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Pietro Fittipaldi', 'Haas Ferrari', '2020');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Max Verstappen', 'Red Bull Racing Honda', '2021');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Lewis Hamilton', 'Mercedes', '2021');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Valtteri Bottas', 'Mercedes', '2021');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Sergio Perez', 'Red Bull Racing Honda', '2021');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Carlos Sainz', 'Ferrari', '2021');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Lando Norris', 'McLaren Mercedes', '2021');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Charles Leclerc', 'Ferrari', '2021');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Daniel Ricciardo', 'McLaren Mercedes', '2021');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Pierre Gasly', 'AlphaTauri Honda', '2021');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Fernando Alonso', 'Alpine Renault', '2021');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Esteban Ocon', 'Alpine Renault', '2021');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Sebastian Vettel', 'Aston Martin Mercedes', '2021');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Lance Stroll', 'Aston Martin Mercedes', '2021');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Yuki Tsunoda', 'AlphaTauri Honda', '2021');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('George Russell', 'Williams Mercedes', '2021');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Kimi Räikkönen', 'Alfa Romeo Racing Ferrari', '2021');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Nicholas Latifi', 'Williams Mercedes', '2021');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Antonio Giovinazzi', 'Alfa Romeo Racing Ferrari', '2021');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Mick Schumacher', 'Haas Ferrari', '2021');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Robert Kubica', 'Alfa Romeo Racing Ferrari', '2021');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Nikita Mazepin', 'Haas Ferrari', '2021');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Max Verstappen', 'Red Bull Racing RBPT', '2022');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Charles Leclerc', 'Ferrari', '2022');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Sergio Perez', 'Red Bull Racing RBPT', '2022');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('George Russell', 'Mercedes', '2022');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Carlos Sainz', 'Ferrari', '2022');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Lewis Hamilton', 'Mercedes', '2022');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Lando Norris', 'McLaren Mercedes', '2022');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Esteban Ocon', 'Alpine Renault', '2022');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Fernando Alonso', 'Alpine Renault', '2022');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Valtteri Bottas', 'Alfa Romeo Ferrari', '2022');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Daniel Ricciardo', 'McLaren Mercedes', '2022');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Sebastian Vettel', 'Aston Martin Aramco Mercedes', '2022');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Kevin Magnussen', 'Haas Ferrari', '2022');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Pierre Gasly', 'AlphaTauri RBPT', '2022');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Lance Stroll', 'Aston Martin Aramco Mercedes', '2022');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Mick Schumacher', 'Haas Ferrari', '2022');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Yuki Tsunoda', 'AlphaTauri RBPT', '2022');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Guanyu Zhou', 'Alfa Romeo Ferrari', '2022');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Alexander Albon', 'Williams Mercedes', '2022');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Nicholas Latifi', 'Williams Mercedes', '2022');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Nyck De Vries', 'Williams Mercedes', '2022');
INSERT INTO Drives_For (driver_name, team_name, year) VALUES ('Nico Hulkenberg', 'Aston Martin Aramco Mercedes', '2022');





INSERT INTO Engine_Manufacturer (model, company_name) VALUES ('Ferrari V10', 'Ferrari');
INSERT INTO Engine_Manufacturer (model, company_name) VALUES ('Honda RA620H', 'Honda');
INSERT INTO Engine_Manufacturer (model, company_name) VALUES ('Mercedes AMG F1 M10 EQ Power+', 'Mercedes');
INSERT INTO Engine_Manufacturer (model, company_name) VALUES ('Ferrari 062 EVO', 'Ferrari');
INSERT INTO Engine_Manufacturer (model, company_name) VALUES ('Renault E-Tech 20 1.6 V6 t', 'Renault');





INSERT INTO Car_Engine (car_model, engine_model) VALUES ('F2004', 'Ferrari V10');
INSERT INTO Car_Engine (car_model, engine_model) VALUES ('RB16', 'Honda RA620H');
INSERT INTO Car_Engine (car_model, engine_model) VALUES ('W10', 'Mercedes AMG F1 M10 EQ Power+');
INSERT INTO Car_Engine (car_model, engine_model) VALUES ('VF-18', 'Ferrari 062 EVO');
INSERT INTO Car_Engine (car_model, engine_model) VALUES ('MCL35', 'Renault E-Tech 20 1.6 V6 t');





INSERT INTO Safety_Car (model, manufacturer) VALUES ('Mercedes SLK 55 AMG', 'Mercedes');
INSERT INTO Safety_Car (model, manufacturer) VALUES ('Aston Martin Vantage', 'Aston Martin');
INSERT INTO Safety_Car (model, manufacturer) VALUES ('Mercedes-AMG GT R', 'Mercedes');
INSERT INTO Safety_Car (model, manufacturer) VALUES ('Mercedes-AMG GT S', 'Mercedes');
INSERT INTO Safety_Car (model, manufacturer) VALUES ('Mercedes SLS AMG', 'Mercedes');





INSERT INTO Season (year) VALUES ('2000');
INSERT INTO Season (year) VALUES ('2001');
INSERT INTO Season (year) VALUES ('2002');
INSERT INTO Season (year) VALUES ('2003');
INSERT INTO Season (year) VALUES ('2004');
INSERT INTO Season (year) VALUES ('2005');
INSERT INTO Season (year) VALUES ('2006');
INSERT INTO Season (year) VALUES ('2007');
INSERT INTO Season (year) VALUES ('2008');
INSERT INTO Season (year) VALUES ('2009');
INSERT INTO Season (year) VALUES ('2010');
INSERT INTO Season (year) VALUES ('2011');
INSERT INTO Season (year) VALUES ('2012');
INSERT INTO Season (year) VALUES ('2013');
INSERT INTO Season (year) VALUES ('2014');
INSERT INTO Season (year) VALUES ('2015');
INSERT INTO Season (year) VALUES ('2016');
INSERT INTO Season (year) VALUES ('2017');
INSERT INTO Season (year) VALUES ('2018');
INSERT INTO Season (year) VALUES ('2019');
INSERT INTO Season (year) VALUES ('2020');
INSERT INTO Season (year) VALUES ('2021');
INSERT INTO Season (year) VALUES ('2022');





INSERT INTO Race1 (p1, p2, p3, qp1, qp2, qp3, fastest_lap, circuit, year, safety_car_model) VALUES ('Juan Pablo Montoya', 'Kimi Räikkönen', 'Rubens Barrichello', 'Rubens Barrichello', 'Juan Pablo Montoya', 'Kimi Räikkönen', 'Juan Pablo Montoya', 'Sao Paulo', '2004', 'Mercedes SLK 55 AMG');
INSERT INTO Race1 (p1, p2, p3, qp1, qp2, qp3, fastest_lap, circuit, year, safety_car_model) VALUES ('Lewis Hamilton', 'Charles Leclerc', 'Valterri Bottas', 'Max Verstappen', 'Lewis Hamilton', 'Valtteri Bottas', 'Sergio Perez', 'Silverstone', '2021', 'Aston Martin Vantage');
INSERT INTO Race1 (p1, p2, p3, qp1, qp2, qp3, fastest_lap, circuit, year, safety_car_model) VALUES ('Lewis Hamilton', 'Sebastian Vettel', 'Max Verstappen', 'Lewis Hamilton', 'Valtteri Bottas', 'Max Verstappen', 'Pierre Gasly', 'Circuit de Monaco', '2019', 'Mercedes-AMG GT R');
INSERT INTO Race1 (p1, p2, p3, qp1, qp2, qp3, fastest_lap, circuit, year, safety_car_model) VALUES ('Sebastian Vettel', 'Lewis Hamilton', 'Max Verstappen', 'Lewis Hamilton', 'Sebastian Vettel', 'Esteban Ocon', 'Valterri Bottas', 'Spa', '2018', 'Mercedes-AMG GT S');
INSERT INTO Race1 (p1, p2, p3, qp1, qp2, qp3, fastest_lap, circuit, year, safety_car_model) VALUES ('Lewis Hamilton', 'Max Verstappen', 'Valterri Bottas', 'Lewis Hamilton', 'Valtteri Bottas', 'Max Verstappen', 'Valterri Bottas', 'Barcelona-catalunya', '2020', 'Mercedes SLS AMG');





INSERT INTO Race2 (circuit, country) VALUES ('Silverstone', 'Great Britian');
INSERT INTO Race2 (circuit, country) VALUES ('Sao Paulo', 'Brazil');
INSERT INTO Race2 (circuit, country) VALUES ('Circuit de Monaco', 'Monaco');
INSERT INTO Race2 (circuit, country) VALUES ('Spa', 'Belgium');
INSERT INTO Race2 (circuit, country) VALUES ('Barcelona-catalunya', 'Spain');





INSERT INTO Team2 (year, season_year) VALUES ('2000', '2000');
INSERT INTO Team2 (year, season_year) VALUES ('2001', '2001');
INSERT INTO Team2 (year, season_year) VALUES ('2002', '2002');
INSERT INTO Team2 (year, season_year) VALUES ('2003', '2003');
INSERT INTO Team2 (year, season_year) VALUES ('2004', '2004');
INSERT INTO Team2 (year, season_year) VALUES ('2005', '2005');
INSERT INTO Team2 (year, season_year) VALUES ('2006', '2006');
INSERT INTO Team2 (year, season_year) VALUES ('2007', '2007');
INSERT INTO Team2 (year, season_year) VALUES ('2008', '2008');
INSERT INTO Team2 (year, season_year) VALUES ('2009', '2009');
INSERT INTO Team2 (year, season_year) VALUES ('2010', '2010');
INSERT INTO Team2 (year, season_year) VALUES ('2011', '2011');
INSERT INTO Team2 (year, season_year) VALUES ('2012', '2012');
INSERT INTO Team2 (year, season_year) VALUES ('2013', '2013');
INSERT INTO Team2 (year, season_year) VALUES ('2014', '2014');
INSERT INTO Team2 (year, season_year) VALUES ('2015', '2015');
INSERT INTO Team2 (year, season_year) VALUES ('2016', '2016');
INSERT INTO Team2 (year, season_year) VALUES ('2017', '2017');
INSERT INTO Team2 (year, season_year) VALUES ('2018', '2018');
INSERT INTO Team2 (year, season_year) VALUES ('2019', '2019');
INSERT INTO Team2 (year, season_year) VALUES ('2020', '2020');
INSERT INTO Team2 (year, season_year) VALUES ('2021', '2021');
INSERT INTO Team2 (year, season_year) VALUES ('2022', '2022');




INSERT INTO Season_Champion (year, driver_name) VALUES ('2004', 'Michael Schumacher');
INSERT INTO Season_Champion (year, driver_name) VALUES ('2021', 'Max Verstappen');
INSERT INTO Season_Champion (year, driver_name) VALUES ('2019', 'Lewis Hamilton');
INSERT INTO Season_Champion (year, driver_name) VALUES ('2018', 'Lewis Hamilton');
INSERT INTO Season_Champion (year, driver_name) VALUES ('2020', 'Lewis Hamilton');





INSERT INTO Sponsor (name) VALUES ('Vodafone Group');
INSERT INTO Sponsor (name) VALUES ('Mobil 1');
INSERT INTO Sponsor (name) VALUES ('Tommy Hilfiger');
INSERT INTO Sponsor (name) VALUES ('Richard Mille');
INSERT INTO Sponsor (name) VALUES ('Velo');





INSERT INTO Pays_For (team_name, team_year, sponsor_name) VALUES ('Ferrari', '2004', 'Vodafone Group');
INSERT INTO Pays_For (team_name, team_year, sponsor_name) VALUES ('Red Bull Racing Honda', '2021', 'Mobil 1');
INSERT INTO Pays_For (team_name, team_year, sponsor_name) VALUES ('Mercedes', '2019', 'Tommy Hilfiger');
INSERT INTO Pays_For (team_name, team_year, sponsor_name) VALUES ('Haas Ferrari', '2018', 'Richard Mille');
INSERT INTO Pays_For (team_name, team_year, sponsor_name) VALUES ('McLaren Renault', '2020', 'Velo');
