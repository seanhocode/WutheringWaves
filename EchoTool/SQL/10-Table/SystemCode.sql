USE WutheringWaves
GO

CREATE TABLE SystemCode ( 
	CodeType VARCHAR(100) DEFAULT ('') NOT NULL         -- 代碼類別 
	, SystemCode VARCHAR(100) DEFAULT ('') NOT NULL     -- 系統代碼 
	, zhCHTName NVARCHAR(100)                           -- 繁體中文名稱 
	, enUSName NVARCHAR(100)                            -- 英文名稱 
	, zhCHSName NVARCHAR(100)                           -- 簡體中文名稱 
	, jaJPName NVARCHAR(100)                            -- 日文名稱 
	, StartDate DATE DEFAULT (GETDATE()) NOT NULL       -- 啟用日期 
	, EndDate DATE                                      -- 停用日期 
	, SortSequence INT DEFAULT 0 NOT NULL               -- 列印順序 
	, CreatedDate DATETIME NOT NULL                     -- 建檔日期 
	, CreatedUser NVARCHAR(10) NOT NULL                 -- 建檔人員 
	, ModifiedDate DATETIME NOT NULL                    -- 修改日期 
	, ModifiedUser NVARCHAR(10) NOT NULL                -- 修改人員 
	, SystemCodeID BIGINT IDENTITY(1,1)  NOT NULL       -- 識別欄位 
)

