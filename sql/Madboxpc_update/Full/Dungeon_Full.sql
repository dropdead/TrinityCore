-- 01_[Dungeon]Culling_Of_Stratholme.sql
-- Culling of Stratholme
-- Update Spawn mobs 2 Intro cuando Arthas va donde malganis.
DELETE FROM `creature` WHERE `id` IN (27737,27729,27734,27736,28199,28200,28201,28249,28409,32273) AND `map`=595;
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`,`MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
VALUES
('28409','595','2','1','0','0','2338.47','1280.28','133.323','3.58524','30','0','0','8982','0','0','0','0','0'),
('32273','595','2','1','0','1839','2335.1','1278.2','132.885','3.43131','86400','0','0','417911','0','0','0','0','0'),
('27737','595','3','1','25543','0','2319.89','1285.78','131.407','1.72169','60','10','0','630','0','0','1','0','0'),
('27737','595','3','1','10979','0','2308.12','1304.21','127.601','4.39662','60','10','0','630','0','0','1','0','0'),
('27737','595','3','1','25542','0','2335.47','1262.04','132.921','1.42079','60','10','0','630','0','0','1','0','0'),
('27737','595','3','1','25543','0','2297.73','1338.75','124.622','2.5574','60','10','0','630','0','0','1','0','0'),
('27737','595','3','1','10979','0','2322.65','1265.39','133.033','5.6524','60','10','0','630','0','0','1','0','0'),
('27737','595','3','1','10973','0','2277.83','1331.92','124.19','3.48045','60','10','0','630','0','0','1','0','0'),
('27737','595','3','1','25543','0','2294.18','1316.93','125.672','6.05649','60','10','0','630','0','0','1','0','0'),
('27737','595','3','1','10973','0','2310.56','1369','128.372','5.03364','60','10','0','630','0','0','1','0','0'),
('27737','595','3','1','10979','0','2306.15','1322.85','125.708','4.99133','60','10','0','630','0','0','1','0','0'),
('27737','595','3','1','10973','0','2320.14','1297.48','129.694','1.35248','60','10','0','630','0','0','1','0','0'),
('27737','595','3','1','25542','0','2291.57','1327.27','124.545','5.32358','60','10','0','630','0','0','1','0','0'),
('27737','595','3','1','25542','0','2308.04','1352.65','126.907','5.83741','60','10','0','630','0','0','1','0','0'),
('27737','595','3','1','10979','0','2329.44','1281.11','132.636','2.25207','60','10','0','630','0','0','1','0','0'),
('27737','595','3','1','0','0','2407.32','1423.8','131.522','6.24743','60','10','0','706','0','0','1','0','0'),
('27737','595','3','1','0','0','2417.26','1428.41','131.652','6.20423','60','10','0','730','0','0','1','0','0'),
('27737','595','3','1','0','0','2420.48','1419.99','130.716','0.0977616','60','10','0','706','0','0','1','0','0'),
('27737','595','3','1','0','0','2426.63','1413.41','130.464','0.404064','60','10','0','730','0','0','1','0','0'),
('27737','595','3','1','0','0','2430.46','1417.6','130.557','0.125247','60','10','0','730','0','0','1','0','0'),
('27737','595','3','1','0','0','2433.94','1427.03','131.18','0.0584885','60','10','0','706','0','0','1','0','0'),
('27737','595','3','1','0','0','2446.5','1428.37','131.013','6.10606','60','10','0','756','0','0','1','0','0'),
('27737','595','3','1','0','0','2449.49','1423.35','130.588','5.77619','60','10','0','706','0','0','1','0','0'),
('27737','595','3','1','0','0','2441.92','1424.41','130.606','6.07857','60','10','0','706','0','0','1','0','0'),
('27737','595','3','1','0','0','2450.6','1438.61','132.213','4.74889','60','10','0','730','0','0','1','0','0'),
('27737','595','3','1','0','0','2460.17','1436.46','131.501','4.73711','60','10','0','756','0','0','1','0','0'),
('27737','595','3','1','0','0','2444.68','1421.68','130.324','6.01338','60','10','0','756','0','0','1','0','0'),
('27737','595','3','1','0','0','2456.87','1419.07','130.488','5.39763','60','10','0','706','0','0','1','0','0'),
('27737','595','3','1','0','0','2464.27','1422.15','130.976','5.22092','60','10','0','756','0','0','1','0','0'),
('27737','595','3','1','0','0','2468.21','1403.06','130.39','5.6364','60','10','0','756','0','0','1','0','0'),
('27737','595','3','1','0','0','2460.88','1406.8','130.508','5.96234','60','10','0','756','0','0','1','0','0'),
('27737','595','3','1','0','0','2485.77','1398.35','130.795','4.71591','60','10','0','756','0','0','1','0','0'),
('27737','595','3','1','0','0','2485.79','1380.46','130.15','5.02928','60','10','0','730','0','0','1','0','0'),
('27737','595','3','1','0','0','2475.77','1396.31','130.124','4.84079','60','10','0','730','0','0','1','0','0'),
('27737','595','3','1','0','0','2476.92','1387.21','129.401','5.05128','60','10','0','730','0','0','1','0','0'),
('27737','595','3','1','0','0','2483.24','1389.37','130.123','4.74104','60','10','0','730','0','0','1','0','0'),
('27737','595','3','1','0','0','2480.2','1370.15','129.533','5.79583','60','10','0','706','0','0','1','0','0'),
('27737','595','3','1','0','0','2481.54','1375.11','129.642','5.4644','60','10','0','730','0','0','1','0','0'),
('27737','595','3','1','0','0','2489.44','1359.42','131.233','5.378','60','10','0','730','0','0','1','0','0'),
('27737','595','3','1','0','0','2486.59','1356.19','131.876','5.7275','60','10','0','756','0','0','1','0','0'),
('27737','595','3','1','0','0','2495.53','1348.61','133.072','5.52722','60','10','0','730','0','0','1','0','0'),
('27737','595','3','1','0','0','2504.48','1349.65','132.856','5.11881','60','10','0','730','0','0','1','0','0'),
('27737','595','3','1','0','0','2493.11','1380.29','130.24','4.93189','60','10','0','706','0','0','1','0','0'),
('27737','595','3','1','0','0','2487.18','1392.64','130.512','4.93818','60','10','0','706','0','0','1','0','0'),
('27737','595','3','1','0','0','2506.49','1336.89','132.794','5.19343','60','10','0','756','0','0','1','0','0'),
('27737','595','3','1','0','0','2518.2','1306.39','130.623','4.81723','60','10','0','756','0','0','1','0','0'),
('27737','595','3','1','0','0','2513.4','1299.67','130.868','4.4206','60','10','0','756','0','0','1','0','0'),
('27737','595','3','1','0','0','2511.45','1291.47','130.808','5.00729','60','10','0','756','0','0','1','0','0'),
('27737','595','3','1','0','0','2518.56','1292.32','130.528','5.16438','60','10','0','756','0','0','1','0','0'),
('27737','595','3','1','0','0','2515.49','1279.85','129.214','5.28847','60','10','0','730','0','0','1','0','0'),
('27737','595','3','1','0','0','2514.37','1285.92','129.934','5.70473','60','10','0','706','0','0','1','0','0'),
('27737','595','3','1','0','0','2522.65','1274.29','128.576','5.44634','60','10','0','706','0','0','1','0','0'),
('27737','595','3','1','0','0','2535.38','1275.77','127.42','5.49817','60','10','0','756','0','0','1','0','0'),
('27737','595','3','1','0','0','2537.59','1273.1','127.05','5.02693','60','10','0','730','0','0','1','0','0'),
('27737','595','3','1','0','0','2547.49','1261.7','126.44','4.78425','60','10','0','730','0','0','1','0','0'),
('27737','595','3','1','0','0','2534.36','1261.06','127.125','4.3994','60','10','0','756','0','0','1','0','0'),
('27737','595','3','1','0','0','2532.69','1251.44','127.452','5.4479','60','10','0','730','0','0','1','0','0'),
('27737','595','3','1','0','0','2551.84','1252.35','125.455','5.04342','60','10','0','706','0','0','1','0','0'),
('27737','595','3','1','0','0','2536.1','1244','126.928','5.16515','60','10','0','756','0','0','1','0','0'),
('27737','595','3','1','0','0','2543.63','1247.23','126.131','5.19735','60','10','0','706','0','0','1','0','0'),
('27737','595','3','1','0','0','2554.21','1238.95','125.475','4.64836','60','10','0','730','0','0','1','0','0'),
('27737','595','3','1','0','0','2548.89','1227.37','126.375','5.31517','60','10','0','756','0','0','1','0','0'),
('27737','595','3','1','0','0','2560.46','1225.4','125.496','4.85335','60','10','0','706','0','0','1','0','0'),
('27737','595','3','1','0','0','2555.11','1218.55','125.944','5.11646','60','10','0','730','0','0','1','0','0'),
('27737','595','3','1','0','0','2561.91','1211.56','125.38','5.5877','60','10','0','730','0','0','1','0','0'),
('27737','595','3','1','0','0','2568.67','1202.96','125.509','4.96095','60','10','0','756','0','0','1','0','0'),
('27737','595','3','1','0','0','2571.93','1193.48','125.619','5.07641','60','10','0','756','0','0','1','0','0'),
('27737','595','3','1','0','0','2577.77','1180.88','125.562','4.64522','60','10','0','756','0','0','1','0','0'),
('27737','595','3','1','0','0','2574.2','1166.63','126.089','4.44966','60','10','0','706','0','0','1','0','0'),
('27737','595','3','1','0','0','2564.78','1166.82','127.092','4.2266','60','10','0','756','0','0','1','0','0'),
('27737','595','3','1','0','0','2577.56','1158.41','126.385','4.07738','60','10','0','756','0','0','1','0','0'),
('27737','595','3','1','0','0','2567.93','1176.56','126.2','4.7489','60','10','0','706','0','0','1','0','0'),
('27737','595','3','1','0','0','2559.28','1189.46','126.642','4.73319','60','10','0','756','0','0','1','0','0'),
('27737','595','3','1','0','0','2554.14','1213.37','126.599','5.13845','60','10','0','706','0','0','1','0','0'),
('27737','595','3','1','0','0','2560.58','1218.48','125.281','4.97351','60','10','0','730','0','0','1','0','0'),
('27737','595','3','1','0','0','2570.2','1170.58','126.311','4.64365','60','10','0','756','0','0','1','0','0'),
('27729','595','3','1','0','0','2496.57','1354.66','132.217','5.13691','120','5','0','63000','0','0','1','0','0'),
('27729','595','3','1','0','0','2494.22','1365.17','130.812','5.15654','120','5','0','63000','0','0','1','0','0'),
('27729','595','3','1','0','0','2440.41','1434.46','131.456','5.69372','120','5','0','63000','0','0','1','0','0'),
('27729','595','3','1','0','0','2433.18','1421.13','130.644','0.046706','120','5','0','63000','0','0','1','0','0'),
('27734','595','3','1','0','0','2546.07','1239.17','125.945','5.07801','120','5','0','63000','0','0','1','0','0'),
('27734','595','3','1','0','0','2458.58','1426.22','131.056','5.42984','120','5','0','63000','0','0','1','0','0'),
('27736','595','3','1','0','0','2488.11','1364.91','130.402','5.35524','120','5','0','130330','0','0','1','0','0'),
('28199','595','3','1','0','0','2527.63','1267.59','128.168','5.12906','120','5','0','63000','0','0','1','0','0'),
('28199','595','3','1','0','0','2528.06','1284.34','128.877','5.14869','120','5','0','63000','0','0','1','0','0'),
('28199','595','3','1','0','0','2466.27','1414.57','130.977','5.18637','120','5','0','63000','0','0','1','0','0'),
('28200','595','3','1','0','0','2570.51','1181.4','125.809','4.61855','120','5','0','50400','44070','0','1','0','0'),
('28200','595','3','1','0','0','2560.45','1202.05','126.031','4.85417','120','5','0','50400','44070','0','1','0','0'),
('28200','595','3','1','0','0','2487.85','1373.29','130.236','5.078','120','5','0','50400','44070','0','1','0','0'),
('28200','595','3','1','0','0','2416.7','1416.52','130.379','0.191224','120','5','0','50400','44070','0','1','0','0'),
('28200','595','3','1','0','0','2424.42','1422.68','130.868','0.25327','120','5','0','50400','44070','0','1','0','0'),
('28201','595','3','1','0','0','2540.67','1254.82','126.274','4.97198','120','5','0','130330','0','0','1','0','0'),
('28201','595','3','1','0','0','2410.03','1417.19','130.577','0.191229','120','5','0','130330','0','0','1','0','0'),
('28249','595','3','1','0','0','2562.66','1177.9','126.716','4.77171','120','5','0','63000','0','0','1','0','0'),
('28249','595','3','1','0','0','2566.72','1190.41','125.837','4.7992','120','5','0','63000','0','0','1','0','0'),
('28249','595','3','1','0','0','2472.34','1404.76','130.752','5.20601','120','5','0','63000','0','0','1','0','0'),
('28249','595','3','1','0','0','2460.59','1413.26','130.46','5.4377','120','5','0','63000','0','0','1','0','0'),
('28249','595','3','1','0','0','2415.04','1423.52','131.111','0.214785','120','5','0','63000','0','0','1','0','0');
-- Target Fix.
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` IN (52480, 58825);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`) 
VALUES
(13, 52480, 18, 1, 27733),
(13, 58825, 18, 1, 27733);
-- Misc Update
UPDATE `gameobject` SET `spawntimesecs` = 86400 WHERE `id` IN (190663,193597);
UPDATE `creature_ai_scripts` SET `event_param3` = 10, `event_param4` = 10 WHERE `id` IN (2774302,2774303);
UPDATE `creature_template` SET `flags_extra` = `flags_extra`|128 WHERE `entry` = 20562;
UPDATE `creature` SET `spawnMask` = 3 WHERE `id` IN (27915,30997);
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|33554432|67108864|536870912 WHERE `entry` IN (26529,26530,26532,26533,31211,31212,31215,31217,32313);
UPDATE `creature_template` SET `dmg_multiplier` = 20 WHERE `entry` IN (31211,31212,31215,31217,32313);
-- Fix Culling Stratholme.
-- Remuevo Script De item para quest. SELECT * FROM  item_template WHERE ScriptName='arcane_disruptor'; Agregado por mi en commit anteriores.
UPDATE `item_template` SET `ScriptName`='' WHERE `entry`=37888;
-- Nuevos Script Para evento mas blizlike.
UPDATE `creature_template` SET `ScriptName`= 'npc_cos_chromie' WHERE `entry` IN (27915,26527);
UPDATE `creature_template` SET `ScriptName` = 'npc_cos_arcane_disruptor_target' WHERE `entry` = 30996;
-- Spawn Npc Faltante de evento. Infinite Corruptor solo se activara y vera si se cumple el tiempo.
DELETE FROM `creature` WHERE `id` IN (27915,32273) AND `map` =595;
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`,`MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
('27915','595','3','1','0','235','1813.56','1285.23','142.31','3.71074','300','0','0','17010','0','0','0','0','0'),
('32273','595','2','1','0','1839','2323.24','1294.86','130.681','4.74126','300','0','0','417911','0','0','0','0','0');
-- Fix CoS reward dungeon finder
UPDATE `instance_encounters` SET `creditType`=0, `creditEntry`=26533 WHERE `entry` IN (296, 300);

