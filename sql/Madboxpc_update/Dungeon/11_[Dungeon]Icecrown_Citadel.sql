-- 11_[Dungeon]Icecrown_Citadel.sql
-- ICC
-- BOSS FESTERGUT
-- Fix spell http://www.wowhead.com/spell=71160
DELETE FROM `spell_script_names` WHERE `spell_id` IN (71160,71161);
INSERT INTO `spell_script_names` VALUES 
(71160,'spell_stinky_plague_stench'),
(71161,'spell_stinky_plague_stench');


-- Añadida Inmunidades gral 
-- Añadido correcto inmune mask a npcs (SELECT  `entry` ,  `difficulty_entry_1` ,  `difficulty_entry_2` ,  `difficulty_entry_3` FROM  `creature_template` WHERE  `entry`IN ( 37697,37562)); 
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|33554432|536870912 WHERE `entry` IN (37697,38604,38758,38759,37562,38602,38760,38761);
-- marrowgar
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|4|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|536870912 WHERE `entry` IN (36612,37957,37958,37959);
-- lady
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|4|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|1048576|4194304|8388608|67108864|536870912 WHERE `entry` IN (36855,38106,38926,38297);
-- saurfang
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|4|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|536870912 WHERE `entry` IN (37813,38402,38582,38583);
-- valkyrs de la espiral
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|4|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|536870912 WHERE `entry` IN (37098,38418);
-- stinky
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|4|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|536870912 WHERE `entry` IN (37025,38064);
-- precious
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|4|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|536870912 WHERE `entry` IN (37217,38103);
-- festergut
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|4|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|536870912 WHERE `entry` IN (36626,37504,37505,37506);
-- rotface
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|4|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|536870912 WHERE `entry` IN (36627,38390,38549,38550);
-- putricidio
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|4|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|536870912 WHERE `entry` IN (36678,38431,38585,38586);
-- valanar
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|4|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|536870912 WHERE `entry` IN (37970,38401,38784,38785);
-- keleseth
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|4|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|536870912 WHERE `entry` IN (37972,38399,38769,38770);
-- taldaram
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|4|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|536870912 WHERE `entry` IN (37973,38400,38771,38772);
-- lanathel
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|4|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|536870912 WHERE `entry` IN (37955,38434,38435,38436);
-- sindragosa
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|4|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|536870912 WHERE `entry` IN (36853,38265,38266,38267);
-- rimefang
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|4|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|536870912 WHERE `entry` IN (37533,38220);
-- spinestalker
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|4|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|536870912 WHERE `entry` IN (37534,38219);
-- lichking
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|4|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|536870912 WHERE `entry` IN (36597,39166,39167,39168);
-- Valkyrs de lich king(36609)
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|4|8|16|32|64|128|256|512|4096|8192|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|536870912 WHERE `entry` IN (36609,39120,39121,39122);

