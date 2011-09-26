-- Fix item Tricky Treat para Achievements http://www.wowhead.com/achievement=288
UPDATE `item_template` SET `ScriptName`='item_hallowsend_tricky_treat' WHERE `entry`='33226';
-- Fix Npc para quest http://www.wowhead.com/quest=8358#comments al usar el emote /train
UPDATE `creature_template` SET `ScriptName`='npc_kali_remik' WHERE `entry`='11814';

-- Fix ModelID de npcs
UPDATE `creature_template` SET `modelid1`='11686' WHERE `entry`='23686';-- Headless Horseman Flame Bunny
UPDATE `creature_template` SET `modelid1`='21342' WHERE `entry`='24034';-- Headless Horseman - Wisp Invis

-- Fix Cubetas con agua para quest. (Water Bucket)
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (42339,42132);
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`)
VALUES 
('42339','42322','1','Bucket Lands');
('42132','42971','1','Headless Horseman - Start Fire');

-- Añadido a Disables Give Water Bucket para creaturas y pets.
-- 2 Spell disabled for creatures + 4 Spell disabled for pets
DELETE FROM `disables` WHERE `entry` =42322;
INSERT INTO `disables` (`sourceType`,`entry`,`flags`) 
VALUES ('0','42322','6');



-- CONDITION_SOURCE_TYPE_SPELL_SCRIPT_TARGET            = 13,
-- CONDITION_SPELL_SCRIPT_TARGET     = 18, 
-- Añadida correcta condicion para cubeta de agua :) (Bucket Lands)
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
VALUES
(13, 0, 42339, 1, 18, 1, 0, 0, 0, "", "Bucket Lands"),
(13, 0, 42339, 0, 18, 1, 23537, 0, 0, "", "Bucket Lands");

-- ScriptName
UPDATE `creature_template` SET `ScriptName`='npc_headless_horseman_fire',`equipment_id`='0' WHERE `entry`='23537';
UPDATE `creature_template` SET `ScriptName`='npc_shade_of_the_horseman',`unit_flags`= `unit_flags` | 0x2000000 WHERE `entry`='23543';