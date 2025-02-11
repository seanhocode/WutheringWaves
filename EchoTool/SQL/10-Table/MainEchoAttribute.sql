USE WutheringWaves
GO
-- 建立主詞條表
CREATE TABLE MainEchoAttribute (
    MainEchoAttributeID INT IDENTITY(1,1) PRIMARY KEY, -- 主詞條 ID，自動增量
    Cost INTEGER NOT NULL, -- 聲骸的 Cost 值 (1, 3, 4)
    IsRandom BIT NOT NULL, -- 是否為隨機詞條 (0 = 固定, 1 = 隨機)
    AttributeCode VARCHAR(100) NOT NULL, -- 詞條類型 (例如：Attack, HP, CritRate)
    AttributeValue DECIMAL(7,2) NOT NULL -- 詞條數值
);

-- 插入主詞條數據
INSERT INTO MainEchoAttribute (Cost, IsRandom, AttributeCode, AttributeValue) VALUES
(4, 0, 'Attack', 150.00)
, (3, 0, 'Attack', 100.00)
, (1, 0, 'HP', 2280.00)

, (4, 1, 'CritRate', 22.00)
, (4, 1, 'CritDamage', 44.00)
, (4, 1, 'HealingBonus', 26.40)
, (4, 1, 'HPPercent', 33.00)
, (4, 1, 'DefensePercent', 41.80)
, (4, 1, 'AttackPercent', 33.00)

, (3, 1, 'ElementalDamage', 30.00)
, (3, 1, 'ResonanceEfficiency', 32.00)
, (3, 1, 'HPPercent', 30.00)
, (3, 1, 'DefensePercent', 38.00)
, (3, 1, 'AttackPercent', 30.00)

, (1, 1, 'HPPercent', 22.80)
, (1, 1, 'DefensePercent', 18.00)
, (1, 1, 'AttackPercent', 18.00);