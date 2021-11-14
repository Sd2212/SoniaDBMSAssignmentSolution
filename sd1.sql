create database Travel;
use Travel;

create table PASSENGER(
Passenger_name varchar(15),
Category_Id int,Gender varchar(6),
Passenger_Id int,
FOREIGN KEY (Category_Id) REFERENCES CATEGORY (CAT_ID), 
FOREIGN KEY (Passenger_Id) REFERENCES City (Pass_id)  
);

create table Category(
CAT_ID int primary key, Category varchar(15),
 Bus_Type varchar(10)
);

create table City(
Pass_id int primary key,Boarding_City varchar(20),
Destination_City varchar(20),Distance int
);

create table Price(
Bus_Type varchar(10),Distance int,
Price int
);

insert into PASSENGER values("Sejal",2,"F",1);
insert into PASSENGER values("Anmol",3,"M",2);
insert into PASSENGER values("Pallavi",2,"F",3);
insert into PASSENGER values("Khusboo",2,"F",4);
insert into PASSENGER values("Udit",1,"M",5);
insert into PASSENGER values("Ankur",4,"M",6);
insert into PASSENGER values("Hemant",1,"M",7);
insert into PASSENGER values("Manish",3,"M",8);
insert into PASSENGER values("Piyush",4,"M",9);

insert into Category values(1,"Non-Ac","Sleeper");
insert into Category values(2,"Ac","Sleeper");
insert into Category values(3,"Non-Ac","Sitting");
insert into Category values(4,"Ac","Sitting");

insert into City values(1,"Bengaluru","Chennai",350);
insert into City values(2,"Mumbai","Hyderbad",700);
insert into City values(3,"Panaji","Bengaluru",600);
insert into City values(4,"Chennai","Mumbai",1500);
insert into City values(5,"Trivandrum","Panaji",1000);
insert into City values(6,"Nagpur","Hyderbad",500);
insert into City values(7,"Panaji","Mumbai",700);
insert into City values(8,"Hyderbad","Bengaluru",500);
insert into City values(9,"Pune","Nagpur",700);

insert into Price values("Sleeper",350,770);
insert into Price values("Sleeper",500,1100);
insert into Price values("Sleeper",600,1320);
insert into Price values("Sleeper",700,1540);
insert into Price values("Sleeper",1000,2200);
insert into Price values("Sleeper",1200,2640);
insert into Price values("Sitting",500,620);
insert into Price values("Sitting",600,744);
insert into Price values("Sitting",700,868);
insert into Price values("Sitting",1000,1240);
insert into Price values("Sitting",1200,1488);
insert into Price values("Sitting",1500,1860);
insert into Price values("Sleeper",350,434);

select p.Gender, count(p.Gender) as count from Passenger p
inner join City c on p.passenger_id=c.pass_id
  where c.Distance>=600 group by Gender;
 
 select min(Price) as Min from Price where Bus_Type="Sleeper";

select Passenger_name from Passenger where Passenger_name like "S%";

select p.passenger_name,c.boarding_city,c.destination_city,
ca.Bus_Type,pr.Price from Passenger p
inner join category ca on p.category_id=ca.cat_id
inner join City c on p.passenger_id=c.pass_id
inner join Price pr on pr.bus_type=ca.bus_type
where c.distance=pr.distance;

select p.passenger_name, pr.price from passenger p
inner join category ca on p.category_id=ca.cat_id
inner join City c on p.passenger_id=c.pass_id
inner join Price pr on pr.bus_type=ca.Bus_Type
 where c.Distance=1000  and ca.bus_type="Sitting" ;
 
select  ca.bus_type, pr.price from  category ca
inner join passenger p on p.category_id=ca.cat_id
inner join City c on p.passenger_id=c.pass_id
inner join Price pr on pr.distance=c.distance
where p.passenger_name="Pallavi";
 
 select distinct(distance) from City order by distance desc;
 
 select p.passenger_name, c.distance,c.distance*100/t.s as `percent of total`
 from city c  cross join (select sum(c.distance) as s from city c)t
 inner join passenger p on p.passenger_id=c.pass_id;

call cost;

update  city set boarding_city="Chennai" where pass_id=4;
update  city set destination_city="Mumbai" where pass_id=4;
update  city set distance=1500 where pass_id=4;

