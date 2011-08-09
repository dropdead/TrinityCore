-- 04[Paladin]Sacred_Shield.sql
-- Add cooldown for Sacred Shield after remove effect as expected
DELETE FROM `spell_script_names` WHERE `spell_id` = 58597;
INSERT INTO `spell_script_names` VALUES
(58597, 'spell_pal_sacred_shield');