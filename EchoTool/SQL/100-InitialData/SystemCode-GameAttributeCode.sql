USE WutheringWaves
GO

DECLARE @CreatedDate DATETIME = '2025/02/11'
DECLARE @CreatedUser NVARCHAR(10) = 'System'

DELETE FROM SystemCode WHERE CodeType = 'GameAttributeCode'

INSERT INTO SystemCode (CodeType, SystemCode, zhCHTName, enUSName, zhCHSName, jaJPName, StartDate, EndDate, SortSequence, CreatedDate, CreatedUser, ModifiedDate, ModifiedUser)
SELECT 'GameAttributeCode', 'Havoc', '湮滅', NULL, 'Havoc', NULL, '2025/02/11', NULL, 0, @CreatedDate, @CreatedUser, @CreatedDate, @CreatedUser
UNION ALL SELECT 'GameAttributeCode', 'Spectro', '衍射', NULL, 'Spectro', NULL, '2025/02/11', NULL, 1, @CreatedDate, @CreatedUser, @CreatedDate, @CreatedUser
UNION ALL SELECT 'GameAttributeCode', 'Electro', '導電', NULL, 'Electro', NULL, '2025/02/11', NULL, 2, @CreatedDate, @CreatedUser, @CreatedDate, @CreatedUser
UNION ALL SELECT 'GameAttributeCode', 'Aero', '氣動', NULL, 'Aero', NULL, '2025/02/11', NULL, 3, @CreatedDate, @CreatedUser, @CreatedDate, @CreatedUser
UNION ALL SELECT 'GameAttributeCode', 'Glacio', '冷凝', NULL, 'Glacio', NULL, '2025/02/11', NULL, 4, @CreatedDate, @CreatedUser, @CreatedDate, @CreatedUser
UNION ALL SELECT 'GameAttributeCode', 'Fusion', '熱熔', NULL, 'Fusion', NULL, '2025/02/11', NULL, 5, @CreatedDate, @CreatedUser, @CreatedDate, @CreatedUser