import pandas as pd
pd.options.mode.chained_assignment = None
data = pd.read_csv('game_statistics.csv', low_memory=False)
for i in range(len(data)):
    match data['team'].iloc[i]:
        case 'OKC':
            data['teamid'].iloc[i] = '1610612637'
        case 'NOP':
            data['teamid'].iloc[i] = '1610612645'
        case 'ATL':
            data['teamid'].iloc[i] = '1610612737'
        case 'BOS':
            data['teamid'].iloc[i] = '1610612738'
        case 'CLE':
            data['teamid'].iloc[i] = '1610612739'
        case 'MEM':
            data['teamid'].iloc[i] = '1610612740'
        case 'CHI':
            data['teamid'].iloc[i] = '1610612741'
        case 'DAL':
            data['teamid'].iloc[i] = '1610612742'
        case 'DEN':
            data['teamid'].iloc[i] = '1610612743'
        case 'GSW':
            data['teamid'].iloc[i] = '1610612744'
        case 'HOU':
            data['teamid'].iloc[i] = '1610612745'
        case 'LAC':
            data['teamid'].iloc[i] = '1610612746'
        case 'LAL':
            data['teamid'].iloc[i] = '1610612747'
        case 'MIA':
            data['teamid'].iloc[i] = '1610612748'
        case 'MIL':
            data['teamid'].iloc[i] = '1610612749'
        case 'MIN':
            data['teamid'].iloc[i] = '1610612750'
        case 'BKN':
            data['teamid'].iloc[i] = '1610612751'
        case 'NYK':
            data['teamid'].iloc[i] = '1610612752'
        case 'ORL':
            data['teamid'].iloc[i] = '1610612753'
        case 'IND':
            data['teamid'].iloc[i] = '1610612754'
        case 'PHI':
            data['teamid'].iloc[i] = '1610612755'
        case 'PHX':
            data['teamid'].iloc[i] = '1610612756'
        case 'POR':
            data['teamid'].iloc[i] = '1610612757'
        case 'SAC':
            data['teamid'].iloc[i] = '1610612758'
        case 'SAS':
            data['teamid'].iloc[i] = '1610612759'
        case 'SEA':
            data['teamid'].iloc[i] = '1610612760'
        case 'TOR':
            data['teamid'].iloc[i] = '1610612761'
        case 'UTA':
            data['teamid'].iloc[i] = '1610612762'
        case 'VAN':
            data['teamid'].iloc[i] = '1610612763'
        case 'WAS':
            data['teamid'].iloc[i] = '1610612764'
        case 'DET':
            data['teamid'].iloc[i] = '1610612765'
        case 'CHA':
            data['teamid'].iloc[i] = '1610612766'
data.to_csv('statistics_cleaned.csv', index=False)