-- Update Dmg Boss
-- Query para visualizar los valores:
-- SELECT `entry`,`name`,`mindmg`,`maxdmg`,`dmg_multiplier` FROM `creature_template` WHERE entry=36612;
-- Icc actualizacion de Daño de bosses
-- Lord Marrowgar -- Este divide el daño entre los tankes asi que estara bien
-- 10n min=45.8k max=51.3k
UPDATE `creature_template` SET  `mindmg` =  '1527',`maxdmg` =  '1710',`dmg_multiplier` =  '30' WHERE `entry` =36612;
-- 10H min=50.3k max=56.4k
UPDATE `creature_template` SET  `mindmg` =  '1527',`maxdmg` =  '1710',`dmg_multiplier` =  '33' WHERE `entry` =37957;
-- 25n min=56.5k max=63.3k
UPDATE `creature_template` SET  `mindmg` =  '1527',`maxdmg` =  '1710',`dmg_multiplier` =  '37' WHERE `entry` =37958;
-- 25H min=61k max=68.4k
UPDATE `creature_template` SET  `mindmg` =  '1527',`maxdmg` =  '1710',`dmg_multiplier` =  '40' WHERE `entry` =37959;
-- Lady Deathwhisper
-- 10n min=20.5k max=23.5k
UPDATE `creature_template` SET  `mindmg` =  '1110',`maxdmg` =  '1271',`dmg_multiplier` =  '18.5' WHERE `entry` =36855;
-- 10H min=22.7k max=26k
UPDATE `creature_template` SET  `mindmg` =  '1110',`maxdmg` =  '1271',`dmg_multiplier` =  '20.5' WHERE `entry` =38106;
-- 25n min=26k max=29,8k
UPDATE `creature_template` SET  `mindmg` =  '1110',`maxdmg` =  '1271',`dmg_multiplier` =  '23.5' WHERE `entry` =38296;
-- 25H min=26k max=32.4k
UPDATE `creature_template` SET  `mindmg` =  '1110',`maxdmg` =  '1271',`dmg_multiplier` =  '25.5' WHERE `entry` =38297;
-- Deathbringer
-- 10n min=35.1k max=39.3k
UPDATE `creature_template` SET  `mindmg` =  '1527',`maxdmg` =  '1710',`dmg_multiplier` =  '23' WHERE `entry` =37813;
-- 10H min=38.1k max=42.7k
UPDATE `creature_template` SET  `mindmg` =  '1527',`maxdmg` =  '1710',`dmg_multiplier` =  '25' WHERE `entry` =38402;
-- 25n min=44.2k max=49.5k
UPDATE `creature_template` SET  `mindmg` =  '1527',`maxdmg` =  '1710',`dmg_multiplier` =  '29' WHERE `entry` =38582;
-- 25H min=47.3k max=53k
UPDATE `creature_template` SET  `mindmg` =  '1527',`maxdmg` =  '1710',`dmg_multiplier` =  '31' WHERE `entry` =38583;
-- Festergut
-- 10n min=32k max=35.9k
UPDATE `creature_template` SET  `mindmg` =  '1527',`maxdmg` =  '1710',`dmg_multiplier` =  '21' WHERE `entry` =36626;
-- 10H min=35.1k max=39.3k
UPDATE `creature_template` SET  `mindmg` =  '1527',`maxdmg` =  '1710',`dmg_multiplier` =  '23' WHERE `entry` =37505;
-- 25n min=41.2k max=46.1k
UPDATE `creature_template` SET  `mindmg` =  '1527',`maxdmg` =  '1710',`dmg_multiplier` =  '27' WHERE `entry` =38582;
-- 25H min=44.2k max=49.6k
UPDATE `creature_template` SET  `mindmg` =  '1527',`maxdmg` =  '1710',`dmg_multiplier` =  '29' WHERE `entry` =37506;
-- Rotface
-- 10n min=35.1k max=39.3k
UPDATE `creature_template` SET  `mindmg` =  '1527',`maxdmg` =  '1710',`dmg_multiplier` =  '23' WHERE `entry` =36627;
-- 10H min=38.1k max=42.7k
UPDATE `creature_template` SET  `mindmg` =  '1527',`maxdmg` =  '1710',`dmg_multiplier` =  '25' WHERE `entry` =38390;
-- 25n min=44.2k max=49.5k
UPDATE `creature_template` SET  `mindmg` =  '1527',`maxdmg` =  '1710',`dmg_multiplier` =  '29' WHERE `entry` =38549;
-- 25H min=47.3k max=53k
UPDATE `creature_template` SET  `mindmg` =  '1527',`maxdmg` =  '1710',`dmg_multiplier` =  '31' WHERE `entry` =38550;
-- Profesor Putricidio
-- 10n min=39.7k max=44.4k
UPDATE `creature_template` SET  `mindmg` =  '1527',`maxdmg` =  '1710',`dmg_multiplier` =  '26' WHERE `entry` =36678;
-- 10H min=42.7k max=47.8k
UPDATE `creature_template` SET  `mindmg` =  '1527',`maxdmg` =  '1710',`dmg_multiplier` =  '28' WHERE `entry` =38431;
-- 25n min=47.3k max=53k
UPDATE `creature_template` SET  `mindmg` =  '1527',`maxdmg` =  '1710',`dmg_multiplier` =  '31' WHERE `entry` =38585;
-- 25H min=50.3k max=56.4k
UPDATE `creature_template` SET  `mindmg` =  '1527',`maxdmg` =  '1710',`dmg_multiplier` =  '33' WHERE `entry` =38586;
-- Valanar
-- 10n min=22.9k max=25.6k
UPDATE `creature_template` SET  `mindmg` =  '1527',`maxdmg` =  '1710',`dmg_multiplier` =  '15' WHERE `entry` =37970;
-- 10H min=26.9k max=29k
UPDATE `creature_template` SET  `mindmg` =  '1527',`maxdmg` =  '1710',`dmg_multiplier` =  '17' WHERE `entry` =38401;
-- 25n min=30.5k max=34.2k
UPDATE `creature_template` SET  `mindmg` =  '1527',`maxdmg` =  '1710',`dmg_multiplier` =  '20' WHERE `entry` =38784;
-- 25H min=33.6k max=37.6k
UPDATE `creature_template` SET  `mindmg` =  '1527',`maxdmg` =  '1710',`dmg_multiplier` =  '22' WHERE `entry` =38785;
-- Keleseth
-- 10n min=22.9k max=25.6k
UPDATE `creature_template` SET  `mindmg` =  '1527',`maxdmg` =  '1710',`dmg_multiplier` =  '15' WHERE `entry` =37972;
-- 10H min=26.9k max=29k
UPDATE `creature_template` SET  `mindmg` =  '1527',`maxdmg` =  '1710',`dmg_multiplier` =  '17' WHERE `entry` =38399;
-- 25n min=30.5k max=34.2k
UPDATE `creature_template` SET  `mindmg` =  '1527',`maxdmg` =  '1710',`dmg_multiplier` =  '20' WHERE `entry` =38769;
-- 25H min=33.6k max=37.6k
UPDATE `creature_template` SET  `mindmg` =  '1527',`maxdmg` =  '1710',`dmg_multiplier` =  '22' WHERE `entry` =38770;
-- Taldaram
-- 10n min=22.9k max=25.6k
UPDATE `creature_template` SET  `mindmg` =  '1527',`maxdmg` =  '1710',`dmg_multiplier` =  '15' WHERE `entry` =37973;
-- 10H min=26.9k max=29k
UPDATE `creature_template` SET  `mindmg` =  '1527',`maxdmg` =  '1710',`dmg_multiplier` =  '17' WHERE `entry` =38400;
-- 25n min=30.5k max=34.2k
UPDATE `creature_template` SET  `mindmg` =  '1527',`maxdmg` =  '1710',`dmg_multiplier` =  '20' WHERE `entry` =38771;
-- 25H min=33.6k max=37.6k
UPDATE `creature_template` SET  `mindmg` =  '1527',`maxdmg` =  '1710',`dmg_multiplier` =  '22' WHERE `entry` =38772;
-- Blood Queen Lanathel
-- 10n min=35.1k max=39.3k
UPDATE `creature_template` SET  `mindmg` =  '1527',`maxdmg` =  '1710',`dmg_multiplier` =  '23' WHERE `entry` =37955;
-- 10H min=38.1k max=42.7k
UPDATE `creature_template` SET  `mindmg` =  '1527',`maxdmg` =  '1710',`dmg_multiplier` =  '25' WHERE `entry` =38434;
-- 25n min=44.2k max=49.5k
UPDATE `creature_template` SET  `mindmg` =  '1527',`maxdmg` =  '1710',`dmg_multiplier` =  '29' WHERE `entry` =38435;
-- 25H min=47.3k max=53k
UPDATE `creature_template` SET  `mindmg` =  '1527',`maxdmg` =  '1710',`dmg_multiplier` =  '31' WHERE `entry` =38436;
-- Sindragosa
-- 10n min=29k max=32.4k
UPDATE `creature_template` SET  `mindmg` =  '1527',`maxdmg` =  '1710',`dmg_multiplier` =  '19' WHERE `entry` =36853;
-- 10H min=32k max=35.9k
UPDATE `creature_template` SET  `mindmg` =  '1527',`maxdmg` =  '1710',`dmg_multiplier` =  '21' WHERE `entry` =38265;
-- 25n min=36.6k max=41k
UPDATE `creature_template` SET  `mindmg` =  '1527',`maxdmg` =  '1710',`dmg_multiplier` =  '24' WHERE `entry` =38266;
-- 25H min=39.7k max=44.4k
UPDATE `creature_template` SET  `mindmg` =  '1527',`maxdmg` =  '1710',`dmg_multiplier` =  '26' WHERE `entry` =38267;
-- Lich King
-- 10n min=29k max=32.4k
UPDATE `creature_template` SET  `mindmg` =  '1527',`maxdmg` =  '1710',`dmg_multiplier` =  '19' WHERE `entry` =36597;
-- 10H min=32k max=35.9k
UPDATE `creature_template` SET  `mindmg` =  '1527',`maxdmg` =  '1710',`dmg_multiplier` =  '21' WHERE `entry` =39166;
-- 25n min=36.6k max=41k
UPDATE `creature_template` SET  `mindmg` =  '1527',`maxdmg` =  '1710',`dmg_multiplier` =  '24' WHERE `entry` =39167;
-- 25H min=39.7k max=44.4k
UPDATE `creature_template` SET  `mindmg` =  '1527',`maxdmg` =  '1710',`dmg_multiplier` =  '26' WHERE `entry` =39168;
-- Gral.
-- Solcuion para las arañas Nerub'ar Broodkeeper que no se les podian pegar. http://old.wowhead.com/npc=36725
UPDATE `creature` SET `position_z` = 35.24 WHERE `guid` IN (201170,201106);
UPDATE `creature` SET `position_z` = 44.57 WHERE `guid` IN (200949,200956);
UPDATE `creature` SET `position_z` = 42.1 WHERE `guid` IN (200912,200934);

