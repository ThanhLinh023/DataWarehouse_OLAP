select T1.gameid,gameKey, gameTypeKey,teamKey, timeKey, type, FGM, FGA, [3PM], [3PA], FTM, FTA, OREB, DREB, REB, TOV, STL, BLK, PF
from 
	[NBAStats].[dbo].[gameStatistics] as T1, 
	[NBAStatsDW].[dbo].[DimGame] as T2, 
	[NBAStatsDW].[dbo].[DimGameType] as T3,
	[NBAStatsDW].[dbo].[DimTeam] as T4, 
	[NBAStatsDW].[dbo].[DimTime] as T5
where T1.gameid = T2.gameId 
and T1.type = T3.typeName 
and T1.team = T4.teamName
and T2.gameId = T5.gameId
and T5.day = day(date)
and T5.month = month(date)
and T5.year = year(date)
order by gameid asc