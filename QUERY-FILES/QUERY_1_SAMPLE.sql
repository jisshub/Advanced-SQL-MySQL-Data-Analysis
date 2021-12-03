use mavenfuzzyfactory;

select *from website_sessions;

-- Limit the data
select *from website_sessions where website_session_id between 1000 and 2000;

--  Find count of website sessions and group them by utm_content ?
select 
	utm_content,
    count(distinct website_session_id) as sessions
from website_sessions 
where website_session_id between 1000 and 2000
group by 
	1
order by
	2 desc;
    
-- group by 1 means group by first column
-- order by 2 means order by second columns.
-- We got the website session that gives more utm content
-- Next join it with order table

select * from orders;

select 
	website_sessions.utm_content,
    count(distinct website_sessions.website_session_id) as sessions,
    count(distinct orders.order_id) as orders,
    sum(orders.price_usd) as revenue
from website_sessions
LEFT JOIN orders
on website_sessions.website_session_id=orders.website_session_id
where website_sessions.website_session_id between 1000 and 2000
group by 
	1
order by
	2 desc;
    
-- next add conversion rates for orders.
-- conversion rate analysis are simply fractions. it means
-- how many successfull outcomes/how many attempts.
-- here it is,  orders/sessons.


select 
	website_sessions.utm_content,
    count(distinct website_sessions.website_session_id) as sessions,
    count(distinct orders.order_id) as orders,
    sum(orders.price_usd) as revenue,
    count(distinct orders.order_id)/count(distinct website_sessions.website_session_id) 
		as conversion_rate
from website_sessions
LEFT JOIN orders
on website_sessions.website_session_id=orders.website_session_id
where website_sessions.website_session_id between 1000 and 2000
group by 
	1
order by
	2 desc;
    