-- 02_[Dungeon]Hall_Of_Stone.sql
-- Hall Of Stone (HOS)
UPDATE `gameobject_template` SET `flags` = 4 WHERE `entry` IN (190586,193996);
UPDATE `gameobject` SET `spawnMask` = 1 WHERE `id` = 190586;
-- Spawn Chest (cofre)
DELETE FROM `gameobject` WHERE `id` = '193996';
INSERT INTO `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) 
VALUES ('193996','599','2','1','880.406','345.164','203.706','0','0','0','0','1','86400','0','1');
UPDATE `gameobject` SET `spawntimesecs` = 86400 WHERE `id` IN (190586,193996);
UPDATE `creature_template` SET `flags_extra` = `flags_extra`|2 , `unit_flags` = `unit_flags`|2 WHERE `entry` = 28055;
UPDATE `creature_template` SET `flags_extra`= `flags_extra`|2|128 , `InhabitType`= 4 WHERE `entry` IN (28234,28235,28237,28265,30897,30898,30899,31874,31875,31878);
UPDATE `creature_template` SET `modelid1` = 17200, `modelid2` = 17200 WHERE `entry` IN (28235,31874);
UPDATE `creature` SET `spawnMask` = 0 WHERE `guid` = 126794; -- Fix Spawnmaks mob
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|33554432|67108864|536870912 WHERE `entry` IN (27975,27977,27978,31384,31381,31386); -- Inmunidades
UPDATE `creature_template` SET `dmg_multiplier` = 16 WHERE `entry` = 31384;-- Update dmg
UPDATE `creature_template` SET `dmg_multiplier` = 22 WHERE `entry` = 31381;-- Update dmg

-- ScriptNames
UPDATE `creature_template` SET `ScriptName` = 'mob_dark_matter' WHERE `entry` = 28235;
UPDATE `creature_template` SET `ScriptName` = 'mob_searing_gaze' WHERE `entry` = 28265;

-- EAI Forged Iron Trogg  - Forged Iron Dwarf -  Dark Rune Protector - Dark Rune Stormcaller - Iron Golem Custodian
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (27979,27982,27983,27984,27985);
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) 
VALUES
('2798401','27984','0','0','100','3','7000','10000','7000','10000','11','12167','4','1','0','0','0','0','0','0','0','0','Dark Rune Stormcaller (Normal) - Cast Lightning Bolt'),
('2798402','27984','0','0','100','5','7000','10000','7000','10000','11','59863','4','1','0','0','0','0','0','0','0','0','Dark Rune Stormcaller (Heroic) - Cast Lightning Bolt'),
('2798403','27984','0','0','100','3','4000','7000','12000','15000','11','15654','4','0','0','0','0','0','0','0','0','0','Dark Rune Stormcaller (Normal) - Cast Shadow Word: Pain'),
('2798404','27984','0','0','100','5','4000','7000','12000','15000','11','59864','4','0','0','0','0','0','0','0','0','0','Dark Rune Stormcaller (Heroic) - Cast Shadow Word: Pain'),
('2798301','27983','0','0','100','7','7000','10000','10000','15000','11','42724','1','0','0','0','0','0','0','0','0','0','Dark Rune Protector - Cast Cleave'),
('2798302','27983','0','0','100','7','7000','10000','15000','20000','11','22120','4','2','0','0','0','0','0','0','0','0','Dark Rune Protector - Cast Charge'),
('2798501','27985','0','0','100','7','4000','7000','10000','15000','11','33661','1','0','0','0','0','0','0','0','0','0','Iron Golem Custodian - Cast Crush Armor'),
('2798502','27985','0','0','100','3','7000','10000','15000','20000','11','12734','0','0','0','0','0','0','0','0','0','0','Iron Golem Custodian (Normal) - Cast Ground Smash'),
('2798503','27985','0','0','100','5','7000','10000','15000','20000','11','59865','0','0','0','0','0','0','0','0','0','0','Iron Golem Custodian (Heroic) - Cast Ground Smash'),
('2798201','27982','0','0','100','3','4000','7000','10000','15000','11','50895','4','0','0','0','0','0','0','0','0','0','Forged Iron Dwarf (Normal) - Cast Lightning Tether'),
('2798202','27982','0','0','100','5','4000','7000','10000','15000','11','59851','4','0','0','0','0','0','0','0','0','0','Forged Iron Dwarf (Heroic) - Cast Lightning Tether'),
('2797901','27979','0','0','100','3','4000','7000','7000','12000','11','50900','4','0','0','0','0','0','0','0','0','0','Forged Iron Trogg (Normal) - Cast Lightning Shock'),
('2797902','27979','0','0','100','5','4000','7000','7000','12000','11','59852','4','0','0','0','0','0','0','0','0','0','Forged Iron Trogg (Heroic) - Cast Lightning Shock');

-- modify Dark Rune Protector melee damage
UPDATE `creature_template` SET `dmg_multiplier`=5 WHERE `entry`=27983;
UPDATE `creature_template` SET `dmg_multiplier`=10 WHERE `entry`=31876;

-- 03_[Dungeon]Obsidian_Sanctum.sql
-- Twilight Welp
UPDATE `creature_template` SET `minlevel`=81  , `maxlevel`=81, `Health_mod`=12 WHERE `entry` IN (30890,31214);
UPDATE `creature_template` SET `Health_mod`=29 WHERE `entry` IN (31540,31548);
-- Twilight Egg
UPDATE `creature_template` SET `minlevel`=80  , `maxlevel`=80, `Health_mod`=5 WHERE `entry` IN (30882,31204);
UPDATE `creature_template` SET `Health_mod`=15 WHERE `entry` IN (31539,31547);
UPDATE `creature_template` SET `ScriptName` = 'mob_twilight_eggs' WHERE `entry` = 31204;
-- Delete Portals
DELETE FROM `gameobject` WHERE `id`=193988;
-- Delete Trigger
DELETE FROM `creature` WHERE `id` = 31138;
-- Add Script to Portal
UPDATE `gameobject_template` SET `ScriptName` = 'go_twilight_portal' WHERE `entry` = 193988;
-- Add Script to Trash
UPDATE `creature_template` SET `ScriptName` = 'mob_obsidian_sanctum_trash' WHERE `entry` IN (30681,30680,30682,30453);
-- Fix some Immunitys
UPDATE `creature_template` SET `mechanic_immune_mask`=650854235 WHERE `entry` IN (30451,31520,28860,31311);
-- More Terrible Terrible Damage
UPDATE `creature_template` SET `dmg_multiplier` = 13 WHERE `entry` IN (30681,30680,30682,30453,31214,30890,31219,31218);
UPDATE `creature_template` SET `dmg_multiplier` = 26 WHERE `entry` IN (31001,30999,30998,31000,31548,31540,31543,31541);
UPDATE `creature_template` SET `dmg_multiplier` = 40 WHERE `entry` IN (30452,30451,30449,28860);
UPDATE `creature_template` SET `dmg_multiplier` = 80 WHERE `entry` IN (31535,31520,31534,31311);
UPDATE `creature_template` SET `dmgschool`=1 WHERE `entry` IN (30643,31317);

-- 04_[Dungeon]Gundrak.sql
-- Emotes Boss Drakkari Colossus - Boss Sladran. (commit 1296 61b4d8ec976c)
DELETE FROM `script_texts` WHERE `entry` IN (-1604008,-1604009,-1604010,-1604007,-1604014,-1604029);
INSERT INTO `script_texts` (`npc_entry`,`entry`,`content_default`,`sound`,`type`,`language`,`emote`,`comment`) 
VALUES
(29307,-1604008,'%s surges forward!',0,2,0,0,'Colossus EMOTE_SURGE'),
(29307,-1604009,'%s seep into the ground.',0,2,0,0,'Colossus EMOTE_SEEP'),
(29307,-1604010,'%s begins to glow faintly.',0,2,0,0,'Colossus EMOTE_GLOW'),
(29304,-1604007,'%s begins to cast Poison Nova!',0,3,0,0,'Sladran EMOTE_NOVA'),
(29305,-1604014,'I crush you, cockroaches!',14725,1,0,0,'Moorabi SAY_SLAY_1'),
(29305,-1604029,'%s transforms into a Mammoth!',14724,2,0,0,'Moorabi EMOTE_TRANSFORMED');
-- ScriptNames
UPDATE `creature_template` SET `ScriptName` = 'mob_snake_wrap' WHERE `entry` = '29742'; -- Serpientes para Archievent - Boss Sladran
-- Scriptname Galdarah Summon
UPDATE `creature_template` SET `ScriptName` = 'mob_rhino_spirit' WHERE `entry` = '29791';
-- Misc Updates
UPDATE `creature_template` SET `faction_A` = '16', `faction_H` = '16' WHERE `entry` IN ('29742','32218');-- Correcta Faction Snake - Boss Sladran
UPDATE `creature_template` SET `faction_A` = '16', `faction_H` = '16' WHERE `entry` IN ('29573','31367','29680','29713','30940','30943'); -- Faction Npc Drakkari Elemental - Slad'ran Viper - Slad'ran Constrictor
UPDATE `creature_template` SET `faction_A` = '7', `faction_H` = '7' WHERE `entry` = '29932'; -- Faction Npc Eck the Ferocious
DELETE FROM `creature_onkill_reputation` WHERE `creature_id` in ('29307','31365'); -- No reputacion boss Drakkari Colossus
UPDATE `creature_template` SET `lootid` = '0', `skinloot` = '80103' WHERE `entry` in ('29307','31365'); -- No loot Drakkari Colossus y Añadido Skinlot Heroic Mode
UPDATE `creature_template` SET `minlevel` = '78', `maxlevel` = '82' WHERE `entry` = '29791'; -- Rhino Spirit npclevel
-- Inmunidades Todos.
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|33554432|67108864|536870912 WHERE `entry` IN (29304,31370,29307,31365,29573,31367,29306,31368,29932,29305,30530); 
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask` &~ 256 &~ 2048 &~ 33554432 WHERE `entry` IN (29305,30530); 
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask` &~ 2097152 WHERE `entry` IN (29304,31370,29307,31365,29573,31367,29306,31368,29932,29305,30530);
-- Livin Mojos Update Spawnmask 
-- http://www.wowhead.com/npc=29830 "Living Mojo"
UPDATE `creature` SET `spawnMask` = '0' WHERE `guid` IN ('127071','127072','127073','127074','127075');
-- Vehicle ID (Experimental)
UPDATE `creature_template` SET `VehicleId` = '169' where `entry` IN ('29306','31368');
-- Update Damage =)
UPDATE `creature_template` SET `dmg_multiplier` = 17 WHERE `entry` IN (30936,30925,31370,31367,30942,30941,30932,30927,30930,30938,30929,30926,30933,30939);
UPDATE `creature_template` SET `dmg_multiplier` = 22 WHERE `entry` IN (29932,31368);
UPDATE `creature_template` SET `dmg_multiplier` = 30 WHERE `entry` = 31365;
UPDATE `creature_template` SET `baseattacktime` = 1000 WHERE `entry` IN (29305,30530);
UPDATE `creature_template` SET `baseattacktime` = 3500 WHERE `entry` IN (29307,31365);
-- Eai Update
-- Cobra Events
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = '29774';
DELETE FROM `creature_ai_scripts` WHERE `id` IN ('2982607','2982608');
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) values
('2977401','29774','4','0','100','2','0','0','0','0','11','55700','1','0','0','0','0','0','0','0','0','0','Spitting Cobra (Normal) - Cast Venom Spit on Aggro'),
('2977402','29774','4','0','100','4','0','0','0','0','11','59019','1','0','0','0','0','0','0','0','0','0','Spitting Cobra (Heroic) - Cast Venom Spit on Aggro'),
('2977403','29774','9','0','100','3','5','30','2300','5000','11','55700','1','0','0','0','0','0','0','0','0','0','Spitting Cobra (Normal) - Cast Venom Spit'),
('2977404','29774','9','0','100','5','5','30','2300','5000','11','59019','1','0','0','0','0','0','0','0','0','0','Spitting Cobra (Heroic) - Cast Venom Spit'),
('2977405','29774','9','0','100','3','0','5','5000','9000','11','55703','1','0','0','0','0','0','0','0','0','0','Spitting Cobra (Normal) - Cast Cobra Strike'),
('2977406','29774','9','0','100','5','0','5','5000','9000','11','59020','1','0','0','0','0','0','0','0','0','0','Spitting Cobra (Heroic) - Cast Cobra Strike'),
-- Drakkari Medice 
('2982607','29826','2','0','100','3','75','0','10000','16000','11','55597','0','0','0','0','0','0','0','0','0','0','Drakkari Medecine Man (Normal) - Cast Healing Wave on Self'),
('2982608','29826','2','0','100','5','75','0','10000','16000','11','58980','0','0','0','0','0','0','0','0','0','0','Drakkari Medecine Man (Heroic) - Cast Healing Wave on Self');
DELETE FROM `spell_script_names` WHERE `spell_id` IN (54849,59453);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(54849, 'spell_mojo_volley_trigger'),
(59453, 'spell_mojo_volley_trigger');
UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~512 WHERE `entry` IN (29307,31365);


-- ----------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------
-- 05_[Dungeon]Halls_Of_Lightning.sql
-- Halls_Of_Lightning
-- cleanup
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=126981;
UPDATE `creature_template` SET `dmg_multiplier`=15 WHERE `entry`=31533;
-- update waypoints
UPDATE `waypoint_data` SET `delay`=10000, `action`=1269811 WHERE `id`=1269810 AND `point` IN (5,14);
UPDATE `waypoint_data` SET `action`=1269810 WHERE `id`=1269810 AND `point` IN (2,11);
-- waypoint scripts
DELETE FROM `waypoint_scripts` WHERE `id` IN (1269810,1269811);
INSERT INTO `waypoint_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`,`guid`)
VALUES
(1269810,0,14,52092,1,0,0,0,0,0,2500),
(1269811,2,15,52098,1,0,0,0,0,0,2501);
-- bjarngrim's charge up
DELETE FROM `spell_script_names` WHERE `spell_id`=52098;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(52098, 'spell_bjarngrim_charge_up');
-- trigger's charge up
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=56458;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,56458,18,1,28586);
-- cast temporary electrical charge on hit
DELETE FROM `spell_scripts` WHERE `id`=56458;
INSERT INTO `spell_scripts` (`id`,`effIndex`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES
(56458,0,0,15,52092,2,0,0,0,0,0);
-- bjarngrim's stance auras
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (53790,53791,53792,-52658,-59795);
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(53790,41105,2, 'Bjarngrim - Defensive Aura'),
(53791,41107,2, 'Bjarngrim - Berserker Aura'),
(53792,41106,2, 'Bjarngrim - Battle Aura'),
(-52658,53337,0,'Static Overload'),
(-59795,59798,0,'Static Overload');
-- achievement: lightning struck
DELETE FROM `disables` WHERE `sourceType`=4 AND `entry`=6835;
DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=6835 AND `type`=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`) VALUES
(6835,11,0,0, 'achievement_lightning_struck');


