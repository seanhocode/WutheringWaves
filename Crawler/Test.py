import configparser
from Tool import DataTool
from Tool import UpdateTool

# region====================================讀取config設定====================================
config = configparser.ConfigParser()
config.read('config.ini')

characterListUrl = config['Url']['CharacterList']
characterDataBaseUrl = config['Url']['CharacterDataBase']

characterListPath = config['JSONPath']['CharacterList']
CharacterUpgradeItemListPath = config['JSONPath']['CharacterUpgradeItemList']
CharacterTotalUpgradeItemListPath = config['JSONPath']['CharacterTotalUpgradeItemList']
# endregion====================================讀取config設定=================================


#====================================測試區域==========================================
#UpdateTool.GenCharacterList(characterListUrl, characterDataBaseUrl, characterListPath)
DataTool.__AddOrUpdateList([], {})
#====================================測試區域==========================================