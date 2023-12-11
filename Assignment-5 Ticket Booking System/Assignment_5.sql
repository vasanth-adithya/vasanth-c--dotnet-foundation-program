------------------------------------------------------------TASK 1-------------------------------------------------------------------------------


--1)Creating a Data Base with Name TicketBookingSystem

Create Database TicketBookingSystem

Use TicketBookingSystem


--2)Creating the Tables

--a)Venue Table
Create Table venue(
Venue_Id Int Primary Key Not Null,
Venue_name Varchar(255),
Address Varchar(255),
);

Select * from Venue


--b)Event Table
Create Table Event(
Event_id int Primary Key Not Null,
Event_Name Varchar(255),
Event_Date Date,
Event_Time Time,
Venue_id Int Foreign Key References Venue(Venue_Id),
Total_Seats Int,
Available_Seats Int,
Ticket_Price Decimal,
Event_Type Varchar(255) Check(Event_Type in ('Movie','Sports','Concert')),--Syntax(Event_Type Varchar(255) check(Event_Type in ('Movie','Sports','Concert')))
Booking_Id Int,--Syntax(Booking_Id Int Foreign Key References Booking(Booking_Id)).Here,Im not declaring the (Foreign Key) because there is no table with Name Booking,So We just Declaring the Booking_Id and datatype and at last we need to update this record with foreign Key.
);

Select * from Event;


--c)Customer Table

Create Table Customers(
Customer_Id Int Primary Key Not Null,
Customer_Name Varchar(255),
Email Varchar(255),
Phone_Number Varchar(255),
Booking_Id Int,--Syntax(Booking_Id Int Foreign Key References Booking(Booking_Id)).Here,Im not declaring the (Foreign Key) because there is no table with Name Booking,So We just Declaring the Booking_Id and datatype and at last we need to update this record with foreign Key.
);

Select * from Customers;




--d)Booking Table

Create Table Booking(
Booking_Id Int Primary Key Not Null,
Customer_Id Int Foreign Key References Customers(Customer_Id),
Event_Id Int Foreign Key References Event(Event_Id),
Num_Tickets Int,
Total_Cost Decimal,
Booking_Date Date
);

Select * from Booking;

--Displaying all the Tables

Select * from Venue;
Select * from Customers;
Select * from Event;
Select * from Booking;


----------------------------------------------Task 2-----------------------------------------------------------
--1. Write a SQL query to insert at least 10 sample records into each table.


    

-- Insert sample records into Event table
INSERT INTO Venue (Venue_Id, Venue_name, Address)
VALUES
    (1, 'ABC Concert Hall', 'MG Road Thrissur, Kerala'),
    (2, 'XYZ Stadium', 'Second Street, Bangalore, Karnataka'),
    (3, 'YUN Theatre', 'Naoroji Road, Mumbai, Maharashtra'),
    (4, 'ASD Stadium', 'SMS Road, Kochi, Kerala'),
    (5, 'KJH Concert Hall', 'Minister Road, Hyderabad, Telangana'),
    (6, 'MRS Stadium', 'Akbar Road, Delhi, Uttar Pradesh'),
    (7, 'SRM Concert Hall', 'Tughlaq Road, Jaipur, Rajasthan'),
    (8, 'EFG Theatre', 'Park Street, Kolkata, West Bengal'),
    (9, 'BRS Theatre', 'Tilak Marg, Delhi, Uttar Pradesh'),
    (10, 'CFR Concert Hall', 'RS Road, Trivandrum, Kerala'),
    (11, 'Royal Palace', '23 Pinnavar Street, Warangal'),
    (12, 'Emerald Gardens', 'Hunter Road, Warangal'),
    (13, 'Mystic Meadows', 'Mulugu Road, Mulugu'),
    (14, 'Grand Plaza', 'Aramghar, Ranga Reddy'),
    (15, 'Serenity Hall', 'L.B Nagar, Hyderabad'),
    (16, 'Harmony Gardens', '2-24, Airport Road, Shamshabad, Hyderabad'),
    (17, 'Sunset Haven', 'Madhura Lane, Khammam'),
    (18, 'Eternal Palace', 'Parade Ground, Hyderabad'),
    (19, 'Whispering Woods', 'KPHB COLONY, Hanamkonda'),
    (20, 'Enchanting Oasis', 'Rudragudem, Nallabelli');

