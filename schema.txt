Team(
	Points int, 
	Name char(50), 
	Year int, 
	Season_year int, 
	Model char(50),
	Principal_name, char(50)
	)
Season(
	Year int PRIMARY KEY, 
	)
Race(
	Circuit char(200), 
	Year int, 
	Fastest_lap real, 
	P1 char(50), 
	P2 char(50), 
	P3 char(50), 
	QP1 char(50), 
	QP2 char(50), 
	QP3 char(50)
	)
Car(
	Model char(50)
	)
Engine Manufacturer(
	Model char(50), 
	Company_name char(100)
	)
Car_engine(
	Car_model char(50), 
	Engine_model char(50)
	)
Principal(
	Name char(100)
	)
Driver(
	Name char(100)
	Driver_number int
	)
Team_driver(
	Driver_name char(100), 
	Driver_number int, 
	Team_name char(50), 
	Team_year int
	)
Sponsor(
	Name char(100), 
	)
Team_sponsor(
	Team_name char(50), 
	Team_year int
	Sponsor_name char(100)
	)
Lap_record(
	Time real, 
	Year int, 
	Circuit_name char(200)
	)
Set_record(
	Driver_name char(100), 
	Time real
)
