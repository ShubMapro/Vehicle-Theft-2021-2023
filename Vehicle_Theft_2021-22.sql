Create database vehicleTheft;

use vehicleTheft;

Alter table locations
Add constraint primary key(locationId);

Alter table makeDetails
Add constraint primary key(makeId);

Alter table stolenVehicles
Add constraint primary key(vehicleId);

Alter table stolenVehicles
Add constraint foreign key(locationId) references locations(locationId);

Alter table stolenVehicles
Add constraint foreign key(makeId) references makeDetails(makeId);


# Total Vehicles Stolen
Select Count(*) as Total_Vehicles_Stolen from stolenVehicles;

# Average Model Age in Years
Select round(avg(year(dateStolen) - modelYear),2) as AverageAge from stolenVehicles;

# Average Vehicles stolen per day
Select round((count(*)/365)*2,0) as Average_Per_Day from stolenVehicles;

# Top 5 Vehicles stolen as per vehicle type
Select vehicleType, count(*) as VehicleTypeCount from stolenVehicles
group by vehicleType
order by VehicleTypeCount desc
limit 5;

# Top 5 Vehicles stolen as per region
Select region, count(*) as RegionCount from locations l
join stolenVehicles sv on l.locationId = sv.locationId
group by region
order by RegionCount desc
limit 5;

# Top 5 Vehicles stolen as per color
Select color, count(*) as NumberOfVehicles from stolenVehicles
group by color
order by NumberOfVehicles desc
limit 5;


# Top 5 Vehicles stolen as per make type
Select makeName, count(*) as MakeNameCount from makeDetails md
join stolenVehicles sv on md.makeId = sv.makeId
group by makeName
order by MakeNameCount desc
limit 5;

# Vehicles Stolen as per Weekdays
Select dayname(dateStolen) as Weekday, count(*) as NoOfVehicles from stolenVehicles
group by Weekday
order by NoOfVehicles Desc;

# Vehicles Stolen as per Months
Select monthname(dateStolen) as MonthName, count(*) as NoOfVehicles from stolenVehicles
group by MonthName
order by NoOfVehicles Desc;

# Vehicles Stolen as per Years
Select Year(dateStolen) as YearName, count(*) as NoOfVehicles from stolenVehicles
group by YearName
order by NoOfVehicles Desc;
