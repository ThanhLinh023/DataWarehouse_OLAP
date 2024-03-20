import pandas as pd
data = pd.read_csv('team_traditional.csv')
data['MIN'] = 48
data = data.sort_values(by='gameid')
# Extract data for table DimTeam
dimTeamTable = pd.DataFrame(data['teamid'].unique(), columns=['teamid'])
dimTeamTable['team'] = data['team'].unique()
# Extract data for table DimGame
# Extract gameId
dimGameTable = pd.DataFrame(data['gameid'].unique(), columns=['gameid'])
# Extract first team ID, second team ID, first team's point, second team's point, match duration, season
duration = []
firstTeam = []
secondTeam = []
firstTeamPoint = []
secondTeamPoint = []
season = []
day = []
month = []
year = []
for i in range(0, len(data), 2):
    # Attributes of Table 'DimTime'
    day.append(data['date'].iloc[i].split('/')[1])
    month.append(data['date'].iloc[i].split('/')[0])
    year.append(data['date'].iloc[i].split('/')[2])
    # Attributes of Table 'DimGame'
    duration.append(data['MIN'].iloc[i])
    firstTeam.append(data['home'].iloc[i])
    secondTeam.append(data['away'].iloc[i])
    if data['team'].iloc[i] == data['home'].iloc[i]:
        firstTeamPoint.append(data['PTS'].iloc[i])
        secondTeamPoint.append(data['PTS'].iloc[i+1])
    if data['team'].iloc[i] == data['away'].iloc[i]:
        firstTeamPoint.append(data['PTS'].iloc[i+1])
        secondTeamPoint.append(data['PTS'].iloc[i])
    season.append(data['season'].iloc[i])
# Concat attributes to DataFrame of table DimGame
dimGameTable['1stTeamId'] = firstTeam
dimGameTable['2ndTeamId'] = secondTeam
dimGameTable['1stTeamPoint'] = firstTeamPoint
dimGameTable['2ndTeamPoint'] = secondTeamPoint
dimGameTable['duration'] = duration
dimGameTable['season'] = season
# Dictionary to map game's name type to type ID
typeName = {
    "playin" : 0,
    "regular": 1, 
    "playoff": 2
}
# Extract attributes of table FactGameStats: statsId, gameId, gameType, checkedTeamId, statistics from dataset
factData = pd.read_csv('team_traditional.csv')
statsId = [i + 1 for i in range(len(factData))]
factData['statsId'] = statsId
factData = factData.drop(['date'], axis=1)
factData = factData.drop(['team'], axis=1)
factData = factData.drop(['home'], axis=1)
factData = factData.drop(['away'], axis=1)
factData = factData.drop(['MIN'], axis=1)
factData = factData.drop(['PTS'], axis=1)
factData = factData.drop(['FG%'], axis=1)
factData = factData.drop(['3P%'], axis=1)
factData = factData.drop(['FT%'], axis=1)
factData = factData.drop(['AST'], axis=1)
factData = factData.drop(['+/-'], axis=1)
factData = factData.drop(['win'], axis=1)
factGameStats = factData.drop(['season'], axis=1)
factGameStats['type'] = factGameStats['type'].map(typeName)
factGameStats = factGameStats.rename(columns={'teamid': 'checkedTeamId'})
# Extract data for table DimTime
dimTimeTable = pd.DataFrame(data['gameid'].unique(), columns=['gameId'])
dimTimeTable['day'] = day
dimTimeTable['month'] = month
dimTimeTable['year'] = year
dimTimeTable['timeKey'] = [i + 1 for i in range(len(dimGameTable))]
# Export to .csv file
dimTeamTable.to_csv('dimTeamTable.csv', index=False)
dimGameTable.to_csv('dimGameTable.csv', index=False)
factGameStats.to_csv('factGameStats.csv', index=False)
dimTimeTable.to_csv('dimTimeTable.csv', index=False)