-- Scriptnames y ajustes:

/*-----Trash de Martillo de la Luz-----*/
-- Aqui se les sube el daño tambien para que no puedan farmear en solo
UPDATE `creature_template` SET `ScriptName` = 'npc_ancient_skeletal_soldier_icc' WHERE `entry` =37012;
UPDATE `creature_template` SET `dmg_multiplier` = '10' WHERE `entry` =37012;
UPDATE `creature_template` SET `ScriptName` = 'npc_ancient_skeletal_soldier_icc' WHERE `entry` =38059;
UPDATE `creature_template` SET `dmg_multiplier` = '17.5' WHERE `entry` =38059;
UPDATE `creature_template` SET `ScriptName` = 'npc_deathbound_ward_icc' WHERE `entry` =37007;
UPDATE `creature_template` SET `mindmg` = '1100',`maxdmg` = '1300' WHERE `entry` =37007;
UPDATE `creature_template` SET `ScriptName` = 'npc_deathbound_ward_icc' WHERE `entry` =38031;
UPDATE `creature_template` SET `mindmg` = '1100',`maxdmg` = '1200' WHERE `entry` =38031;
UPDATE `creature_template` SET `ScriptName` = 'npc_servant_of_the_throne_icc' WHERE `entry` =36724;
UPDATE `creature_template` SET `dmg_multiplier` = '10.5' WHERE `entry` =36724;
UPDATE `creature_template` SET `ScriptName` = 'npc_servant_of_the_throne_icc' WHERE `entry` =38057;
UPDATE `creature_template` SET `dmg_multiplier` = '19' WHERE `entry` =38057;
-- UPDATE `creature_template` SET `ScriptName` = 'npc_the_damned_icc' WHERE `entry` =37011;
UPDATE `creature_template` SET `dmg_multiplier` = '10' WHERE `entry` =37011;
-- UPDATE `creature_template` SET `ScriptName` = 'npc_the_damned_icc' WHERE `entry` =38061;
UPDATE `creature_template` SET `dmg_multiplier` = '16' WHERE `entry` =38061;
UPDATE `creature_template` SET `ScriptName` = 'npc_nerubar_broodkeeper_icc' WHERE `entry` =36725;
UPDATE `creature_template` SET `dmg_multiplier` = '11.2' WHERE `entry` =36725;
UPDATE `creature_template` SET `ScriptName` = 'npc_nerubar_broodkeeper_icc' WHERE `entry` =38058;
UPDATE `creature_template` SET `dmg_multiplier` = '14.7' WHERE `entry` =38058;

