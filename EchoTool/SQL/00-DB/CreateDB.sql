USE master
GO
/*刪除指定資料庫上的所有連線，並變更為單一使用者連線模式*/
ALTER DATABASE WutheringWaves
SET SINGLE_USER
WITH ROLLBACK IMMEDIATE;
GO
/*刪除資料庫*/
DROP DATABASE IF EXISTS WutheringWaves
GO
CREATE DATABASE WutheringWaves
GO
