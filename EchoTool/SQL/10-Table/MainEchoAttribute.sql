USE WutheringWaves
GO
-- 建立主詞條表
CREATE TABLE MainEchoAttribute (
    MainEchoAttributeID INT IDENTITY(1,1) PRIMARY KEY -- 主詞條 ID，自動增量
    , Cost INTEGER NOT NULL -- 聲骸的 Cost 值 (1, 3, 4)
    , IsRandom BIT NOT NULL -- 是否為隨機詞條 (0 = 固定, 1 = 隨機)
    , EchoAttributeCode VARCHAR(100) NOT NULL -- 詞條類型 (例如：Attack, HP, CritRate)
    , EchoAttributeValue DECIMAL(7,2) NOT NULL -- 詞條數值
    , Rank INT
);

-- 插入主詞條數據
INSERT INTO MainEchoAttribute (Cost, IsRandom, EchoAttributeCode, EchoAttributeValue, Rank) VALUES
--==========================Rank5==========================
(4, 0, 'Attack', 150.00, 5)
, (3, 0, 'Attack', 100.00, 5)
, (1, 0, 'HP', 2280.00, 5)

, (4, 1, 'CritRate', 22.00, 5)
, (4, 1, 'CritDamage', 44.00, 5)
, (4, 1, 'HealingBonus', 26.40, 5)
, (4, 1, 'HPPercent', 33.00, 5)
, (4, 1, 'DefensePercent', 41.80, 5)
, (4, 1, 'AttackPercent', 33.00, 5)

, (3, 1, 'ElementalDamage', 30.00, 5)
, (3, 1, 'ResonanceEfficiency', 32.00, 5)
, (3, 1, 'HPPercent', 30.00, 5)
, (3, 1, 'DefensePercent', 38.00, 5)
, (3, 1, 'AttackPercent', 30.00, 5)

, (1, 1, 'HPPercent', 22.80, 5)
, (1, 1, 'DefensePercent', 18.00, 5)
, (1, 1, 'AttackPercent', 18.00, 5)
--==========================Rank5==========================
--==========================Rank4==========================
, (4, 0, 'Attack', 92.00, 4)
, (3, 0, 'Attack', 63.00, 4)
, (1, 0, 'HP', 957.00, 4)

, (4, 1, 'CritRate', 13.80, 4)
, (4, 1, 'CritDamage', 27.70, 4)
, (4, 1, 'HealingBonus', 16.30, 4)
, (4, 1, 'HPPercent', 20.50, 4)
, (4, 1, 'DefensePercent', 26.00, 4)
, (4, 1, 'AttackPercent', 20.50, 4)

, (3, 1, 'ElementalDamage', 18.90, 4)
, (3, 1, 'ResonanceEfficiency', 20.10, 4)
, (3, 1, 'HPPercent', 18.90, 4)
, (3, 1, 'DefensePercent', 99999.99, 4)
, (3, 1, 'AttackPercent', 18.90, 4)

, (1, 1, 'HPPercent', 14.20, 4)
, (1, 1, 'DefensePercent', 11.30, 4)
, (1, 1, 'AttackPercent', 11.30, 4)
--==========================Rank4==========================