-- 06_[Dungeon]Ahnkahet.sql
-- [AzjolNerub] Ahnkahet Fix commit 1095 (adaf61d85a7d) [WOWMadboxPC/Script]
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` IN (59465,56312,60342);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`) 
VALUES
(13, 59465, 18, 1, 30178),
(13, 56312, 18, 1, 29310),
(13, 60342, 18, 1, 29310);
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (57055, 56648);
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) 
VALUES
(57055, -56648, 1, 'Amanitar: Remove Potent Fungus'),
(56648, -57055, 1, 'Amanitar: Remove Mini');
UPDATE `creature_template` SET `scale` = 1 WHERE `entry` IN (31461, 31462);
UPDATE `creature_template` SET `dmg_multiplier` = 20, `flags_extra` = `flags_extra`|1 WHERE `entry` IN (31456,31463,31464,31465,31469);
UPDATE `creature_template` SET `dmg_multiplier` = 0.75 WHERE `entry` = 30625;
UPDATE `creature_template` SET `dmg_multiplier` = 1.5 WHERE `entry` = 31480;
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|4|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|33554432|67108864|536870912 WHERE `entry` IN (29308,29309,29310,29311,30385,30114,31456,31463,31464,31465,31469,31474,31473);
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask` &~ 4 WHERE `entry` IN (29310,31465);
DELETE FROM `spell_script_names` WHERE `spell_id`=56153;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(56153, 'spell_elder_nadox_guardian_aura');
DELETE FROM `disables` WHERE `sourceType`=4 AND `entry`=7317;
DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=7317 AND `type`=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`) VALUES
(7317,11,0,0, 'achievement_respect_your_elders');

