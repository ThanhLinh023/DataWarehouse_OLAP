-- Dimension Tables of NBAStatsDW
use NBAStatsDW
go
--DimTime
create table DimTime
(
	timeKey int identity(1,1) not null primary key,
	gameId float,
	day int,
	month int,
	year int
);
--DimGame
create table DimGame
(
	gameKey int identity(1,1) not null primary key,
	gameId float,
	_1stTeam nvarchar(255),
	_2ndTeam nvarchar(255),
	_1stTeamPoint int,
	_2ndTeamPoint int,
	duration int,
	season int
);
--DimGameType
create table DimGameType
(
	gameTypeKey int identity(1,1) not null primary key,
	typeName nvarchar(255)
);
--DimTeam
create table DimTeam
(
	teamKey int identity(1,1) not null primary key,
	teamId float,
	teamName varchar(255)
);
--FactGameStats
create table FactGameStats
(
	statsId int not null identity(1,1) primary key,
	gameKey int,
	gameTypeKey int,
	teamKey int,
	timeKey int,
	fgm int,
	fga int,
	_3pm int,
	_3pa int,
	ftm int,
	fta int,
	oreb int,
	dreb int,
	reb int,
	tov int,
	stl int,
	blk int,
	pf int
);
-- Drop script
--drop table dbo.DimGame
--drop table dbo.DimGameType
--drop table dbo.DimTeam
--drop table dbo.DimTime
--drop table dbo.FactGameStats