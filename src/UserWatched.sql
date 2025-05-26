-- Shows how far users are with watching movies/shows
-- This query requires using the library.db and then attaching jellyfin.db with name jellyfin (I use sqlite Browser GUI for this)
-- When the played indicator is 0 you can check the playbackPositionTicks for how far a user is. Sometimes Jellyfin does not mark a movie
-- as played if it was stopped a while before the end. You can use [dotnet repl](https://github.com/jonsequitur/dotnet-repl) to get a
-- pretty print version of the ticks: Console.WriteLine(TimeSpan.FromTicks(23888240000));

select Username,SeriesName,SeasonName,played,playbackPositionTicks,RunTimeTicks,t.Name,SeriesId,t.IndexNumber,
RunTimeTicks-playbackPositionTicks,lastPlayedDate,concat('Console.WriteLine(TimeSpan.FromTicks(',playbackPositionTicks,'))') 
from TypedBaseItems t
join UserDatas ud
on t.UserDataKey = ud.key
join jellyfin.Users u
on ud.userId = u.InternalId
-- Use this filter for Movies
where Name like '%some cool movie%'
-- Use this filter for Series
-- where SeriesName like '%some cool series%'
order by SeasonName,IndexNumber
