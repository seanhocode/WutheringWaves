USE WutheringWaves
GO
DROP PROCEDURE IF EXISTS spAllSubEchoAttribute
GO

CREATE PROCEDURE spAllSubEchoAttribute
AS
BEGIN
    DECLARE @EchoAttributeCodes NVARCHAR(MAX) = ''
    DECLARE @SQL NVARCHAR(MAX)

    SELECT @EchoAttributeCodes = @EchoAttributeCodes + '[' + AttributeCode + ']' 
    FROM SubEchoAttribute 
    GROUP BY AttributeCode
    SET @EchoAttributeCodes = REPLACE(@EchoAttributeCodes, '][', '],[')

    SET @SQL = N'
    SELECT Level, ' + @EchoAttributeCodes + N'
    FROM   
    (
        SELECT Level, EchoAttributeCode, EchoAttributeValue
        FROM SubEchoAttribute
    ) SEA
    PIVOT  
    (  
        MAX([EchoAttributeValue])
        FOR EchoAttributeCode IN  
            (' + @EchoAttributeCodes + N')
    ) AS SEAP
    ORDER BY SEAP.Level
    '
    
    -- 執行動態 SQL
    EXEC(@SQL)
END