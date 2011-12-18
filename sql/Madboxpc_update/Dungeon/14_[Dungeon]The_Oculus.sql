UPDATE `gameobject_template` SET `AIName`='' WHERE `entry` IN (188715,189985);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (188715,189985);
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_emerald_drake_touch_the_nightmare';
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (49346,49460,49464);
UPDATE `creature_template` SET `AIName`='',`ScriptName`='' WHERE `entry`=28239;
DELETE FROM `creature` WHERE `id`=28183;
DELETE FROM `creature_addon` WHERE `guid` BETWEEN 100227 AND 100234;

UPDATE `creature_template` SET `unit_flags`=0 WHERE `entry`=30879;
UPDATE `creature_template` SET `IconName`='',`ScriptName`='npc_oculus_mount' WHERE `entry` IN (27692,27755,27756);
UPDATE `creature_template` SET `InhabitType`=5,`ScriptName`='npc_planar_anomaly' WHERE `entry`=30879;
UPDATE `creature_template_addon` SET `auras`='50325' WHERE `entry` IN (27692,27755);
UPDATE `creature_template_addon` SET `auras`='50248 50325' WHERE `entry`=27756;
UPDATE `creature_template` SET `spell2`=50240,`spell3`=50253,`spell4`=0 WHERE `entry`=27756;

UPDATE `creature_template` SET `mingold`=7666,`maxgold`=12776 WHERE `entry` IN(27633,27635,27636,27641, 30901,30902,30904,30905,30915,30916);
UPDATE `creature_template` SET `mingold`=40000,`maxgold`=60000,`mechanic_immune_mask`=646676351 WHERE `entry` IN(27447,27654,27655,27656);
UPDATE `creature_template` SET `mingold`=120000,`maxgold`=180000,`mechanic_immune_mask`=646676351 WHERE `entry` IN(31558,31559,31560,31561);

DELETE FROM `spell_script_names` WHERE `spell_id` IN(49838,49840,50240,49592);
INSERT INTO `spell_script_names` VALUES
(49840,'spell_amber_drake_shock_lance'),
(49838,'spell_amber_drake_stop_time'),
(50240,'spell_ruby_drake_evasive_maneuvers'),
(49592,'spell_amber_drake_temporal_rift');

DELETE FROM `spell_proc_event` WHERE `entry`=50240;
INSERT INTO `spell_proc_event` (`entry`,`procEx`,`CustomChance`)VALUES
(50240,4,100);

DELETE FROM `creature_addon` WHERE `guid` IN (101924,101933,101922,101974,102064,101967);
INSERT INTO `creature_addon` (`guid`,`auras`) VALUES
(101924,'50088'),
(101933,'50088'),
(101922,'50088'),
(101974,'50088'),
(102064,'50088'),
(101967,'50088');

-- skinnloot
UPDATE `creature_template` SET `skinloot`=70210 WHERE `entry` IN (27636,27633,27635,27638,28276, 30902,30901,30904,30903,30991);
UPDATE `creature_template` SET `skinloot`=29730,`type_flags`=`type_flags`|32768 WHERE `entry` IN (27641, 30905);
UPDATE `creature_template` SET `skinloot`=70211 WHERE `entry` IN (27642,27644,27645, 30909,30914,30907);

-- Conditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry` IN (50232,50328,50341,49840,49592);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (61407,62136,54069,56251,51024,50087);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
-- Searing Wrath
(17,50232,1,19,27638,0),
(17,50232,2,19,27656,0),
(17,50232,3,19,28276,0),
-- Leeching Poison
(17,50328,1,19,27638,0),
(17,50328,2,19,27656,0),
(17,50328,3,19,28276,0),
-- Touch the Nightmare
(17,50341,1,19,27638,0),
(17,50341,2,19,27656,0),
(17,50341,3,19,28276,0),
-- Shock Lance
(17,49840,1,19,27638,0),
(17,49840,2,19,27656,0),
(17,49840,3,19,28276,0),
-- Temporal Rift
(17,49592,1,19,27638,0),
(17,49592,2,19,27656,0),
(17,49592,3,19,28276,0),

(13,61407,0,18,1,28183),
(13,62136,0,18,1,28183),
(13,54069,0,18,1,28183),
(13,56251,0,18,1,28183),
(13,51024,0,18,1,28239),

(13,50087,0,18,1,27641);


DELETE FROM creature_loot_template WHERE entry IN(30901, 30902, 30904, 30905, 30906, 30907, 30908, 30909, 30910, 30911, 30912, 30913, 30914, 30915, 30916);
INSERT INTO creature_loot_template VALUES
(30902, 33631, 73, 1, 0, 1, 1),
(30902, 33632, 17, 1, 0, 1, 1),
(30902, 37366, 1, 1, 0, 1, 1),
(30902, 37365, 1, 1, 0, 1, 1),
(30902, 37364, 1, 1, 0, 1, 1),
(30902, 43297, 0.1, 1, 0, 1, 1),
(30902, 45912, 0.1, 1, 0, 1, 1),
(30901, 33470, 33, 1, 0, 1, 7),
(30901, 43852, 19, 1, 0, 1, 1),
(30901, 33454, 8, 1, 0, 1, 1),
(30901, 33445, 4, 1, 0, 1, 1),
(30901, 33447, 2, 1, 0, 1, 1),
(30901, 33448, 2, 1, 0, 1, 1),
(30901, 37364, 1.2, 1, 0, 1, 1),
(30901, 37366, 1, 1, 0, 1, 1),
(30901, 37365, 1, 1, 0, 1, 1),
(30901, 43297, 0.1, 1, 0, 1, 1),
(30901, 45912, 0.1, 1, 0, 1, 1),
(30904, 33470, 31, 1, 0, 1, 7),
(30904, 43852, 19, 1, 0, 1, 1),
(30904, 33454, 7, 1, 0, 1, 1),
(30904, 33445, 4, 1, 0, 1, 1),
(30904, 33447, 2, 1, 0, 1, 1),
(30904, 37366, 1, 1, 0, 1, 1),
(30904, 37365, 1, 1, 0, 1, 1),
(30904, 37364, 1, 1, 0, 1, 1),
(30904, 43297, 0.1, 1, 0, 1, 1),
(30904, 45912, 0.1, 1, 0, 1, 1),
(30916, 33470, 32, 1, 0, 1, 7),
(30916, 43852, 18, 1, 0, 1, 1),
(30916, 33454, 8, 1, 0, 1, 1),
(30916, 33445, 4, 1, 0, 1, 1),
(30916, 33447, 2, 1, 0, 1, 1),
(30916, 37366, 1, 1, 0, 1, 1),
(30916, 37365, 1, 1, 0, 1, 1),
(30916, 37364, 1, 1, 0, 1, 1),
(30916, 43297, 0.1, 1, 0, 1, 1),
(30916, 45912, 0.1, 1, 0, 1, 1),
(30915, 33470, 33, 1, 0, 1, 7),
(30915, 43852, 19, 1, 0, 1, 1),
(30915, 33454, 8, 1, 0, 1, 1),
(30915, 33445, 4, 1, 0, 1, 1),
(30915, 33447, 2, 1, 0, 1, 1),
(30915, 33478, 2, 1, 0, 1, 1),
(30915, 37366, 1, 1, 0, 1, 1),
(30915, 37365, 1, 1, 0, 1, 1),
(30915, 37364, 1, 1, 0, 1, 1),
(30915, 43297, 0.1, 1, 0, 1, 1),
(30915, 45912, 0.1, 1, 0, 1, 1),
(30905, 39209, 72, 1, 0, 1, 1),
(30905, 39210, 17, 1, 0, 1, 1),
(30905, 37366, 1, 1, 0, 1, 1),
(30905, 37365, 1, 1, 0, 1, 1),
(30905, 37364, 1, 1, 0, 1, 1),
(30905, 43297, 0.1, 1, 0, 1, 1),
(30905, 45912, 0.1, 1, 0, 1, 1),
(30906, 39512, 72, 1, 0, 1, 4),
(30906, 37700, 28, 1, 0, 1, 4),
(30906, 39513, 17, 1, 0, 1, 4),
(30906, 37366, 1, 1, 0, 1, 1),
(30906, 37365, 1, 1, 0, 1, 1),
(30906, 37364, 1, 1, 0, 1, 1),
(30908, 39512, 69, 1, 0, 1, 4),
(30908, 37702, 30, 1, 0, 1, 4),
(30908, 39513, 18, 1, 0, 1, 4),
(30908, 37366, 1.7, 1, 0, 1, 1),
(30908, 37365, 1, 1, 0, 1, 1),
(30908, 37364, 1, 1, 0, 1, 1),
(30913, 39512, 72, 1, 0, 1, 4),
(30913, 37705, 30, 1, 0, 1, 4),
(30913, 39513, 18, 1, 0, 1, 4),
(30913, 37366, 1, 1, 0, 1, 1),
(30913, 37365, 1, 1, 0, 1, 1),
(30913, 37364, 1, 1, 0, 1, 1),
(30912, 33470, 33, 1, 0, 1, 4),
(30912, 43852, 18, 1, 0, 1, 1),
(30912, 33454, 7, 1, 0, 1, 1),
(30912, 33445, 6, 1, 0, 1, 1),
(30912, 33447, 2, 1, 0, 1, 1),
(30912, 33764, 1.8, 1, 0, 1, 1),
(30912, 36047, 1.1, 1, 0, 1, 1),
(30912, 36148, 1.1, 1, 0, 1, 1),
(30912, 37097, 1, 1, 0, 1, 1),
(30912, 33448, 2, 1, 0, 1, 1),
(30912, 36371, 1.3, 1, 0, 1, 1),
(30912, 37366, 1, 1, 0, 1, 1),
(30912, 37365, 1, 1, 0, 1, 1),
(30912, 37364, 1, 1, 0, 1, 1),
(30910, 17057, 27, 1, 0, 1, 1),
(30910, 17058, 25, 1, 0, 1, 1),
(30910, 33470, 19, 1, 0, 1, 1),
(30910, 36781, 16, 1, 0, 1, 1),
(30910, 43852, 12, 1, 0, 1, 1),
(30910, 37365, 1.2, 1, 0, 1, 1),
(30910, 33447, 2, 1, 0, 1, 1),
(30910, 37366, 1, 1, 0, 1, 1),
(30910, 37364, 1, 1, 0, 1, 1),
(30911, 17057, 26, 1, 0, 1, 1),
(30911, 17058, 25, 1, 0, 1, 1),
(30911, 33470, 17, 1, 0, 1, 7),
(30911, 36781, 14, 1, 0, 1, 1),
(30911, 43853, 10, 1, 0, 1, 1),
(30911, 37366, 1, 1, 0, 1, 1),
(30911, 37365, 1, 1, 0, 1, 1),
(30911, 37364, 1, 1, 0, 1, 1),
(30914, 39211, 71, 1, 0, 1, 5),
(30914, 43011, 46, 1, 0, 1, 1),
(30914, 39212, 17, 1, 0, 1, 4),
(30914, 43013, 13, 1, 0, 1, 1),
(30914, 37366, 1, 1, 0, 1, 1),
(30914, 37365, 1, 1, 0, 1, 1),
(30914, 37364, 1, 1, 0, 1, 1),
(30907, 39567, 73, 1, 0, 1, 5),
(30907, 39568, 16, 1, 0, 1, 4),
(30907, 37366, 1, 1, 0, 1, 1),
(30907, 37365, 1, 1, 0, 1, 1),
(30907, 37364, 1, 1, 0, 1, 1),
(30909, 39562, 72, 1, 0, 1, 4),
(30909, 34736, 49, 1, 0, 1, 1),
(30909, 39563, 18, 1, 0, 1, 3),
(30909, 43013, 11, 1, 0, 1, 1),
(30909, 33422, 1, 1, 0, 1, 1),
(30909, 37366, 1, 1, 0, 1, 1),
(30909, 37365, 1, 1, 0, 1, 1),
(30909, 37364, 1, 1, 0, 1, 1);


DELETE FROM script_texts WHERE Entry IN(-1578005,-1578006, -1578007, -1578008, -1578009, -1578010, -1578011, -1578012, -1578013, -1578014, -1578015, -1578016, -1578017, -1578018, -1578019, -1578020, -1578021, -1578022, -1578023, -1578024);
INSERT INTO script_texts VALUES
(27654, -1578005, "The prisoners shall not go free. The word of Malygos is law!", "", "", "", "", "", "", "", "", 0, 1, 0, 0, ""),
(27654, -1578006, "A fitting punishment!", "", "", "", "", "", "", "", "", 0, 1, 0, 0, ""),
(27654, -1578007, "Sentence: executed!", "", "", "", "", "", "", "", "", 0, 1, 0, 0, ""),
(27654, -1578008, "Another casualty of war!", "", "", "", "", "", "", "", "", 0, 1, 0, 0, ""),
(27654, -1578009, "The war... goes on.", "", "", "", "", "", "", "", "", 0, 1, 0, 0, ""),
(27654, -1578010, "Intruders, your victory will be short-lived. I am Commander Varos Cloudstrider. My drakes control the skies and protect this conduit. I will see to it personally that the Oculus does not fall into your hands!", "", "", "", "", "", "", "", "", 0, 1, 0, 0, ""),
(27654, -1578011, "It is too late to run!", "", "", "", "", "", "", "", "", 0, 1, 0, 0, ""),
(27654, -1578012, "Gather 'round...", "", "", "", "", "", "", "", "", 0, 1, 0, 0, ""),
(27654, -1578013, "None shall escape!", "", "", "", "", "", "", "", "", 0, 1, 0, 0, ""),
(27654, -1578014, "I condemn you to death!", "", "", "", "", "", "", "", "", 0, 1, 0, 0, ""),
(27654, -1578015, "Tremble, worms!", "", "", "", "", "", "", "", "", 0, 1, 0, 0, ""),
(27654, -1578016, "I will crush you!", "", "", "", "", "", "", "", "", 0, 1, 0, 0, ""),
(27654, -1578017, "Can you fly?", "", "", "", "", "", "", "", "", 0, 1, 0, 0, ""),
(27655, -1578018, "Everything I've done... has been for Azeroth...", "", "", "", "", "", "", "", "", 0, 1, 0, 0, ""),
(27655, -1578019, "If only you understood!", "", "", "", "", "", "", "", "", 0, 1, 0, 0, ""),
(27655, -1578020, "Now do you see? Do you?!", "", "", "", "", "", "", "", "", 0, 1, 0, 0, ""),
(27655, -1578021, "Unfortunate, but necessary.", "", "", "", "", "", "", "", "", 0, 1, 0, 0, ""),
(27656, -1578022, "It's a long way down...", "", "", "", "", "", "", "", "", 0, 1, 0, 0, ""),
(27656, -1578023, "Back to the earth with you!", "", "", "", "", "", "", "", "", 0, 1, 0, 0, ""),
(27656, -1578024, "Enjoy the fall!", "", "", "", "", "", "", "", "", 0, 1, 0, 0, "");

DELETE FROM creature_onkill_reputation WHERE creature_id IN(30902, 30901, 30904, 30915, 30916, 30905, 30903, 31558, 31559, 31560, 31561);
INSERT INTO creature_onkill_reputation VALUES
(30902, 1037, 1052, 7, 0, 2, 7, 0, 2, 1),
(30901, 1037, 1052, 7, 0, 15, 7, 0, 15, 1),
(30904, 1037, 1052, 7, 0, 15, 7, 0, 15, 1),
(30915, 1037, 1052, 7, 0, 15, 7, 0, 15, 1),
(30916, 1037, 1052, 7, 0, 15, 7, 0, 15, 1),
(30905, 1037, 1052, 7, 0, 30, 7, 0, 30, 1),
(30903, 1037, 1052, 7, 0, 15, 7, 0, 15, 1),
(31558, 1037, 1052, 7, 0, 250, 7, 0, 250, 1),
(31559, 1037, 1052, 7, 0, 250, 7, 0, 250, 1),
(31560, 1037, 1052, 7, 0, 250, 7, 0, 250, 1),
(31561, 1037, 1052, 7, 0, 250, 7, 0, 250, 1);

-- -------------------------------------
-- Loot Cache of the Ley-Guardian.
DELETE FROM `item_loot_template` WHERE `entry`=52676;
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
-- Gemas
(52676,36921,0,1,1,1,3),
(52676,36933,0,1,1,1,3),
(52676,36930,0,1,1,1,3),
(52676,36918,0,1,1,1,3),
(52676,36927,0,1,1,1,3),
(52676,36924,0,1,1,1,3),
-- Montura
(52676,43953,5,1,0,1,1);

-- Fix achievement Experienced Drake Rider.
DELETE FROM `achievement_criteria_data` WHERE `type` IN (5,11) AND `criteria_id` IN (7177,7178,7179);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES
(7177,11,0,0,'achievement_experienced_drake_rider_amber'),
(7178,11,0,0,'achievement_experienced_drake_rider_emerald'),
(7179,11,0,0,'achievement_experienced_drake_rider_ruby');


UPDATE `spell_script_names` SET `ScriptName`='spell_amber_drake_shock_lance' WHERE `ScriptName`='spell_amber_drake_schock_lance';
DELETE FROM `creature_addon` WHERE `guid` IN (101924,101933,101922,101974,102064,101967);
INSERT INTO `creature_addon` (`guid`,`auras`) VALUES
(101924,'50088'),
(101933,'50088'),
(101922,'50088'),
(101974,'50088'),
(102064,'50088'),
(101967,'50088');

DELETE FROM `creature` WHERE `id`=28183;
DELETE FROM `creature_addon` WHERE `guid` BETWEEN 100227 AND 100234;

UPDATE `creature_template` SET `scale`=1 WHERE `entry`=28183;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='' WHERE `entry`=28239;
UPDATE `creature_template` SET `InhabitType`=5, `ScriptName`='npc_planar_anomaly' WHERE `entry`=30879;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (49346,49460,49464);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (61407,62136,54069,56251,51024);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,61407,18,1,28183),
(13,62136,18,1,28183),
(13,54069,18,1,28183),
(13,56251,18,1,28183),
(13,51024,18,1,28239);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=50087;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,50087,0,18,1,27641,0,0,'','Energy Link target only Centrifuge Construct');

UPDATE `creature_template` SET `AIName`='SmartAI',`ScriptName`='' WHERE `entry` IN (27636,27633,27635,27638,27641,27640,27639,28276,27642,27644,27645,27650,27651,27653,27647,27648);
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (27636,27633,27635,27638,27641,27640,27639,28276,27642,27644,27645,27650,27651,27653,27647,27648);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (27636,27633,27635,27638,27641,27640,27639,28276,27642,27644,27645,27650,27651,27653,27647,27648);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(27636,0,0,0,0,0,100,2,2000,4000,2000,4000,11,50705,0,0,0,0,0,2,0,0,0,0,0,0,0,'Azure Ley-Whelp - IC - cast Arcane Bolt'),
(27636,0,1,0,0,0,100,4,2000,4000,2000,4000,11,59210,0,0,0,0,0,2,0,0,0,0,0,0,0,'Azure Ley-Whelp - IC - cast Arcane Bolt H'),

(27633,0,0,0,0,0,100,0,3000,5000,6000,8000,11,50573,0,0,0,0,0,2,0,0,0,0,0,0,0,'Azure Inquisitor - IC - cast Arcane Cleave'),
(27633,0,1,0,0,0,100,0,9000,10000,15000,20000,11,50690,0,0,0,0,0,5,0,0,0,0,0,0,0,'Azure Inquisitor - IC - cast Immobilizing Field'),
(27633,0,2,0,9,0,100,2,5,30,3000,5000,11,51454,0,0,0,0,0,6,0,0,0,0,0,0,0,'Azure Inquisitor - IC - cast Throw'),
(27633,0,3,0,9,0,100,4,5,30,3000,5000,11,59209,0,0,0,0,0,6,0,0,0,0,0,0,0,'Azure Inquisitor - IC - cast Throw H'),

(27635,0,0,0,0,0,100,2,3000,5000,7000,10000,11,50702,0,0,0,0,0,1,0,0,0,0,0,0,0,'Azure Spellbinder - IC - cast Arcane Volley '),
(27635,0,1,0,0,0,100,4,3000,5000,7000,10000,11,59212,0,0,0,0,0,1,0,0,0,0,0,0,0,'Azure Spellbinder - IC - cast Arcane Volley H'),
(27635,0,2,0,0,0,100,2,7000,9000,15000,20000,11,50566,0,0,0,0,0,5,0,0,0,0,0,0,0,'Azure Spellbinder - IC - cast Mind Warp'),
(27635,0,3,0,0,0,100,4,7000,9000,15000,20000,11,38047,0,0,0,0,0,5,0,0,0,0,0,0,0,'Azure Spellbinder - IC - cast Mind Warp H'),
(27635,0,4,0,0,0,100,0,10000,13000,20000,25000,11,50572,0,0,0,0,0,5,0,0,0,0,0,0,0,'Azure Spellbinder - IC - cast Power Sap'),

(27638,0,0,0,0,0,100,2,0,5000,5000,7000,11,49549,0,0,0,0,0,2,0,0,0,0,0,0,0,'Azure Ring Guardian - IC - cast Ice Beam'),
(27638,0,1,0,0,0,100,4,0,5000,5000,7000,11,59211,0,0,0,0,0,2,0,0,0,0,0,0,0,'Azure Ring Guardian - IC - cast Ice Beam H'),

(27641,0,0,0,25,0,100,0,0,0,0,0,75,69844,0,0,0,0,0,1,0,0,0,0,0,0,0,'Centrifuge Construct - On Reset - add Aura: Vertex Color Bright Red'),
(27641,0,1,0,4,0,100,0,0,0,0,0,28,69844,0,0,0,0,0,1,0,0,0,0,0,0,0,'Centrifuge Construct - On Aggro - remove Aura: Vertex Color Bright Red'),

(27640,0,0,0,23,0,100,2,50717,0,0,0,11,50717,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ring-Lord Conjurer - On missing Aura: Charged Skin - cast Charged Skin'),
(27640,0,1,0,23,0,100,4,59276,0,0,0,11,59276,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ring-Lord Conjurer - On missing Aura: Charged Skin H - cast Charged Skin H'),


(27639,0,0,0,0,0,100,2,3000,5000,8000,10000,11,50715,0,0,0,0,0,5,0,0,0,0,0,0,0,'Ring-Lord Sorceress - IC - cast Blizzard'),
(27639,0,1,0,0,0,100,4,3000,5000,8000,10000,11,59278,0,0,0,0,0,5,0,0,0,0,0,0,0,'Ring-Lord Sorceress - IC - cast Blizzard H'),
(27639,0,2,0,0,0,100,2,2000,4000,6000,8000,11,16102,0,0,0,0,0,5,0,0,0,0,0,0,0,'Ring-Lord Sorceress - IC - cast Flamestrike'),
(27639,0,3,0,0,0,100,4,2000,4000,6000,8000,11,61402,0,0,0,0,0,5,0,0,0,0,0,0,0,'Ring-Lord Sorceress - IC - cast Flamestrike H'),

(28276,0,0,0,0,0,100,2,2000,4000,2000,4000,11,50705,0,0,0,0,0,2,0,0,0,0,0,0,0,'Greater Ley-Whelp - IC - cast Arcane Bolt'),
(28276,0,1,0,0,0,100,4,2000,4000,2000,4000,11,59210,0,0,0,0,0,2,0,0,0,0,0,0,0,'Greater Ley-Whelp - IC - cast Arcane Bolt H'),

-- Mage-Lord Urom Adds
(27642,0,0,0,9,0,100,0,8,25,6000,8000,11,32323,0,0,0,0,0,6,0,0,0,0,0,0,0,'Phantasmal Mammoth - IC - cast Charge'),
(27642,0,1,0,0,0,100,0,4000,6000,10000,12000,11,51253,0,0,0,0,0,1,0,0,0,0,0,0,0,'Phantasmal Mammoth - IC - cast Trample'),

(27644,0,0,0,0,0,100,2,3000,6000,12000,14000,11,50728,0,0,0,0,0,1,0,0,0,0,0,0,0,'Phantasmal Wolf - IC - cast Furious Howl'),
(27644,0,1,0,0,0,100,4,3000,6000,12000,14000,11,59274,0,0,0,0,0,1,0,0,0,0,0,0,0,'Phantasmal Wolf - IC - cast Furious Howl H'),
(27644,0,2,0,0,0,100,2,5000,8000,14000,17000,11,50729,0,0,0,0,0,2,0,0,0,0,0,0,0,'Phantasmal Wolf - IC - cast Carnivorous Bite'),
(27644,0,3,0,0,0,100,4,5000,8000,14000,17000,11,59269,0,0,0,0,0,2,0,0,0,0,0,0,0,'Phantasmal Wolf - IC - cast Carnivorous Bite H'),

(27645,0,0,0,0,0,100,2,6000,8000,8000,10000,11,59220,0,0,0,0,0,5,0,0,0,0,0,0,0,'Phantasmal Cloudscraper - IC - cast Chain Lightning'),
(27645,0,1,0,0,0,100,4,6000,8000,8000,10000,11,15588,0,0,0,0,0,5,0,0,0,0,0,0,0,'Phantasmal Cloudscraper - IC - cast Chain Lightning H'),
(27645,0,2,0,0,0,100,2,2000,4000,10000,12000,11,15588,0,0,0,0,0,1,0,0,0,0,0,0,0,'Phantasmal Cloudscraper - IC - cast Thunderclap'),
(27645,0,3,0,0,0,100,4,2000,4000,10000,12000,11,59217,0,0,0,0,0,1,0,0,0,0,0,0,0,'Phantasmal Cloudscraper - IC - cast Thunderclap H'),

(27650,0,0,0,23,0,100,2,25020,0,0,0,11,25020,0,0,0,0,0,1,0,0,0,0,0,0,0,'Phantasmal Air - On missing Aura: Lightning Shield - cast Lightning Shield'),
(27650,0,1,0,23,0,100,4,20545,0,0,0,11,20545,0,0,0,0,0,1,0,0,0,0,0,0,0,'Phantasmal Air - On missing Aura: Lightning Shield H - cast Lightning Shield H'),

(27651,0,0,0,0,0,100,2,3000,5000,5000,8000,11,50744,0,0,0,0,0,5,0,0,0,0,0,0,0,'Phantasmal Fire - IC - cast Blaze'),
(27651,0,1,0,0,0,100,4,3000,5000,5000,8000,11,59225,0,0,0,0,0,5,0,0,0,0,0,0,0,'Phantasmal Fire - IC - cast Blaze H'),

(27653,0,0,0,0,0,100,2,3000,5000,4000,6000,11,37924,0,0,0,0,0,1,0,0,0,0,0,0,0,'Phantasmal Water - IC - cast Water Bolt Volley'),
(27653,0,1,0,0,0,100,4,3000,5000,4000,6000,11,59266,0,0,0,0,0,1,0,0,0,0,0,0,0,'Phantasmal Water - IC - cast Water Bolt Volley H'),

(27647,0,0,0,0,0,100,0,2000,5000,7000,9000,11,50731,0,0,0,0,0,5,0,0,0,0,0,0,0,'Phantasmal Ogre - IC - cast Mace Smash'),
(27647,0,1,0,4,0,100,0,0,0,0,0,11,50730,0,0,0,0,0,1,0,0,0,0,0,0,0,'Phantasmal Ogre - On Aggro - cast Bloodlust'),

(27648,0,0,0,0,0,100,2,3000,5000,8000,10000,11,50732,0,0,0,0,0,5,0,0,0,0,0,0,0,'Phantasmal Naga - IC - cast Water Tomb'),
(27648,0,1,0,0,0,100,4,3000,5000,8000,10000,11,59261,0,0,0,0,0,5,0,0,0,0,0,0,0,'Phantasmal Naga - IC - cast Water Tomb H'),
(27648,0,2,0,0,0,100,0,4000,6000,6000,8000,11,49711,0,0,0,0,0,5,0,0,0,0,0,0,0,'Phantasmal Naga - IC - cast Hooked Net');

UPDATE `creature_template` SET `skinloot`=70210 WHERE `entry` IN (27636,27633,27635,27638,28276, 30902,30901,30904,30903,30991);  
UPDATE `creature_template` SET `skinloot`=29730,`type_flags`=`type_flags`|32768 WHERE `entry` IN (27641, 30905);        
UPDATE `creature_template` SET `skinloot`=70211 WHERE `entry` IN (27642,27644,27645, 30909,30914,30907); 

-- Experienced Drake Rider
DELETE FROM `disables` WHERE `sourceType`=4 AND `entry` IN (7177,7178,7179);
DELETE FROM `achievement_criteria_data` WHERE `type`=5 AND `criteria_id` IN (7177,7178,7179);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES
(7177,5,49460,0,''),
(7178,5,49346,0,''),
(7179,5,49464,0,'');

-- Voids
DELETE FROM `disables` WHERE `sourceType`=4 AND `entry` IN (7323,7324,7325);
DELETE FROM `achievement_criteria_data` WHERE `type`=11 AND `criteria_id` IN (7323,7324,7325);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES
(7323,11,0,0,'achievement_ruby_void'),
(7324,11,0,0,'achievement_emerald_void'),
(7325,11,0,0,'achievement_amber_void');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry` IN (50232,50328,50341,49840,49592);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`) VALUES
-- Searing Wrath
(17,50232,1,19,27638),
(17,50232,2,19,27656),
(17,50232,3,19,28276),
-- Leeching Poison
(17,50328,1,19,27638),
(17,50328,2,19,27656),
(17,50328,3,19,28276),
-- Touch the Nightmare
(17,50341,1,19,27638),
(17,50341,2,19,27656),
(17,50341,3,19,28276),
-- Shock Lance
(17,49840,1,19,27638),
(17,49840,2,19,27656),
(17,49840,3,19,28276),
-- Temporal Rift
(17,49592,1,19,27638),
(17,49592,2,19,27656),
(17,49592,3,19,28276);

UPDATE `spell_script_names` SET `ScriptName`='spell_amber_drake_stop_time' WHERE `ScriptName`='spell_amber_drake_time_stop';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_emerald_drake_touch_the_nightmare';

UPDATE `creature_template_addon` SET `auras`='50325' WHERE `entry` IN (27692,27755);
UPDATE `creature_template_addon` SET `auras`='50248 50325' WHERE `entry`=27756;
UPDATE `creature_template` SET `spell2`=50240, `spell3`=50253, `spell4`=0 WHERE `entry`=27756;

UPDATE `gameobject_template` SET `AIName`='' WHERE `entry`=188715;
DELETE FROM `smart_scripts` WHERE `entryorguid`=188715;

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (27692,27755,27756);
UPDATE `creature_template` SET `IconName`='' WHERE `entry` IN (27756,27755,27692);
UPDATE `creature_template` SET `ScriptName`='npc_oculus_mount' WHERE `ScriptName`='npc_oculus_drakes';

DELETE FROM `creature` WHERE `id`=28239;