-- 07_[Dungeon]Utgarde_Pinnacle.sql
-- Utgarde_Pinnacle
DELETE FROM `disables` WHERE `entry`=7598;
DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=7598 AND `type`=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(7598,11,0,0,'achievement_kings_bane');
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=51368;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,51368,18,1,26693);
UPDATE `instance_encounters` SET `creditEntry`=23980 WHERE `entry` IN (575,576);
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1575030 AND -1575000;
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
('0','-1575030','%s is within range of the harpoon launchers!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','3','0','0','skadi EMOTE_HARPOON_RANGE'),
('26693','-1575029','You motherless knaves! Your corpses will make fine morsels for my new drake!',NULL,NULL,'Ihr r?udigen Halunken! Eure Leichen werden feine Appetithappen f?r meinen neuen Drachen abgeben!',NULL,NULL,NULL,NULL,NULL,'13507','1','0','0','skadi SAY_DRAKE_DEATH'),
('26693','-1575028','ARGH! You call that... an attack? I\'ll... show... aghhhh...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13506','1','0','0','skadi SAY_DEATH'),
('26693','-1575027','I\'ll mount your skull from the highest tower!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13505','1','0','0','skadi SAY_KILL_3'),
('26693','-1575026','Not so brash now, are you?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13504','1','0','0','skadi SAY_KILL_2'),
('26693','-1575025','Mjor Na Ul Kaval!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13503','1','0','0','skadi SAY_KILL_1'),
('26693','-1575024','If one more harpoon touches my drake I\'ll flae my miserable heins.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13502','1','0','0','skadi SAY_DRAKE_HARPOON_2'),
('26693','-1575023','I ask for ... to kill them, yet all I get is feeble whelps! By Ye.. SLAUGHTER THEM!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13501','1','0','0','skadi SAY_DRAKE_HARPOON_1'),
('26693','-1575022','Cleanse our sacred halls with flame!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13500','1','0','0','skadi SAY_DRAKEBREATH_3'),
('26693','-1575021','Go now! Leave nothing but ash in your wake!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13499','1','0','0','skadi SAY_DRAKEBREATH_2'),
('26693','-1575020','Sear them to the bone!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13498','1','0','0','skadi SAY_DRAKEBREATH_1'),
('26693','-1575019','What mongrels dare intrude here? Look alive, my brothers! A feast for the one that brings me their heads!',NULL,NULL,'Welche Hunde wagen es, hier einzudringen? Auf sie, meine Br?der! Ein Fest f?r den, der mir ihre K?pfe bringt!',NULL,NULL,NULL,NULL,NULL,'13497','1','0','0','skadi SAY_AGGRO'),
('26687','-1575018',' ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13467','1','0','0','gortok SAY_DEATH'),
('26687','-1575017','An easy task!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13466','1','0','0','gortok SAY_SLAY_2'),
('26687','-1575016','You die! That what master wants!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13465','1','0','0','gortok SAY_SLAY_1'),
('26687','-1575015','What this place? I will destroy you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13464','1','0','0','gortok SAY_AGGRO'),
('26668','-1575014','Nooo! I did not come this far... to...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13855','1','0','0','svala SAY_DEATH'),
('26668','-1575013','Any last words?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13854','1','0','0','svala SAY_SACRIFICE_5'),
('26668','-1575012','Yor-guul mak!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13853','1','0','0','svala SAY_SACRIFICE_4'),
('26668','-1575011','Your end is inevitable.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13852','1','0','0','svala SAY_SACRIFICE_3'),
('26668','-1575010','Go now to my master.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13851','1','0','0','svala SAY_SACRIFICE_2'),
('26668','-1575009','Your death approaches.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13850','1','0','0','svala SAY_SACRIFICE_1'),
('26668','-1575008','Another soul for my master.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13848','1','0','0','svala SAY_SLAY_3'),
('26668','-1575007','Your will is done, my king.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13847','1','0','0','svala SAY_SLAY_2'),
('26668','-1575006','You were a fool to challenge the power of the Lich King!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13845','1','0','0','svala SAY_SLAY_1'),
('26668','-1575005','I will vanquish your soul!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13842','1','0','0','svala SAY_AGGRO'),
('0','-1575004','I will be happy to slaughter them in your name! Come, enemies of the Scourge! I will show you the might of the Lich King!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13858','1','0','0','svala SAY_INTRO_5'),
('0','-1575003','Your first test awaits you. Destroy our uninvited guests.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'14733','1','0','0','svala SAY_INTRO_4_ARTHAS'),
('0','-1575002','The sensation is... beyond my imagining. I am yours to command, my king.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13857','1','0','0','svala SAY_INTRO_3'),
('0','-1575001','Your sacrifice is a testament to your obedience. Indeed you are worthy of this charge. Arise, and forever be known as Svala Sorrowgrave!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'14732','1','0','0','svala SAY_INTRO_2_ARTHAS'),
('0','-1575000','My liege! I have done as you asked, and now beseech you for your blessing!',NULL,NULL,'Mein Meister! Ich tat, was Ihr verlangtet, und ersuche Euch um Euren Segen!',NULL,NULL,NULL,NULL,NULL,'13856','1','0','0','svala SAY_INTRO_1');


-- 08_[Dungeon]Draktharon_Keep.sql
UPDATE creature_template SET unit_flags = unit_flags | 2 WHERE entry IN (26620,31339);
-- Fix Drak'Tharon Keep reward for DF.
UPDATE `instance_encounters` SET `creditType` = '0', `creditEntry` = '26632' WHERE `entry` IN ('376', '375')

-- 09_[Dungeon]Violet_Hold.sql
-- Violet Hold
UPDATE creature_template SET scriptname = 'npc_void_sentry' WHERE entry = 29364;

-- 10_[Dungeon]AzjolNerub.sql
-- boss melee dmg
UPDATE `creature_template` SET `dmg_multiplier` = 20, `flags_extra` = `flags_extra`|1 WHERE `entry` IN (31612,31611,31610);
-- immunitys
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|4|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|33554432|67108864|536870912 WHERE `entry` IN (28684,28921,29120,31612,31611,31610);
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|4|8|16|32|64|128|512|1024|4096|8192|65536|131072|524288|4194304|8388608|67108864|536870912 WHERE `entry` IN (28729,28730,28731,31615,31616,31617);
-- scriptnames
UPDATE `creature_template` SET `ScriptName` = 'npc_web_wrap' WHERE `entry` = 28619;
UPDATE `creature_template` SET `ScriptName` = 'npc_krikthir_watcher' WHERE `entry` IN (28729,28730,28731);
UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'npc_anubar_crusher' WHERE `entry` = 28922;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_hadronox_nerubian' WHERE `entry` IN (29062,29063,29064);
-- update positions to prevent chain-aggro (custom)
UPDATE `creature` SET `position_x` = 506.178, `position_y` = 669.927, `position_z` = 776.306, `orientation` = 0.855211 WHERE `guid` = 127225;
UPDATE `creature` SET `position_x` = 500.963, `position_y` = 667.828, `position_z` = 776.306, `orientation` = 0.83428 WHERE `guid` = 127233;
-- set swarm target entry
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` IN (52438, 52449);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`) 
VALUES
(13, 52438, 18, 1, 28684),
(13, 52449, 18, 1, 28684);
-- remove some db spawns (should be spawned by script)
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (29062,29063,29064,29096,29097,29098);
DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id` IN (29062,29063,29064));
DELETE FROM `linked_respawn` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id` IN (29062,29063,29064));
DELETE FROM `creature` WHERE `id` IN (29062,29063,29064);
DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id` IN (29096,29097,29098));
DELETE FROM `linked_respawn` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id` IN (29096,29097,29098));
DELETE FROM `creature` WHERE `id` IN (29096,29097,29098);
-- anubarak add scripts
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` IN (29213, 29216, 29217);
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (29213, 29216, 29217);
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
('2921301','29213','4','0','100','3','0','0','0','0','11','53602','1','0','0','0','0','0','0','0','0','0','Anubar Darter - Cast Dart (Normal)'),
('2921302','29213','4','0','100','5','0','0','0','0','11','59349','1','0','0','0','0','0','0','0','0','0','Anubar Darter - Cast Dart (Heroic)'),

('2921601','29216','0','0','100','7','5000','10000','7000','15000','11','52532','1','0','0','0','0','0','0','0','0','0','Anubar Guardian - Cast Strike'),
('2921602','29216','0','0','100','3','10000','10000','10000','15000','11','53618','1','0','0','0','0','0','0','0','0','0','Anubar Guardian - Cast Sunder Armor (Normal)'),
('2921603','29216','0','0','100','5','10000','10000','10000','15000','11','59350','1','0','0','0','0','0','0','0','0','0','Anubar Guardian - Cast Sunder Armor (Heroic)'),

('2921701','29217','0','0','100','3','5000','7000','4000','6000','11','53617','1','0','0','0','0','0','0','0','0','0','Anubar Venomancer - Cast Poison Bolt (Normal)'),
('2921702','29217','0','0','100','5','5000','7000','4000','6000','11','59359','1','0','0','0','0','0','0','0','0','0','Anubar Venomancer - Cast Poison Bolt (Heroic)'),
('2921703','29217','0','0','100','3','7000','10000','10000','12000','11','53616','1','2','0','0','0','0','0','0','0','0','Anubar Venomancer - Cast Poison Bolt Volley (Normal)'),
('2921704','29217','0','0','100','5','7000','10000','10000','12000','11','59360','1','2','0','0','0','0','0','0','0','0','Anubar Venomancer - Cast Poison Bolt Volley (Heroic)');
-- achievements
DELETE FROM `disables` WHERE `sourceType`=4 AND `entry`=4244;
DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=4244 AND `type`=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(4244,11,0,0,'achievement_hadronox_denied');
-- spell scriptnames
DELETE FROM `spell_script_names` WHERE `spell_id` IN (53030,59417);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(53030, 'spell_hadronox_leech_poison'),
(59417, 'spell_hadronox_leech_poison');

-- 11_[Dungeon]Icecrown_Citadel.sql
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
UPDATE `creature_template` SET  `mindmg` =  '1509',`maxdmg` =  '2683',`dmg_multiplier` =  '38' WHERE `entry` =36612;-- Valor Anterior 35
-- Lady Deathwhisper
UPDATE `creature_template` SET  `mindmg` =  '1509',`maxdmg` =  '2683',`dmg_multiplier` =  '10.5' WHERE  `entry` =36855;-- Valor Anterior 7.5
-- Deathbringer
UPDATE `creature_template` SET  `mindmg` =  '1509',`maxdmg` =  '2683',`dmg_multiplier` =  '38' WHERE `entry` =37813;-- Valor Anterior 35
-- Rotface
UPDATE `creature_template` SET  `mindmg` =  '1509',`maxdmg` =  '2683',`dmg_multiplier` =  '38' WHERE `entry` =36627;-- Valor Anterior 35
-- 36899 Bigg Ozze
UPDATE `creature_template` SET  `mindmg` =  '1509',`maxdmg` =  '2683',`dmg_multiplier` =  '9.5' WHERE  `entry` =36899;-- Valor Anterior 7.5
-- Festergut
UPDATE `creature_template` SET  `mindmg` =  '1509',`maxdmg` =  '2683',`dmg_multiplier` =  '38' WHERE `entry` =36626;-- Valor Anterior 35
-- Sister Svalna
UPDATE `creature_template` SET  `mindmg` =  '1509',`maxdmg` =  '2683',`dmg_multiplier` =  '10.5' WHERE  `entry` =37126;-- Valor Anterior 7.5


-- 12_[Dungeon]Eye_Of_Eternity.sql
-- Spawns
DELETE FROM `creature` WHERE `id` IN (30090, 22517);
-- Spawn Focusing Iris (Normal/Heroic)
DELETE FROM `gameobject` WHERE `id` IN (193958, 193960) AND `map` = 616;
INSERT INTO `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`)
VALUES 
(193958, 616, 1, 1, 1154.35, 1300.87, 266.172, 5.34356, 0, 0, 0, 1, 180, 0, 1),
(193960, 616, 2, 1, 1154.35, 1300.87, 266.172, 5.34356, 0, 0, 0, 1, 180, 0, 1);
-- Update Position Npcs.
UPDATE `creature` SET `position_x` = `position_x` + 400  WHERE `map` = 616;
UPDATE `gameobject` SET `position_x` = `position_x` + 400 WHERE `map` = 616;
UPDATE `areatrigger_teleport` SET `target_position_x` = `target_position_x` + 400 WHERE `id` = 5290;
-- Update Stat Spell Wyrmrest skytalon
UPDATE `creature_template` SET 
`spell1` = 56091,-- Flammenstachel
`spell2` = 56092,-- Flammenhuelle
`spell3` = 57090,-- Wiederbeleben
`spell4` = 57143,-- Explosion des Lebens
`spell5` = 57108,-- Flammenschild
`spell6` = 57092 -- Blitztempo
WHERE `entry` IN (30161, 31752);
-- Update Malygos (BOSS)
UPDATE `creature` SET `spawndist` = 0,`MovementType` = 0 WHERE `id` = 28859;
UPDATE `creature_template` SET `difficulty_entry_1` = 31734, `unit_flags` = 770,`ScriptName` = 'boss_malygos' WHERE `entry` = 28859;
UPDATE `creature_template` SET `name` = 'Malygos (1)',`speed_run` = 2.85714, `speed_walk` = 4, `unit_class` = 2, `unit_flags` = 770, `flags_extra` = 1 WHERE `entry` = 31734;
-- Nexus lord
UPDATE `creature_template` SET `ScriptName` = 'npc_nexus_lord' WHERE `entry` = 30245;
-- Scion of eternity
UPDATE `creature_template` SET `ScriptName` = 'npc_scion_of_eternity' WHERE `entry` = 30249;
-- Hover discs
UPDATE `creature_template` SET `ScriptName` = 'npc_hover_disc' WHERE `entry` = 30248;
UPDATE `creature_template` SET `VehicleId` = 283 WHERE `entry` = 31748;
UPDATE `creature_template` SET `VehicleId` = 223 WHERE `entry` = 31749;
-- Portal (malygos)
UPDATE `creature_template` SET `unit_flags` = 770, `flags_extra` = 2 WHERE `entry` = 30118;
-- Ignore threat
UPDATE `creature_template` SET `unit_flags` = 768 WHERE `entry` IN (30234, 31748);
-- Power spark
UPDATE `creature_template` SET `ScriptName` = 'npc_power_spark' WHERE `entry` = 30084;
-- Vortex
UPDATE `creature_template` SET `ScriptName` = 'npc_vortex_vehicle' WHERE `entry` = 30090;
-- Focusing iris
UPDATE `gameobject_template` SET `ScriptName` = 'go_focusing_iris' WHERE `entry` IN (193958, 193960);
UPDATE `creature_template` SET `ScriptName`='npc_alexstrasza' WHERE entry=32295;
-- Can fly
UPDATE `creature_template` SET `InhabitType` = 7 WHERE `entry` IN (28859, 30090, 30118, 30234, 30248, 30592, 31734, 31748, 31749);
-- Immunitys
-- Malygos, Nexus lord, Scion of eternity
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854395 WHERE `entry` IN (28859, 31734, 30245, 31750, 30249, 31751);
-- Instance Script
UPDATE `instance_template` SET `script` = 'instance_eye_of_eternity', `allowMount` = 0 WHERE `map` = 616;
-- Spell targets
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` IN (56505, 56152, 59099);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) 
VALUES 
(13, 56152, 18, 1, 28859),-- Power spark (malygos)
(13, 56505, 18, 1, 30334),-- Surge of power (deep breath)
(13, 59099, 18, 1, 0);-- Destroy platform event
-- Vehicle onclick
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (30234);
INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`quest_start`,`quest_start_active`,`quest_end`,`cast_flags`,`aura_required`,`aura_forbidden`,`user_type`) VALUES
(30234,46598,0,0,0,1,0,0,0);-- Malygos player disc
DELETE FROM `spell_script_names` WHERE `spell_id`=60936;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(60936, 'spell_surge_of_power_targeting');
UPDATE `creature_template` SET `dmg_multiplier`=40 WHERE `entry`=28859;
UPDATE `creature_template` SET `dmg_multiplier`=70 WHERE `entry`=31734;
UPDATE `creature_template` SET `dmg_multiplier`=20 WHERE `entry`=30245;
UPDATE `creature_template` SET `dmg_multiplier`=30 WHERE `entry`=31750;
UPDATE `gameobject_loot_template` SET `item`=40753 WHERE `entry`=26097 AND `item`=47241;
UPDATE `npc_spellclick_spells` SET `spell_id`=46598 WHERE `npc_entry`=31748;
-- Arcane Barrage
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=56397;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(56397,63934,1, 'Arcane Barrage - Arcane Barrage Damage');
UPDATE `creature_template` SET `lootid`=32448 WHERE `entry`=32448;
-- Creatures
UPDATE `creature` SET `position_x`=754.26 WHERE `guid`=132302;
UPDATE `creature` SET `position_x`=754.29 WHERE `guid`=132303;
UPDATE `creature` SET `position_x`=652.42 WHERE `guid`=132309;
UPDATE `creature` SET `position_x`=847.67 WHERE `guid`=132310;
UPDATE `creature` SET `position_x`=647.68 WHERE `guid`=132311;
UPDATE `creature` SET `position_x`=843.18 WHERE `guid`=132312;
UPDATE `creature` SET `position_x`=808.53 WHERE `guid`=132313;
UPDATE `creature` SET `position_x`=754.54 WHERE `guid`=132314;
-- GameObjects
UPDATE `gameobject` SET `position_x`=764.56 WHERE `guid`=151793;
UPDATE `gameobject` SET `position_x`=764.56 WHERE `guid`=151792;
UPDATE `gameobject` SET `position_x`=754.35 WHERE `guid`=67449;
UPDATE `gameobject` SET `position_x`=724.68 WHERE `guid`=67450;
UPDATE `gameobject` SET `position_x`=754.35 WHERE `guid`=400001;
UPDATE `gameobject` SET `position_x`=754.35 WHERE `guid`=400000;
-- Areatrigger
UPDATE `areatrigger_teleport` SET `target_position_x`=727.94 WHERE `id`=5290;
-- Los disable
DELETE FROM `disables` WHERE `sourceType`=6 AND `entry`=616;
INSERT INTO `disables` VALUES (6, 616, 4, 0, 0, "Disable Eye of Eternity LOS");
UPDATE `creature_template` SET `dmg_multiplier`=40 WHERE `entry`=28859;
UPDATE `creature_template` SET `dmg_multiplier`=70 WHERE `entry`=31734;
UPDATE `creature_template` SET `dmg_multiplier`=20 WHERE `entry`=30245;
UPDATE `creature_template` SET `dmg_multiplier`=30 WHERE `entry`=31750;
UPDATE `gameobject_loot_template` SET `item`=40753 WHERE `entry`=26097 AND `item`=47241;
UPDATE `npc_spellclick_spells` SET `spell_id`=46598 WHERE `npc_entry`=31748;
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|2 WHERE `entry`=30282;
UPDATE `quest_start_scripts` SET `datalong2`=3 WHERE `id`=12886;
-- Captive Proto-Drake
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=29708;
INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`quest_start`,`quest_start_active`,`quest_end`,`cast_flags`,`aura_required`,`aura_forbidden`,`user_type`)
VALUES (29708,43671,12856,1,12856,1,0,0,0);


