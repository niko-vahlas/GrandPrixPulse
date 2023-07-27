Team(

  Points int, 

  <ins>Name</ins> char(100), 

  <ins>Year</ins> int, 

  Team\_program char(100), 

  ***Season\_year*** int NOT NULL, 

  ***Model*** char(50) NOT NULL,

  ***Principal\_name*** char(50) NOT NULL

)

Season(

<ins>Year</ins> int, 

***Champion\_name*** char(100) NOT NULL

)

Race(

<ins>Circuit</ins> char(200), 

<ins>***Year***</ins> int, 

Fastest\_lap real, 

P1 char(100), 

P2 char(100), 

P3 char(100), 

QP1 char(100), 

QP2 char(100), 

QP3 char(100), 

Country char(100), 

***Safety\_model*** char(50)

)

Safety\_car(

<ins>Model</ins> char(50), 

Manufacturer char(100)

)

Car(

<ins>Model</ins> char(50)

)

Engine Manufacturer(

<ins>Model</ins> char(50), 

Company\_name char(100)

)

Uses\_engine(

<ins>***Car\_model***</ins> char(50), 

<ins>***Engine\_model***</ins> char(50)

)

Principal(

<ins>Name</ins> char(100)

)

Driver(

<ins>Name</ins> char(100), 

Career\_points int, 

Career\_wins int

)

Drives\_for(

<ins>***Driver\_name***</ins> char(100), 

<ins>***Team\_name***</ins> char(100), 

<ins>***Team\_year***</ins> int

)

Sponsor(

<ins>Name</ins> char(100), 

)

Pays\_for(

<ins>***Team\_name***</ins> char(100), 

<ins>***Team\_year***</ins> int

<ins>***Sponsor\_name***</ins> char(100)

)

Lap\_record(

Time real, 

Year int, 

<ins>Circuit\_name</ins> char(200)

***Driver\_name*** char(100) NOT NULL

) Candidate keys: Time

