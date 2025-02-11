USE WutheringWaves
GO

DECLARE @CreatedDate DATETIME = '2025/02/11'
DECLARE @CreatedUser NVARCHAR(10) = 'System'

DELETE FROM SystemCode WHERE CodeType = 'EchoAttributeCode'

INSERT INTO SystemCode (CodeType, SystemCode, zhCHTName, enUSName, zhCHSName, jaJPName, StartDate, EndDate, SortSequence, CreatedDate, CreatedUser, ModifiedDate, ModifiedUser)
SELECT 'EchoAttributeCode', 'Attack', '攻擊', NULL, NULL, NULL, '2025/02/11', NULL, 0, @CreatedDate, @CreatedUser, @CreatedDate, @CreatedUser
UNION ALL SELECT 'EchoAttributeCode', 'Defense', '防禦', NULL, NULL, NULL, '2025/02/11', NULL, 1, @CreatedDate, @CreatedUser, @CreatedDate, @CreatedUser
UNION ALL SELECT 'EchoAttributeCode', 'HP', '生命', NULL, NULL, NULL, '2025/02/11', NULL, 2, @CreatedDate, @CreatedUser, @CreatedDate, @CreatedUser
UNION ALL SELECT 'EchoAttributeCode', 'AttackPercent', '攻擊百分比', NULL, NULL, NULL, '2025/02/11', NULL, 3, @CreatedDate, @CreatedUser, @CreatedDate, @CreatedUser
UNION ALL SELECT 'EchoAttributeCode', 'DefensePercent', '防禦百分比', NULL, NULL, NULL, '2025/02/11', NULL, 4, @CreatedDate, @CreatedUser, @CreatedDate, @CreatedUser
UNION ALL SELECT 'EchoAttributeCode', 'HPPercent', '生命百分比', NULL, NULL, NULL, '2025/02/11', NULL, 5, @CreatedDate, @CreatedUser, @CreatedDate, @CreatedUser
UNION ALL SELECT 'EchoAttributeCode', 'CritRate', '暴擊率', NULL, NULL, NULL, '2025/02/11', NULL, 6, @CreatedDate, @CreatedUser, @CreatedDate, @CreatedUser
UNION ALL SELECT 'EchoAttributeCode', 'CritDamage', '暴擊傷害', NULL, NULL, NULL, '2025/02/11', NULL, 7, @CreatedDate, @CreatedUser, @CreatedDate, @CreatedUser
UNION ALL SELECT 'EchoAttributeCode', 'ResonanceEfficiency', '共鳴效率', NULL, NULL, NULL, '2025/02/11', NULL, 8, @CreatedDate, @CreatedUser, @CreatedDate, @CreatedUser
UNION ALL SELECT 'EchoAttributeCode', 'ResonanceSkillDamage', '共鳴技能傷害加成', NULL, NULL, NULL, '2025/02/11', NULL, 9, @CreatedDate, @CreatedUser, @CreatedDate, @CreatedUser
UNION ALL SELECT 'EchoAttributeCode', 'ResonanceReleaseDamage', '共鳴解放傷害加成', NULL, NULL, NULL, '2025/02/11', NULL, 10, @CreatedDate, @CreatedUser, @CreatedDate, @CreatedUser
UNION ALL SELECT 'EchoAttributeCode', 'NormalAttackDamage', '普攻傷害加成', NULL, NULL, NULL, '2025/02/11', NULL, 11, @CreatedDate, @CreatedUser, @CreatedDate, @CreatedUser
UNION ALL SELECT 'EchoAttributeCode', 'HeavyAttackDamage', '重擊傷害加成', NULL, NULL, NULL, '2025/02/11', NULL, 12, @CreatedDate, @CreatedUser, @CreatedDate, @CreatedUser
UNION ALL SELECT 'EchoAttributeCode', 'HealingBonus', '治療效果加乘', NULL, NULL, NULL, '2025/02/11', NULL, 12, @CreatedDate, @CreatedUser, @CreatedDate, @CreatedUser
UNION ALL SELECT 'EchoAttributeCode', 'ElementalDamage', '屬性傷害加成', NULL, NULL, NULL, '2025/02/11', NULL, 12, @CreatedDate, @CreatedUser, @CreatedDate, @CreatedUser;