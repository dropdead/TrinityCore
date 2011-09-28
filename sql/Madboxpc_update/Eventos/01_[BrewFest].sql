-- Brewfest Coren Direbrew
/* TODO
-- Faltante Loot. Chekear.
*/
DELETE FROM `gameobject` WHERE `id` = 188498; -- Spawn Mole- machine Consola en la entrada de Brd
INSERT INTO `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(188498, 230, 1, 1, 1133.59, -462.347, -103.659, 5.75403, 0, 0, 0.261501, -0.965203, 300, 0, 1);
DELETE FROM `game_event_gameobject` WHERE `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 188498); -- Añadido al eventlink correspondiente.
INSERT INTO `game_event_gameobject` (`guid`, `eventEntry`) VALUES
((SELECT `guid` FROM `gameobject` WHERE `id` = 188498), 24);
DELETE FROM `creature` WHERE `id` IN (23872); -- Spawn Coren Direbrew
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(23872, 230, 1, 1, 0, 0, 890.38, -135.366, -49.7525, 5.19012, 300, 0, 0, 302400, 0, 0, 0, 0, 0);
DELETE FROM `game_event_creature` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id` IN (23872));
INSERT INTO `game_event_creature` (`guid`, `eventEntry`) VALUES
((SELECT `guid` FROM `creature` WHERE `id` = 23872), 24);
-- Spawn de creatures por guid asignadas a correcto evento ID.
DELETE FROM `game_event_creature` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id` IN (23872,26719,27584,28329)); -- Añadido al eventlink correspondiente.
-- Añadido ScriptNames
UPDATE `creature_template` SET `ScriptName` = 'npc_coren_direbrew', `flags_extra` = 0, `dmg_multiplier` = 20, `lootid` = 23872 WHERE `entry` = 23872;
UPDATE `creature_template` SET `ScriptName` = 'npc_brewmaiden' WHERE `entry` IN (26822,26764);
UPDATE `creature_template` SET `faction_A` = 736, `faction_H` = 736 WHERE `entry` = 26776;
UPDATE `gameobject_template` SET `ScriptName` = 'go_mole_machine_console' WHERE `entry` = 188498;
-- Limite Targets
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` IN (47344, 47310);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`) VALUES
(13, 47310, 18, 1, 0),-- Cast Disarm AOE
(13, 47344, 18, 1, 26764), 
(13, 47344, 18, 1, 26822);  
-- Spell scripts
DELETE FROM `spell_scripts` WHERE `id`=47344;
INSERT INTO `spell_scripts` (`id`, `effIndex`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`)
VALUES
(47344, 0, 0, 15, 47339, 3, 0, 0, 0, 0, 0); -- cast back "Send Second Mug" on "Request Second Mug" hit
-- Spell Auras Drinking Brew
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 47371;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(47371, -47376, 1, 'Remove Visual Buff'),
(47371, -47331, 1, 'Remove Has Brew Aura');
-- Inmunidades
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|33554432|67108864|536870912 WHERE `entry` IN (23872,26822,26764);

UPDATE `quest_template` SET `SpecialFlags`=9 WHERE `entry`=25483;
UPDATE `creature_template` SET `npcflag`=3 WHERE `entry`=23872;

-- Tapper Swindlekeg SAI
SET @ENTRY := 24711;
SET @SPELL_DRINK := 50552;
SET @SPELL_FINISH := 50555;
SET @QUEST_DIRE_BREW := 12492;
UPDATE `creature_template` SET `AIName`='SmartAI',`flags_extra`=`flags_extra`|2 WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY,@ENTRY*100);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,@QUEST_DIRE_BREW,0,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0,"Tapper Swindlekeg - On Quest Complete - Run Script"),
(@ENTRY*100+0,9,0,0,0,0,100,0,1500,1500,0,0,1,0,0,0,0,0,0,0,7,0,0,0,0,0,0,"Tapper Swindlekeg - On Script - Say Line 0"),
(@ENTRY*100+0,9,1,0,0,0,100,0,0,0,0,0,11,@SPELL_DRINK,0,0,0,0,0,0,1,0,0,0,0,0,0,"Tapper Swindlekeg - On Script - Cast Questgiver Tries Dire Brew"),
(@ENTRY*100+0,9,2,0,0,0,100,0,8500,8500,0,0,11,@SPELL_FINISH,0,0,0,0,0,0,1,0,0,0,0,0,0,"Tapper Swindlekeg - On Script - Cast Questgiver Finishes Drinking"),
(@ENTRY*100+0,9,3,0,0,0,100,0,0,0,0,0,28,@SPELL_DRINK,0,0,0,0,0,0,1,0,0,0,0,0,0,"Tapper Swindlekeg - On Script - Remove Growth Aura"),
(@ENTRY*100+0,9,4,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,0,7,0,0,0,0,0,0,"Tapper Swindlekeg - On Script - Say Line 1"),
(@ENTRY*100+0,9,5,0,0,0,100,0,3500,3500,0,0,1,2,0,0,0,0,0,0,7,0,0,0,0,0,0,"Tapper Swindlekeg - On Script - Say Line 2"),
(@ENTRY*100+0,9,6,0,0,0,100,0,3500,3500,0,0,1,3,0,0,0,0,0,0,7,0,0,0,0,0,0,"Tapper Swindlekeg - On Script - Say Line 3");
-- Text
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"Well time's money, and time's wasting! Let's have that drink...",12,0,100,1,0,0,"Tapper Swindlekeg"),
(@ENTRY,1,0,"Wow! This really greases the steamplugs!",12,0,100,1,0,0,"Tapper Swindlekeg"),
(@ENTRY,2,0,"If I were an honest goblin, I'd say this was the best beer of the festival...",12,0,100,1,0,0,"Tapper Swindlekeg"),
(@ENTRY,3,0,"Too bad Coren's dead. If I could buy that brew from him and resell it - watered down and rebottled under my own label, of course - I'd be rich!",12,0,100,1,0,0,"Tapper Swindlekeg"),
-- These three are used in areatrigger script
(@ENTRY,4,0,"Hey there, and welcome to Brewfest. Come in and have a drink or three!",12,1,100,3,0,0,"Tapper Swindlekeg"),
(@ENTRY,4,1,"What's up, friend? Welcome to the Brewfest Grounds! Now go buy some drinks!",12,1,100,3,0,0,"Tapper Swindlekeg"),
(@ENTRY,4,2,"Hey hey, it's another $r! Welcome to my annual Brewfest celebration... now go feast and drink some!",12,1,100,3,0,0,"Tapper Swindlekeg");
 
-- Ipfelkofer Ironkeg SAI
SET @ENTRY := 24710;
SET @SPELL_DRINK := 50552;
SET @SPELL_FINISH := 50555;
SET @QUEST_DIRE_BREW := 11441;
UPDATE `creature_template` SET `AIName`='SmartAI',`flags_extra`=`flags_extra`|2 WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY,@ENTRY*100);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,@QUEST_DIRE_BREW,0,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ipfelkofer Ironkeg - On Quest Complete - Run Script"),
(@ENTRY*100+0,9,0,0,0,0,100,0,1500,1500,0,0,1,0,0,0,0,0,0,0,7,0,0,0,0,0,0,"Ipfelkofer Ironkeg - On Script - Say Line 0"),
(@ENTRY*100+0,9,1,0,0,0,100,0,0,0,0,0,11,@SPELL_DRINK,0,0,0,0,0,0,1,0,0,0,0,0,0,"Ipfelkofer Ironkeg - On Script - Cast Questgiver Tries Dire Brew"),
(@ENTRY*100+0,9,2,0,0,0,100,0,8500,8500,0,0,11,@SPELL_FINISH,0,0,0,0,0,0,1,0,0,0,0,0,0,"Ipfelkofer Ironkeg - On Script - Cast Questgiver Finishes Drinking"),
(@ENTRY*100+0,9,3,0,0,0,100,0,0,0,0,0,28,@SPELL_DRINK,0,0,0,0,0,0,1,0,0,0,0,0,0,"Ipfelkofer Ironkeg - On Script - Remove Growth Aura"),
(@ENTRY*100+0,9,4,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,0,7,0,0,0,0,0,0,"Ipfelkofer Ironkeg - On Script - Say Line 1"),
(@ENTRY*100+0,9,5,0,0,0,100,0,3500,3500,0,0,1,2,0,0,0,0,0,0,7,0,0,0,0,0,0,"Ipfelkofer Ironkeg - On Script - Say Line 2"),
(@ENTRY*100+0,9,6,0,0,0,100,0,3500,3500,0,0,1,3,0,0,0,0,0,0,7,0,0,0,0,0,0,"Ipfelkofer Ironkeg - On Script - Say Line 3");
 
-- Text
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"Right! Let's try this so-called dire brew...",12,0,100,0,0,0,"Ipfelkofer Ironkeg"),
(@ENTRY,1,0,"Bronzebeard's beard! What a drink!",12,0,100,0,0,0,"Ipfelkofer Ironkeg"),
(@ENTRY,2,0,"$N, this beer... well, it might be the best of Brewfest!",12,0,100,15,0,0,"Ipfelkofer Ironkeg"),
(@ENTRY,3,0,"It is a shame Coren's Dire Brew can't quench more thirsting throats! It's blasphemy, I know, but I envy those Dark Iron dwarves!",12,0,100,274,0,0,"Ipfelkofer Ironkeg"),
-- These three are used in areatrigger script
(@ENTRY,4,0,"Ho there, and welcome to Brewfest!",12,7,100,3,0,0,"Ipfelkofer Ironkeg"),
(@ENTRY,4,1,"Hello, friend! Welcome to the Brewfest Grounds!",12,7,100,3,0,0,"Ipfelkofer Ironkeg"),
(@ENTRY,4,2,"Hail, good $c! Welcome to Ironforge's annual Brewfest celebration!",12,7,100,3,0,0,"Ipfelkofer Ironkeg");
 
-- Areatrigger scriptname
DELETE FROM `areatrigger_scripts` WHERE `entry` IN (4829,4820);
INSERT INTO `areatrigger_scripts` (`entry`,`ScriptName`) VALUES
(4829,'at_brewfest'), -- Durotar
(4820,'at_brewfest'); -- Dun Morogh

-- [Q] Catch the Wild Wolpertinger!
-- [Q] [A/H] Catch the Wild Wolpertinger!
-- Conditions already exist with proper ErrorTextId
-- Wild Wolpertinger SAI
SET @ENTRY := 23487;
SET @SPELL_NET := 41621;
SET @SPELL_CREATE_ITEM := 41622;
UPDATE `creature_template` SET `AIName`='SmartAI',`unit_flags`=`unit_flags`|512 WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,2,8,0,100,0,@SPELL_NET,0,0,0,11,@SPELL_CREATE_ITEM,2,0,0,0,0,7,0,0,0,0,0,0,0,"Wild Wolpertinger - On Spellhit - Cast Create Stunned Wolpertinger Item"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,41,4000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wild Wolpertinger - On Spellhit - Forced Despawn");
-- Fix conejos para que la red no sea casteada en el player (by Kayserzero)
UPDATE `creature_template` SET `unit_flags`=640 WHERE entry=23487;

-- [Q] [A/H] Chug and Chuck
-- The chance of this event to occur is low according to videos!
-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
-- Self-Turning and Oscillating Utility Target SAI
SET @ENTRY := 24108;
SET @SPELL_THROW_MUG := 42300;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,8,0,100,0,@SPELL_THROW_MUG,0,0,0,33,@ENTRY,0,0,0,0,0,7,0,0,0,0,0,0,0,"Self-Turning and Oscillating Utility Target - On Spellhit - Quest Credit");
-- Condition for spell
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (13) AND `SourceEntry` IN (42436,42300);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,42436,0,18,1,0,0,0,'',"Spell Drink! targets player"),
(13,0,42300,0,18,24108,0,0,0,'',"Spell Brewfest - Throw Mug targets Self-Turning and Oscillating Utility Target");
-- Spell Drink! should make you throw a mug
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=42436 AND `spell_effect`=42300;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(42436,42300,1,'Drink! will now also cast Brewfest - Throw Mug');
-- [Q] [A/H] Pink Elekks On Parade
-- We were able to kill them for credits.. (faction).
-- Tirisfal Pink Elekk SAI
SET @ENTRY := 23530;
SET @SPELL_ELEKK_DISPERSION := 44654;
UPDATE `creature_template` SET `AIName`='SmartAI',`faction_A`=35,`faction_H`=35 WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,8,0,100,0,@SPELL_ELEKK_DISPERSION,0,0,0,33,@ENTRY,0,0,0,0,0,7,0,0,0,0,0,0,0,"Tirisfal Pink Elekk - On Spellhit - Quest Credit"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,41,2000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Tirisfal Pink Elekk - On Spellhit - Forced Despawn");
-- Eversong Pink Elekk SAI
SET @ENTRY := 23531;
SET @SPELL_ELEKK_DISPERSION := 44654;
UPDATE `creature_template` SET `AIName`='SmartAI',`faction_A`=35,`faction_H`=35 WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,8,0,100,0,@SPELL_ELEKK_DISPERSION,0,0,0,33,@ENTRY,0,0,0,0,0,7,0,0,0,0,0,0,0,"Eversong Pink Elekk - On Spellhit - Quest Credit"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,41,2000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Eversong Pink Elekk - On Spellhit - Forced Despawn");
-- Mulgore Pink Elekk SAI
SET @ENTRY := 23529;
SET @SPELL_ELEKK_DISPERSION := 44654;
UPDATE `creature_template` SET `AIName`='SmartAI',`faction_A`=35,`faction_H`=35 WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,8,0,100,0,@SPELL_ELEKK_DISPERSION,0,0,0,33,@ENTRY,0,0,0,0,0,7,0,0,0,0,0,0,0,"Mulgore Pink Elekk - On Spellhit - Quest Credit"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,41,2000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mulgore Pink Elekk - On Spellhit - Forced Despawn");
-- Elwynn Pink Elekk SAI
SET @ENTRY := 23507;
SET @SPELL_ELEKK_DISPERSION := 44654;
UPDATE `creature_template` SET `AIName`='SmartAI',`faction_A`=35,`faction_H`=35 WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,8,0,100,0,@SPELL_ELEKK_DISPERSION,0,0,0,33,@ENTRY,0,0,0,0,0,7,0,0,0,0,0,0,0,"Elwynn Pink Elekk - On Spellhit - Quest Credit"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,41,2000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Elwynn Pink Elekk - On Spellhit - Forced Despawn");
-- Teldrassil Pink Elekk SAI
SET @ENTRY := 23527;
SET @SPELL_ELEKK_DISPERSION := 44654;
UPDATE `creature_template` SET `AIName`='SmartAI',`faction_A`=35,`faction_H`=35 WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,8,0,100,0,@SPELL_ELEKK_DISPERSION,0,0,0,33,@ENTRY,0,0,0,0,0,7,0,0,0,0,0,0,0,"Teldrassil Pink Elekk - On Spellhit - Quest Credit"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,41,2000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Teldrassil Pink Elekk - On Spellhit - Forced Despawn");
-- Azuremyst Pink Elekk SAI
SET @ENTRY := 23528;
SET @SPELL_ELEKK_DISPERSION := 44654;
UPDATE `creature_template` SET `AIName`='SmartAI',`faction_A`=35,`faction_H`=35 WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,8,0,100,0,@SPELL_ELEKK_DISPERSION,0,0,0,33,@ENTRY,0,0,0,0,0,7,0,0,0,0,0,0,0,"Azuremyst Pink Elekk - On Spellhit - Quest Credit"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,41,2000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Azuremyst Pink Elekk - On Spellhit - Forced Despawn");
-- Gordok Brew Barker SAI
SET @ENTRY := 23685;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,22,0,100,0,101,5000,5000,0,11,@SPELL_DRINK,2,0,0,0,0,7,0,0,0,0,0,0,0,"Gordok Brew Barker - Emote Receive 'Wave' - Cast Create Complimentary Brewfest Sampler"),
(@ENTRY,0,1,0,1,0,100,0,30000,45000,180000,240000,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"Gordok Brew Barker - Out of Combat - Yell Line 0 (random)");
-- Text
DELETE FROM `script_texts` WHERE `entry` BETWEEN -717 AND -719;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"YOU TRY DA' BEST, NOW TRY DA' REST! OGRE BREW!",14,0,100,1,0,0,"Gordok Brew Barker"),
(@ENTRY,0,1,"HEY YOU! DRINK OGRE BREWS! MAKE YOU BIG AND STRONG!",14,0,100,1,0,0,"Gordok Brew Barker"),
(@ENTRY,0,2,"YOU WANT DRINK? WE GOT DRINK!",14,0,100,1,0,0,"Gordok Brew Barker"),
-- Dark Iron Attack
(@ENTRY,1,0,"SOMEONE TRY THIS SUPER BREW!",14,0,100,1,0,0,"Gordok Brew Barker");
-- Blix Fixwidget SAI
SET @ENTRY := 24495;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,22,0,100,0,101,5000,5000,0,11,@SPELL_DRINK,2,0,0,0,0,7,0,0,0,0,0,0,0,"Blix Fixwidget - Emote Receive 'Wave' - Cast Create Complimentary Brewfest Sampler"),
(@ENTRY,0,1,0,1,0,100,0,30000,45000,180000,240000,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"Blix Fixwidget - Out of Combat - Say Line 0 (random)");
-- Text
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"Whoah! Walk by again girl!",12,0,100,1,0,0,"Blix Fixwidget"),
(@ENTRY,0,1,"Hey! Sweet cheeks, over here!",12,0,100,1,0,0,"Blix Fixwidget"),
(@ENTRY,0,2,"Hey, hey sweet thing! Looking good!",12,0,100,1,0,0,"Blix Fixwidget"),
(@ENTRY,0,3,"Hey, hey! Nice build you got there honey!",12,0,100,1,0,0,"Blix Fixwidget"),
(@ENTRY,0,4,"Yo! Big lady! You think you're big enough to handle me?",12,0,100,1,0,0,"Blix Fixwidget");
-- Drohn's Distillery Barker SAI
SET @ENTRY := 24492;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,22,0,100,0,101,5000,5000,0,11,@SPELL_DRINK,2,0,0,0,0,7,0,0,0,0,0,0,0,"Drohn's Distillery Barker - Emote Receive 'Wave' - Cast Create Complimentary Brewfest Sampler"),
(@ENTRY,0,1,0,1,0,100,0,30000,45000,180000,240000,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"Drohn's Distillery Barker - Out of Combat - Say Line 0 (random)");
-- Text
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"Drohn's brew is the stuff legends are made of! Come taste the legend!",12,0,100,1,0,0,"Drohn's Distillery Barker"),
(@ENTRY,0,1,"We drink for the Horde! Do you drink for the Horde? Come show us at Drohn's Distillery!",12,0,100,1,0,0,"Drohn's Distillery Barker"),
(@ENTRY,0,2,"Hey you, the tall one... Want to put some hair on your chest? Drohn's Distillery can help you out!",12,0,100,1,0,0,"Drohn's Distillery Barker"),
(@ENTRY,0,3,"Drohn's Distillery has the best brew money can buy! They were voted 'Outstanding Brew' by Monthly Goblin Brew!",12,0,100,1,0,0,"Drohn's Distillery Barker"),
-- Dark Iron Attack
(@ENTRY,1,0,"Chug and chuck! Chug and chuck!",14,0,100,1,0,0,"Drohn's Distillery Barker"),
(@ENTRY,2,0,"Down the free brew and pelt the Guzzlers with your mug!",14,0,100,1,0,0,"Drohn's Distillery Barker"),
(@ENTRY,3,0,"SOMEONE TRY THIS SUPER BREW!",14,0,100,1,0,0,"Drohn's Distillery Barker");
-- T'chali's Voodoo Brewery Barker SAI
SET @ENTRY := 24493;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,22,0,100,0,101,5000,5000,0,11,@SPELL_DRINK,2,0,0,0,0,7,0,0,0,0,0,0,0,"T'chali's Voodoo Brewery Barker - Emote Receive 'Wave' - Cast Create Complimentary Brewfest Sampler"),
(@ENTRY,0,1,0,1,0,100,0,30000,45000,180000,240000,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"T'chali's Voodoo Brewery Barker - Out of Combat - Say Line 0 (random)");
-- Text
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"Drohn's brew is the stuff legends are made of! Come taste the legend!",12,0,100,1,0,0,"T'chali's Voodoo Brewery Barker"),
(@ENTRY,0,1,"We drink for the Horde! Do you drink for the Horde? Come show us at Drohn's Distillery!",12,0,100,1,0,0,"T'chali's Voodoo Brewery Barker"),
(@ENTRY,0,2,"Hey you, the tall one... Want to put some hair on your chest? Drohn's Distillery can help you out!",12,0,100,1,0,0,"T'chali's Voodoo Brewery Barker"),
(@ENTRY,0,3,"Drohn's Distillery has the best brew money can buy! They were voted 'Outstanding Brew' by Monthly Goblin Brew!",12,0,100,1,0,0,"T'chali's Voodoo Brewery Barker"),
-- Dark Iron Attack
(@ENTRY,1,0,"Chug and chuck! Chug and chuck!",14,0,100,1,0,0,"T'chali's Voodoo Brewery Barker"),
(@ENTRY,2,0,"Down the free brew and pelt the Guzzlers with your mug!",14,0,100,1,0,0,"T'chali's Voodoo Brewery Barker"),
(@ENTRY,3,0,"SOMEONE TRY THIS SUPER BREW!",14,0,100,1,0,0,"T'chali's Voodoo Brewery Barker");
-- Brewfest Reveler SAI
SET @ENTRY := 24484;
SET @SPELL_CREATE_MUG := 42518;
SET @SPELL_TOAST := 41586;
UPDATE `creature_template` SET `AIName`='SmartAI',`ScriptName`='' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,22,0,100,0,101,5000,5000,0,11,@SPELL_CREATE_MUG,2,0,0,0,0,7,0,0,0,0,0,0,0,"Brewfest Reveler - Emote Receive 'Wave' - Cast Create Complimentary Brewfest Sampler"),
(@ENTRY,0,1,0,22,0,100,0,34,5000,5000,0,11,@SPELL_TOAST,2,0,0,0,0,7,0,0,0,0,0,0,0,"Brewfest Reveler - Emote Receive 'Dance' - Cast Brewfest Toast");
-- Condition for spell
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=42518;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,42518,0,18,1,0,0,0,'',"Spell Create Complimentary Brewfest Sampler targets players"),
(13,0,42518,0,26,33096,0,0,0,'',"Spell Create Complimentary Brewfest Sampler targets players");

-- Fix Quest Chug and chuck (A/H) and Bark for... (Q 11294,11408,11293,11407)
UPDATE `quest_template` SET `PrevQuestId`='11409' WHERE (`entry`='12194');
UPDATE `quest_template` SET `PrevQuestId`='12191' WHERE (`entry`='12192');
DELETE FROM  `spell_linked_spell` WHERE `spell_trigger` = 42436;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`)
VALUES ('42436','47173','0','Brewfest Sampler');
UPDATE `item_template` SET `ScriptName`='item_brewfest_ChugAndChuck' WHERE (`entry`='33096');
UPDATE `creature_template` SET `scale`='0.01',`AIName`='',`flags_extra`='0',`ScriptName`='npc_brewfest_trigger' WHERE `entry` in (24202, 24203, 24204, 24205);
UPDATE `quest_template` SET `PrevQuestId`='0' WHERE (`entry`='12193');

