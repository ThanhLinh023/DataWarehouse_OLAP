alter table [NBAStatsDW].[dbo].[FactGameStats]
add constraint fk_dimTime foreign key (timeKey) references [NBAStatsDW].[dbo].[dimTime] (timeKey),
	constraint fk_dimGame foreign key (gameKey) references [NBAStatsDW].[dbo].[dimGame] (gameKey),
	constraint fk_dimTeam foreign key (teamKey) references [NBAStatsDW].[dbo].[dimTeam] (teamKey),
	constraint fk_dimGameType foreign key (gameTypeKey) references [NBAStatsDW].[dbo].[dimGameType] (gameTypeKey);











-- Drop foreign key
alter table [NBAStatsDW].[dbo].[FactGameStats] drop constraint fk_dimTime, fk_dimGame, fk_dimTeam, fk_dimGameType
truncate table [NBAStatsDW].[dbo].[FactGameStats] 
truncate table [NBAStatsDW].[dbo].[dimTime]
truncate table [NBAStatsDW].[dbo].[dimGame]
truncate table [NBAStatsDW].[dbo].[dimTeam]
truncate table [NBAStatsDW].[dbo].[dimGameType]