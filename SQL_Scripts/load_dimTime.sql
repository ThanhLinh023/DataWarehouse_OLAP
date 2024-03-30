declare @i int
declare @len int
declare @gameId float
declare @d int
declare @m int
declare @y int
set @len = (select count(*) from [NBAStats].[dbo].[gameStatistics])
set @i = 1

while @i < @len
	begin
		select @gameId = gameid, @d = DAY(date), @m = MONTH(date), @y = YEAR(date)
		from 
		(
		  select *, ROW_NUMBER() over (order by gameId asc) as row_num
		  from [NBAStats].[dbo].[gameStatistics]
		) 
		as subquery
		where row_num = @i
		set @i = @i + 2
		insert into [NBAStatsDW].[dbo].[DimTime] values (@gameId, @d, @m, @y);
	end