# Proposal

### Project Description

The goal of the project is to create a database that contains historical information pertaining to **Formula 1** such as:

- Drivers, team principal, and points scored by different teams every year
- Fastest lap times at various circuits
- Seasonal race results

The database is going to model:

- Drivers, team principal, sponsors, and car model as entities related to a team
- Points scored by drivers and teams every year
- Engine manufacturer for different model cars (different cars from different teams sometimes share the same engine)
- Unique team entities differentiated by year
- The relationship between drivers and lap records on different circuits
- Race results every year

### Database Specifications

Benefits of the database:

- Overview of historical team data
- Compare and review past driver, car, and team performance
- View fastest lap records at all F1 circuits

Functionality:

- Look up team members, sponsors, car model, and team performance by year and team
- Look up most recent lap records of different Formula 1 circuits
- Look up race results by year and circuit

### Description of Application Platform

We will use PHP/MySQL for the backend and HTML/CSS for the frontend.

### ER Diagram

![f1 drawio](https://media.github.students.cs.ubc.ca/user/18369/files/cac2ee2c-bbcc-45f1-bae0-058a49ce6276)
