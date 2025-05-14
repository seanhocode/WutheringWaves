from Tool import JSONTool

#=================================產生角色升級素材彙總清單=================================
def __AddOrUpdateList(lst, newItem):
    """更新或新增素材清單"""
    for item in lst:
        if item['Item'] == newItem['Item']:
            item['Value'] += newItem['Value']
            return      # 找到就更新，並結束函式
    lst.append(newItem) # 若沒找到，則新增

def GenTotalUpgradeItemList(itemListPath, outputPath):
    """產生角色升級素材彙總清單"""
    totalList = []
    characterItemList = JSONTool.Read(itemListPath)

    for characterItem in characterItemList:
        subTotalList = []
        for itemList in characterItem["ItemList"]:
            for item in itemList["Item"]:
                __AddOrUpdateList(subTotalList, {"Item": item["ItemName"], "Value": item["Value"]})
        totalList.append({"Character": characterItem["Character"], "ItemList": subTotalList})
    
    JSONTool.Write(outputPath, totalList)
#=================================產生角色升級素材彙總清單=================================