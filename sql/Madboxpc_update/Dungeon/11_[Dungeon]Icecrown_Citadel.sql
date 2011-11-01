-- ICC

-- BOSS FESTERGUT
-- Fix spell http://www.wowhead.com/spell=71160
DELETE FROM `spell_script_names` WHERE `spell_id` IN (71160,71161);
INSERT INTO `spell_script_names` VALUES 
(71160,'spell_stinky_plague_stench'),
(71161,'spell_stinky_plague_stench');


-- BOSS PUTRICIDE
-- http://www.wowhead.com/npc=37697
-- 
-- Añadido correcto inmune mask a npcs (SELECT  `entry` ,  `difficulty_entry_1` ,  `difficulty_entry_2` ,  `difficulty_entry_3` FROM  `creature_template` WHERE  `entry`IN ( 37697,37562)); 
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|33554432|536870912 WHERE `entry` IN (37697,38604,38758,38759,37562,38602,38760,38761);


-- Update Dmg Boss
-- Lord Marrowgar
UPDATE `creature_template` SET  `dmg_multiplier` =  '45' WHERE `entry` =36612;-- Valor Anterior 35
-- Lady Deathwhisper
UPDATE `creature_template` SET  `dmg_multiplier` =  '11.5' WHERE  `entry` =36855;-- Valor Anterior 7.5
-- Deathbringer
UPDATE `creature_template` SET  `dmg_multiplier` =  '45' WHERE `entry` =37813;-- Valor Anterior 35
-- Rotface
UPDATE `creature_template` SET  `dmg_multiplier` =  '45' WHERE `entry` =36627;-- Valor Anterior 35
-- 36899 Bigg Ozze
UPDATE `creature_template` SET  `dmg_multiplier` =  '9.5' WHERE  `entry` =36899;-- Valor Anterior 7.5
-- Festergut
UPDATE `creature_template` SET  `dmg_multiplier` =  '45' WHERE `entry` =36626;-- Valor Anterior 35
-- Sister Svalna
UPDATE `creature_template` SET  `dmg_multiplier` =  '11.5' WHERE  `entry` =37126;-- Valor Anterior 7.5