 Create temporary table tota
select
website_session_id,
website_pageviews.pageview_url as landing_page,
Count(website_session_id) as sessions
from website_pageviews
where pageview_url='/home'and website_pageviews.created_at<'2012-06-14'
group by 1,2;

-- create temporary table bo
select
website_session_id as website_sessions,
Count(distinct website_pageview_id) as amount_pages
from website_pageviews
where website_pageviews.created_at<'2012-06-14'
group by 1
having amount_pages=1;
-- count bounced and total sessions for home page

select
Count(tota.sessions) as total_sessions,
Count(bo.website_sessions) as bounced_sessions,
Count(bo.website_sessions)/Count(tota.sessions) as bounce_rate
from tota
left join bo
on tota.website_session_id=bo.website_sessions;