/*--Trash de Oratorio de los Malditos--*/
UPDATE `creature_template` SET `ScriptName` = 'npc_deathspeaker_servant_10man_icc' WHERE `entry`=36805;
UPDATE `creature_template` SET `ScriptName` = 'npc_deathspeaker_servant_25man_icc' WHERE `entry`=38075;
UPDATE `creature_template` SET `ScriptName` = 'npc_deathspeaker_disciple_10man_icc' WHERE `entry`=36807;
UPDATE `creature_template` SET `ScriptName` = 'npc_deathspeaker_disciple_25man_icc' WHERE `entry`=38073;
UPDATE `creature_template` SET `ScriptName` = 'npc_deathspeaker_zealot_icc' WHERE `entry`=36808;
UPDATE `creature_template` SET `ScriptName` = 'npc_deathspeaker_zealot_icc' WHERE `entry`=38076;
UPDATE `creature_template` SET `ScriptName` = 'npc_deathspeaker_attendant_10man_icc' WHERE `entry`=36811;
UPDATE `creature_template` SET `ScriptName` = 'npc_deathspeaker_attendant_25man_icc' WHERE `entry`=38072;
UPDATE `creature_template` SET `ScriptName` = 'npc_deathspeaker_high_priest_icc' WHERE `entry`=36829;
UPDATE `creature_template` SET `ScriptName` = 'npc_deathspeaker_high_priest_icc' WHERE `entry`=38074;

