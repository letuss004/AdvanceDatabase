Use master
GO
create database AirlineReservation
Go
Use AirlineReservation

create table [dbo].[Airline_meal]
(
    [Aircode]   [char](2)    not null,
    [meal_code] [varchar](5) not null
)

create table [dbo].[Airline_Service]
(
    [Aircode]      [char](2)    not null,
    [Service_code] [varchar](3) not null
)

create table [dbo].[Airlines_Master]
(
    [Aircode]      [char](2)     not null,
    [Airline_name] [varchar](15) not null
)

create table [dbo].[Category_master]
(
    [Category_code] [char](2)     not null,
    [Description]   [varchar](15) not null
)

create table [dbo].[City_master]
(
    [City_code] [varchar](5)  not null,
    [City_name] [varchar](15) not null,
    [Country]   varchar(15)   not null
)

create table [dbo].[Class_master]
(
    [Class_code] [char](3)     not null,
    [Class_name] [varchar](15) not null
)

create table [dbo].[Day_master]
(
    [Day_code] [int]         not null,
    [Day_name] [varchar](15) not null
)

create table [dbo].[Flight]
(
    [Aircraft_code] [char](5)     not null,
    [Aircode]       [char](2)     not null,
    [Type]          [varchar](10) not null,
    [Source]        [varchar](15) not null,
    [Destination]   [varchar](15) not null,
    [Category]      [varchar](15) not null,
    [Dep_time]      [varchar](15),
    [Journey_hrs]   [int]
)

create table [dbo].[Flight_days]
(
    [Aircraft_code] [varchar](5) not null,
    [day_code]      [int]        not null
)

create table [dbo].[Flight_details]
(
    [Aircraft_code] [varchar](5) not null,
    [Class_code]    [char](2)    not null,
    [Fare]          [numeric](9) not null,
    [Seats]         [numeric](9) not null
)

create table [dbo].[Meal]
(
    [Meal_code] [varchar](5)  not null,
    [Meal_name] [varchar](30) not null
)

create table [dbo].[Passenger]
(
    [PNR_no]    [numeric](9)  not null,
    [Ticket_no] [numeric](9)  not null,
    [Name]      [varchar](15) not null,
    [Age]       [int]         not null,
    [Sex]       [char](10)    not null,
    [PP No]     [varchar](20) not null,
    [Meal Pref] [varchar](20)
)

create table [dbo].[Service]
(
    [Service_code] [varchar](3)  not null,
    [Service_name] [varchar](20) not null
)

create table [dbo].[Status_master]
(
    [Status_code] [varchar](3)  not null,
    [Description] [varchar](15) not null
)

create table [dbo].[Reservation]
(
    [PNR_no]        [numeric](9)  not null,
    [Aircraft_code] [varchar](5)  not null,
    [Journey_date]  [datetime]    not null,
    [Class_code]    [char](3)     not null,
    [No_of_seats]   [bigint]      not null,
    [Address]       [varchar](50) not null,
    [Contact_no]    [numeric](9)  not null,
    [Status]        [char](3)     not null
)


insert into Airline_meal
values ('9W', 'V')
insert into Airline_meal
values ('9W', 'NV')
insert into Airline_meal
values ('AI', 'V')
insert into Airline_meal
values ('AI', 'NV')
insert into Airline_meal
values ('AI', 'V')
insert into Airline_meal
values ('AI', 'CV')
insert into Airline_meal
values ('AI', 'CNV')
insert into Airline_meal
values ('AI', 'CONV')
insert into Airline_meal
values ('AI', 'CONNV')
insert into Airline_meal
values ('BA', 'V')
insert into Airline_meal
values ('BA', 'NV')
insert into Airline_meal
values ('BA', 'CV')
insert into Airline_meal
values ('BA', 'CNV')
insert into Airline_meal
values ('BA', 'CONV')
insert into Airline_meal
values ('BA', 'CONNV')
insert into Airline_meal
values ('IA', 'V')
insert into Airline_meal
values ('IA', 'NV')
insert into Airline_Service
values ('IA', 'CC')
insert into Airline_Service
values ('IA', 'N')
insert into Airline_Service
values ('IA', 'WC')
insert into Airline_Service
values ('BA', 'CC')
insert into Airline_Service
values ('BA', 'N')
insert into Airline_Service
values ('BA', 'WC')
insert into Airline_Service
values ('9W', 'CC')
insert into Airline_Service
values ('9W', 'N')
insert into Airline_Service
values ('9W', 'WC')
insert into Airline_Service
values ('AI', 'CC')
insert into Airline_Service
values ('AI', 'N')
insert into Airline_Service
values ('AI', 'WC')
insert into Airlines_Master
values ('9W', 'Jet Airways')
insert into Airlines_Master
values ('AI', 'Air India')
insert into Airlines_Master
values ('BA', 'British Airways')
insert into Airlines_Master
values ('IA', 'Indian Airlines')
insert into Category_master
values ('D', 'Domestic')
insert into Category_master
values ('I', 'International')
insert into City_master
values ('Bang', 'Bangalore', 'India')
insert into City_master
values ('Cal', 'Calcutta', 'India')
insert into City_master
values ('Che', 'Chennai', 'India')
insert into City_master
values ('Del', 'Delhi', 'India')
insert into City_master
values ('Lon', 'London', 'England')
insert into City_master
values ('Mum', 'Mumbai', 'India')
insert into City_master
values ('NY', 'New York', 'USA')
insert into Class_master
values ('FC', 'First Class')

