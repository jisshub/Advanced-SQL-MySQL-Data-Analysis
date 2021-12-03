# ASSIGNMENT - 2
# QUESYION IN GITHUB README

SELECT * from website_sessions;

select  
	count(distinct website_sessions.website_session_id) 
		as sessions,
	count(distinct orders.order_id) 
		as orders,
    count(distinct orders.order_id) / count(distinct website_sessions.website_session_id) 
		as session_to_order_conv_rates
from 
	website_sessions left join orders
	on website_sessions.website_session_id=orders.website_session_id
where 
	website_sessions.created_at<'2012-04-14'
    and utm_source='gsearch'
    and utm_campaign='nonbrand';


select * from orders;