/*---------Trash de La Espiral---------*/
UPDATE `creature_template` SET `ScriptName` = 'npc_valkyr_herald_10man_icc' WHERE `entry`=37098;
UPDATE `creature_template` SET `ScriptName` = 'npc_valkyr_herald_25man_icc' WHERE `entry`=38418;

/*----Trash de Talleres de la Peste----*/
UPDATE `creature_template` SET `ScriptName` = 'npc_blighted_abomination_icc' WHERE `entry`=37022;
UPDATE `creature_template` SET `ScriptName` = 'npc_blighted_abomination_icc' WHERE `entry`=38108;
UPDATE `creature_template` SET `ScriptName` = 'npc_vengeful_fleshreapert_icc' WHERE `entry`=37038;
UPDATE `creature_template` SET `ScriptName` = 'npc_vengeful_fleshreapert_icc' WHERE `entry`=38063;
UPDATE `creature_template` SET `ScriptName` = 'npc_plague_scientist_icc' WHERE `entry`=37023;
UPDATE `creature_template` SET `ScriptName` = 'npc_plague_scientist_icc' WHERE `entry`=38062;
UPDATE `creature_template` SET `ScriptName` = 'npc_pustulating_horror_10man_icc' WHERE `entry`=10404;
UPDATE `creature_template` SET `ScriptName` = 'npc_pustulating_horror_25man_icc' WHERE `entry`=38110;
UPDATE `creature_template` SET `ScriptName` = 'npc_decaying_colossus_10man_icc' WHERE `entry`=36880;
UPDATE `creature_template` SET `ScriptName` = 'npc_decaying_colossus_25man_icc' WHERE `entry`=37655;

/*--------Trash de Salas Carmesi--------*/
UPDATE `creature_template` SET `ScriptName` = 'npc_darkfallen_archmage_10man_icc' WHERE `entry`=37664;
UPDATE `creature_template` SET `ScriptName` = 'npc_darkfallen_archmage_25man_icc' WHERE `entry`=38099;
UPDATE `creature_template` SET `ScriptName` = 'npc_darkfallen_blood_knight_icc' WHERE `entry`=37595;
UPDATE `creature_template` SET `ScriptName` = 'npc_darkfallen_blood_knight_icc' WHERE `entry`=38100;
UPDATE `creature_template` SET `ScriptName` = 'npc_darkfallen_noble_10man_icc' WHERE `entry`=37663;
UPDATE `creature_template` SET `ScriptName` = 'npc_darkfallen_noble_25man_icc' WHERE `entry`=38480;
UPDATE `creature_template` SET `ScriptName` = 'npc_vampiric_fiend_icc' WHERE `entry`=37901;
UPDATE `creature_template` SET `ScriptName` = 'npc_darkfallen_advisor_10man_icc' WHERE `entry`=37571;
UPDATE `creature_template` SET `ScriptName` = 'npc_darkfallen_advisor_25man_icc' WHERE `entry`=38098;
UPDATE `creature_template` SET `ScriptName` = 'npc_darkfallen_commander_10man_icc' WHERE `entry`=37662;
UPDATE `creature_template` SET `ScriptName` = 'npc_darkfallen_commander_25man_icc' WHERE `entry`=38102;
UPDATE `creature_template` SET `ScriptName` = 'npc_darkfallen_lieutenant_10man_icc' WHERE `entry`=37665;
UPDATE `creature_template` SET `ScriptName` = 'npc_darkfallen_lieutenant_25man_icc' WHERE `entry`=38101;
UPDATE `creature_template` SET `ScriptName` = 'npc_darkfallen_tactician_icc' WHERE `entry`=37666;
UPDATE `creature_template` SET `ScriptName` = 'npc_darkfallen_tactician_icc' WHERE `entry`=38479;