INSERT INTO Event (Event_id, Event_Name, Event_Date, Event_Time, Venue_id, Total_Seats, Available_Seats, Ticket_Price, Event_Type, Booking_Id)
VALUES
	(101, 'Anandham', '2024-01-05', '13:00:00', 1, 200, 150, 150.00, 'Movie', 11),
	(102, 'YHJ Concert', '2024-02-22', '16:30:00', 2, 1000, 850, 1500.00, 'Concert', 13),
	(103, 'Jawan', '2023-12-15', '07:00:00', 3, 350, 200, 120.00, 'Movie', 15),
	(104, 'Cricket World Cup Final', '2024-04-12', '14:00:00', 4, 20000, 0, 2000.00, 'Sports', 17),
	(105, 'ZGY Concert', '2024-01-14', '10:00:00', 5, 2500, 1000, 250.00, 'Concert', 19),
	(106, 'Queen', '2023-12-19', '19:00:00', 6, 300, 100, 140.00, 'Movie', 12),
	(107, 'FIFA World Cup Semi-Final', '2024-03-04', '12:30:00', 7, 25000, 20000, 450.00, 'Sports', 14),
	(108, 'MRQ Concert', '2024-06-25', '09:00:00', 8, 2500, 1500, 1000.00, 'Concert', 16),
	(109, 'Badminton Final', '2024-02-13', '08:30:00', 9, 4000, 2000, 400.00, 'Sports', 18),
	(110, 'WQA Concert', '2024-08-18', '10:00:00', 10, 3500, 2000, 350.00, 'Concert', 20),
	(111, 'Bollywood Night', '2023-12-15', '20:00:00', 11, 200, 200, 150.00, 'Concert', 1),
    (112, 'Cricket Match', '2023-12-20', '15:30:00', 12, 5000, 5000, 100.00, 'Sports', 2),
    (113, 'Classical Concert', '2023-12-18', '19:30:00', 13, 150, 150, 200.00, 'Concert', 3),
    (114, 'Football Championship', '2023-12-22', '17:00:00', 14, 10000, 10000, 80.00, 'Sports', 4),
    (115, 'Movie Premiere', '2023-12-17', '21:00:00', 15, 300, 300, 120.00, 'Movie', 5),
    (116, 'Rock Music Festival', '2023-12-19', '18:30:00', 16, 500, 500, 180.00, 'Concert', 6),
    (117, 'Tennis Tournament', '2023-12-21', '14:00:00', 17, 2000, 2000, 90.00, 'Sports', 7),
    (118, 'Comedy Show', '2023-12-16', '19:00:00', 18, 100, 100, 160.00, 'Concert', 8),
    (119, 'Basketball Championship', '2023-12-23', '16:30:00', 19, 8000, 8000, 75.00, 'Sports', 9),
    (120, 'Dance Performance', '2023-12-14', '22:00:00', 20, 250, 250, 130.00, 'Concert', 10);

-- Inserting records into Customers table
INSERT INTO Customers (Customer_Id, Customer_Name, Email, Phone_Number, Booking_Id)
VALUES
(1001, 'Aarav Sharma', 'aarav@gmail.com', '9876543210', 1),
    (1002, 'Isha Singh', 'isha@gmail.com', '8765432109', 2),
    (1003, 'Advait Verma', 'advait@gmail.com', '7654321098', 3),
    (1004, 'Sia Kapoor', 'sia@gmail.com', '6543210987', 4),
    (1005, 'Aryan Patel', 'aryan@gmail.com', '5432109876', 5),
    (1006, 'Anaya Gupta', 'anaya@gmail.com', '4321098765', 6),
    (1007, 'Vihaan Kumar', 'vihaan@gmail.com', '3210987654', 7),
    (1008, 'Aisha Yadav', 'aisha@gmail.com', '2109876543', 8),
    (1009, 'Arjun Malhotra', 'arjun@gmail.com', '1098765432', 9),
    (1010, 'Zara Khan', 'zara@gmail.com', '9876543210', 10),
	(1011, 'Sreya Das', 'sreya@gmail.com', 9999999000, 12),
	(1012, 'Srinithi Verma', 'srinithi@gmail.com', 9123499879, 14),
	(1013, 'Maria Varghese', 'maria@gmail.com', 9999888888, 16),
	(1014, 'Amrutha Jose', 'amrutha@gmail.com', 9207234567, 18),
	(1015, 'Devika Dinesh', 'devika@gmail.com', 9123456789, 20),
	(1016, 'Reshma K', 'reshma@gmail.com', 9802864713, 11),
	(1017, 'Malavika Pradeep', 'malavika@gmail.com', 9988776655, 13),
	(1018, 'Prem Kishan', 'prem@gmail.com', 7095919679, 15),
	(1019, 'Neha Singh', 'neha@gmail.com', 9912658491, 17),
	(1020, 'Meghan Gupta', 'meghan@gmail.com', 8965458491, 19);



    

