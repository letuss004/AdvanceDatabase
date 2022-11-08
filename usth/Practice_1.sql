/*https://moodle.usth.edu.vn/pluginfile.php/23810/mod_resource/content/1/Practice%201.pdf*/
use AirlineReservation;

/*ex1*/
select Passenger.Name,
       Passenger.PNR_no,
       Reservation.PNR_no,
       Reservation.Aircraft_code,
       Reservation.Journey_date,
       IF(Reservation.No_of_seats > 1, 1, 0) withCompanion
from Passenger
         natural join Reservation;

/*ex2*/
select Aircraft_code, sum(No_of_seats) as sum
from Reservation
group by Aircraft_code
having sum(No_of_seats) > 5;

/*ex3*/
select * from Reservation order by No_of_seats DESC limit 1 offset 1;
select * from Reservation order by No_of_seats DESC limit 1, 1;

/*ex4*/