-- Ram Barrel Run Quest
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (-43880, -43883, 42994, 42993, 42992, 43310, 43332, -43332);
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES 
('-43880','-42994','0','Remove brewfest speed buffs when player dismounted'),
('-43880','-42993','0','Remove brewfest speed buffs when player dismounted'),
('-43880','-42992','0','Remove brewfest speed buffs when player dismounted'),
('-43880','-42146','0','Remove brewfest speed buffs when player dismounted'),
('-43880','-43310','0','Remove brewfest speed buffs when player dismounted'),
('-43880','-43492','0','Remove brewfest speed buffs when player dismounted'),
('-43880','-43332','0','Remove brewfest speed buffs when player dismounted'),
('-43880','-43052','0','Remove brewfest speed buffs when player dismounted'),
('-43883','-42994','0','Remove brewfest speed buffs when player dismounted'),
('-43883','-42993','0','Remove brewfest speed buffs when player dismounted'),
('-43883','-42992','0','Remove brewfest speed buffs when player dismounted'),
('-43883','-42146','0','Remove brewfest speed buffs when player dismounted'),
('-43883','-43310','0','Remove brewfest speed buffs when player dismounted'),
('-43883','-43492','0','Remove brewfest speed buffs when player dismounted'),
('-43883','-43332','0','Remove brewfest speed buffs when player dismounted'),
('-43883','-43052','0','Remove brewfest speed buffs when player dismounted'),
('42994','-42993','0','Switch brewfest speed buffs'),
('42994','-42992','0','Switch brewfest speed buffs'),
('42994','-43310','0','Switch brewfest speed buffs'),
('42994','-43332','0','Switch brewfest speed buffs'),
('42993','-42994','0','Switch brewfest speed buffs'),
('42993','-42992','0','Switch brewfest speed buffs'),
('42993','-43310','0','Switch brewfest speed buffs'),
('42993','-43332','0','Switch brewfest speed buffs'),
('42992','-42993','0','Switch brewfest speed buffs'),
('42992','-42994','0','Switch brewfest speed buffs'),
('42992','-43310','0','Switch brewfest speed buffs'),
('42992','-43332','0','Switch brewfest speed buffs'),
('43310','-42993','0','Switch brewfest speed buffs'),
('43310','-42992','0','Switch brewfest speed buffs'),
('43310','-42994','0','Switch brewfest speed buffs'),
('43310','-43332','0','Switch brewfest speed buffs'),
('43332','-42993','0','Switch brewfest speed buffs'),
('43332','-42992','0','Switch brewfest speed buffs'),
('43332','-43310','0','Switch brewfest speed buffs'),
('43332','-42994','0','Switch brewfest speed buffs'),    
('-43332','43310','0','Switch brewfest speed buffs');