-- Inserting records into Booking table
INSERT INTO Booking (Booking_Id, Customer_Id, Event_Id, Num_Tickets, Total_Cost, Booking_Date)
VALUES
    (1, 1001, 111, 2, 800.00, '2023-12-10'),
    (2, 1002, 112, 5, 5100.00, '2023-12-12'),
    (3, 1003, 113, 1, 2100.00, '2023-12-14'),
    (4, 1004, 114, 3, 2140.00, '2023-12-16'),
    (5, 1005, 115, 4, 4180.00, '2023-12-18'),
    (6, 1006, 116, 2, 1360.00, '2023-12-20'),
    (7, 1007, 117, 6, 5410.00, '2023-12-22'),
    (8, 1008, 118, 1, 1160.00, '2023-12-24'),
    (9, 1009, 119, 5, 3175.00, '2023-12-26'),
    (10, 1010, 120, 3, 1390.00, '2023-12-28'),
	(11, 1016, 101, 4, 600.00, '2023-12-08'),
	(12, 1011, 106, 4, 560.00, '2023-12-17'),
	(13, 1017, 102, 1, 1500.00, '2023-10-05'),
	(14, 1012, 107, 2, 900.00, '2023-08-25'),
	(15, 1018, 103, 3, 360.00, '2023-12-10'),
	(16, 1013, 108, 2, 2000.00, '2024-05-10'),
	(17, 1019, 104, 2, 4000.00, '2024-02-14'),
	(18, 1014, 109, 3, 1200.00, '2024-01-04'),
	(19, 1020, 105, 5, 1250.00, '2023-11-23'),
	(20, 1015, 110, 1, 350.00, '2024-06-19');



--Displaying all the Tables

Select * from Venue;
Select * from Customers;
Select * from Event;
Select * from Booking;


--2. Write a SQL query to list all Events.

Select * from Event;






--3. Write a SQL query to select events with available tickets.

Select Event_Name from Event
Where Available_Seats>0;







--4. Write a SQL query to select events name partial match with ‘cup’.

Select Event_Name from Event
Where Event_Name like '%cup%';


--5. Write a SQL query to select events with ticket price range is between 1000 to 2500.

Select Event_Name from Event
Where Ticket_Price Between 1000 And 2500;



--6. Write a SQL query to retrieve events with dates falling within a specific range.

Select * from Event
Where Event_Date Between '2023-12-03' and '2024-08-10';



--7. Write a SQL query to retrieve events with available tickets that also have "Concert" in their name.

Select * from Event
Where Available_seats>0 And Event_Name like ('%concert%');




--8. Write a SQL query to retrieve bookings details contains booked no of ticket more than 4.

Select * from Booking
Where Num_Tickets>4;






--9. Write a SQL query to retrieve customer information whose phone number end with ‘000’

Select * from Customers
Where Phone_Number Like '%000';





--10. Write a SQL query to retrieve the events in order whose seat capacity more than 15000.

Select * from Event
Where Total_Seats>15000
Order By Total_Seats;


--11. Write a SQL query to select events name not start with ‘x’, ‘y’, ‘z’

Select Event_Name from Event
Where Event_Name Not Like '[x,y,z]%'; 





Select * from Venue;
Select * from Customers;
Select * from Event;
Select * from Booking;


ALTER TABLE Event
ADD FOREIGN KEY (Booking_Id) REFERENCES Booking(Booking_Id);

ALTER TABLE Customers
ADD FOREIGN KEY (Booking_Id) REFERENCES Booking(Booking_Id);

















-------------------------Tasks 3: Aggregate functions, Having, Order By, GroupBy and Joins:----------------------


--12. Write a SQL query to List Events and Their Average Ticket Prices.

Select Event_Type As Event,Avg(Ticket_Price) As Average_Price from Event
Group By Event_Type;






--13. Write a SQL query to Calculate the Total Revenue Generated by Events.

Select Sum((Total_Seats-Available_Seats)*Ticket_Price) As Total_Revenue from Event


select * from Event



--14. Write a SQL query to find the event with the highest ticket sales.

select TOP 1 e.event_id,e.event_name,sum(b.num_tickets) as Total_Tickets_Sold from Event as e 
left join Booking as b on e.event_id=b.event_id 
group by e.event_id,e.event_name 
order by Total_Tickets_Sold desc;


Select * from Venue;
Select * from Customers;
Select * from Event;
Select * from Booking;





--15. Write a SQL query to Calculate the Total Number of Tickets Sold for Each Event.

Select Event_Name,Total_Seats-Available_Seats As TotalSeatsBooked from Event



--16. Write a SQL query to Find Events with No Ticket Sales.

Select Event_Name from Event
Where(Total_Seats=Available_Seats) ;




--17. Write a SQL query to Find the User Who Has Booked the Most Tickets.

