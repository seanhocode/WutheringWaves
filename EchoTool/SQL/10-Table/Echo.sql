USE WutheringWaves
GO

CREATE TABLE Echo(
    EchoID BIGINT IDENTITY(1, 1)
    , EchoName NVARCHAR(100)
    , Cost INT
    , Level INT
    , EchoTypeCode VARCHAR(100)
    , GameAttributeCode VARCHAR(100)
    , MainAttributeCode VARCHAR(100)
    , MainAttributeType VARCHAR(100)
    , SubAttributeCode1 VARCHAR(100)
    , SubAttributeCode2 VARCHAR(100)
    , SubAttributeCode3 VARCHAR(100)
    , SubAttributeCode4 VARCHAR(100)
    , SubAttributeCode5 VARCHAR(100)
)