insert into Class_master
values ('E', 'Economy')
insert into Class_master
values ('Ex', 'Executive')
insert into Day_master
values (1, 'Sunday')
insert into Day_master
values (2, 'Monday')
insert into Day_master
values (3, 'Tuesday')
insert into Day_master
values (4, 'Wednesday')
insert into Day_master
values (5, 'Thursday')
insert into Day_master
values (6, 'Friday')
insert into Day_master
values (7, 'Saturday')
insert into Flight
values ('9W01', '9W', 'Airbus', 'Cal', 'Che', 'D', '15.30', 3)
insert into Flight
values ('9W02', '9W', 'Airbus', 'Mum', 'Del', 'D', '9.30', 2)
insert into Flight
values ('9W03', '9W', 'Airbus', 'Che', 'Mum', 'D', '10.45', 2)
insert into Flight
values ('AI01', 'AI', 'Boeing', 'Cal', 'NY', 'I', '2.20', 18)
insert into Flight
values ('AI02', 'AI', 'Boeing', 'Mum', 'NY', 'I', '1.30', 20)
insert into Flight
values ('AIO3', 'AI', 'Boeing', 'Del', 'NY', 'I', '3.00', 17)
insert into Flight
values ('BA01', 'BA', 'Boeing', 'Mum', 'Lon', 'I', '23.30', 9)
insert into Flight
values ('BA02', 'BA', 'Boeing', 'Del', 'Lon', 'I', '2.15', 11)
insert into Flight
values ('BA03', 'BA', 'Boeing', 'Mum', 'NY', 'I', '3.30', 20)
insert into Flight
values ('IC01', 'IA', 'Airbus', 'Bang', 'Che', 'D', '10.45', 1)
insert into Flight
values ('IC02', 'IA', 'Airbus', 'Bang', 'Mum', 'D', '14.00', 2)
insert into Flight
values ('IC03', 'IA', 'Boeing', 'Del', 'Cal', 'D', '17.45', 1)
insert into Flight
values ('IC04', 'IA', 'Boeing', 'Mum', 'Cal', 'D', '18.30', 2)
insert into Flight_days
values ('9W01', 1)
insert into Flight_days
values ('9W02', 2)
insert into Flight_days
values ('AI01', 2)
insert into Flight_days
values ('AI02', 1)
insert into Flight_days
values ('AI03', 2)
insert into Flight_days
values ('BA01', 2)
insert into Flight_days
values ('BA02', 1)

insert into Flight_days
values ('BA03', 2)
insert into Flight_days
values ('IC01', 1)
insert into Flight_days
values ('IC02', 3)
insert into Flight_days
values ('IC03', 1)
insert into Flight_days
values ('IC04', 2)
insert into Flight_days
values ('9W01', 3)
insert into Flight_days
values ('9W02', 4)
insert into Flight_days
values ('9W03', 4)
insert into Flight_days
values ('AI01', 4)
insert into Flight_days
values ('AI02', 3)
insert into Flight_days
values ('AI03', 4)
insert into Flight_days
values ('BA01', 4)
insert into Flight_days
values ('BA02', 3)
insert into Flight_days
values ('BA03', 4)
insert into Flight_days
values ('IC01', 2)
insert into Flight_days
values ('IC02', 5)
insert into Flight_days
values ('IC03', 3)
insert into Flight_days
values ('IC04', 4)
insert into Flight_days
values ('9W01', 5)
insert into Flight_days
values ('9W03', 6)
insert into Flight_days
values ('AI01', 7)
insert into Flight_days
values ('AI02', 5)
insert into Flight_days
values ('AI03', 6)
insert into Flight_days
values ('BA01', 7)
insert into Flight_days
values ('BA02', 5)
insert into Flight_days
values ('BA03', 7)
insert into Flight_days
values ('IC01', 5)
insert into Flight_days
values ('IC02', 6)
insert into Flight_days
values ('IC03', 5)
insert into Flight_days
values ('IC04', 6)
insert into Flight_days
values ('9W02', 6)
insert into Flight_days
values ('AI02', 6)
insert into Flight_days
values ('AI03', 7)
insert into Flight_days
values ('IC03', 6)
insert into Flight_days
values ('IC05', 1)
insert into Flight_details
values ('IC01', 'E', 3409, 300)
insert into Flight_details
values ('IC01', 'Ex', 5117, 150)
insert into Flight_details
values ('IC02', 'E', 4000, 300)
insert into Flight_details
values ('IC02', 'Ex', 4600, 150)
insert into Flight_details
values ('IC03', 'E', 5048, 425)
insert into Flight_details
values ('IC03', 'Ex', 7574, 125)
insert into Flight_details
values ('IC04', 'E', 5817, 425)
insert into Flight_details
values ('IC04', 'Ex', 5861, 125)