Select Top 1 C.Customer_Name As User_Name,B.Num_Tickets As Max_Tickets from Customers C
Inner Join Booking B on C.Customer_Id=B.Customer_Id
Order By Num_Tickets Desc;




--18. Write a SQL query to calculate the average Ticket Price for Events in Each Venue.

select v.venue_id,v.venue_name,avg(e.ticket_price) as Average_Ticket_Price from Venue v 
join Event e on v.venue_id=e.venue_id 
group by v.venue_id,v.venue_name 
order by venue_id asc;


--19. Write a SQL query to calculate the total Number of Tickets Sold for Each Event Type.


SELECT E.Event_Type,SUM(B.Num_Tickets) AS Total_Tickets FROM Booking B
INNER JOIN Event E ON B.Booking_Id = E.Booking_Id
GROUP BY E.Event_Type;




--20. Write a SQL query to calculate the total Revenue Generated by Events in Each Year.

Select Year(Event_Date) As Event_Year,sum((Total_Seats-Available_Seats)*Ticket_Price) As Total_Revenue from Event
Group By Year(Event_Date);





--21. Write a SQL query to list users who have booked tickets for multiple events.

select c.customer_id,c.customer_name,count(b.event_id) as Number_of_Events_Booked from Customers c 
join Booking as b on c.customer_id = b.customer_id 
group by c.customer_id, c.customer_name 
having count(b.event_id) > 1;



--22. Write a SQL query to calculate the Total Revenue Generated by Events for Each User.

select c.customer_id,c.customer_name,sum(b.total_cost) as Total_Revenue from Customers as c 
join Booking as b on c.customer_id = b.customer_id 
group by c.customer_id, c.customer_name 
order by customer_id asc;




--23. Write a SQL query to calculate the Average Ticket Price for Events in Each Category and Venue.
select e.event_type,v.venue_name,avg(e.ticket_price) as Average_Ticket_Price from Event e 
join Venue v on e.venue_id = v.venue_id 
group by e.event_type, v.venue_name;


------------------------------------------Tasks 4: Subquery and its types----------------------------------------------
--24. Calculate the Average Ticket Price for Events in Each Venue Using a Subquery.
select v.venue_id,v.venue_name,
(select avg(ticket_price) from Event where venue_id = v.venue_id) as Average_Ticket_Price from Venue v 
order by v.venue_id;




--25. Find Events with More Than 50% of Tickets Sold using subquery.
Select Event_Name from Event
Where Event_Name in (Select Event_Name from Event where (Available_Seats<0.5*Total_seats));






--26. Calculate the Total Number of Tickets Sold for Each Event.
Select  Event_Name,Total_Seats-Available_Seats As Tickets_Sold from Event;





--27. Find Users Who Have Not Booked Any Tickets Using a NOT EXISTS Subquery.

select c.customer_id,c.customer_name,c.email,c.phone_number from Customers c 
where not exists (select 1 from Booking as b where b.customer_id = c.customer_id);






--28. List Events with No Ticket Sales Using a NOT IN Subquery.
Select Event_Name,available_seats from Event
Where Event_Name NOT In(Select Event_Name from Event where Available_Seats!=Total_Seats)





--29. Calculate the Total Number of Tickets Sold for Each Event Type Using a Subquery in the FROM Clause.
select event_type,sum(num_tickets) as Total_Tickets_Sold from (select e.event_id,e.event_type,b.num_tickets from Event e
left join Booking as b on e.event_id = b.event_id) as Subquery 
group by event_type;






--30. Find Events with Ticket Prices Higher Than the Average Ticket Price Using a Subquery in the WHERE Clause.

Select Event_Id,Event_Name,Ticket_Price from Event
Where Ticket_Price>(Select Avg(Ticket_Price) As Avg_Prices from Event);




--31. List Users Who Have Booked Tickets for Events in a Given Venue Using a Subquery in the WHERE Clause.

select c.customer_id,c.customer_name,c.email,c.phone_number from Customers c 
where  exists (
select 1 from Booking as b join Event as e on b.event_id = e.event_id
where b.customer_id = c.customer_id and e.venue_id = 3
);



--32. Calculate the Total Number of Tickets Sold for Each Event Category Using a Subquery with GROUP BY.

select e.event_type,(select sum(num_tickets) from Booking as b 
where b.event_id in (select event_id from Event as e1 where e1.event_type = e.event_type)) as Total_Tickets_Sold from Event e 
group by e.event_type;



--33. Calculate the Average Ticket Price for Events in Each Venue Using a Subquery

select v.venue_id,v.venue_name,
(select avg(e.ticket_price) from Event e where e.venue_id = v.venue_id) as Average_Ticket_Price
from Venue as v;