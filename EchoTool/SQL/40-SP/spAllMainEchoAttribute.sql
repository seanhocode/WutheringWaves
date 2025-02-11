USE WutheringWaves
GO
DROP PROCEDURE IF EXISTS spAllMainEchoAttribute
GO

CREATE PROCEDURE spAllMainEchoAttribute
AS
BEGIN
    DECLARE @EchoAttributeCodes NVARCHAR(MAX) = ''
    DECLARE @SQL NVARCHAR(MAX)

    -- 動態生成 PIVOT 所需的欄位
    SELECT @EchoAttributeCodes = STRING_AGG('[' + EchoAttributeCode + ']', ',')
    FROM (SELECT DISTINCT EchoAttributeCode FROM MainEchoAttribute) AS T

    -- 建立動態 SQL 查詢
    SET @SQL = N'
    SELECT Cost, IsRandom, Rank, ' + @EchoAttributeCodes + N'
    FROM   
    (
        SELECT Cost, IsRandom, Rank, EchoAttributeCode, EchoAttributeValue
        FROM MainEchoAttribute
    ) MEA
    PIVOT  
    (  
        MAX(EchoAttributeValue)
        FOR EchoAttributeCode IN (' + @EchoAttributeCodes + N')
    ) AS MEAP
    ORDER BY MEAP.Rank DESC, MEAP.IsRandom, MEAP.Cost DESC
    '

    -- 執行動態 SQL
    EXEC(@SQL)
END