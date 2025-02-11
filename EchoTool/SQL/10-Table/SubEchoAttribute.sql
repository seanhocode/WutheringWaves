USE WutheringWaves
GO
-- 建立副詞條表
CREATE TABLE SubEchoAttribute (
    SubEchoAttributeID INT IDENTITY(1,1) PRIMARY KEY, -- 副詞條 ID，自動增量
    Level INTEGER NOT NULL, -- 副詞條等級 (1-8)
    AttributeCode VARCHAR(100) NOT NULL, -- 詞條類型 (例如：Attack, CritRate, HP)
    AttributeValue DECIMAL(7,2) NOT NULL -- 詞條數值
);

-- 插入副詞條數據
INSERT INTO SubEchoAttribute (Level, AttributeCode, AttributeValue) VALUES
(1, 'Attack', 60.00), (1, 'Defense', 60.00), (1, 'HP', 580.00), (1, 'AttackPercent', 11.60), (1, 'DefensePercent', 15.00), (1, 'HPPercent', 11.60), (1, 'CritRate', 10.50), (1, 'CritDamage', 21.00), (1, 'ResonanceEfficiency', 12.40), (1, 'ResonanceSkillDamage', 11.60), (1, 'ResonanceReleaseDamage', 11.60), (1, 'NormalAttackDamage', 11.60), (1, 'HeavyAttackDamage', 11.60),
(2, 'Attack', 50.00), (2, 'Defense', 50.00), (2, 'HP', 540.00), (2, 'AttackPercent', 10.90), (2, 'DefensePercent', 13.80), (2, 'HPPercent', 10.90), (2, 'CritRate', 9.90), (2, 'CritDamage', 19.80), (2, 'ResonanceEfficiency', 11.60), (2, 'ResonanceSkillDamage', 10.90), (2, 'ResonanceReleaseDamage', 10.90), (2, 'NormalAttackDamage', 10.90), (2, 'HeavyAttackDamage', 10.90),
(3, 'Attack', 40.00), (3, 'Defense', 40.00), (3, 'HP', 510.00), (3, 'AttackPercent', 10.10), (3, 'DefensePercent', 12.80), (3, 'HPPercent', 10.10), (3, 'CritRate', 9.30), (3, 'CritDamage', 18.60), (3, 'ResonanceEfficiency', 10.80), (3, 'ResonanceSkillDamage', 10.10), (3, 'ResonanceReleaseDamage', 10.10), (3, 'NormalAttackDamage', 10.10), (3, 'HeavyAttackDamage', 10.10),
(4, 'Attack', 30.00),                        (4, 'HP', 470.00), (4, 'AttackPercent', 9.40), (4, 'DefensePercent', 11.80), (4, 'HPPercent', 9.40), (4, 'CritRate', 8.70), (4, 'CritDamage', 17.40), (4, 'ResonanceEfficiency', 10.00), (4, 'ResonanceSkillDamage', 9.40), (4, 'ResonanceReleaseDamage', 9.40), (4, 'NormalAttackDamage', 9.40), (4, 'HeavyAttackDamage', 9.40),
                                             (5, 'HP', 430.00), (5, 'AttackPercent', 8.60), (5, 'DefensePercent', 10.90), (5, 'HPPercent', 8.60), (5, 'CritRate', 8.10), (5, 'CritDamage', 16.20), (5, 'ResonanceEfficiency', 9.20), (5, 'ResonanceSkillDamage', 8.60), (5, 'ResonanceReleaseDamage', 8.60), (5, 'NormalAttackDamage', 8.60), (5, 'HeavyAttackDamage', 8.60),
                                             (6, 'HP', 390.00), (6, 'AttackPercent', 7.90), (6, 'DefensePercent', 10.00), (6, 'HPPercent', 7.90), (6, 'CritRate', 7.50), (6, 'CritDamage', 15.00), (6, 'ResonanceEfficiency', 8.40), (6, 'ResonanceSkillDamage', 7.90), (6, 'ResonanceReleaseDamage', 7.90), (6, 'NormalAttackDamage', 7.90), (6, 'HeavyAttackDamage', 7.90),
                                             (7, 'HP', 360.00), (7, 'AttackPercent', 7.10), (7, 'DefensePercent', 9.00), (7, 'HPPercent', 7.10), (7, 'CritRate', 6.90), (7, 'CritDamage', 13.80), (7, 'ResonanceEfficiency', 7.60), (7, 'ResonanceSkillDamage', 7.10), (7, 'ResonanceReleaseDamage', 7.10), (7, 'NormalAttackDamage', 7.10), (7, 'HeavyAttackDamage', 7.10),
                                             (8, 'HP', 320.00), (8, 'AttackPercent', 6.46), (8, 'DefensePercent', 8.10), (8, 'HPPercent', 6.40), (8, 'CritRate', 6.30), (8, 'CritDamage', 12.60), (8, 'ResonanceEfficiency', 6.80), (8, 'ResonanceSkillDamage', 6.40), (8, 'ResonanceReleaseDamage', 6.40), (8, 'NormalAttackDamage', 6.40), (8, 'HeavyAttackDamage', 6.40);