DELETE FROM `spell_script_names` WHERE `ScriptName` = 'spell_brewfest_speed';
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES 
('43332','spell_brewfest_speed'),
('43310','spell_brewfest_speed'),
('42992','spell_brewfest_speed'),
('42993','spell_brewfest_speed'),
('42994','spell_brewfest_speed');

UPDATE `item_template` SET `Duration`='240' WHERE (`entry`='33797');
UPDATE `creature_template` SET `scale`='0.01',`flags_extra`='0',`ScriptName`='npc_brewfest_apple_trigger' WHERE (`entry`='24337');
UPDATE `creature_template` SET `flags_extra`='0',`ScriptName`='npc_brewfest_keg_thrower' WHERE (`entry`='24364');
UPDATE `creature_template` SET `flags_extra`='0',`ScriptName`='npc_brewfest_keg_thrower' WHERE (`entry`='24527');
UPDATE `creature_template` SET `flags_extra`='0',`ScriptName`='npc_brewfest_keg_receiver' WHERE (`entry`='24468');
UPDATE `creature_template` SET `flags_extra`='0',`ScriptName`='npc_brewfest_keg_receiver' WHERE (`entry`='24510');
UPDATE `creature_template` SET `flags_extra`='0',`ScriptName`='npc_brewfest_ram_master' WHERE (`entry`='23558');
UPDATE `creature_template` SET `flags_extra`='0',`ScriptName`='npc_brewfest_ram_master' WHERE (`entry`='24497');

