from Tool import CrawlerTool
from Tool import JSONTool

#==========================================取得角色升級素材資料==========================================
def __GetUpgradeItem(area, ratio = 1):
    """從素材區塊中找到素材名稱及數量"""
    itemList = []
    item = None

    for span in area.find_all("span"):                                                              # 找到此區域所有span區塊
        if span.find("span", class_ = "card-body") and "card-list-container" not in span["class"]:  # 如果這個span class是card-body
            itemTag = span.find("a", title = True)                                                  # 從span區快中找出第一個 <a> 標籤，且該標籤有title屬性的元素
            item = itemTag["title"] if itemTag else None                                            # 取得a的title

            valueTag = span.find("span", class_ = "card-text card-font")                            # 找到此span區塊裡class = card-text card-font的子span
            value = valueTag.get_text(strip = True) if valueTag else None                           # 取得子span值
            value = int(value.replace(",", ""))
            
            if value is not None:
                itemList.append({"ItemName": item, "Value": value * ratio})

    return itemList

def __GetItemArea(soup, areaType, containText):
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
            , "Item": __GetUpgradeItem(__GetItemArea(soup, "span", "(0✦ → 6✦)"))
        })
        #===============================等級提升素材===============================

        #===============================技能提升素材===============================
        itemList.append({
            "ItemType": "技能提升素材"
            , "Item": __GetUpgradeItem(__GetItemArea(soup, "div", "(1 → 10 for One Main Forte)"), 5)
        })
        #===============================技能提升素材===============================

        #===============================固有技能提升素材===========================
        itemList.append({
            "ItemType": "固有技能提升素材"
            , "Item": __GetUpgradeItem(__GetItemArea(soup, "div", "(1 → 2 for All Inherent Skill)"))
        })
        #===============================固有技能提升素材===========================

        #===============================屬性提升素材===============================
        itemList.append({
            "ItemType": "屬性提升素材"
            , "Item": __GetUpgradeItem(__GetItemArea(soup, "div", "(1 → 2 for One Strand of Stat Bonus)"), 4)
        })
        #===============================屬性提升素材===============================

        characterUpgradeItemList.append({"Character": character["Name"], "ItemList": itemList})

    JSONTool.Write(outputPath, characterUpgradeItemList)
#==========================================取得角色升級素材資料==========================================

#==========================================取得角色清單=================================================
def GenCharacterList(characterListUrl, characterDataBaseUrl, outputPath):
    """取得角色清單"""
    characterList = []
    dataList = []

    # 取得網站內容
    soup = CrawlerTool.GetScop(characterListUrl)

    # 抓角色區塊
    characters = soup.select(".article-table.sortable.alternating-colors-table tbody tr td a[title][href]")

    for character in characters:
        # 只保留「純文字」的 a（沒有子元素）
        if character.string and character.string.strip():
            name = character.get("title")
            link = characterDataBaseUrl + character.get("href")
            dataList.append({"Name": name, "Link": link})

    for data in dataList:
        soup = CrawlerTool.GetScop(data["Link"])

        if "playable" in soup.get_text():
            characterList.append(data)
        else:
            continue

    JSONTool.Write(outputPath, characterList)
#==========================================取得角色清單=================================================