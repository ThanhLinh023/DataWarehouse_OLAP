use master;
go
-- Drop database
if exists (select name from SysDatabases where name = 'NBAStatsDW')
	begin
		alter database NBAStatsDW set single_user with rollback immediate;
		drop database NBAStatsDW;
	end
go
-- Create new database with same name
create database NBAStatsDW;
go
use NBAStatsDW;
go
-- Drop and create new dimension tables
-- DimGame table
if (object_id('DimGame') is not null ) drop table dbo.DimGame;
go
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
-- DimGameType
if (object_id('DimGameType') is not null ) drop table dbo.DimGameType;
go
create table DimGameType
(
	gameTypeKey int identity(1,1) not null primary key,
	typeName nvarchar(255)
);
-- DimTeam
if (object_id('DimTeam') is not null ) drop table dbo.DimTeam;
go
create table DimTeam
(
	teamKey int identity(1,1) not null primary key,
	teamId float,
	teamName varchar(255)
);
-- DimTime
if (object_id('DimTime') is not null ) drop table dbo.DimTime;
go
create table DimTime
(
	timeKey int identity(1,1) not null primary key,
	gameId float,
	day int,
	month int,
	year int
);
-- FactGameStats
if (object_id('FactGameStats') is not null ) drop table dbo.FactGameStats;
go
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