from Tool import CrawlerTool
from Tool import JSONTool

# region==========================================取得角色升級素材資料==========================================
def _GetUpgradeItem(area, ratio = 1):
    """從素材區塊中找到素材名稱及數量"""
    itemList = []
    item = None

    for span in area.find_all("span"):                                                              # 找到此區域所有span區塊
        if span.find("span", class_ = "card-body") and "card-list-container" not in span["class"]:  # 如果這個span class是card-body
            # itemTag = span.find("a", title = True)                                                  # 從span區快中找出第一個 <a> 標籤，且該標籤有title屬性的元素
            # item = itemTag["title"] if itemTag else None                                            # 取得a的title

            valueTag = span.find("span", class_ = "card-text card-font")                            # 找到此span區塊裡class = card-text card-font的子span
            value = valueTag.get_text(strip = True) if valueTag else None                           # 取得子span值
            value = int(value.replace(",", ""))

            imgTag = span.find("img")
            item = imgTag["alt"] if imgTag else None
            img = imgTag["data-src"] if imgTag else None
            
            if value is not None:
                itemList.append({"ItemName": item, "Value": value * ratio, "ImageLink": img})

    return itemList

def _GetItemArea(soup, areaType, containText):
    """取得素材區塊"""
    for area in soup.find_all(areaType):
        # 確保沒有 class 或 id 屬性
        if not area.has_attr("class") and not area.has_attr("id"):
            # 檢查文字是否包含目標內容
            if containText in area.get_text(strip = True):
                return area
            
def GenCharacterUpgradeItemList(characterListPath, outputPath):
    """取得角色升級素材資料"""
    characterList = JSONTool.Read(characterListPath)
    characterUpgradeItemList = []

    for character in characterList:
        #取得角色頁面資訊
        soup = CrawlerTool.GetScop(character["Link"])

        itemList = []
        #===============================等級提升素材===============================
        itemList.append({
            "ItemType": "等級提升素材"
            , "Item": _GetUpgradeItem(_GetItemArea(soup, "span", "(0✦ → 6✦)"))
        })
        #===============================等級提升素材===============================

        #===============================技能提升素材===============================
        itemList.append({
            "ItemType": "技能提升素材"
            , "Item": _GetUpgradeItem(_GetItemArea(soup, "div", "(1 → 10 for One Main Forte)"), 5)
        })
        #===============================技能提升素材===============================

        #===============================固有技能提升素材===========================
        itemList.append({
            "ItemType": "固有技能提升素材"
            , "Item": _GetUpgradeItem(_GetItemArea(soup, "div", "(1 → 2 for All Inherent Skill)"))
        })
        #===============================固有技能提升素材===========================

        #===============================屬性提升素材===============================
        itemList.append({
            "ItemType": "屬性提升素材"
            , "Item": _GetUpgradeItem(_GetItemArea(soup, "div", "(1 → 2 for One Strand of Stat Bonus)"), 4)
        })
        #===============================屬性提升素材===============================

        characterUpgradeItemList.append({"Character": character["Name"], "ItemList": itemList})

    JSONTool.Write(outputPath, characterUpgradeItemList)
# endregion=======================================取得角色升級素材資料==========================================

# region==========================================取得角色清單=================================================
def GenCharacterList(characterListUrl, characterDataBaseUrl, outputPath):
    """取得角色清單"""
    characterList = []
    dataList = []

    # 取得網站內容
    soup = CrawlerTool.GetScop(characterListUrl)

    characters = soup.select(".article-table.sortable.alternating-colors-table tbody tr td span[typeof] a[title][href]")

    for character in characters:
        characterName = character["title"]
        characterLink = characterDataBaseUrl + character["href"]
        if character.find("img"):
            print()
            dataList.append({"Name": characterName, "Link": characterLink, "ImageLink": character.find("img")["data-src"]})

    for data in dataList:
        soup = CrawlerTool.GetScop(data["Link"])

        if "playable" in soup.get_text():
            characterList.append(data)
        else:
            continue

    JSONTool.Write(outputPath, characterList)
# endregion=======================================取得角色清單=================================================