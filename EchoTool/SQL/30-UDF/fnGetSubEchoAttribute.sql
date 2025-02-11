DROP FUNCTION IF EXISTS [fnGetSubEchoAttribute]
GO
SET ANSI_NULLS ON --是否能用 = NULL 判斷是否為NULL ON:不可以(預設) OFF:可以
GO
SET QUOTED_IDENTIFIER ON --是否能用單引號'、雙引號"來引字串 ON:只可以用單引號(預設) OFF:兩個都可以
GO
/****************************************************************************************
目的：     取得SubEchoAttribute
依存：     無
傳回值:    Table
副作用:    無
備註:      @AttributeCode、@Level為NULL則回傳所有
範例:      SELECT * FROM fnGetSubEchoAttribute('HPPercent', NULL)
****************************************************************************************/
CREATE FUNCTION [fnGetSubEchoAttribute]
(
	@EchoAttributeCode NVARCHAR(100)
	, @Level INT
)
RETURNS @Result TABLE (
    EchoAttributeCode VARCHAR(100)
    , EchoAttributeName NVARCHAR(100)
	, EchoAttributeValue DECIMAL(7,2)
    , Level INT
)
AS
BEGIN
    INSERT INTO @Result (EchoAttributeCode, EchoAttributeName, EchoAttributeValue, Level)
	SELECT SEA.EchoAttributeCode, SC.zhCHTName AS EchoAttributeName, SEA.EchoAttributeValue, SEA.Level
    FROM SubEchoAttribute SEA
    JOIN SystemCode SC 
        ON SC.CodeType = 'EchoAttributeCode'
        AND SEA.EchoAttributeCode = SC.SystemCode
    WHERE (SEA.EchoAttributeCode = @EchoAttributeCode OR ISNULL(@EchoAttributeCode, '') = '')
        AND (SEA.[Level] = @Level OR ISNULL(@Level, 9999) = 9999)

    RETURN
END
GO
