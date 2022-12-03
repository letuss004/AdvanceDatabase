/*https://moodle.usth.edu.vn/pluginfile.php/23810/mod_resource/content/1/Practice%201.pdf*/
use AirlineReservation;
go
select P.Name,
       P.PNR_no,
       R.PNR_no,
       R.Aircraft_code,
       R.Journey_date,
       IIF(R.No_of_seats > 1, 1, 0) as withCompanion
from Passenger P
         join Reservation R on P.PNR_no = R.PNR_no;
go
select Aircraft_code, sum(No_of_seats) as sum
from Reservation
group by Aircraft_code
having sum(No_of_seats) > 5;
go
select *
from Reservation
order by No_of_seats DESC
offset 1 rows fetch next 1 rows only;
go
/**/
drop view if exists vw_male_passenger;
create or alter view vw_male_passenger as
select P.PNR_no, Ticket_no, Name, R2.Aircraft_code, Status, Sex
from Passenger P
         join Reservation R2 on P.PNR_no = R2.PNR_no
where Sex = 'Male';
select *
from vw_male_passenger;

/**/
select *
from Passenger
where PNR_no = 4;
update vw_male_passenger
SET Sex='Gfluid'
where PNR_no = 3

/**/
create or alter view vw_male_passenger as
select P.PNR_no, Ticket_no, Name, R2.Aircraft_code, Status, Sex
from Passenger P
         join Reservation R2 on P.PNR_no = R2.PNR_no
where Sex = 'Male'
with check option;

/**/
create or alter view vw_male_passenger with SCHEMABINDING as
select P.PNR_no, Ticket_no, Name, R2.Aircraft_code, Status, Sex
from Passenger P
         join Reservation R2 on P.PNR_no = R2.PNR_no
where Sex = 'Male'
/**/
exec sp_spaceused Passenger;
exec sp_spaceused vw_male_passenger;

/**/
create or alter procedure process_counter as
begin
    declare @cnt int = 10
    while @cnt >= 0 begin
        PRINT square(@cnt)
        set @cnt = @cnt - 1
    end
end
go
exec process_counter;

/**/
create or alter procedure display_passenger_companion @Aircraft_code varchar as
select P.Name,
       P.PNR_no,
       R.PNR_no,
       R.Aircraft_code,
       R.Journey_date,
       IIF(R.No_of_seats > 1, 1, 0) as withCompanion
from Passenger P
         join Reservation R on P.PNR_no = R.PNR_no
where R.Aircraft_code = @Aircraft_code
go
exec display_passenger_companion 'IC01';
/**/
create or alter procedure Insert_Passenger @PNR_no int, @Ticket_no int, @Name varchar, @Age int, @Sex char,
                                           @PP_No varchar, @Meal varchar as
insert into Passenger (PNR_no, Ticket_no, Name, Age, Sex, [PP No], [Meal Pref])
values (@PNR_no, @Ticket_no, @Name, @Age, @Sex, @PP_No, @Meal)
go

/**/
create or alter function Count_non_chinese_meal() returns int as
begin
    declare @tmp int = 1
    --     set @tmp = (select count(*)
--                 from Meal
--                 where Meal_name not like 'Chinese%')
    return @tmp;
end
go
select Count_non_chinese_meal()
go
/**/
create or alter function Display_meal(@meal_name varchar(10))
    returns table as
        return
            (
                select Meal_name, A.Airline_name
                from Meal
                         join Airline_meal Am on Meal.Meal_code = Am.meal_code
                         join Airlines_Master A on Am.Aircode = A.Aircode
                where Meal_name like case when @meal_name != '*' then @meal_name else '%' end
            )
go
select *
from Display_meal('Vegetarian')
select *
from Display_meal('*')
go
/**/
create or alter trigger prevents_deleting
    on Passenger
    for delete as if (select count(*)
                      from deleted) > 1
    begin
        raiserror ('You have not permission to delete more than 1 passenger at the time', 16, 1)
    end
go
/**/
create or alter trigger ins_reservation
    on Reservation
    for insert as
begin
    declare c cursor for select inserted.PNR_no, inserted.Aircraft_code, inserted.Class_code from inserted
    declare @PNR_no int
    declare @Aircraft_code varchar
    declare @Class_code char
    open c
    fetch next from c into @PNR_no, @Aircraft_code, @Class_code;
    if ((select count(*)
         from Passenger P
                  join Flight F on F.Aircraft_code = @Aircraft_code
                  join Class_master C on C.Class_code = @Class_code
         where P.PNR_no = @PNR_no) < 1)
        delete from Reservation where PNR_no = @PNR_no
    fetch next from c into @PNR_no, @Aircraft_code, @Class_code;
    close c;
end;
go
insert into Reservation (PNR_no, Aircraft_code, Journey_date, Class_code, No_of_seats, Address, Contact_no, Status)
values (111, 'asf', getDate(), 'C', 121, 'as', 111, 'a'),
       (111, 'asf', getDate(), 'C', 121, 'as', 111, 'a');
/**/
create or alter trigger ins_reservation_data
    on Reservation
    for insert as
begin
    declare @Journey_date datetime;
    declare @PNR_no int;
    declare c cursor for select inserted.Journey_date, inserted.PNR_no;
    open c
    fetch next from c into @Journey_date, @PNR_no;
    if (@Journey_date < getdate()) delete from Reservation where PNR_no = @PNR_no
    close c
end
go
/**/
create or alter trigger update_no_of_set
    on Reservation
    for update as
begin
    declare @seats int;
    declare @PNR_no int;
    declare c cursor for SELECT inserted.No_of_seats, inserted.PNR_no;
    open c
    fetch next from c into @seats, @PNR_no;
    if (@seats > 5) delete from Reservation where PNR_no;
    close c;
end
