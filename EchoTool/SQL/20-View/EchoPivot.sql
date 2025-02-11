USE WutheringWaves

DECLARE @AttributeCodes VARCHAR(MAX) = ''
DECLARE @SQL VARCHAR(MAX)

--==============================================主詞條==============================================
SELECT @AttributeCodes = @AttributeCodes + '[' + AttributeCode + ']' 
FROM MainEchoAttribute 
GROUP BY AttributeCode
SET @AttributeCodes = REPLACE(@AttributeCodes, '][', '],[')

SET @SQL = N'
SELECT Cost, IsRandom, ' + @AttributeCodes + N'
FROM   
(
    SELECT Cost, IsRandom, AttributeCode, AttributeValue
    FROM MainEchoAttribute
) MEA
PIVOT  
(  
    MAX([AttributeValue])
    FOR AttributeCode IN  
        (' + @AttributeCodes + N')
) AS MEAP
ORDER BY MEAP.IsRandom, MEAP.Cost DESC
'
EXEC(@SQL)
--==============================================主詞條==============================================
SET @AttributeCodes = ''
SET @SQL = ''
--==============================================副詞條==============================================
SELECT @AttributeCodes = @AttributeCodes + '[' + AttributeCode + ']' 
FROM SubEchoAttribute 
GROUP BY AttributeCode
SET @AttributeCodes = REPLACE(@AttributeCodes, '][', '],[')

SET @SQL = N'
SELECT Level, ' + @AttributeCodes + N'
FROM   
(
    SELECT Level, AttributeCode, AttributeValue
    FROM SubEchoAttribute
) SEA
PIVOT  
(  
    MAX([AttributeValue])
    FOR AttributeCode IN  
        (' + @AttributeCodes + N')
) AS SEAP
ORDER BY SEAP.Level
'
EXEC(@SQL)
--==============================================副詞條==============================================