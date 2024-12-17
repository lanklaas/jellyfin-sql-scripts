-- Use this to check what the last season number and episode number of a series is.
-- Useful in combination with the UserWatched script to check if a user is done with a series
select ParentIndexNumber as 'Last Season',max(IndexNumber) as 'Last Episode' from TypedBaseItems
where SeriesName like '%some cool show%'
group by ParentIndexNumber
order by ParentIndexNumber desc
limit 1