/*---Trash de Camaras de Alaescarcha---*/
UPDATE `creature_template` SET `ScriptName` = 'npc_ymirjar_deathbringer_10man_icc' WHERE `entry`=38125;
UPDATE `creature_template` SET `ScriptName` = 'npc_ymirjar_deathbringer_25man_icc' WHERE `entry`=38130;
UPDATE `creature_template` SET `ScriptName` = 'npc_ymirjar_frostbinder_icc' WHERE `entry`=37127;
UPDATE `creature_template` SET `ScriptName` = 'npc_ymirjar_frostbinder_icc' WHERE `entry`=38126;
UPDATE `creature_template` SET `ScriptName` = 'npc_ymirjar_battlemaiden_icc' WHERE `entry`=37132;
UPDATE `creature_template` SET `ScriptName` = 'npc_ymirjar_battlemaiden_icc' WHERE `entry`=38132;
UPDATE `creature_template` SET `ScriptName` = 'npc_ymirjar_huntress_icc' WHERE `entry`=37134;
UPDATE `creature_template` SET `ScriptName` = 'npc_ymirjar_huntress_icc' WHERE `entry`=38134;
UPDATE `creature_template` SET `ScriptName` = 'npc_ymirjar_warlord_icc' WHERE `entry`=37133;
UPDATE `creature_template` SET `ScriptName` = 'npc_ymirjar_warlord_icc' WHERE `entry`=38133;


-- Inmunidades del trash de icc:
-- ancient skeletal soldier
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|4|8|16|128|512|1024|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|134217728 WHERE `entry` IN (37012,38059);
-- deathbound ward
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|4|8|16|128|512|1024|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|134217728 WHERE `entry` IN (37007,38031);
-- servant of the throne
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|4|8|16|128|512|1024|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|134217728 WHERE `entry` IN (36724,38057);
-- the damned
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|4|8|16|128|512|1024|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|134217728 WHERE `entry` IN (37011,38061);
-- nerubar broodkeeper
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|4|8|16|128|512|1024|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|134217728 WHERE `entry` IN (36725,38058);
-- deathspeaker servant
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|4|8|16|128|512|1024|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|134217728 WHERE `entry` IN (36805,38075);
-- deathspeaker disciple
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|4|8|16|128|512|1024|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|134217728 WHERE `entry` IN (36807,38073);
-- deathspeaker zealot
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|4|8|16|128|512|1024|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|134217728 WHERE `entry` IN (36808,38076);
-- deathspeaker attendant
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|4|8|16|128|512|1024|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|134217728 WHERE `entry` IN (36811,38072);
-- deathspeaker high priest
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|4|8|16|128|512|1024|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|134217728 WHERE `entry` IN (36829,38074);
-- blighted abomination
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|4|8|16|128|512|1024|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|134217728 WHERE `entry` IN (37022,38108);
-- vengeful fleshreapert
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|4|8|16|128|512|1024|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|134217728 WHERE `entry` IN (37038,38063);
-- plague scientist
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|4|8|16|128|512|1024|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|134217728 WHERE `entry` IN (37023,38062);
-- pustulating horror
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|4|8|16|128|512|1024|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|134217728 WHERE `entry` IN (10404,38110);
-- decaying colossus
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|4|8|16|128|512|1024|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|134217728 WHERE `entry` IN (36880,37655);
-- darkfallen archmage
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|4|8|16|128|512|1024|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|134217728 WHERE `entry` IN (37664,38099);
-- darkfallen blood knight
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|4|8|16|128|512|1024|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|134217728 WHERE `entry` IN (37595,38100);
-- darkfallen noble
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|4|8|16|128|512|1024|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|134217728 WHERE `entry` IN (37663,38480);
-- vampiric fiend
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|4|8|16|128|512|1024|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|134217728 WHERE `entry`=37901;
-- darkfallen advisor
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|4|8|16|128|512|1024|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|134217728 WHERE `entry` IN (37571,38098);
-- darkfallen commander
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|4|8|16|128|512|1024|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|134217728 WHERE `entry` IN (37662,38102);
-- darkfallen lieutenant
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|4|8|16|128|512|1024|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|134217728 WHERE `entry` IN (37665,38101);
-- darkfallen tactician
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|4|8|16|128|512|1024|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|134217728 WHERE `entry` IN (37666,38479);
-- ymirjar deathbringer
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|4|8|16|128|512|1024|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|134217728 WHERE `entry` IN (38125,38130);
-- ymirjar frostbinder
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|4|8|16|128|512|1024|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|134217728 WHERE `entry` IN (37127,38126);
-- ymirjar battlemaiden
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|4|8|16|128|512|1024|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|134217728 WHERE `entry`=38132;
-- ymirjar huntress
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|4|8|16|128|512|1024|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|134217728 WHERE `entry`=38134;
-- ymirjar warlord
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|4|8|16|128|512|1024|65536|131072|524288|1048576|4194304|8388608|33554432|67108864|134217728 WHERE `entry`=38133;

