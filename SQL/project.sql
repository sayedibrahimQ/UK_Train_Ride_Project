use [TRAIN RIDE UK];
select * from [railway - Copy];

/*What is the trend of passenger journeys ?*/
select Date_of_Journey, count(Purchase_Type) as no_of_trips
from [railway - Copy]
group by Date_of_Journey
order by Date_of_Journey desc;

/*What are the peak hours for passenger
journeys in the am and pm period? */
select Departure_Time, count(Departure_Time) no_of_trips
from [railway - Copy]
group by Departure_Time
order by count(Departure_Time) desc;

/*What are the top 5 departure stations ?*/
select top 5 Departure_Station, count(*) as no_of_departures
from [railway - Copy]
group by Departure_Station
order by no_of_departures desc;

/*What are the top 5 arrival stations ?*/
select top 5 Arrival_Destination, count(*) as no_of_trips
from [railway - Copy]
group by Arrival_Destination
order by no_of_trips desc;

/*What is the most common ticket class and type?*/
select Ticket_Class, Ticket_Type, count(*) as no_of_purchase
from [railway - Copy]
group by Ticket_Class, Ticket_Type
order by no_of_purchase desc;

/*What is the monthly trend of net revenue?*/
select datepart(MONTH,Date_of_Purchase) as date_in_month,
sum(Revenue) as total_rev
from [railway - Copy]
group by datepart(MONTH,Date_of_Purchase)
order by date_in_month asc;

/*What is the distribution of net revenue by ticket type ?*/
select Ticket_Type, sum(Revenue) as revenue
from [railway - Copy]
group by Ticket_Type
order by revenue desc;

/*What are the top 5 and bottom 5 routes by revenue?*/
select top 5 Arrival_Destination, sum(Revenue) as revenue
from [railway - Copy]
group by Arrival_Destination
order by revenue desc;

/*How often are train services cancelled & delayed each month?*/
select datepart(month,Date_of_Journey) as monthly,Journey_Status,
count(Journey_Status) as numbers
from [railway - Copy]
group by datepart(month,Date_of_Journey),Journey_Status
order by numbers desc;

select datepart(month,Date_of_Journey) as monthly,
sum(case when Journey_Status='On Time' then 1 else 0 end) as ontime,
sum(case when Journey_Status='Delayed' then 1 else 0 end) as Delayed,
sum(case when Journey_Status='Cancelled' then 1 else 0 end) as Cancelled
from [railway - Copy]
group by datepart(month,Date_of_Journey)
order by monthly;

/*What are  the causes of train service cancellation
and its financial impact on revenue ?*/
select Reason_for_Delay, sum(Refund) as Refund
from [railway - Copy]
group by Reason_for_Delay
order by Refund desc;

/*Which month has on-time services?*/
select datepart(MONTH,Date_of_Journey) as month,
sum(case when Journey_Status='On Time' then 1 else 0 end)
as on_time_journeys
from [railway - Copy]
group by datepart(MONTH,Date_of_Journey)
order by on_time_journeys;