DELETE FROM `creature` WHERE `id` IN (24364,24527,24337);
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) 
VALUES 
('24364','0','1','1','0','0','-5608.76','-460.569','403.345','5.74527','300','0','0','1003','0','0'),
('24527','1','1','1','0','0','856.609','-4497.95','6.43272','0.0600562','300','0','0','1003','0','0');
INSERT INTO `creature` 
(`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`curhealth`)
VALUES 
(24337, 0, 1, 1, '-5667.41', '-476.651', '396.275', '-2.00713', 180, 42),
(24337, 0, 1, 1, '-5355.3', '-527.423', '391.493', '-2.3911', 180, 42),
(24337, 0, 1, 1, '-5189.16', '-482.752', '387.244', '-1.65806', 180, 42),
(24337, 1, 1, 1, '1290.86', '-4433.25', '27.1411', '2.05949', 180, 42),
(24337, 1, 1, 1, '1096.65', '-4427.11', '20.2013', '2.3911', 180, 42),
(24337, 1, 1, 1, '1004.55', '-4479.3', '10.9096', '-0.244346', 180, 42),
(24337, 0, 1, 1, '-5498.16', '-511.732', '397.462', '1.85111', 300, 42);
DELETE FROM `gameobject` WHERE `id` = 186331;
INSERT INTO gameobject
(`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`)
VALUES
(186331, 0, 1, 1, '-5667.41', '-476.651', '396.275', '-2.00713', 0, 0, '0.843391', '-0.5373', 180, 100, 1),
(186331, 0, 1, 1, '-5355.3', '-527.423', '391.493', '-2.3911', 0, 0, '0.930418', '-0.366501', 180, 100, 1),
(186331, 0, 1, 1, '-5189.16', '-482.752', '387.244', '-1.65806', 0, 0, '0.737277', '-0.67559', 180, 100, 1),
(186331, 1, 1, 1, '1290.86', '-4433.25', '27.1411', '2.05949', 0, 0, '0.857167', '0.515038', 180, 100, 1),
(186331, 1, 1, 1, '1096.65', '-4427.11', '20.2013', '2.3911', 0, 0, '0.930418', '0.366501', 180, 100, 1),
(186331, 1, 1, 1, '1004.55', '-4479.3', '10.9096', '-0.244346', 0, 0, '0.121869', '-0.992546', 180, 100, 1),
(186331, 0, 1, 1, '-5498.16', '-511.732', '397.462', '1.85111', 0, 0, '0.798954', '0.601392', 300, 0, 1);

UPDATE `item_template` SET `ScriptName`='item_brewfest_ram_reins' WHERE (`entry`='33306');

-- Spell de quest faltante Rental Racing Ram al tomar la quest para quedar montado
UPDATE `quest_template` SET `SrcSpell`=43883 WHERE `entry` IN (11293,11294,11407,11408,11409,11122,11412);

-- Cambio de Modelo(Uno invisible) y asociacion de script al npc Barker Bunny
UPDATE `creature_template` SET `modelid1`=11686, `ScriptName`='npc_brewfest_trigger' WHERE `entry`=24202;
UPDATE `creature_template` SET `modelid1`=11686, `ScriptName`='npc_brewfest_trigger' WHERE `entry`=24203;
UPDATE `creature_template` SET `modelid1`=11686, `ScriptName`='npc_brewfest_trigger' WHERE `entry`=24204;
UPDATE `creature_template` SET `modelid1`=11686, `ScriptName`='npc_brewfest_trigger' WHERE `entry`=24205;

-- Agrega bunnys para las quest de Barker
SET @GUID := 2420200;
DELETE FROM `creature` WHERE `guid` IN (@GUID,@GUID+1,@GUID+2,@GUID+3,@GUID+4,@GUID+5,@GUID+6,@GUID+7);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES
(@GUID,24202,0,1,1,0,0,-4912.327148,-948.907410,501.493164,5.5,600,0,0,1,0,0),
(@GUID+1,24203,0,1,1,0,0,-4969.666016,-1208.679565,501.77864,3.8,600,0,0,1,0,0),
(@GUID+2,24204,0,1,1,0,0,-4690.384766,-1235.180908,501.659607,2.3,600,0,0,1,0,0),
(@GUID+3,24205,0,1,1,0,0,-4661.659668,-955.10980,500.377472,3.8,600,0,0,1,0,0),
(@GUID+4,24202,1,1,1,0,0,1647.637939,-4409.758789,17.244448,5.06,600,0,0,1,0,0),
(@GUID+5,24203,1,1,1,0,0,1947.653931,-4686.246094,25.314669,4.2,600,0,0,1,0,0),
(@GUID+6,24204,1,1,1,0,0,1932.215698,-4298.459473,24.518383,4.99,600,0,0,1,0,0),
(@GUID+7,24205,1,1,1,0,0,1578.210327,-4199.839355,41.619968,5.1,600,0,0,1,0,0);
DELETE FROM `game_event_creature` WHERE `guid` IN (@GUID,@GUID+1,@GUID+2,@GUID+3,@GUID+4,@GUID+5,@GUID+6,@GUID+7);
INSERT INTO `game_event_creature` (`eventEntry`,`guid`) VALUES
(24, @GUID),
(24, @GUID+1),
(24, @GUID+2),
(24, @GUID+3),
(24, @GUID+4),
(24, @GUID+5),
(24, @GUID+6),
(24, @GUID+7);

-- Agrega Dark Iron Mole Machine Wreckage (Noblizzlike pero da una daily)
SET @GUID := 189989;
DELETE FROM `gameobject` WHERE `guid` IN (@GUID,@GUID+1);
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@GUID,189989,0,1,1,-5154.36,-609.284,398.452,2.13369,0,0,0.875682,0.482887,300,0,1),
(@GUID+1,189990,1,1,1,1198.66,-4297.37,21.3811,4.92821,0,0,0.626838,-0.77915,300,0,1);
DELETE FROM `game_event_gameobject` WHERE `guid` IN (@GUID,@GUID+1);
INSERT INTO `game_event_gameobject` (`eventEntry`,`guid`) VALUES
(24, @GUID),
(24, @GUID+1);
DELETE FROM `gameobject_questrelation` WHERE `quest` IN (12020,12192);
INSERT INTO `gameobject_questrelation` (`id`,`quest`) VALUES
(189989,12020),
(189990,12192);
 
-- Borrado de Dark Iron Plans (Quest removida)
DELETE FROM `gameobject` WHERE `guid` IN (11140);
DELETE FROM `gameobject` WHERE `guid` IN (18015);

-- respawn Core Direbrew
UPDATE `creature` SET `spawntimesecs` = 604800 WHERE `id`  = 23972;

-- Posible Fix Reward DF Core Direbrew
DELETE FROM `instance_encounters` WHERE `entry` IN (895,900);
INSERT INTO `instance_encounters` (`entry`, `creditType`, `creditEntry`, `lastEncounterDungeon`, `comment`) 
VALUES('895','0','23872','287','Coren Direbrew');

-- Quest 12491 y 12492 no tienen prerequisito en el 2010
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE `entry`IN (12491,12492);

-- Fix Vendedores Blix Fixwidget y Ray'ma Horda
-- Fix Vendedores Belbi Quikswitch y Larkin Thunderbrew Alianza
DELETE FROM `npc_vendor` WHERE `entry` IN (24495,27489,23710,27478);
INSERT INTO `npc_vendor` (`entry`,`slot`,`item`,`ExtendedCost`) VALUES
(24495,1,33968,2274),
(24495,11,34008,2275),
(24495,12,39477,2424),
(24495,13,46707,2275),
(24495,14,33927,2275),
(24495,15,37750,2398),
(24495,16,37816,2399),
-- (24495,17,32233,0), Only appears on EU realms
(24495,2,33864,2274),
(24495,3,33967,2274),
(24495,4,33969,2274),
(24495,5,33863,2276),
(24495,6,33966,2275),
(24495,7,33862,2276),
(24495,8,33868,2275),
(24495,9,37599,2276),
(27489,1,33968,2274),
(27489,11,34008,2275),
(27489,12,39477,2424),
(27489,13,46707,2275),
(27489,14,33927,2275),
(27489,15,37750,2398),
(27489,16,37816,2399),
-- (27489,17,32233,0), Only appears on EU realms
(27489,2,33864,2274),
(27489,3,33967,2274),
(27489,4,33969,2274),
(27489,5,33863,2276),
(27489,6,33966,2275),
(27489,7,33862,2276),
(27489,8,33868,2275),
(27489,9,37599,2276),
(23710,1,33968,2274),
(23710,11,33047,2275),
(23710,12,39476,2424),
(23710,13,46707,2275),
(23710,14,33927,2275),
(23710,15,37750,2398),
(23710,16,37816,2399),
-- (23710,17,32233,0), Only appears on EU realms
(23710,2,33864,2274),
(23710,3,33967,2274),
(23710,4,33969,2274),
(23710,5,33863,2276),
(23710,6,33966,2275),
(23710,7,33862,2276),
(23710,8,33868,2275),
(23710,9,37736,2276),
(27478,1,33968,2274),
(27478,11,33047,2275),
(27478,12,39476,2424),
(27478,13,46707,2275),
(27478,14,33927,2275),
(27478,15,37750,2398),
(27478,16,37816,2399),
-- (27478,17,32233,0), Only appears on EU realms
(27478,2,33864,2274),
(27478,3,33967,2274),
(27478,4,33969,2274),
(27478,5,33863,2276),
(27478,6,33966,2275),
(27478,7,33862,2276),
(27478,8,33868,2275),
(27478,9,37736,2276);

-- Add la quest Catch the Wild Wolpertinger! al Npc Horda
-- Fix Quest Say, There Wouldn't Happen to be a Souvenir This Year, Would There? Alianza
-- Delete Quest A Visit To The Wonderworks from Pol Amberstill
DELETE FROM `creature_involvedrelation` WHERE `quest` IN (11431, 12193);
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES
(24657, 11431),
(23710, 12193);
DELETE FROM `creature_questrelation` WHERE `quest` IN (11431,13938);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES
(24657, 11431);

-- Add Larkin Thunderbrew and Ray'ma
SET @GUID := 2420210;
DELETE FROM `creature` WHERE `guid` IN (@GUID,@GUID+1);
INSERT INTO `creature` 
(`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES
(@GUID,27478,0,1,1,0,356,-4849.77,-862.706,501.914,4.82484,300,0,0,2215,0,0),
(@GUID+1,27489,1,1,1,0,0,1473.62,-4207.1,43.1863,4.42707,300,0,0,2215,0,0);
DELETE FROM `game_event_creature` WHERE `guid` IN (@GUID,@GUID+1);
INSERT INTO `game_event_creature` (`eventEntry`,`guid`) VALUES
(24, @GUID),
(24, @GUID+1);


/*Dark Iron Attack
 
They come every 30 minutes for 5 minutes.
1) During that time you should drink the freeze booze on the table (at least 1) while aiming at a Dark Dwarf. You'll throw the mug at them, and an NPC will throw you a new mug.
2) Map this to a key and spam it while turning left and right.
3) If they destroy all the kegs, you will not be able to loot the gear.
4) You can loot the gear once every 12 hours.
5) The gear will be available from :05 to :20 and :35 to :50 (eg 1:05 is when they stop attacking, it'll be there for 15 minutes)
6) This is worth 10 tokens
7) The "whirlwind" effect is picked up from big mugs that randomly appear on the ground
8) Stand on tables and you're less likely to be hit by a DD (serious knockback)
 
23808 - [DND] Brewfest Keg Move to Target
24766 - [DND] Brewfest Face Me Bunny
24109 - [DND] Brewfest Target Dummy Move To Target
23894 - [DND] Brewfest Dark Iron Spawn Bunny
23703 - [DND] Brewfest Dark Iron Event Generator
 
188508 - Dark Iron Mole Machine (Minion Summoner)
 
42676 - Holiday - Brewfest - Dark Iron Knockback Aura
 
 
SCRIPT SUMMARY
1. The Event Generator will run a script on GUID. They are invisible and ALWAYS spawned.
2. When it runs a script in Dun Morogh it means that it will summon the Spawn Bunnies only at Dun Morogh, and the Spawn Bunnies will summon the Dwarfs at THEIR position, which means they are always at the correct place.
3. The Dark Iron Guzzlers are scripted in C++. On spawn they will cast 43668 which has a spellscript. It basically checks if the Dark Iron Guzzler is in Dun Morogh or Durotar.
4. When the Dark Iron Guzzler spawns in Dun Morogh it will target different Keg Creatures than when it's spawned in Durotar, therefore it's done in C++ with a spellscript.
 
        FESTIVE KEG SPAWNS
HORDE
Gordok                  1222.903 -4296.746 21.27534
Ti'chali's              1182.845 -4273.276 21.27497
Drohn's                 1184.316 -4314.621 21.37921
 
ALLIANCE
Gordok                  -5146.527 -576.4496 397.2595
Barleybrew              -5185.96436 -599.7956 396.472931
Thunderbrew             -5159.86572 -631.8079 397.263
 
 
Full horde video        http://www.wegame.com/watch/world-of-warcraft-brewfest-dailies-part-1-horde-dark-iron-attack-part-3/
Proof of despawn        http://www.wegame.com/watch/brewfest-after-a-dark-iron-dwarf-attack/
 
*/
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Misc.
DELETE FROM `gameobject` WHERE `id`=186881; -- Dark Iron Dwarf Plans should be summoned by event
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|128 WHERE `entry`=24109; -- [DND] Brewfest Target Dummy Move To Target
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|256 WHERE `entry`=23706; -- Gordok Festive Keg
UPDATE `creature_model_info` SET `bounding_radius`=0.9,`combat_reach`=1.8,`gender`=2 WHERE `modelid`=24860; -- Gordok Festive Keg
UPDATE `creature_template_addon` SET `bytes1`=0,`bytes2`=1,`mount`=0,`emote`=0,`auras`=NULL WHERE `entry`=23706; -- Gordok Festive Keg
 
-- Brewfest - Attack Keg can only target kegs
DELETE FROM `conditions` WHERE `SourceEntry` IN (42393) AND `ConditionValue2` IN (23702,23700,23706,24373,24372);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,42393,0,18,1,23702,0,0,'',"Spell Brewfest - Attack Keg can only be cast at Thunderbrew Festive Keg"),
(13,0,42393,0,18,1,23700,0,0,'',"Spell Brewfest - Attack Keg can only be cast at Barleybrew Festive Keg"),
(13,0,42393,0,18,1,23706,0,0,'',"Spell Brewfest - Attack Keg can only be cast at Gordok Festive Keg"),
(13,0,42393,0,18,1,24373,0,0,'',"Spell Brewfest - Attack Keg can only be cast at T'chalis's Festive Keg"),
(13,0,42393,0,18,1,24372,0,0,'',"Spell Brewfest - Attack Keg can only be cast at Drohn's Festive Keg");
 
-- Holiday - Brewfest - Dark Iron - Get Region - Spawn
DELETE FROM `spell_script_names` WHERE `spell_id`=43668;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(43668,'spell_gen_dark_iron_dwarf_spawn');
 
-- Holiday - Brewfest - Dark Iron Knockback Target Test
DELETE FROM `spell_script_names` WHERE `spell_id`=42674;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(42674,'spell_gen_dark_iron_knockback_test');
 
-- Brewfest - Dark Iron Knockback
DELETE FROM `conditions` WHERE `SourceEntry`=42299 AND `ConditionValue2`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,42299,0,18,1,0,0,0,'',"Spell Brewfest - Dark Iron Knockback can only be cast at players");
 
-- Spawn [DND] Brewfest Dark Iron Event Generator and Dark Iron Herald
DELETE FROM `creature` WHERE `id` IN (23703,24536) AND `guid` IN (1045953,1045954,1045955,1045956);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(1045953,23703,0,1,1,0,0,-5152.3,-603.529,398.356,2.50732,300,0,0,37800,0,0,0,0,0),
(1045955,24536,0,1,1,0,0,-5152.3,-603.529,398.356,2.50732,300,0,0,37800,0,0,0,0,0),
(1045956,23703,0,1,1,0,0,1197.6,-4293.571,21.243,5.20232,300,0,0,37800,0,0,0,0,0),
(1045954,24536,0,1,1,0,0,1197.6,-4293.571,21.243,5.20232,300,0,0,37800,0,0,0,0,0);
 