-- Custom npc para recuperar anillos
DELETE FROM `creature_template` WHERE (`entry`=97015);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES (97015, 0, 0, 0, 0, 0, 30859, 30987, 30861, 30862, 'Recuperador de Anillos del Veredicto', 'Hablale si has perdido tu anillo', '', 0, 80, 80, 2, 35, 35, 1, 1, 1.14286, 1, 1, 422, 586, 0, 642, 7.5, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 345, 509, 103, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 75, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2354, 0, 2, 'npc_icc_rep_rings', 12340);
UPDATE creature_template SET npcflag=1, gossip_menu_id=61001 WHERE entry=97015;
DELETE FROM gossip_menu WHERE entry=61001;
INSERT INTO gossip_menu VALUES (61001,537006);
DELETE FROM npc_text WHERE id=537006;
INSERT INTO npc_text (id, text0_0) VALUES 
(537006,'Has perdido el anillo obtenido con la reputacion de El Veredicto? podras obtener de nuevo el anillo que tenias de acuerdo con tu nivel de reputacion.$B$BSi despues de recuperarlo y subir mas reputacion no te ofrecen las misiones de intercambio, borra el anillo que tienes y vuelve a hablar conmigo.$B$BYo te suministrare? otro.');


-- Valithria Missing difficulty spawn
DELETE FROM `creature_template` WHERE `entry` IN (39175,39176);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) 
VALUES 
(39175, 0, 0, 0, 0, 0, 30318, 0, 0, 0, 'Valithria Dreamwalker (2)', '', '', 0, 83, 83, 2, 1665, 1665, 0, 1, 1.14286, 1, 3, 509, 683, 0, 805, 35, 2000, 0, 1, 536870912, 8, 0, 0, 0, 0, 0, 371, 535, 135, 2, 67113036, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 860.524, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '', 12340),
(39176, 0, 0, 0, 0, 0, 30318, 0, 0, 0, 'Valithria Dreamwalker (3)', '', '', 0, 83, 83, 2, 1665, 1665, 0, 1, 1.14286, 1, 3, 509, 683, 0, 805, 70, 2000, 0, 1, 536870912, 8, 0, 0, 0, 0, 0, 371, 535, 135, 2, 67113036, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 2581.57, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '', 12340);

-- Update missing difficulty entry
UPDATE `creature_template` SET `difficulty_entry_2` = 39175, `difficulty_entry_3` = 39176 WHERE `entry` = 36789;
-- Update valithria
UPDATE `creature` SET `spawnMask` = 15, `phaseMask` = 5, curhealth = 12000007 WHERE `guid` = 137747; 
DELETE FROM `creature` WHERE `guid` = 137746;

-- Update Creature template addons for missing entries
DELETE FROM `creature_template_addon` WHERE `entry` IN (39175,39176);
INSERT INTO `creature_template_addon` VALUES 
(39175, 0, 0, 0, 1, 0, '72724 70904'),
(39176, 0, 0, 0, 1, 0, '72724 70904');