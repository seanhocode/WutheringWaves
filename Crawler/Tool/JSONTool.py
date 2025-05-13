import json

def Write(filePath, data, encoding = "utf-8"):
    with open(filePath, "w", encoding = encoding) as f:
        json.dump(data, f, ensure_ascii = False, indent = 2)
        #ensure_ascii = False => 不會把中文轉成 \u 編碼
        #indent = 2 => 讓JSON更易讀，縮排 2 格

def Read(filePath, encoding = "utf-8"):
    with open(filePath, "r", encoding = encoding) as f:
        return json.load(f)