-- Fix the equipment templates of the brewers
DELETE FROM `creature_equip_template` WHERE `entry`=2478;
INSERT INTO `creature_equip_template` (`entry`,`itemEntry1`,`itemEntry2`,`itemEntry3`) VALUES
(2478,33161,33161,0);
 
-- Update the templates
UPDATE `creature_template` SET `equipment_id`=2478 WHERE `entry` IN (23684,23683,23685,24493,24492);
 
-- Make the Event Generator spawns only spawn if Brewfest is active
DELETE FROM `game_event_creature` WHERE `eventEntry`=24 AND `guid` IN (1045953,1045954,1045955,1045956);
INSERT INTO `game_event_creature` (`eventEntry`,`guid`) VALUES
(24,1045953),(24,1045955),(24,1045954),(24,1045956);
 
-- Add aura 'Brewfest - Dark Iron Attack - Keg Marker' to Thunderbrew/Barleybrew/Gordok/T'chalis's/Drohn's Festive Keg
DELETE FROM `creature_template_addon` WHERE `entry` IN (23702,23700,23706,24373,24372);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(23702,0,0,0,0,'42761'),(23700,0,0,0,0,'42761'),(23706,0,0,0,0,'42761'),
(24373,0,0,0,0,'42761'),(24372,0,0,0,0,'42761');
 
-- Add Dark Iron Guzzler's equipment template (taken from sniff)
DELETE FROM `creature_equip_template` WHERE `entry`=2477 AND `itemEntry1`=33125;
INSERT INTO `creature_equip_template` (`entry`,`itemEntry1`,`itemEntry2`,`itemEntry3`) VALUES
(2477,33125,0,0);
 
-- Add aura 'Holiday - Brewfest - Dark Iron Knockback Target Test' and 'Holiday - Brewfest - Dark Iron - Get Region - Spawn' to Dark Iron Guzzler
DELETE FROM `creature_template_addon` WHERE `entry`=23709;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(23709,0,0,0,0,'42676 43668');
 
-- Drunken Master & Dark Iron Retreat
DELETE FROM `conditions` WHERE `SourceEntry` IN (42695,42794,42341) AND `ConditionValue2` IN (23709);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,42695,0,18,1,23709,0,0,'',"Spell Holiday - Brewfest - Dark Iron Knock-down Power-up can only be cast at Dark Iron Guzzler"),
(13,0,42794,0,18,1,23709,0,0,'',"Spell Holiday - Brewfest - Random Mug Fling can only be cast at Dark Iron Guzzler"),
(13,0,42341,0,18,1,23709,0,0,'',"Spell Dark Iron Retreat can only be cast at Dark Iron Guzzler");
 