insert into Flight_details
values ('9W01', 'E', 6100, 300)
insert into Flight_details
values ('9W01', 'Ex', 6895, 150)
insert into Flight_details
values ('9W02', 'E', 5900, 300)
insert into Flight_details
values ('9W02', 'Ex', 6850, 150)
insert into Flight_details
values ('9W03', 'E', 4175, 300)
insert into Flight_details
values ('9W03', 'Ex', 5400, 150)
insert into Flight_details
values ('AI01', 'E', 72215, 350)
insert into Flight_details
values ('AI01', 'Ex', 77145, 175)
insert into Flight_details
values ('AI01', 'FC', 81215, 100)
insert into Flight_details
values ('AI02', 'E', 60100, 350)
insert into Flight_details
values ('AI02', 'Ex', 70150, 175)
insert into Flight_details
values ('AI02', 'FC', 75540, 100)
insert into Flight_details
values ('AI03', 'E', 6100, 300)
insert into Flight_details
values ('AI03', 'Ex', 6100, 300)
insert into Flight_details
values ('AI03', 'FC', 6100, 300)
insert into Flight_details
values ('BA01', 'E', 63215, 350)
insert into Flight_details
values ('BA01', 'Ex', 69145, 175)
insert into Flight_details
values ('BA01', 'FC', 73215, 100)
insert into Flight_details
values ('BA02', 'E', 66130, 350)
insert into Flight_details
values ('BA02', 'Ex', 72190, 175)
insert into Flight_details
values ('BA02', 'FC', 78540, 100)
insert into Flight_details
values ('BA03', 'E', 62350, 350)
insert into Flight_details
values ('BA03', 'Ex', 63100, 175)
insert into Flight_details
values ('BA03', 'FC', 64150, 100)
insert into Meal
values ('CV', 'Chinese Vegetarian')
insert into Meal
values ('CNV', 'Chinese Non-Vegetarian')
insert into Meal
values ('CONV', 'Continental Vegetarian')
insert into Meal
values ('CONNV', 'Continental Non-Vegetarian')
insert into Meal
values ('NV', 'Non-Vegetarian')
insert into Meal
values ('V', 'Vegetarian')
insert into Passenger
values (1, 1, 'Allen Smith', 45, 'Male', 117889, 'CONNV')
insert into Passenger
values (1, 2, 'Stella Smith', 23, 'Female', 322901, 'V')
insert into Passenger
values (1, 3, 'Pam Smith', 26, 'Female', 279011, 'NV')
insert into Passenger
values (2, 4, 'Peter Jones', 27, 'Male', '293211', 'NV')
insert into Passenger
values (2, 5, 'Lily Jones', 30, 'Female', 347821, 'V')
insert into Passenger
values (3, 6, 'James Crawford', 44, 'Male', 123111, 'NV')

insert into Passenger
values (3, 7, 'Kitty Crawford', 30, 'Female', 1237112, 'CONNV')
insert into Passenger
values (4, 8, 'Alex Lee', 22, 'Male', 40103, 'V')
insert into Passenger
values (4, 9, 'Greta Lee', 20, 'Female', 41312, 'NV')
insert into Passenger
values (4, 10, 'Shania Lee', 30, 'Female', 34784, 'NV')
insert into Passenger
values (4, 10, 'Christopher Lee', 30, 'Female', 12453, 'NV')
insert into Passenger
values (3, 7, 'Stella Morris', 27, 'Female', 31567, 'V')
insert into Service
values ('CC', 'Child Care')
insert into Service
values ('N', 'Nurse')
insert into Service
values ('WC', 'Wheel Chair')
insert into Status_master
values ('C', 'Cancelled')
insert into Status_master
values ('R', 'Reserved')
insert into Status_master
values ('T', 'Travelled')
insert into Status_master
values ('U', 'Untravelled')
insert into Status_master
values ('W', 'Waitlist')
insert into Reservation
values (1, 'IC01', '2001-03-15', 'Ex', 2, '25, Temple street, Malleshwaram, Bangalore', 3317575, 'C')
insert into Reservation
values (2, 'BA02', '2001-05-15', 'FC', 3, 'Pushpa Vihar, 613 Defence colony, New Delhi', 6453892, 'C')
insert into Reservation
values (3, 'IC01', '2001-03-15', 'Ex', 2, '11A, Ellite Auto house, Andheri, Mumber-93', 3214344, 'C')
insert into Reservation
values (4, 'BA02', '2001-03-21', 'E', 4, 'Videocon Bldg, Andheri-E, Mumbai-93', 9430243, 'R')
insert into Reservation
values (5, 'IC01', '2001-05-15', 'FC', 1, 'Nariman Point, Mumbai-1', 2122122, 'C')
