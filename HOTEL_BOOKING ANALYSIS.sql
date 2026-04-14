select * from hotel limit 5;

alter table hotel alter column arrival_date type date using arrival_date :: timestamp without time zone;

-------------------------- REVENUE AND PRICING -------------
--which hotel genrated the highest total revenue in 2022, and what was its average ADR per night?

select
	hotel_name, extract (year from arrival_date) as arrival_year,
	round(sum(total_revenue_inr)::numeric,2)as total_revenue,
	round(avg(adr_per_night_inr)::numeric,2)as adr_avg_per_night
from hotel 
	where arrival_date>= date '2002-01-01' and arrival_date < date '2023-01-01'
	group by hotel_name ,arrival_year
	order by total_revenue desc limit 5;
 
--find all bookings where total_revenue_inr is significantly lower than adr_per_night_inr * nights_stayed -- these
--are likely data errors or heavy discounts.

select
	booking_id,total_revenue_inr,
	adr_per_night_inr ,nights_stayed ,(adr_per_night_inr * nights_stayed) as expected_revenue,
	total_revenue_inr,(adr_per_night_inr * nights_stayed -total_revenue_inr)as gap
from hotel
	where abs(adr_per_night_inr * nights_stayed - total_revenue_inr)> (adr_per_night_inr * nights_stayed * 0.10)
	order by gap desc;
 
-----------------------BOOKING BEHAVIOR--------------------------

--which booking chanel brings the highest average lead_time_days?(tells you who plans furthest in advance -- useful
-- for targeted campaigns).

select 
	booking_channel,round(avg(lead_time_days)::numeric,2)as highest_lead_time
from hotel
	group by booking_channel order by highest_lead_time desc;
	
-- what % of bookings via "Booking.com" ended in canecellation vs "Direct Website"?

select
	booking_channel,count(*) as total_bookings,
	sum(case when cancellation_status = 'Yes' then 1 else 0 end)as cancellation,
	round(100.0 * sum (case when cancellation_status = 'Yes' then 1 else 0 end)/count(*),2) as cancellation_pct
from hotel group by booking_channel
	having booking_channel in ('Booking.Com','Direct Website')
	order by cancellation_pct desc;

---------------OPERATIONAL------------------
--identify hotels with average nights_stayed > 10 - these  are your long_stay properties. what room types dominate those
--stays?

	
--actual distribution 
select 
		round(avg(nights_stayed)::numeric,2)as overall_avg,
		min(nights_stayed)as min_nights,
		max(nights_stayed) as max_nights
from hotel;
--------------------------------------------------------------------------------------------
select
	hotel_name,room_type,round(avg(nights_stayed)::numeric,2)as avg_stay
from hotel
	group by hotel_name ,room_type having avg(nights_stayed)>8
	order by avg_stay desc;
	 
--For bookings with cancellation_status = Yes, what is the average lead_time_days? (high lead time + cancellation
--revenue at risk from early planners).

select 
	round(avg(lead_time_days)::numeric,2) as avg_lead_time_cancelled
from hotel
	where cancellation_status = 'Yes'
	
-------------GUEST SEGMENTATION---------------

--Which country_of_guest generates the highest average total_revenue_inr? Rank top 5.

select 
	country_of_guest,round(sum(total_revenue_inr)::numeric,2)as total_revenue_inr
from hotel
	group by country_of_guest order by total_revenue_inr desc limit 5;
 
-- find all family bookings (children>0) that chose "Suite" or "Presidential Suite"- what's their average spend
--vs families in standard rooms?

select  
	room_type,children,round(avg(total_revenue_inr)::numeric,2)as avg_spend,
	count(*) as  total_bookings
from hotel
	where children >0 and room_type in ('Suite','Presidential Suite')
	group by room_type,children 
	order by total_bookings desc;


select * from hotel limit 10;