-- Insert missing object template for spell Drunken Master's - it's a trap and these do not come from sniffs, so WDBVerified on 1
DELETE FROM `gameobject_template` WHERE `entry`=186471;
INSERT INTO `gameobject_template` (`entry`,`type`,`displayId`,`name`,`IconName`,`castBarCaption`,`unk1`,`faction`,`flags`,`size`,`questItem1`,`questItem2`,`questItem3`,`questItem4`,`questItem5`,`questItem6`,`data0`,`data1`,`data2`,`data3`,`data4`,`data5`,`data6`,`data7`,`data8`,`data9`,`data10`,`data11`,`data12`,`data13`,`data14`,`data15`,`data16`,`data17`,`data18`,`data19`,`data20`,`data21`,`data22`,`data23`,`AIName`,`ScriptName`,`WDBVerified`) VALUES
(186471,6,0,'Super Brew Stein','','','',14,0,3,0,0,0,0,0,0,0,0,5,42696,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',1);
 
-- [Q] [A/H] This One Time, When I Was Drunk...
-- Shouldn't be related to Chug and Chuck at all
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE `entry`=12020;
 
-- Drunken Brewfest Reveler SAI
SET @ENTRY := 23698;
SET @SPELL_VOMIT := 67468;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-88896,-88960);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
-- Alliance
(-88896,0,0,0,1,0,100,0,10000,45000,180000,240000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Drunken Brewfest Reveler - Out of Combat - Say Line 0 (random)"),
(-88896,0,1,0,1,0,100,0,10000,45000,180000,240000,11,@SPELL_VOMIT,2,0,0,0,0,1,0,0,0,0,0,0,0,"Drunken Brewfest Reveler - Out of Combat - Cast Drunken Vomit"),
-- Horde
(-88960,0,0,0,1,0,100,0,10000,45000,180000,240000,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Drunken Brewfest Reveler - Out of Combat - Say Line 1 (random)"),
(-88960,0,1,0,1,0,100,0,10000,45000,180000,240000,11,@SPELL_VOMIT,2,0,0,0,0,1,0,0,0,0,0,0,0,"Drunken Brewfest Reveler - Out of Combat - Cast Drunken Vomit");
-- Text
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`TEXT`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"Uh oh...",12,0,100,0,0,0,"Drunken Brewfest Reveler"),
(@ENTRY,0,1,"Good times! <hic>",12,0,100,0,0,0,"Drunken Brewfest Reveler"),
(@ENTRY,0,2,"What's all the fuss about here?",12,0,100,0,0,0,"Drunken Brewfest Reveler"),
(@ENTRY,0,3,"The besht part about drinking is pretending to be drunk... I'm jusht pretending guys.",12,0,100,0,0,0,"Drunken Brewfest Reveler"),
(@ENTRY,0,4,"Hey fellas! How's it going?",12,0,100,0,0,0,"Drunken Brewfest Reveler"),
(@ENTRY,0,5,"Hey! Anyone shee that cute blond dwarf? I shwear they were jusht here...",12,0,100,0,0,0,"Drunken Brewfest Reveler"),
(@ENTRY,0,6,"Hey! Lishten up! I've got... I have something important to talk about! Shee... Wait... What wash I shaying? Something aboutsh boats and floating... Yeah! Sho don't float on a boat... Thank you...",12,0,100,0,0,0,"Drunken Brewfest Reveler"),
 
(@ENTRY,1,0,"Uh oh...",12,0,100,0,0,0,"Drunken Brewfest Reveler"),
(@ENTRY,1,1,"Good times! <hic>",12,0,100,0,0,0,"Drunken Brewfest Reveler"),
(@ENTRY,1,2,"What's all the fuss about here?",12,0,100,0,0,0,"Drunken Brewfest Reveler"),
(@ENTRY,1,3,"The besht part about drinking is pretending to be drunk... I'm jusht pretending guys.",12,0,100,0,0,0,"Drunken Brewfest Reveler"),
(@ENTRY,1,4,"You guys have gotta try thish...",12,0,100,0,0,0,"Drunken Brewfest Reveler"),
(@ENTRY,1,5,"Hey! You for the Horde? <hic> I'm for the Horde!",12,0,100,0,0,0,"Drunken Brewfest Reveler");
 
-- [DND] Brewfest Dark Iron Event Generator SAI
SET @ENTRY := 23703;
SET @SPELL_RETREAT := 42341;
UPDATE `creature_template` SET `AIName`='SmartAI',`flags_extra`=`flags_extra`|128 WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-1045953,-1045954,@ENTRY*100,@ENTRY*100+1);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
-- DUN MOROGH
(-1045953,0,0,1,1,0,100,0,10000,10000,1800000,1800000,80,@ENTRY*100,0,2,0,0,0,1,0,0,0,0,0,0,0,"[DND] Brewfest Dark Iron Event Generator - Out of Combat - Run Script"),
(-1045953,0,1,0,61,0,100,0,0,0,0,0,45,6,6,0,0,0,0,10,1045955,24536,0,0,0,0,0,"[DND] Brewfest Dark Iron Event Generator - Out of Combat - Set Data Dark Iron Herald"),
(-1045953,0,2,3,38,0,100,0,5,5,0,0,11,@SPELL_RETREAT,0,0,0,0,0,11,23709,100,0,0,0,0,0,"[DND] Brewfest Dark Iron Event Generator - On Data Set 5 5 - Cast Brewfest Retreat"),
(-1045953,0,3,0,61,0,100,0,0,0,0,0,41,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,"[DND] Brewfest Dark Iron Event Generator - On Data Set 5 5 - Despawn"),
(@ENTRY*100,9,1,0,0,0,100,0,10000,10000,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5168.79,-597.261,398.101,3.85,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn [DND] Brewfest Dark Iron Spawn Bunny"), -- Time this to give the Brewfest Revelers some time to run away
(@ENTRY*100,9,2,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5154.99,-589.22,397.346,3.85,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,3,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5168.34,-585.515,397.688,3.85,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,4,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5160.86,-606.37,398.063,3.85,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,5,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5163.08,-592.054,398.022,3.85,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,6,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5160.24,-579.148,397.18,3.85,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,7,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5172.88,-576.9,397.339,3.85,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,8,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5180.1,-583.465,397.775,3.85,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,9,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5176.84,-592.674,397.622,3.85,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,10,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5172.06,-606.161,397.352,3.85,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,11,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5162.5,-614.447,397.741,3.85,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,12,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5153.05,-618.085,398.125,3.85,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,13,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5148.92,-607.028,398.537,3.85,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,14,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5155.28,-598.89,398.092,3.85,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,15,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5146.97,-591.708,397.372,3.85,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,16,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5136.8,-598.046,397.426,3.85,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,17,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5162.125000,-599.126953,398.169250,3.85,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,18,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5155.227051,-611.064087,398.384796,5.58,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,19,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5172.685547,-617.705200,397.190582,0.80,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,20,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5165.557129,-602.531067,397.959229,2.48,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,21,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5162.540039,-596.897278,398.152252,5.58,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,22,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5171.027832,-590.153503,397.964874,0.80,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,23,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5177.630371,-600.892029,397.344421,2.48,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,24,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5175.105957,-585.409302,397.801575,5.58,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,25,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5160.901367,-585.973755,397.494049,0.80,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,26,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5149.727051,-598.186523,398.000702,2.48,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,27,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5140.413574,-606.157715,398.110840,0.80,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,28,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5148.443359,-613.181458,398.464478,3.85,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,29,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5139.434570,-612.224487,398.017578,5.58,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,30,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5160.227051,-622.226868,397.487183,2.53,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,31,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5165.484863,-608.644226,397.621552,3.85,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,32,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5154.422852,-605.168152,398.364655,1.23,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,33,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5156.091309,-594.039612,397.730194,0.32,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,34,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5151.526855,-593.310730,397.529968,0.32,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,35,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5143.669922,-603.026917,398.192719,0.80,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,36,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5142.348633,-595.296265,397.526245,3.32,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,37,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5154.107910,-582.890503,397.179108,6.32,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,38,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5166.127930,-578.236206,397.194489,4.12,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,39,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5182.114746,-589.290283,397.433838,3.21,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,40,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5173.672363,-598.698364,397.764160,5.21,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,41,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5170.576660,-612.272156,397.254028,1.12,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,42,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5157.810059,-615.534058,398.061340,3.21,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,43,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5170.45,-619.995,397.201,5.03293,"[DND] Brewfest Dark Iron Event Generator,- On Script,- Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,44,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5178.76,-596.961,397.377,1.7539,"[DND] Brewfest Dark Iron Event Generator,- On Script,- Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,45,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5156.98,-580.003,397.177,0.120272,"[DND] Brewfest Dark Iron Event Generator,- On Script,- Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,46,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5179.38,-586.717,397.709,4.49259,"[DND] Brewfest Dark Iron Event Generator,- On Script,- Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,47,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5165.36,-587.727,397.835,1.67301,"[DND] Brewfest Dark Iron Event Generator,- On Script,- Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,48,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5153.73,-615.453,398.279,0.856196,"[DND] Brewfest Dark Iron Event Generator,- On Script,- Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,49,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5152.15,-595.603,397.77,4.901,"[DND] Brewfest Dark Iron Event Generator,- On Script,- Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,50,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5162.17,-574.909,397.177,5.99506,"[DND] Brewfest Dark Iron Event Generator,- On Script,- Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,51,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5168.06,-574.334,397.179,4.72586,"[DND] Brewfest Dark Iron Event Generator,- On Script,- Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,52,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5175.6,-580.338,397.672,1.99189,"[DND] Brewfest Dark Iron Event Generator,- On Script,- Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,53,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5173.89,-589.037,397.868,2.61942,"[DND] Brewfest Dark Iron Event Generator,- On Script,- Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,54,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5174.16,-610.4,397.19,1.88822,"[DND] Brewfest Dark Iron Event Generator,- On Script,- Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,55,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5168.59,-608.303,397.421,3.79124,"[DND] Brewfest Dark Iron Event Generator,- On Script,- Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,56,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5139.81,-601.143,397.845,5.16019,"[DND] Brewfest Dark Iron Event Generator,- On Script,- Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,57,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5148.49,-602.523,398.322,5.16019,"[DND] Brewfest Dark Iron Event Generator,- On Script,- Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,58,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5150.64,-587.595,397.217,5.8317,"[DND] Brewfest Dark Iron Event Generator,- On Script,- Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,59,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5164.38,-582.486,397.347,5.68012,"[DND] Brewfest Dark Iron Event Generator,- On Script,- Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,60,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5170.38,-581.177,397.41,1.41776,"[DND] Brewfest Dark Iron Event Generator,- On Script,- Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
(@ENTRY*100,9,61,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5172.32,-594.611,397.974,1.78454,"[DND] Brewfest Dark Iron Event Generator,- On Script,- Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
 
(@ENTRY*100,9,62,0,0,0,100,0,0,0,0,0,12,23702,1,300000000,0,0,0,8,0,0,0,-5159.85,-632.055,397.179,1.46772,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn Thunderbrew Festive Keg"),
(@ENTRY*100,9,63,0,0,0,100,0,0,0,0,0,12,23706,1,300000000,0,0,0,8,0,0,0,-5146.283691,-576.265930,397.176514,0.09009,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn Gordok Festive Keg"),
(@ENTRY*100,9,64,0,0,0,100,0,0,0,0,0,12,23700,1,300000000,0,0,0,8,0,0,0,-5186.539551,-599.753662,397.176453,0.024872,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn Barleybrew Festive Keg"),
 
(@ENTRY*100,9,65,0,0,0,100,0,0,0,0,0,45,1,1,0,0,0,0,11,24484,100,0,0,0,0,0,"[DND] Brewfest Dark Iron Event Generator - On Script - Set Data Brewfest Reveler"); -- Make them flee
 
/*(@ENTRY*100,9,66,0,0,0,100,0,59000,79000,90000,90000,45,2,2,0,0,0,0,11,23685,50,0,0,0,0,0,"[DND] Brewfest Dark Iron Event Generator - On Script - Set Data Gordok Brew Barker"),
(@ENTRY*100,9,67,0,0,0,100,0,10000,29000,90000,90000,45,3,3,0,0,0,0,11,23683,50,0,0,0,0,0,"[DND] Brewfest Dark Iron Event Generator - On Script - Set Data Maeve Barleybrew"),
(@ENTRY*100,9,68,0,0,0,100,0,3000,11000,90000,90000,45,4,4,0,0,0,0,11,23684,50,0,0,0,0,0,"[DND] Brewfest Dark Iron Event Generator - On Script - Set Data Ita Thunderbrew");*/
 
 
 
 
 
-- DUROTAR
/*(-1045954,0,0,0,1,0,100,0,10000,10000,1800000,1800000,80,@ENTRY*100+1,0,2,0,0,0,1,0,0,0,0,0,0,0,"[DND] Brewfest Dark Iron Event Generator - Out of Combat - Run Script"),
(-1045954,0,1,2,38,0,100,0,5,5,0,0,11,@SPELL_RETREAT,0,0,0,0,0,11,23709,100,0,0,0,0,0,"[DND] Brewfest Dark Iron Event Generator - On Data Set 5 5 - Cast Brewfest Retreat"),
(-1045954,0,2,0,61,0,100,0,0,0,0,0,45,6,6,0,0,0,0,19,24536,100,0,0,0,0,0,"[DND] Brewfest Dark Iron Event Generator - On Data Set 5 5 - Set Data Dark Iron Herald"),
(@ENTRY*100+1,9,0,0,0,0,100,0,10000,10000,0,0,12,24536,1,300000000,0,0,0,1,0,0,0,0,0,0,0,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn Dark Iron Herald"), -- Time this to give the Brewfest Revelers some time to run away
(@ENTRY*100+1,9,1,0,0,0,100,0,0,0,0,0,12,23894,1,300000000,0,0,0,8,0,0,0,-5154.99,-589.22,397.346,3.85,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn [DND] Brewfest Dark Iron Spawn Bunny"),
 
(@ENTRY*100+1,9,43,0,0,0,100,0,0,0,0,0,12,23702,1,300000000,0,0,0,8,0,0,0,-5159.86572 -631.8079 397.263,1.46772,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn Thunderbrew Festive Keg"),
(@ENTRY*100+1,9,44,0,0,0,100,0,0,0,0,0,12,23706,1,300000000,0,0,0,8,0,0,0,-5146.527 -576.4496 397.2595,0.09009,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn Gordok Festive Keg"),
(@ENTRY*100+1,9,45,0,0,0,100,0,0,0,0,0,12,23700,1,300000000,0,0,0,8,0,0,0,-5185.96436 -599.7956 396.472931,0.024872,"[DND] Brewfest Dark Iron Event Generator - On Script - Spawn Barleybrew Festive Keg"),
 
(@ENTRY*100+1,9,46,0,0,0,100,0,0,0,0,0,45,2,2,0,0,0,0,11,24484,70,0,0,0,0,0,"[DND] Brewfest Dark Iron Event Generator - On Script - Set Data Brewfest Reveler"),
 
(@ENTRY*100+1,9,47,0,0,0,100,0,59000,79000,90000,90000,45,2,2,0,0,0,0,11,23685,70,0,0,0,0,0,"[DND] Brewfest Dark Iron Event Generator - On Script - Set Data Gordok Brew Barker"),
(@ENTRY*100+1,9,48,0,0,0,100,0,10000,29000,90000,90000,45,3,3,0,0,0,0,11,24492,70,0,0,0,0,0,"[DND] Brewfest Dark Iron Event Generator - On Script - Set Data Drohn's Distillery Barker"),
(@ENTRY*100+1,9,49,0,0,0,100,0,3000,11000,90000,90000,45,4,4,0,0,0,0,11,24493,70,0,0,0,0,0,"[DND] Brewfest Dark Iron Event Generator - On Script - Set Data T'chalis's Voodoo Brewewry Barket");*/
 
 
 
 
 
 
 
 
 
 
 
-- [DND] Brewfest Dark Iron Spawn Bunny SAI
SET @ENTRY := 23894;
SET @SPELL_MOLE_MACHINE_SPAWN := 73071;
SET @SPELL_GROUND_SHAKE := 44210;
UPDATE `creature_template` SET `AIName`='SmartAI',`flags_extra`=`flags_extra`|128 WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY,@ENTRY*100);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,1,0,100,1,5000,285000,270000,270000,11,@SPELL_MOLE_MACHINE_SPAWN,2,0,0,0,0,1,0,0,0,0,0,0,0,"[DND] Brewfest Dark Iron Spawn Bunny - Out of Combat - Cast Mole Machine Spawn"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,80,@ENTRY*100,0,2,0,0,0,1,0,0,0,0,0,0,0,"[DND] Brewfest Dark Iron Spawn Bunny - On Mole Machine Spawn - Run Script"),
(@ENTRY*100,9,0,0,0,0,100,0,5000,5000,0,0,12,23709,1,300000000,0,0,0,1,0,0,0,0,0,0,3.85,"[DND] Brewfest Dark Iron Spawn Bunny - On Script - Spawn Dark Iron Guzzler"),
(@ENTRY*100,9,1,0,0,0,100,0,4000,4000,0,0,12,23709,1,300000000,0,0,0,1,0,0,0,0,0,0,5.58,"[DND] Brewfest Dark Iron Spawn Bunny - On Script - Spawn Dark Iron Guzzler"),
(@ENTRY*100,9,2,0,0,0,100,0,3000,3000,0,0,12,23709,1,300000000,0,0,0,1,0,0,0,0,0,0,0.80,"[DND] Brewfest Dark Iron Spawn Bunny - On Script - Spawn Dark Iron Guzzler"),
(@ENTRY*100,9,3,0,0,0,100,0,2000,2000,0,0,12,23709,1,300000000,0,0,0,1,0,0,0,0,0,0,2.48,"[DND] Brewfest Dark Iron Spawn Bunny - On Script - Spawn Dark Iron Guzzler");
 
 
 
 
-- DOE MET FUCKING DATA SET DIE KEGS DESPAWNEN KGO
 
 
 
-- Dark Iron Herald SAI
-- We are making him invisible (model 16925) at all times because else we can not run the event properly (since we spawned it).
SET @ENTRY := 24536;
SET @SPELL_PLANS_A := 48145;
SET @SPELL_PLANS_H := 49318;
UPDATE `creature_template` SET `AIName`='SmartAI',`modelid1`=16925 WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY,@ENTRY*100);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,1,16000,16000,20000,20000,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"Dark Iron Herald - On Spawn - Yell Line 0"),
(@ENTRY,0,1,0,1,0,100,0,20000,45000,60000,90000,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,"Dark Iron Herald - Out of Combat - Say Line 1 (random)"),
(@ENTRY,0,2,3,1,0,100,1,295000,295000,300000,300000,45,5,5,0,0,0,0,10,1045953,23703,0,0,0,0,0,"Dark Iron Herald - Out of Combat - Set Data Dark Iron Event Generator"), -- 4.9 minutes passed, retreat
(@ENTRY,0,3,4,61,0,100,0,0,0,0,0,80,@ENTRY*100,0,2,0,0,0,1,0,0,0,0,0,0,0,"Dark Iron Herald - Out of Combat - Run Script"),
(@ENTRY,0,4,0,61,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dark Iron Herald - Out of Combat - Set Phase 1"), -- We should stop talking, so set phase 1
(@ENTRY*100,9,0,0,0,0,100,0,0,0,0,0,2,2,0,0,0,0,1,0,0,0,0,0,0,0,0,"Dark Iron Herald - On Script - Yell Line 2"),
(@ENTRY*100,9,1,0,0,0,100,0,0,0,0,0,41,7000,0,0,0,0,1,0,0,0,0,0,0,0,0,"Dark Iron Herald - On Script - Despawn"),
(@ENTRY*100,9,2,0,0,0,100,0,0,0,0,0,45,5,5,0,0,0,11,23702,100,0,0,0,0,0,0,"Dark Iron Herald - On Script - Set Data Thunderbrew Festive Keg"),
(@ENTRY*100,9,3,0,0,0,100,0,0,0,0,0,45,5,5,0,0,0,11,23706,100,0,0,0,0,0,0,"Dark Iron Herald - On Script - Set Data Gordok Festive Keg"),
(@ENTRY*100,9,4,0,0,0,100,0,0,0,0,0,45,5,5,0,0,0,11,23700,100,0,0,0,0,0,0,"Dark Iron Herald - On Script - Set Data Barleybrew Festive Keg"),
(@ENTRY*100,9,5,0,0,0,100,0,0,0,0,0,11,@SPELL_PLANS_A,2,0,0,0,0,1,0,0,0,0,0,0,0,"Dark Iron Herald - On Script - Cast Players Won - H - Summon Dark Iron Dwarf Plans");
-- Text
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`TEXT`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"No one expects the Dark Iron dwarves!",14,0,100,0,0,0,"Dark Iron Herald"),
 
(@ENTRY,1,0,"We'll drink yer stout and lager,$BDrain all the pints and kegs!$BWe'll drink and brawl and brawl and drink,$B'til we can't feel our legs!",12,0,100,0,0,0,"Dark Iron Herald"),
(@ENTRY,1,1,"So lift a mug to Coren,$BAnd Hurley Blackbreath too!$BThis drink is weak, without much kick,$BBut oi! At least it's brew!",12,0,100,0,0,0,"Dark Iron Herald"),
(@ENTRY,1,2,"And when the brew's all missin'$BTa Shadowforge we'll hop,$BA bitter toast ta Ragnaros...$B... but bring him not a drop!",12,0,100,0,0,0,"Dark Iron Herald"),
(@ENTRY,1,3,"Oh, we're from Blackrock Mountain,$BWe've come ta drink yer brew!$BDark Iron dwarves, they do not lie,$BAnd so yeh know it's true!",12,0,100,0,0,0,"Dark Iron Herald"),
(@ENTRY,1,4,"Yeh will not try our bitter,$BYeh will not serve our ale!$BBut have Brewfest without our lot?$BJust try it, and ye'll fail!",12,0,100,0,0,0,"Dark Iron Herald"),
 
-- Shauren told me to use 0 because the counter is also bugged on retail atm
(@ENTRY,2,0,"RETREAT! We've taken a beating and had 0 casualties! We can't keep taking these losses! FALL BACK!!",14,0,100,0,0,0,"Dark Iron Herald"),
(@ENTRY,3,0,"We did it boys! Now back to the Grim Guzzler and we'll drink to the 0 that were injured!!",14,0,100,0,0,0,"Dark Iron Herald");
 
 
 
 
 
 
 
 
 
 
 
 
 
-- Dark Iron Guzzler
UPDATE `creature_template` SET `AIName`='',`ScriptName`='npc_dark_iron_guzzler',`equipment_id`=2477,`unit_flags`=33024 WHERE `entry`=23709;
 
-- Text
DELETE FROM `creature_text` WHERE `entry`=23709;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`TEXT`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(23709,0,0,"Did someone say 'Free Brew'?",12,0,100,0,0,0,"Dark Iron Guzzler"),
(23709,0,1,"DRINK! BRAWL! DRINK! BRAWL!",12,0,100,0,0,0,"Dark Iron Guzzler"),
(23709,0,2,"No one expects the Dark Iron Dwarves!",12,0,100,0,0,0,"Dark Iron Guzzler"),
(23709,0,3,"Drink it all boys!",12,0,100,0,0,0,"Dark Iron Guzzler"),
(23709,0,4,"It's not a party without some crashers!",12,0,100,0,0,0,"Dark Iron Guzzler");
 
 
 
/*
me->SetReactState(REACT_PASSIVE);
*/
-- Festive Keg SAI (creatures)
-- The unit_flags are taken from sniffs
SET @ENTRY1 := 23702; -- Thunderbrew Festive Keg
SET @ENTRY2 := 23700; -- Barleybrew Festive Keg
SET @ENTRY3 := 23706; -- Gordok Festive Keg
SET @ENTRY4 := 24373; -- T'chalis's Festive Keg
SET @ENTRY5 := 24372; -- Drohn's Festive Keg
UPDATE `creature_template` SET `AIName`='SmartAI',`unit_flags`=`unit_flags`|256,`RegenHealth`=0 WHERE `entry` IN (@ENTRY1,@ENTRY2,@ENTRY3,@ENTRY4,@ENTRY5);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY1,@ENTRY2,@ENTRY3,@ENTRY4,@ENTRY5);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
-- Thunderbrew Festive Keg
(@ENTRY1,0,0,0,1,0,100,1,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Thunderbrew Festive Keg - Out of Combat - Set React State Passive"),
(@ENTRY1,0,1,0,6,0,100,1,0,0,0,0,45,1,1,0,0,0,0,20,186184,0,0,0,0,0,0,"Thunderbrew Festive Keg - On Death - Set Data Thunderbrew Festive Keg (OBJECT)"),
(@ENTRY1,0,2,0,38,0,100,0,5,5,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Thunderbrew Festive Keg - On Data Set - Forced Despawn"),
(@ENTRY1,0,3,0,6,0,100,1,0,0,0,0,45,10,10,0,0,0,0,11,23709,5,0,0,0,0,0,"Thunderbrew Festive Keg - On Death - Set Data Dark Iron Guzzler"),
-- Barleybrew Festive Keg
(@ENTRY2,0,0,0,1,0,100,1,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Barleybrew Festive Keg - Out of Combat - Set React State Passive"),
(@ENTRY2,0,1,0,6,0,100,1,0,0,0,0,45,1,1,0,0,0,0,20,186189,0,0,0,0,0,0,"Barleybrew Festive Keg - On Death - Set Data Barleybrew Festive Keg (OBJECT)"),
(@ENTRY2,0,2,0,38,0,100,0,5,5,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Barleybrew Festive Keg - On Data Set - Forced Despawn"),
(@ENTRY2,0,3,0,6,0,100,1,0,0,0,0,45,11,11,0,0,0,0,11,23709,5,0,0,0,0,0,"Barleybrew Festive Keg - On Death - Set Data Dark Iron Guzzler"),
-- Gordok Festive Keg
(@ENTRY3,0,0,0,1,0,100,1,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gordok Festive Keg - Out of Combat - Set React State Passive"),
(@ENTRY3,0,1,0,6,0,100,1,0,0,0,0,45,1,1,0,0,0,0,20,186185,0,0,0,0,0,0,"Gordok Festive Keg - On Death - Set Data Gordok Festive Keg (OBJECT)"),
(@ENTRY3,0,2,0,38,0,100,0,5,5,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gordok Festive Keg - On Data Set - Forced Despawn"),
(@ENTRY3,0,3,0,6,0,100,1,0,0,0,0,45,12,12,0,0,0,0,11,23709,5,0,0,0,0,0,"Gordok Festive Keg - On Death - Set Data Dark Iron Guzzler"),
-- T'chalis's Festive Keg
(@ENTRY4,0,0,0,1,0,100,1,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"T'chalis's Festive Keg - Out of Combat - Set React State Passive"),
(@ENTRY4,0,1,0,6,0,100,1,0,0,0,0,45,1,1,0,0,0,0,20,186187,0,0,0,0,0,0,"T'chalis's Festive Keg - On Death - Set Data T'chalis's Festive Keg (OBJECT)"),
(@ENTRY4,0,2,0,38,0,100,0,5,5,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"T'chalis's Festive Keg - On Data Set - Forced Despawn"),
(@ENTRY4,0,3,0,6,0,100,1,0,0,0,0,45,10,10,0,0,0,0,11,23709,5,0,0,0,0,0,"T'chalis's Festive Keg - On Death - Set Data Dark Iron Guzzler"),
-- Drohn's Festive Keg
(@ENTRY5,0,0,0,1,0,100,1,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Drohn's Festive Keg - Out of Combat - Set React State Passive"),
(@ENTRY5,0,1,0,6,0,100,1,0,0,0,0,45,1,1,0,0,0,0,20,186186,0,0,0,0,0,0,"Drohn's Festive Keg - On Death - Set Data Drohn's Festive Keg (OBJECT)"),
(@ENTRY5,0,2,0,38,0,100,0,5,5,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Drohn's Festive Keg - On Data Set - Forced Despawn"),
(@ENTRY5,0,3,0,6,0,100,1,0,0,0,0,45,10,10,0,0,0,0,11,23709,5,0,0,0,0,0,"Drohn's Festive Keg - On Death - Set Data Dark Iron Guzzler");
 
-- Festive Keg SAI (gameobjects)
-- Currently we can not despawn the objects through SAI, misses proper support. I'm still adding it because it might be of use for when this gets fixed
SET @ENTRY1 := 186184;
SET @ENTRY2 := 186189;
SET @ENTRY3 := 186185;
SET @ENTRY4 := 186187;
SET @ENTRY5 := 186186;
UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry` IN (@ENTRY1,@ENTRY2,@ENTRY3,@ENTRY4,@ENTRY5);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY1,@ENTRY2,@ENTRY3,@ENTRY4,@ENTRY5);
INSERT INTO `smart_scripts`(`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY1,1,0,0,38,0,100,0,1,1,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Thunderbrew Festive Keg - On Data Set - Despawn"),
(@ENTRY2,1,0,0,38,0,100,0,1,1,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Barleybrew Festive Keg - On Data Set - Despawn"),
(@ENTRY3,1,0,0,38,0,100,0,1,1,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gordok Festive Keg - On Data Set - Despawn"),
(@ENTRY4,1,0,0,38,0,100,0,1,1,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"T'chalis's Festive Keg - On Data Set - Despawn"),
(@ENTRY5,1,0,0,38,0,100,0,1,1,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Drohn's Festive Keg - On Data Set - Despawn");
 
 
 
 
 
 
 
 
 
 
 
-- Brewfest Reveler SAI
SET @ENTRY := 24484;
SET @SPELL_THROW_MUG := 50696;
SET @SPELL_CREATE_MUG := 42518;
SET @SPELL_TOAST := 41586;
UPDATE `creature_template` SET `AIName`='SmartAI',`ScriptName`='' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY,@ENTRY*100,@ENTRY*100+1); -- We are adding new lines so don't remove complete SAI
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,22,0,100,0,101,5000,5000,0,11,@SPELL_CREATE_MUG,2,0,0,0,0,7,0,0,0,0,0,0,0,"Brewfest Reveler - Emote Receive 'Wave' - Cast Create Complimentary Brewfest Sampler"),
(@ENTRY,0,1,0,22,0,100,0,34,5000,5000,0,11,@SPELL_TOAST,2,0,0,0,0,7,0,0,0,0,0,0,0,"Brewfest Reveler - Emote Receive 'Dance' - Cast Brewfest Toast"),
(@ENTRY,0,2,0,1,0,100,0,4000,11000,15000,27000,10,92,1,4,0,0,0,1,0,0,0,0,0,0,0,"Brewfest Reveler - Out of Combat - Play Random Emote"),
 
(@ENTRY,0,3,0,38,0,100,0,1,1,0,0,80,@ENTRY*100,0,2,0,0,0,1,0,0,0,0,0,0,0,"Brewfest Reveler - On Data Set 1 1 - Run Script"),
(@ENTRY*100,9,0,0,0,0,100,0,0,0,0,0,53,1,@ENTRY,0,0,0,2,1,0,0,0,0,0,0,0,"Brewfest Reveler - On Script - Start WP"),
(@ENTRY*100,9,1,0,0,0,100,0,1000,5000,5000,5000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Brewfest Reveler - On Script - Say Line 0 (random)"),
(@ENTRY*100,9,2,0,0,0,100,0,0,0,0,0,11,@SPELL_THROW_MUG,0,0,0,0,0,1,0,0,0,0,0,0,0,"Brewfest Reveler - On Script - Cast Throw Mug"),
(@ENTRY,0,4,0,58,0,100,0,3,@ENTRY,0,0,41,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Brewfest Reveler - On WP 3 - Despawn");
 
/*(@ENTRY,0,5,0,38,0,100,0,1,1,0,0,80,@ENTRY*100+1,0,2,0,0,0,1,0,0,0,0,0,0,0,"Brewfest Reveler - On Data Set 2 2 - Run Script"),
(@ENTRY*100+1,9,0,0,0,0,100,0,0,0,0,0,53,1,@ENTRY*10,0,0,0,2,1,0,0,0,0,0,0,0,"Brewfest Reveler - On Script - Start WP"),
(@ENTRY*100+1,9,1,0,0,0,100,0,1000,5000,5000,5000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Brewfest Reveler - On Script - Say Line 0 (random)"),
(@ENTRY*100+1,9,2,0,0,0,100,0,1000,3000,3000,3000,11,@SPELL_THROW_MUG,0,0,0,0,0,1,0,0,0,0,0,0,0,"Brewfest Reveler - On Script - Cast Throw Mug"),
(@ENTRY,0,6,0,58,0,100,0,4,@ENTRY*10,0,0,41,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Brewfest Reveler - On WP 4 - Despawn");*/
-- Text
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`TEXT`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"Dark Iron dwarves!",12,0,100,0,0,0,"Brewfest Reveler"),
(@ENTRY,0,1,"Run! It's the Dark Iron dwarves!",12,0,100,0,0,0,"Brewfest Reveler"),
(@ENTRY,0,2,"They're after the beer!",12,0,100,0,0,0,"Brewfest Reveler"),
(@ENTRY,0,3,"Someone has to save the beer!",12,0,100,0,0,0,"Brewfest Reveler"),
(@ENTRY,0,4,"If you value your beer, run for it!",12,0,100,0,0,0,"Brewfest Reveler");
 
-- Waypoints
DELETE FROM `waypoints` WHERE `entry` IN (@ENTRY,@ENTRY*10);
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
-- Dun Morogh
(@ENTRY,1,-5184.680176,-562.372009,397.260010,'Brewfest Reveler'),
(@ENTRY,2,-5192.152832,-547.358459,397.177094,'Brewfest Reveler'),
(@ENTRY,3,-5198.825684,-530.586243,392.940155,'Brewfest Reveler'),
-- Durotar
(@ENTRY*10,1,1209.775879,-4342.093750,21.295063,'Brewfest Reveler'),
(@ENTRY*10,2,1203.770874,-4356.925781,21.967909,'Brewfest Reveler'),
(@ENTRY*10,3,1202.042725,-4370.892578,24.852894,'Brewfest Reveler'),
(@ENTRY*10,4,1199.489868,-4389.286621,23.865566,'Brewfest Reveler');
 
 
 
 
-- Gordok Brew Barker SAI
SET @ENTRY := 23685;
SET @SPELL_DRINK := 42518;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,22,0,100,0,101,5000,5000,0,11,@SPELL_DRINK,2,0,0,0,0,7,0,0,0,0,0,0,0,"Gordok Brew Barker - Emote Receive 'Wave' - Cast Create Complimentary Brewfest Sampler"),
(@ENTRY,0,1,0,1,0,100,0,30000,45000,180000,240000,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"Gordok Brew Barker - Out of Combat - Yell Line 0 (random)"),
(@ENTRY,0,2,3,38,0,100,0,2,2,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gordok Brew Barker - On Data Set - Yell Line 1"),
(@ENTRY,0,3,4,61,0,100,0,0,0,0,0,50,186478,15000,0,0,0,0,8,0,0,0,-5149.791992,-590.198792,397.323730,4.39,"Gordok Brew Barker - On Data Set 1 1 - Summon Super Brew Stein"),
(@ENTRY,0,4,0,61,0,100,0,0,0,0,0,50,186471,15000,0,0,0,0,8,0,0,0,-5149.791992,-590.198792,397.323730,4.39,"Gordok Brew Barker - On Data Set 1 1 - Summon Super Brew Stein Trap");
 
-- Text
DELETE FROM `script_texts` WHERE `entry` BETWEEN -717 AND -719;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`TEXT`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"YOU TRY DA' BEST, NOW TRY DA' REST! OGRE BREW!",14,0,100,1,0,0,"Gordok Brew Barker"),
(@ENTRY,0,1,"HEY YOU! DRINK OGRE BREWS! MAKE YOU BIG AND STRONG!",14,0,100,1,0,0,"Gordok Brew Barker"),
(@ENTRY,0,2,"YOU WANT DRINK? WE GOT DRINK!",14,0,100,1,0,0,"Gordok Brew Barker"),
 
(@ENTRY,1,0,"SOMEONE TRY THIS SUPER BREW!",14,0,100,0,0,0,"Gordok Brew Barker");
 
 
 
-- Maeve Barleybrew SAI
SET @ENTRY := 23683;
SET @SPELL_DRINK := 42518;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,22,0,100,0,101,5000,5000,0,11,@SPELL_DRINK,2,0,0,0,0,7,0,0,0,0,0,0,0,"Maeve Barleybrew - Emote Receive 'Wave' - Cast Create Complimentary Brewfest Sampler"),
(@ENTRY,0,1,0,1,0,100,0,30000,45000,180000,240000,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"Maeve Barleybrew - Out of Combat - Yell Line 0 (random)"),
(@ENTRY,0,2,3,38,0,100,0,3,3,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Maeve Barleybrew - On Data Set - Yell Line 1"),
(@ENTRY,0,3,4,61,0,100,0,0,0,0,0,50,186478,15000,0,0,0,0,8,0,0,0,-5161.600586,-611.307861,397.917419,2.39,"Maeve Barleybrew - On Data Set 1 1 - Summon Super Brew Stein"),
(@ENTRY,0,4,5,61,0,100,0,0,0,0,0,50,186471,15000,0,0,0,0,8,0,0,0,-5161.600586,-611.307861,397.917419,2.39,"Maeve Barleybrew - On Data Set 1 1 - Summon Super Brew Stein Trap"),
(@ENTRY,0,5,0,61,0,100,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Maeve Barleybrew - On Data Set - Yell Line 2 (random)");
 
-- Text
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`TEXT`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"Come try our Barleybrew Dark!",12,0,100,1,0,0,"Maeve Barleybrew"),
(@ENTRY,0,1,"Barleybrew, finest brewery in Azeroth!",12,0,100,1,0,0,"Maeve Barleybrew"),
(@ENTRY,0,2,"The Barleybrews have always been leaders in brewery innovation. Check out our newest creation, Barleybrew Clear!",12,0,100,1,0,0,"Maeve Barleybrew"),
 
(@ENTRY,1,0,"SOMEONE TRY THIS SUPER BREW!",14,0,100,0,0,0,"Maeve Barleybrew"),
 
(@ENTRY,2,0,"Chug and chuck! Chug and chuck!",12,0,100,1,0,0,"Maeve Barleybrew"),
(@ENTRY,2,1,"Down the free brew and pelt the Guzzlers with your mug!",12,0,100,1,0,0,"Maeve Barleybrew");
 
 
 
-- Ita Thunderbrew SAI
SET @ENTRY := 23684;
SET @SPELL_DRINK := 42518;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,22,0,100,0,101,5000,5000,0,11,@SPELL_DRINK,2,0,0,0,0,7,0,0,0,0,0,0,0,"Ita Thunderbrew - Emote Receive 'Wave' - Cast Create Complimentary Brewfest Sampler"),
(@ENTRY,0,1,0,1,0,100,0,30000,45000,180000,240000,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"Ita Thunderbrew - Out of Combat - Yell Line 0 (random)"),
(@ENTRY,0,2,3,38,0,100,0,3,3,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ita Thunderbrew - On Data Set - Yell Line 1"),
(@ENTRY,0,3,4,61,0,100,0,0,0,0,0,50,186478,15000,0,0,0,0,8,0,0,0,-5143.592285,-611.210510,398.339081,4.39,"Ita Thunderbrew - On Data Set 1 1 - Summon Super Brew Stein"),
(@ENTRY,0,4,5,61,0,100,0,0,0,0,0,50,186471,15000,0,0,0,0,8,0,0,0,-5149.791992,-590.198792,397.323730,4.39,"Ita Thunderbrew - On Data Set 1 1 - Summon Super Brew Stein Trap"),
(@ENTRY,0,5,0,61,0,100,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ita Thunderbrew - On Data Set - Yell Line 2 (random)");
 
-- Text
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`TEXT`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"Thunderbrew, finest brewery in all the realms.",12,0,100,1,0,0,"Ita Thunderbrew"),
(@ENTRY,0,1,"THUNDER! THUNDER! THUNDER! THUNDERBREW, HO!",12,0,100,1,0,0,"Ita Thunderbrew"),
(@ENTRY,0,2,"You look like you could use a cold one. Thunderbrew's got ya covered!",12,0,100,1,0,0,"Ita Thunderbrew"),
 
(@ENTRY,1,0,"SOMEONE TRY THIS SUPER BREW!",14,0,100,0,0,0,"Ita Thunderbrew"),
 
(@ENTRY,2,0,"Chug and chuck! Chug and chuck!",12,0,100,1,0,0,"Ita Thunderbrew"),
(@ENTRY,2,1,"Down the free brew and pelt the Guzzlers with your mug!",12,0,100,1,0,0,"Ita Thunderbrew");