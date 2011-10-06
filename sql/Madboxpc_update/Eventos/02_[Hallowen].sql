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
DELETE FROM `conditions` WHERE `SourceEntry`=42339;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
VALUES
(13, 0, 42339, 1, 18, 1, 0, 0, 0, "", "Bucket Lands"),
(13, 0, 42339, 0, 18, 1, 23537, 0, 0, "", "Bucket Lands");

-- ScriptName
UPDATE `creature_template` SET `ScriptName`='npc_headless_horseman_fire',`equipment_id`='0' WHERE `entry`='23537';
UPDATE `creature_template` SET `ScriptName`='npc_shade_of_the_horseman',`unit_flags`= `unit_flags` | 0x2000000 WHERE `entry`='23543';

-- 98686
-- Custom Trigger.
DELETE FROM `creature_template`WHERE `entry`=98686;
INSERT INTO `creature_template` (`entry`,`difficulty_entry_1`,`difficulty_entry_2`,`difficulty_entry_3`,`KillCredit1`,`KillCredit2`,`modelid1`,`modelid2`,`modelid3`,`modelid4`,`name`,`subname`,`IconName`,`gossip_menu_id`,`minlevel`,`maxlevel`,`exp`,`faction_A`,`faction_H`,`npcflag`,`speed_walk`,`speed_run`,`scale`,`rank`,`mindmg`,`maxdmg`,`dmgschool`,`attackpower`,`dmg_multiplier`,`baseattacktime`,`rangeattacktime`,`unit_class`,`unit_flags`,`dynamicflags`,`family`,`trainer_type`,`trainer_spell`,`trainer_class`,`trainer_race`,`minrangedmg`,`maxrangedmg`,`rangedattackpower`,`type`,`type_flags`,`lootid`,`pickpocketloot`,`skinloot`,`resistance1`,`resistance2`,`resistance3`,`resistance4`,`resistance5`,`resistance6`,`spell1`,`spell2`,`spell3`,`spell4`,`spell5`,`spell6`,`spell7`,`spell8`,`PetSpellDataId`,`VehicleId`,`mingold`,`maxgold`,`AIName`,`MovementType`,`InhabitType`,`Health_mod`,`Mana_mod`,`Armor_mod`,`RacialLeader`,`questItem1`,`questItem2`,`questItem3`,`questItem4`,`questItem5`,`questItem6`,`movementId`,`RegenHealth`,`equipment_id`,`mechanic_immune_mask`,`flags_extra`,`ScriptName`,`WDBVerified`) 
VALUES ('98686','0','0','0','0','0','4626','0','0','0','Custom Trigger Keeper','','','0','1','1','0','14','14','0','1','1.14286','1','0','1','2','0','0','1','2000','2000','1','33554432','0','0','0','0','0','0','1','2','0','10','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','0','0','0','0','0','0','0','0','1','0','0','0','npc_hallowend','1');

DELETE FROM `creature` WHERE `id` = 98686;
INSERT INTO `creature` (`guid`,`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
VALUES
(NULL, 98686, 530, 1, 1, 328, 0, '-4178.08', '-12499.8', '47.0984', '3.73379', 300, 0, 0, 42, 0, 0, 0, 0, 0),
(NULL, 98686, 1, 1, 1, 0, 0, '305.197', '-4728.36', '9.63175', '2.18494', 300, 0, 0, 42, 0, 0, 0, 0, 0),
(NULL, 98686, 0, 1, 1, 328, 0, '2261.87', '298.982', '34.1137', '1.26623', 300, 0, 0, 42, 0, 0, 0, 0, 0),
(NULL, 98686, 530, 1, 1, 328, 0, '9513.56', '-6810.1', '17.1184', '2.49493', 300, 0, 0, 42, 0, 0, 0, 0, 0),
(NULL, 98686, 0, 1, 1, 328, 0, '-9458.17', '56.5453', '56.0296', '1.39003', 300, 0, 0, 42, 0, 0, 0, 0, 0),
(NULL, 98686, 0, 1, 1, 0, 0, '-5589.21', -486, '397.038', '0.0537012', 300, 0, 0, 42, 0, 0, 0, 0, 0);
-- Linqueamos trigger solo al evento.
INSERT INTO `game_event_creature` VALUES
(12,(SELECT `guid` FROM `creature` WHERE `id` = 98686 limit 0,1),),
(12,(SELECT `guid` FROM `creature` WHERE `id` = 98686 limit 0,1),),
(12,(SELECT `guid` FROM `creature` WHERE `id` = 98686 limit 0,1),),
(12,(SELECT `guid` FROM `creature` WHERE `id` = 98686 limit 0,1),),
(12,(SELECT `guid` FROM `creature` WHERE `id` = 98686 limit 0,1),),
(12,(SELECT `guid` FROM `creature` WHERE `id` = 98686 limit 0,1),);
