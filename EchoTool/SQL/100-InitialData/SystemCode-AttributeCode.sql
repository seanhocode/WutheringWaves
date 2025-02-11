USE WutheringWaves
GO

DECLARE @CreatedDate DATETIME = '2025/02/11'
DECLARE @CreatedUser NVARCHAR(10) = 'System'

DELETE FROM SystemCode WHERE CodeType = 'AttributeCode'

INSERT INTO SystemCode (CodeType, SystemCode, zhCHTName, enUSName, zhCHSName, jaJPName, StartDate, EndDate, SortSequence, CreatedDate, CreatedUser, ModifiedDate, ModifiedUser)
SELECT 'AttributeCode', 'Attack', '攻擊', NULL, NULL, NULL, '2025/02/11', NULL, 0, @CreatedDate, @CreatedUser, @CreatedDate, @CreatedUser
UNION ALL SELECT 'AttributeCode', 'Defense', '防禦', NULL, NULL, NULL, '2025/02/11', NULL, 1, @CreatedDate, @CreatedUser, @CreatedDate, @CreatedUser
UNION ALL SELECT 'AttributeCode', 'HP', '生命', NULL, NULL, NULL, '2025/02/11', NULL, 2, @CreatedDate, @CreatedUser, @CreatedDate, @CreatedUser
UNION ALL SELECT 'AttributeCode', 'AttackPercent', '攻擊百分比', NULL, NULL, NULL, '2025/02/11', NULL, 3, @CreatedDate, @CreatedUser, @CreatedDate, @CreatedUser
UNION ALL SELECT 'AttributeCode', 'DefensePercent', '防禦百分比', NULL, NULL, NULL, '2025/02/11', NULL, 4, @CreatedDate, @CreatedUser, @CreatedDate, @CreatedUser
UNION ALL SELECT 'AttributeCode', 'HPPercent', '生命百分比', NULL, NULL, NULL, '2025/02/11', NULL, 5, @CreatedDate, @CreatedUser, @CreatedDate, @CreatedUser
UNION ALL SELECT 'AttributeCode', 'CritRate', '暴擊率', NULL, NULL, NULL, '2025/02/11', NULL, 6, @CreatedDate, @CreatedUser, @CreatedDate, @CreatedUser
UNION ALL SELECT 'AttributeCode', 'CritDamage', '暴擊傷害', NULL, NULL, NULL, '2025/02/11', NULL, 7, @CreatedDate, @CreatedUser, @CreatedDate, @CreatedUser
UNION ALL SELECT 'AttributeCode', 'ResonanceEfficiency', '共鳴效率', NULL, NULL, NULL, '2025/02/11', NULL, 8, @CreatedDate, @CreatedUser, @CreatedDate, @CreatedUser
UNION ALL SELECT 'AttributeCode', 'ResonanceSkillDamage', '共鳴技能傷害加成', NULL, NULL, NULL, '2025/02/11', NULL, 9, @CreatedDate, @CreatedUser, @CreatedDate, @CreatedUser
UNION ALL SELECT 'AttributeCode', 'ResonanceReleaseDamage', '共鳴解放傷害加成', NULL, NULL, NULL, '2025/02/11', NULL, 10, @CreatedDate, @CreatedUser, @CreatedDate, @CreatedUser
UNION ALL SELECT 'AttributeCode', 'NormalAttackDamage', '普攻傷害加成', NULL, NULL, NULL, '2025/02/11', NULL, 11, @CreatedDate, @CreatedUser, @CreatedDate, @CreatedUser
UNION ALL SELECT 'AttributeCode', 'HeavyAttackDamage', '重擊傷害加成', NULL, NULL, NULL, '2025/02/11', NULL, 12, @CreatedDate, @CreatedUser, @CreatedDate, @CreatedUser
UNION ALL SELECT 'AttributeCode', 'HealingBonus', '治療效果加乘', NULL, NULL, NULL, '2025/02/11', NULL, 12, @CreatedDate, @CreatedUser, @CreatedDate, @CreatedUser
UNION ALL SELECT 'AttributeCode', 'ElementalDamage', '屬性傷害加成', NULL, NULL, NULL, '2025/02/11', NULL, 12, @CreatedDate, @CreatedUser, @CreatedDate, @CreatedUser;