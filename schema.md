Team(

Points int, 

Name char(100), 

Year int, 

Team\_program char(100), 

**Season\_year** int NOT NULL, 

**Model** char(50) NOT NULL,

**Principal\_name** char(50) NOT NULL

)

Season(

Year int, 

**Champion\_name** char(100) NOT NULL

)

Race(

Circuit char(200), 

**Year** int, 

Fastest\_lap real, 

P1 char(100), 

P2 char(100), 

P3 char(100), 

QP1 char(100), 

QP2 char(100), 

QP3 char(100), 

Country char(100), 

**Safety\_model** char(50)

)

Safety\_car(

Model char(50), 

Manufacturer char(100)

)

Car(

Model char(50)

)

Engine Manufacturer(

Model char(50), 

Company\_name char(100)

)

Uses\_engine(

**Car\_model** char(50), 

**Engine\_model** char(50)

)

Principal(

Name char(100)

)

Driver(

Name char(100), 

Career\_points int, 

Career\_wins int

)

Drives\_for(

**Driver\_name** char(100), 

**Team\_name** char(100), 

**Team\_year** int

)

Sponsor(

Name char(100), 

)

Pays\_for(

**Team\_name** char(100), 

**Team\_year** int

**Sponsor\_name** char(100)

)

Lap\_record(

Time real, 

Year int, 

Circuit\_name char(200)

**Driver\_name** char(100) NOT NULL

)

