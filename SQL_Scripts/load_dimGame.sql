declare @i int
declare @len int
declare @name nvarchar(255)
declare @home nvarchar(255)
declare @away nvarchar(255)
declare @gameId float
declare @1stPoint int
declare @2ndPoint int
declare @duration int
declare @ss int
set @len = (select count(*) from [NBAStats].[dbo].[gameStatistics])

set @i = 1;
-- Loop to extract data
while @i < @len
begin
	-- Get necessary properties
	select @gameId = gameid, @home = home, @away = away, @duration = MIN, @ss = season, @name = team
	from 
	(
	  select *, ROW_NUMBER() over (order by gameId asc) as row_num
	  from [NBAStats].[dbo].[gameStatistics]
	) 
	as subquery
	where row_num = @i
	declare @temp int
	set @temp = @i + 1
	-- Process to get 2 teams' point
	if @name = @home
		begin
			select @1stPoint = PTS
			from 
			(
			  select *, ROW_NUMBER() over (order by gameId asc) as row_num1
			  from [NBAStats].[dbo].[gameStatistics]
			) 
			as subquery
			where row_num1 = @i
			select @2ndPoint = PTS
			from 
			(
			  select *, ROW_NUMBER() over (order by gameId asc) as row_num2
			  from [NBAStats].[dbo].[gameStatistics]
			) 
			as subquery
			where row_num2 = @temp
		end
	if @name = @away
	begin
		select @1stPoint = PTS
		from 
		(
		  select *, ROW_NUMBER() over (order by gameId asc) as row_num1
		  from [NBAStats].[dbo].[gameStatistics]
		) 
		as subquery
		where row_num1 = @temp
		select @2ndPoint = PTS
		from 
		(
		  select *, ROW_NUMBER() over (order by gameId asc) as row_num2
		  from [NBAStats].[dbo].[gameStatistics]
		) 
		as subquery
		where row_num2 = @i
	end
	insert into [NBAStatsDW].[dbo].[DimGame] values (@gameId, @home, @away, @1stPoint, @2ndPoint, @duration, @ss);
	set @i = @i + 2
end;