-- 13_[Dungeon]Halls_Of_Reflection.sql
-- Halls of Reflection
-- Creature Templates
START TRANSACTION;
SET @NPC_UTHER              := 37225;
SET @NPC_JAINA_INTRO        := 37221;
SET @NPC_SYLVANA_INTRO      := 37223;
SET @NPC_JAINA_OUTRO        := 36955;
SET @NPC_SYLVANA_OUTRO      := 37554;
SET @NPC_FROSTWORN_GENERAL  := 36723;
SET @NPC_LICH_KING_EVENT    := 36954;
SET @NPC_LICH_KING_BOSS     := 37226;

UPDATE `creature_template` SET  `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|33554432|536870912,`speed_walk`='1.8', `speed_run`='2.0' WHERE `entry` IN (@NPC_LICH_KING_EVENT, @NPC_LICH_KING_BOSS);
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|33554432|536870912,`AIName`='', `Scriptname`='npc_frostworn_general' WHERE `entry`=@NPC_FROSTWORN_GENERAL;

UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|33554432|536870912,`AIName`='', `Scriptname`='npc_jaina_and_sylvana_hor_part2' WHERE `entry` IN (@NPC_JAINA_OUTRO, @NPC_SYLVANA_OUTRO);
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|33554432|536870912,`AIName`='', `Scriptname`='boss_lich_king_hor' WHERE `entry`=@NPC_LICH_KING_BOSS;
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|33554432|536870912,`AIName`='', `Scriptname`='npc_raging_gnoul' WHERE `entry`=36940;
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|33554432|536870912,`AIName`='', `Scriptname`='npc_risen_witch_doctor' WHERE `entry`=36941;
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|33554432|536870912,`AIName`='', `Scriptname`='npc_abon' WHERE `entry`=37069;
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|33554432|536870912,`AIName`='', `Scriptname`='npc_queldelar' WHERE `entry`=37158;

UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|33554432|536870912,`unit_flags` = 32784, `AIName` = '', `ScriptName` = 'npc_spiritual_reflection', `difficulty_entry_1` = 37721 WHERE `entry` = 37107;
UPDATE `creature_template` SET `minlevel` = 80, `maxlevel` = 80, `unit_flags` = 32784, `mindmg` = '422', `maxdmg` = '586', `attackpower` = '642', `dmg_multiplier` = '13' WHERE `entry` = 37721;
UPDATE `creature_template` SET `flags_extra` = 1 WHERE `entry` = @NPC_FROSTWORN_GENERAL;
UPDATE `creature_template` SET `flags_extra` = 257 WHERE `entry` = @NPC_FROSTWORN_GENERAL;

UPDATE `creature_template` SET `scale`='0.8', `equipment_id`='1221' WHERE `entry` IN (@NPC_JAINA_INTRO, @NPC_JAINA_OUTRO);
UPDATE `creature_template` SET `equipment_id`='1290' WHERE `entry` IN (@NPC_SYLVANA_INTRO, @NPC_SYLVANA_OUTRO);
UPDATE `creature_template` SET `equipment_id`='0' WHERE `entry`=@NPC_LICH_KING_EVENT;
UPDATE `creature_template` SET `scale`='0.8' WHERE `entry` IN (@NPC_UTHER, @NPC_SYLVANA_INTRO, @NPC_LICH_KING_BOSS, @NPC_SYLVANA_OUTRO);

-- Creature Spawns
SET @GUID_CREATURE := 202284;
DELETE FROM `creature` WHERE map=668 AND `id` IN (14881, 36723, 37221, 37704, 37906, 38112, 38113);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@GUID_CREATURE+1,'37704','668','3','1','17612','0','5309.08','2006.32','711.422','3.93429','604800','0','0','12600','0','0','0','0','0'),
(@GUID_CREATURE+2,'14881','668','3','1','1160','0','5337.6','2012.14','707.695','3.52509','604800','0','0','8','0','0','0','0','0'),
(@GUID_CREATURE+3,'14881','668','3','1','2536','0','5268.91','1969.17','707.696','0.321519','604800','0','0','8','0','0','0','0','0'),
(@GUID_CREATURE+4,'14881','668','3','1','1160','0','5386.99','2080.5','707.695','4.67797','604800','0','0','8','0','0','0','0','0'),
(@GUID_CREATURE+5,'38112','668','3','1','0','0','5271.65','2042.5','709.32','5.51217','604800','0','0','377468','0','0','0','0','0'),
(@GUID_CREATURE+6,'38113','668','3','1','0','0','5344.75','1972.87','709.319','2.33445','604800','0','0','539240','0','0','0','0','0'),
(@GUID_CREATURE+7,'37221','668','3','1','0','0','5236.67','1929.91','707.695','0.837758','604800','0','0','5040000','881400','0','0','0','0'),
(@GUID_CREATURE+8,'36723','668','3','1','0','2432','5413.9','2116.65','707.695','3.94765','604800','0','0','315000','0','0','0','0','0');

UPDATE `gameobject_template` SET `faction`='1375' WHERE `entry` IN (197341, 202302, 201385, 201596);

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1594540 AND -1594430;
INSERT INTO `script_texts` (`entry`,`content_default`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(-1594473, 'Have reached your allies, Jaina, as promised. All will be powerful agents of the Scourge.', '?????? ????????! ??? ???? ?? ????? ????? ????! ?????? ?? ???? ???????, ?????? ?????? ? ???? ????????!', 17229,1,0,0, '67234'),
(-1594474, 'Do not make the same mistake, Sylvanas. This time there will be no escape. I will serve in death!', '? ?? ??????? ??????? ??????, ????????. ?? ???? ??? ???? ?? ????????. ?? ?? ????????? ????? ??????? ? ?????? ???? ???? ?????? ????????!', 17228,1,0,0, '67234'),
-- SCENE - Hall Of Reflection (Extro) - PreEscape
(-1594477, 'Your allies have arrived, Jaina, just as you promised. You will all become powerful agents of the Scourge.', '???? ???????? ???????, ??????! ??? ?? ? ???????... ??-??-??-??... ??? ?? ??????? ???????? ????????? ?????...', 17212,1,0,0, '67234'),
(-1594478, 'I will not make the same mistake again, Sylvanas. This time there will be no escape. You will all serve me in death!', '? ?? ??????? ??????? ??????, ????????! ?? ???? ??? ???? ?? ????????. ?? ??? ?????? ??????? ??? ????? ??????...', 17213,1,0,0, '67234'),
(-1594479, 'He is too powerful, we must leave this place at once! My magic will hold him in place for only a short time! Come quickly, heroes!', '?? ??????? ?????. ?? ?????? ????????? ?? ???? ??? ????? ??????. ??? ????? ???????? ??? ?????????, ??????? ?????...', 16644,0,0,1, '67234'),
(-1594480, 'He\'s too powerful! Heroes, quickly, come to me! We must leave this place immediately! I will do what I can do hold him in place while we flee.', '?? ??????? ?????. ????? ??????, ?? ????. ?? ?????? ????????? ?????? ??????????. ? ?????????? ??? ?????????, ???? ?? ????? ???????.', 17058,0,0,1, '67234'),
-- SCENE - Hall Of Reflection (Extro) - Escape
(-1594481, 'Death\'s cold embrace awaits.', '?????? ???????????? ??????? ???????!', 17221,1,0,0, '67234'),
(-1594482, 'Rise minions, do not left them us!', '?????????? ???????????, ?? ????? ?? ???????!', 17216,1,0,0, '67234'),
(-1594483, 'Minions sees them. Bring their corpses back to me!', '???????? ??! ????????? ??? ?? ????!', 17222,1,0,0, '67234'),
(-1594484, 'No...', '??????? ???!', 17214,1,0,0, '67234'),
(-1594485, 'All is lost!', '??????? ? ???????.', 17215,1,0,0, '67234'),
(-1594486, 'There is no escape!', '?????? ??????!', 17217,1,0,0, '67234'),
(-1594487, 'I will destroy this barrier. You must hold the undead back!', '? ??????? ??? ????????, ? ?? ??????????? ?????? ?? ??????????!', 16607,1,0,0, '67234'),
(-1594488, 'No wall can hold the Banshee Queen! Keep the undead at bay, heroes! I will tear this barrier down!', '??????? ????? ?? ??????? ???????? ??????. ??????? ?????? ?? ??????????, ? ??????? ??? ????????.', 17029,1,0,0, '67234'),
(-1594489, 'Another ice wall! Keep the undead from interrupting my incantation so that I may bring this wall down!', '????? ??????? ?????... ? ??????? ??, ?????? ?? ????? ?????? ???????? ??? ??????????...', 16608,1,0,0, '67234'),
(-1594490, 'Another barrier? Stand strong, champions! I will bring the wall down!', '??? ???? ????????. ????????? ?????! ? ??????? ??? ?????!', 17030,1,0,0, '67234'),
(-1594491, 'Succumb to the chill of the grave.', '?????????? ????????? ??????!', 17218,1,0,0, '67234'),
(-1594492, 'Another dead end.', '?? ? ???????!', 17219,1,0,0, '67234'),
(-1594493, 'How long can you fight it?', '??? ????? ?? ??????? ???????????????', 17220,1,0,0, '67234'),
(-1594494, 'This playing with us. I\'ll Show what happens to ice when meeting with fire!', '?? ? ???? ??????. ?  ?????? ??? ??? ?????? ????? ??? ??????????? ?? ?????!', 16609,0,0,0, '67234'),
(-1594495, 'Your barriers can\'t hold us back much longer, monster. I will shatter them all!', '???? ???????? ?????? ?? ???????? ???, ????????. ? ????? ?? ? ????!', 16610,1,0,0, '67234'),
(-1594496, 'I grow tired of these games, Arthas! Your walls can\'t stop me!', '? ?????? ?? ???? ??? ?????. ???? ????? ?? ????????? ????!', 17031,1,0,0, '67234'),
(-1594497, 'You won\'t impede our escape, fiend. Keep the undead off me while I bring this barrier down!', '?? ?? ????????? ??? ????, ??????. ??????????? ??????, ? ? ???????? ??? ????????.', 17032,1,0,0, '67234'),
(-1594498, 'There\'s an opening up ahead. GO NOW!', '? ???? ?????, ??????!', 16645,1,0,0, '67234'),
(-1594499, 'We\'re almost there... Don\'t give up!', '?? ????? ?????????, ?? ??????????!', 16646,1,0,0, '67234'),
(-1594500, 'There\'s an opening up ahead. GO NOW!', '? ???? ?????, ??????!', 17059,1,0,0, '67234'),
(-1594501, 'We\'re almost there! Don\'t give up!', '?? ????? ?????????, ?? ??????????!', 17060,1,0,0, '67234'),
(-1594502, 'It... It\'s a dead end. We have no choice but to fight. Steel yourself heroes, for this is our last stand!', '?????? ?????? ??????. ?????? ??? ???????? ?????????. ??? ???? ????????? ?????!', 16647,1,0,0, '67234'),
(-1594503, 'BLASTED DEAD END! So this is how it ends. Prepare yourselves, heroes, for today we make our final stand!', '????????? ?????, ?????? ??? ?????????? ?????. ?????????? ?????, ??? ???? ????????? ?????.', 17061,1,0,0, '67234'),
(-1594504, 'Nowhere to run! You\'re mine now...', '??-??-??... ?????? ??????. ?????? ?? ???!', 17223,1,0,0, '67234'),
(-1594505, 'Soldiers of Lordaeron, rise to meet your master\'s call!', '??????? ?????????, ?????????? ?? ???? ?????????!', 16714,1,0,0, '67234'),
(-1594506, 'The master surveyed his kingdom and found it... lacking. His judgement was swift and without mercy. Death to all!', '???????? ???????? ???? ??????????? ? ??????? ??? ????????! ??? ??? ??? ??????? ? ??????? - ??????? ???? ??????!', 16738,1,0,0, '67234'),
-- FrostWorn General
(-1594519, 'You are not worthy to face the Lich King!', '?? ?????????? ????????? ????? ??????? - ?????!', 16921,1,0,0, '67234'),
(-1594520, 'Master, I have failed...', '????????... ? ?????? ???...', 16922,1,0,0, '67234');

-- Waipoints to escort event on Halls of reflection

DELETE FROM script_waypoint WHERE entry IN (@NPC_JAINA_OUTRO,@NPC_LICH_KING_BOSS,@NPC_SYLVANA_OUTRO);
INSERT INTO script_waypoint VALUES
-- Jaina

   (@NPC_JAINA_OUTRO, 0, 5587.682,2228.586,733.011, 0, 'WP1'),
   (@NPC_JAINA_OUTRO, 1, 5600.715,2209.058,731.618, 0, 'WP2'),
   (@NPC_JAINA_OUTRO, 2, 5606.417,2193.029,731.129, 0, 'WP3'),
   (@NPC_JAINA_OUTRO, 3, 5598.562,2167.806,730.918, 0, 'WP4 - Summon IceWall 01'),
   (@NPC_JAINA_OUTRO, 4, 5556.436,2099.827,731.827, 0, 'WP5 - Spell Channel'),
   (@NPC_JAINA_OUTRO, 5, 5543.498,2071.234,731.702, 0, 'WP6'),
   (@NPC_JAINA_OUTRO, 6, 5528.969,2036.121,731.407, 0, 'WP7'),
   (@NPC_JAINA_OUTRO, 7, 5512.045,1996.702,735.122, 0, 'WP8'),
   (@NPC_JAINA_OUTRO, 8, 5504.490,1988.789,735.886, 0, 'WP9 - Spell Channel'),
   (@NPC_JAINA_OUTRO, 9, 5489.645,1966.389,737.653, 0, 'WP10'),
   (@NPC_JAINA_OUTRO, 10, 5475.517,1943.176,741.146, 0, 'WP11'),
   (@NPC_JAINA_OUTRO, 11, 5466.930,1926.049,743.536, 0, 'WP12'),
   (@NPC_JAINA_OUTRO, 12, 5445.157,1894.955,748.757, 0, 'WP13 - Spell Channel'),
   (@NPC_JAINA_OUTRO, 13, 5425.907,1869.708,753.237, 0, 'WP14'),
   (@NPC_JAINA_OUTRO, 14, 5405.118,1833.937,757.486, 0, 'WP15'),
   (@NPC_JAINA_OUTRO, 15, 5370.324,1799.375,761.007, 0, 'WP16'),
   (@NPC_JAINA_OUTRO, 16, 5335.422,1766.951,767.635, 0, 'WP17 - Spell Channel'),
   (@NPC_JAINA_OUTRO, 17, 5311.438,1739.390,774.165, 0, 'WP18'),
   (@NPC_JAINA_OUTRO, 18, 5283.589,1703.755,784.176, 0, 'WP19'),
   (@NPC_JAINA_OUTRO, 19, 5260.400,1677.775,784.301, 3000, 'WP20'),
   (@NPC_JAINA_OUTRO, 20, 5262.439,1680.410,784.294, 0, 'WP21'),
   (@NPC_JAINA_OUTRO, 21, 5260.400,1677.775,784.301, 0, 'WP22'),

-- Sylvana

   (@NPC_SYLVANA_OUTRO, 0, 5587.682,2228.586,733.011, 0, 'WP1'),
   (@NPC_SYLVANA_OUTRO, 1, 5600.715,2209.058,731.618, 0, 'WP2'),
   (@NPC_SYLVANA_OUTRO, 2, 5606.417,2193.029,731.129, 0, 'WP3'),
   (@NPC_SYLVANA_OUTRO, 3, 5598.562,2167.806,730.918, 0, 'WP4 - Summon IceWall 01'),
   (@NPC_SYLVANA_OUTRO, 4, 5556.436,2099.827,731.827, 0, 'WP5 - Spell Channel'),
   (@NPC_SYLVANA_OUTRO, 5, 5543.498,2071.234,731.702, 0, 'WP6'),
   (@NPC_SYLVANA_OUTRO, 6, 5528.969,2036.121,731.407, 0, 'WP7'),
   (@NPC_SYLVANA_OUTRO, 7, 5512.045,1996.702,735.122, 0, 'WP8'),
   (@NPC_SYLVANA_OUTRO, 8, 5504.490,1988.789,735.886, 0, 'WP9 - Spell Channel'),
   (@NPC_SYLVANA_OUTRO, 9, 5489.645,1966.389,737.653, 0, 'WP10'),
   (@NPC_SYLVANA_OUTRO, 10, 5475.517,1943.176,741.146, 0, 'WP11'),
   (@NPC_SYLVANA_OUTRO, 11, 5466.930,1926.049,743.536, 0, 'WP12'),
   (@NPC_SYLVANA_OUTRO, 12, 5445.157,1894.955,748.757, 0, 'WP13 - Spell Channel'),
   (@NPC_SYLVANA_OUTRO, 13, 5425.907,1869.708,753.237, 0, 'WP14'),
   (@NPC_SYLVANA_OUTRO, 14, 5405.118,1833.937,757.486, 0, 'WP15'),
   (@NPC_SYLVANA_OUTRO, 15, 5370.324,1799.375,761.007, 0, 'WP16'),
   (@NPC_SYLVANA_OUTRO, 16, 5335.422,1766.951,767.635, 0, 'WP17 - Spell Channel'),
   (@NPC_SYLVANA_OUTRO, 17, 5311.438,1739.390,774.165, 0, 'WP18'),
   (@NPC_SYLVANA_OUTRO, 18, 5283.589,1703.755,784.176, 0, 'WP19'),
   (@NPC_SYLVANA_OUTRO, 19, 5260.400,1677.775,784.301, 3000, 'WP20'),
   (@NPC_SYLVANA_OUTRO, 20, 5262.439,1680.410,784.294, 0, 'WP21'),
   (@NPC_SYLVANA_OUTRO, 21, 5260.400,1677.775,784.301, 0, 'WP22'),

-- Lich King

   (@NPC_LICH_KING_BOSS, 1, 5577.19, 2236, 733.012, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 2, 5580.57, 2232.22, 733.012, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 3, 5586.67, 2225.54, 733.012, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 4, 5590.45, 2221.41, 733.012, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 5, 5595.75, 2215.62, 732.101, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 6, 5601.21, 2206.49, 731.54, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 7, 5605.01, 2197.9, 731.667, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 8, 5606.55, 2191.39, 730.977, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 9, 5604.68, 2186.11, 730.998, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 10, 5602.26, 2179.9, 730.967, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 11, 5600.06, 2174.38, 730.924, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 12, 5597.29, 2166.81, 730.924, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 13, 5596.25, 2160.36, 730.931, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 14, 5591.79, 2152.87, 731.008, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 15, 5585.47, 2146.63, 731.109, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 16, 5579.1, 2140.34, 731.18, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 17, 5572.56, 2134.21, 731.092, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 18, 5564.08, 2126.53, 730.816, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 19, 5559.04, 2117.64, 730.812, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 20, 5555.77, 2111.88, 730.995, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 21, 5550.82, 2103.14, 731.123, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 22, 5546.02, 2094.68, 731.16, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 23, 5541.53, 2084.42, 730.999, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 24, 5537.5, 2075.18, 730.901, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 25, 5533.76, 2063.84, 730.87, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 26, 5530.97, 2052.98, 730.981, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 27, 5526.75, 2041.73, 731.193, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 28, 5522.88, 2031.65, 731.7, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 29, 5521.01, 2023.02, 732.396, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 30, 5516.55, 2015.36, 733.12, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 31, 5513.06, 2007.33, 733.99, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 32, 5510.43, 1997.9, 735.016, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 33, 5504.53, 1990.39, 735.748, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 34, 5499.34, 1983.78, 736.29, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 35, 5493.11, 1975.86, 736.852, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 36, 5487.58, 1968.81, 737.394, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 37, 5483.12, 1961.78, 738.06, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 38, 5478.33, 1954.2, 739.343, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 39, 5475.2, 1945.84, 740.697, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 40, 5472.15, 1938.02, 741.884, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 41, 5469.26, 1931.34, 742.813, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 42, 5464.23, 1922.25, 744.055, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 43, 5458.43, 1912.96, 745.229, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 44, 5452.26, 1902.95, 747.091, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 45, 5442.44, 1892.51, 749.208, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 46, 5435.67, 1879.7, 751.776, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 47, 5429.03, 1870.73, 753.151, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 48, 5423.72, 1862.16, 754.263, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 49, 5417.21, 1851.7, 755.507, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 50, 5408.94, 1838.38, 757.002, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 51, 5398.8, 1829.61, 757.742, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 52, 5388.47, 1817.95, 759.285, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 53, 5378.23, 1808.5, 760.316, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 54, 5368.5, 1801.35, 760.845, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 55, 5360.86, 1793.16, 762.271, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 56, 5353.62, 1785.4, 763.868, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 57, 5344.78, 1776.09, 765.759, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 58, 5336.38, 1768.67, 767.324, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 59, 5327.56, 1760.12, 769.332, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 60, 5319.62, 1750.7, 771.487, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 61, 5313.12, 1742.99, 773.424, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 62, 5305.41, 1735.79, 775.473, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 63, 5298.93, 1728.16, 777.573, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 64, 5292.54, 1720.37, 779.862, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 65, 5287.11, 1713.96, 781.667, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 66, 5280.14, 1705.21, 784.65, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 67, 5277.98, 1701.28, 785.224, 0, 'HoR WP LichKing');

-- AreaTrigger for waves restarter
DELETE FROM `areatrigger_scripts` WHERE `entry` = 5697;
INSERT INTO `areatrigger_scripts` VALUES
(5697, 'at_hor_waves_restarter');


-- GameObjects

-- Templates
DELETE FROM gameobject_template WHERE entry IN (201709, 202211, 190236, 196391, 196392, 197341, 197342, 197343, 201385, 201596, 201710, 201747, 201756, 201885, 201976, 202079, 202212, 202236, 202302, 202336, 202337, 202396, 500001, 500002, 500003);
INSERT INTO `gameobject_template` (`entry`, `TYPE`, `displayId`, `NAME`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `AIName`, `ScriptName`, `WDBVerified`) VALUES
('201596','0','9223','Cave In','','','','1375','4','2','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('197342','0','9124','Doodad_IceCrown_Door_02','','','','1375','36','1','0','0','0','0','0','0','1','0','3','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('197343','0','9124','Doodad_IceCrown_Door_03','','','','1375','36','1','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('201976','0','9124','Doodad_IceCrown_Door_04','','','','114','32','1','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('196391','31','8196','Doodad_InstanceNewPortal_Purple01','','','','0','0','2.72','0','0','0','0','0','0','632','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('201747','31','8196','Doodad_InstanceNewPortal_Purple01','','','','0','0','2.72','0','0','0','0','0','0','668','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('196392','31','8197','Doodad_InstanceNewPortal_Purple_Skull01','','','','0','0','2.72','0','0','0','0','0','0','632','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('201756','31','8197','Doodad_InstanceNewPortal_Purple_Skull01','','','','0','0','2.72','0','0','0','0','0','0','668','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('202302','0','9301','Frostmourne','','','','1375','32','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('202236','0','9294','Frostmourne Altar','','','','114','32','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('190236','0','7876','Gate','','','','114','32','0.88','0','0','0','0','0','0','0','0','3000','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('201385','0','9214','Ice Wall','','','','1375','1','2.5','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('500001','0','9214','Ice Wall','','','','1375','1','2.5','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','1'),
('201885','0','9214','Ice Wall','','','','0','1','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('202396','0','9214','Ice Wall','','','','114','33','2','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('197341','0','9124','Impenetrable Door','','','','1375','32','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('500003','14','8253','Orgrim\'s Hammer','','','','0','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','1'),
('202079','22','8111','Portal to Dalaran','','','','0','0','1','0','0','0','0','0','0','53141','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('201710','3','9280','The Captain\'s Chest','','','','1732','0','1','0','0','0','0','0','0','57','27985','0','1','0','0','0','0','0','0','0','1','0','0','0','1','0','0','0','0','0','0','0','0','','','12340'),
('202337','3','9281','The Captain\'s Chest','','','','1735','0','1','0','0','0','0','0','0','57','27993','0','1','0','0','0','0','0','0','0','1','0','0','0','1','0','0','0','0','0','0','0','0','','','12340'),
('202336','3','9280','The Captain\'s Chest','','','','1732','0','1','0','0','0','0','0','0','57','27993','0','1','0','0','0','0','0','0','0','1','0','0','0','1','0','0','0','0','0','0','0','0','','','12340'),
('202212','3','9281','The Captain\'s Chest','','','','1735','0','1','0','0','0','0','0','0','57','27985','0','1','0','0','0','0','0','0','0','1','0','0','0','1','0','0','0','0','0','0','0','0','','','11723'),
('500002','14','9150','The Skybreaker','','','','0','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','1'),
('201709','5','9288','Gunship Stairs','','','','0','1','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('202211','5','9289','Gunship Stairs','','','','0','1','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340');

-- Spawns
DELETE FROM gameobject WHERE map = 668 AND id IN (190236, 196391, 196392, 197341, 197342, 197343, 201385, 201596, 201710, 201747, 201756, 201885, 201976, 202079, 202212, 202236, 202302, 202336, 202337, 202396, 500001, 500002, 500003);
SET @GUID_GO := 153000;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(@GUID_GO,201747,668,3,1,5231.04,1923.79,707.044,0.810935,0,0,-0.370856,0.928691,6000,100,1),
(@GUID_GO+1,201756,668,3,1,5231.04,1923.79,707.044,0.810935,0,0,-0.370856,0.928691,6000,100,1),
(@GUID_GO+2,190236,668,3,1,4926.09,1554.96,163.292,-2.26562,0,0,0.999999,-0.001655,6000,100,1),
(@GUID_GO+3,202302,668,3,1,5309.51,2006.64,709.341,5.50041,0,0,0.381473,-0.92438,604800,100,1),
(@GUID_GO+4,202236,668,3,1,5309.51,2006.64,709.341,5.53575,0,0,0.365077,-0.930977,604800,100,1),
(@GUID_GO+5,201596,668,3,1,5275.28,1694.23,786.147,0.981225,0,0,0.471166,0.882044,25,0,0),
(@GUID_GO+6,500001,668,3,1,5323.61,1755.85,770.305,0.784186,0,0,0.382124,0.924111,604800,100,0),
(@GUID_GO+7,196391,668,3,1,5232.31,1925.57,707.695,0.815481,0,0,0.396536,0.918019,300,0,1),
(@GUID_GO+8,196392,668,3,1,5232.31,1925.57,707.695,0.815481,0,0,0.396536,0.918019,300,0,1),
(@GUID_GO+9,202396,668,3,1,5434.27,1881.12,751.303,0.923328,0,0,0.445439,0.895312,604800,100,0),
(@GUID_GO+10,201885,668,3,1,5494.3,1978.27,736.689,1.0885,0,0,0.517777,0.855516,604800,100,0),
(@GUID_GO+11,197341,668,3,1,5359.24,2058.35,707.695,3.96022,0,0,0.917394,-0.397981,300,100,1),
(@GUID_GO+12,201976,668,3,1,5264.6,1959.55,707.695,0.736951,0,0,0.360194,0.932877,300,100,0),
(@GUID_GO+13,197342,668,3,1,5520.72,2228.89,733.011,0.778581,0,0,0.379532,0.925179,300,100,1),
(@GUID_GO+14,197343,668,3,1,5582.96,2230.59,733.011,5.49098,0,0,0.385827,-0.922571,300,100,1),
(@GUID_GO+15,201385,668,3,1,5540.39,2086.48,731.066,1.00057,0,0,0.479677,0.877445,604800,100,0),
(@GUID_GO+16,202337,668,2,1,5252.33,1585.36,796.062,2.80195,0,0,0.985615,0.169007,604800,100,1),
(@GUID_GO+17,202336,668,2,1,5264.22,1584.94,794.359,2.70142,0,0,0.975878,0.218315,604800,100,1),
(@GUID_GO+18,202079,668,3,1,5248.58,1574.22,795.209,0,0,0,0,1,604800,100,1),
(@GUID_GO+19,500002,668,3,1,5247.09,1586.39,773.922,5.86166,0,0,0.209207,-0.977871,300,0,1),
(@GUID_GO+20,500003,668,3,1,5245.17,1582.11,761.72,5.86166,0,0,0.209207,-0.977871,300,0,1),
(@GUID_GO+21,202212,668,1,1,5253.03,1585.13,796.089,2.75698,0,0,0.981566,0.191121,300,0,1),
(@GUID_GO+22,201710,668,1,1,5262.5,1582.41,794.342,2.75698,0,0,0.981566,0.191121,300,0,1);

DELETE FROM `gameobject_loot_template` WHERE (`entry`=27993);
INSERT INTO `gameobject_loot_template` VALUES 
(27993, 43102, 100, 1, 0, 1, 1),
(27993, 47241, 100, 1, 0, 1, 1),
(27993, 50302, 0, 1, 1, 1, 1),
(27993, 50303, 0, 1, 1, 1, 1),
(27993, 50304, 0, 1, 2, 1, 1),
(27993, 50305, 0, 1, 2, 1, 1),
(27993, 50306, 0, 1, 1, 1, 1),
(27993, 50308, 0, 1, 2, 1, 1),
(27993, 50309, 0, 1, 1, 1, 1),
(27993, 50310, 0, 1, 2, 1, 1),
(27993, 50311, 0, 1, 2, 1, 1),
(27993, 50312, 0, 1, 2, 1, 1),
(27993, 50313, 0, 1, 1, 1, 1),
(27993, 50314, 0, 1, 1, 1, 1);

DELETE FROM `gameobject_loot_template` WHERE (`entry`=27985);
INSERT INTO `gameobject_loot_template` VALUES 
(27985, 47241, 100, 1, 0, 1, 1),
(27985, 49839, 0, 1, 1, 1, 1),
(27985, 49840, 0, 1, 1, 1, 1),
(27985, 49841, 0, 1, 2, 1, 1),
(27985, 49842, 0, 1, 2, 1, 1),
(27985, 49843, 0, 1, 2, 1, 1),
(27985, 49844, 0, 1, 1, 1, 1),
(27985, 49845, 0, 1, 1, 1, 1),
(27985, 49846, 0, 1, 1, 1, 1),
(27985, 49847, 0, 1, 2, 1, 1),
(27985, 49848, 0, 1, 2, 1, 1),
(27985, 49849, 0, 1, 1, 1, 1),
(27985, 49851, 0, 1, 2, 1, 1);

-- Inmunidades.
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|33554432|536870912 WHERE `entry` IN (SELECT `id`  FROM `creature` WHERE map=668);
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|33554432|536870912 WHERE `entry` IN 
(
38112,
38113,
36723,
37107,
36954,
37745,
37158,
37226,
37225,
37221,
36955,
37223,
37554,
37182,
37833,
38177,
38173,
38176,
38175,
38172,
37906,
37014,
36940,
36941,
37069);