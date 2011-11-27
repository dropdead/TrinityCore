-- 01[Paladin]Divine_Storm.sql
-- Divine Storm Heal Fixed
DELETE FROM `spell_dbc` WHERE `Id` = 199997;
INSERT INTO `spell_dbc` (`Id`, `Dispel`, `Mechanic`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `AttributesEx5`, `Stances`, `StancesNot`, `Targets`, `CastingTimeIndex`, `AuraInterruptFlags`, `ProcFlags`, `ProcChance`, `ProcCharges`, `MaxLevel`, `BaseLevel`, `SpellLevel`, `DurationIndex`, `RangeIndex`, `StackAmount`, `EquippedItemClass`, `EquippedItemSubClassMask`, `EquippedItemInventoryTypeMask`, `Effect1`, `Effect2`, `Effect3`, `EffectDieSides1`, `EffectDieSides2`, `EffectDieSides3`, `EffectRealPointsPerLevel1`, `EffectRealPointsPerLevel2`, `EffectRealPointsPerLevel3`, `EffectBasePoints1`, `EffectBasePoints2`, `EffectBasePoints3`, `EffectMechanic1`, `EffectMechanic2`, `EffectMechanic3`, `EffectImplicitTargetA1`, `EffectImplicitTargetA2`, `EffectImplicitTargetA3`, `EffectImplicitTargetB1`, `EffectImplicitTargetB2`, `EffectImplicitTargetB3`, `EffectRadiusIndex1`, `EffectRadiusIndex2`, `EffectRadiusIndex3`, `EffectApplyAuraName1`, `EffectApplyAuraName2`, `EffectApplyAuraName3`, `EffectAmplitude1`, `EffectAmplitude2`, `EffectAmplitude3`, `EffectMultipleValue1`, `EffectMultipleValue2`, `EffectMultipleValue3`, `EffectMiscValue1`, `EffectMiscValue2`, `EffectMiscValue3`, `EffectMiscValueB1`, `EffectMiscValueB2`, `EffectMiscValueB3`, `EffectTriggerSpell1`, `EffectTriggerSpell2`, `EffectTriggerSpell3`, `EffectSpellClassMaskA1`, `EffectSpellClassMaskA2`, `EffectSpellClassMaskA3`, `EffectSpellClassMaskB1`, `EffectSpellClassMaskB2`, `EffectSpellClassMaskB3`, `EffectSpellClassMaskC1`, `EffectSpellClassMaskC2`, `EffectSpellClassMaskC3`, `MaxTargetLevel`, `SpellFamilyName`, `SpellFamilyFlags1`, `SpellFamilyFlags2`, `SpellFamilyFlags3`, `MaxAffectedTargets`, `DmgClass`, `PreventionType`, `DmgMultiplier1`, `DmgMultiplier2`, `DmgMultiplier3`, `AreaGroupId`, `SchoolMask`, `Comment`) VALUES
('199997','0','0','0','0','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','1','0','-1','0','0','6','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','4','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','10','0','0','0','0','0','0','0','0','0','0','0','Divine Storm Helper (SERVERSIDE)');
DELETE FROM `spell_proc_event` WHERE `entry` = 199997;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES
('199997','0','10','0','131072','0','16','0','0','100','0');
DELETE FROM `spell_bonus_data` WHERE `entry` = 54172;
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES
('54172','0','0','0','0','Paladin - Divine Storm');
-- 02[Paladin]Sanctified_Improved_Concentration_Aura.sql
-- Paladin Sanctified Retribution - Improved Concentration Aura
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = -31869;
INSERT INTO `spell_linked_spell` VALUES 
(-31869, -63531, 0, 'Sanctified Retribution at talent reset');
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (-20254,-20255,-20256);
INSERT INTO `spell_linked_spell` VALUES
(-20254,-63510,0,'Improved Concentration Aura at talent reset'),
(-20255,-63510,0,'Improved Concentration Aura at talent reset'),
(-20256,-63510,0,'Improved Concentration Aura at talent reset');
UPDATE `spell_group` SET `spell_id` = 63514 WHERE `id` = 1095;
-- 03[DK]Bloodworm.sql
-- Bloodworm AI
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 28017;
INSERT INTO `creature_ai_scripts` VALUES 
(2801700, 28017, 4, 0, 100, 0, 0, 0, 0, 0, 11, 50453, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Bloodworm - Health Leech');
-- 04[Paladin]Sacred_Shield.sql
-- Add cooldown for Sacred Shield after remove effect as expected
DELETE FROM `spell_script_names` WHERE `spell_id` = 58597;
INSERT INTO `spell_script_names` VALUES
(58597, 'spell_pal_sacred_shield');
-- 05[Generic]Dungeon_Finder.sql
DELETE FROM `spell_script_names` WHERE `spell_id` = 72221;
INSERT INTO `spell_script_names` VALUES
(72221, 'spell_gen_luck_of_the_draw');
-- 06[Druid]Nature_Grasp.sql
-- Añadido CD interno a Nature Grasp.
DELETE FROM `spell_proc_event` WHERE `entry` = 16689;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`)
 VALUE (16689, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2);
-- 07[Hunter]Explosive_trap.sql
-- Fix Spell Explosive Trap (Hunter) daño periódico nulo
UPDATE `spell_bonus_data` SET `ap_dot_bonus` = '0.1' WHERE `entry` = 13812;

-- 08[Paladin]Blessing_of_Sanctuary.sql
DELETE FROM `spell_dbc` WHERE `id` = 20912;
INSERT INTO `spell_dbc` (`Id`,`CastingTimeIndex`,`DurationIndex`,`RangeIndex`,`Effect1`,`EffectBasePoints1`,`EffectImplicitTargetA1`,`EffectApplyAuraName1`,`EffectMiscValue1`,`SpellFamilyName`,`Comment`) VALUES
(20912,1,21,1,6,-3,1,87,127,10,'Blessing of Sanctuary Helper (SERVERSIDE)');
-- Blessing of Sanctuary vs Vigilance
UPDATE `spell_group` SET `spell_id` = 68066 WHERE `id` = 1091 and `spell_id` = 47930;
UPDATE `spell_group` SET `spell_id` = 20912 WHERE `id` = 1092 and `spell_id` = 20911;

-- 09[Priest]Shadowfiend
UPDATE `creature_template_addon` SET `auras`='28305' WHERE `entry`=19668; 

-- 10[Priest]Vampiric_touch
UPDATE `spell_bonus_data` SET `direct_bonus`='1.2' WHERE `entry`=64085;

-- 11[Warrior]Bloodthirst.sql
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 23881;
DELETE FROM `spell_bonus_data` WHERE `entry` = 23880;
INSERT INTO `spell_bonus_data` VALUES (23880, 0, -1, -1, -1, 'Bloodthirst');

-- 12[Shaman]Sentry_Totemt.sql
DELETE FROM `spell_dbc` WHERE `id` IN (6494,6496);
INSERT INTO `spell_dbc` (`Id`,`CastingTimeIndex`,`DurationIndex`,`RangeIndex`,`Effect1`,`EffectBasePoints1`,`EffectImplicitTargetA1`,`EffectImplicitTargetB1`,`EffectApplyAuraName1`,`SpellFamilyName`,`Comment`) VALUES
(6494,1,5,1,6,1,1,27,4,11,'Sentry Totem Helper 1 (SERVERSIDE)'),
(6496,1,5,1,6,1,25,0,1,11,'Sentry Totem Helper 2 (SERVERSIDE)');
UPDATE `creature_template` SET `spell1` = 6494 WHERE `entry` = 3968;
DELETE FROM `conditions` WHERE `SourceEntry` = 6196;
INSERT INTO `conditions` VALUES
(17,0,6196,0,11,6495,1,0,24,'','Far Sight - Sentry Totem');

-- 13_[Paladin]Righteous_Defense.sql
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_pal_righteous_defense';
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(31789,'spell_pal_righteous_defense');


-- 14_[Gral]Spell_Coef_Bonus_Proc.sql
-- -----------------------
-- DRUIDA
-- -----------------------

-- Druida Spells Fix Stack Sp y coeficientes.
UPDATE `spell_bonus_data` SET `direct_bonus` = 0, `dot_bonus` = 0 WHERE `entry` IN (779,1822,60089);
DELETE FROM `spell_bonus_data` WHERE `entry` IN (1079,9007,22568);
INSERT INTO `spell_bonus_data` VALUES
(1079,0,0,-1,-1,'Druid - Rip'),
(9007,0,0,-1,-1,'Druid - Pounce Bleed'),
(22568,0,0,-1,-1,'Druid - Ferocious Bite');
-- Lifebloom final bloom fix
UPDATE `spell_bonus_data` SET `direct_bonus`=0.3857 WHERE `entry`=33778 ;
UPDATE `spell_bonus_data` SET `dot_bonus`=0.0653 WHERE `entry` IN (48450, 48451, 48628);

-- -----------------------
-- HUNTER
-- -----------------------
UPDATE `spell_bonus_data` SET `direct_bonus` = 0, `dot_bonus` = 0 WHERE `entry` IN (3044,3674,13812,13797,1978,42243);
UPDATE `spell_bonus_data` SET `ap_dot_bonus` = 0.1 WHERE `entry` = 13812;
DELETE FROM `spell_bonus_data` WHERE `entry` IN (24131,53353,53254,53215,53216,53217,53352,53209);
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) 
VALUES
(24131,0,0,-1,-1,'Hunter - Wyvern Sting (triggered)'),
(53353,0,0,-1,-1,'Hunter - Chimera Shot (Serpent)'),
(53209,0,0,-1,-1,'Hunter - Chimera Shot -  Rank 1'),
(53254 ,0,0,0,0,'Hunter - Wild Quiver Auto shot (triggered)'),
(53215,0,0,0,0,'Hunter - Wild Quiver Auto shot Rank1'),
(53216 ,0,0,0,0,'Hunter - Wild Quiver Auto shot Rank2'),
(53217,0,0,0,0,'Hunter - Wild Quiver Auto shot Rank3'),
(53352,0,0,0.14,0,'Hunter - Explosive Shot (triggered)');-- Fix Explosive Shot 

DELETE FROM `spell_ranks` WHERE `first_spell_id` = 24131;
INSERT INTO `spell_ranks` VALUES
(24131,24131,1),
(24131,24134,2),
(24131,24135,3),
(24131,27069,4),
(24131,49009,5),
(24131,49010,6);


-- -----------------------
-- ROGUE
-- -----------------------
-- Fix Rogue - Deadly Poison No stack SP.
UPDATE `spell_bonus_data` SET `direct_bonus` = 0, `dot_bonus` = 0 WHERE `entry` IN (2818,2819,11353,11354,25349,26968,27187,57969,57970);

-- -----------------------
-- DK
-- -----------------------

-- -----------------------
-- Enchants
-- -----------------------
-- Enchants
DELETE FROM `spell_bonus_data` WHERE `entry` IN (6297, 13897, 20004, 28005, 20006, 44525); 
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES
(6297,0,0,0,0,'Enchant - Fiery Blaze'),
(13897,0,0,0,0,'Enchant - Fiery Weapon'),
(20004,0,0,0,0,'Enchant - Lifestealing'),
(28005,0,0,0,0,'Enchant - Battlemaster'),
(20006,0,0,0,0,'Enchant - Unholy Weapon'),
(44525,0,0,0,0,'Enchant - Icebreaker');

-- --------------------------
-- Items
-- ----------------------------
-- Trinkets - Reign of the Unliving, Reign of the Dead
DELETE FROM spell_bonus_data WHERE entry IN (67760,67714);
INSERT INTO spell_bonus_data (entry,direct_bonus,dot_bonus,ap_bonus,ap_dot_bonus,comments) VALUES
(67760,0,0,0,0, 'Item - Coliseum 25 Heroic Caster Trinket - Pillar of Flame'),
(67714,0,0,0,0, 'Item - Coliseum 25 Normal Caster Trinket - Pillar of Flame');
DELETE FROM spell_proc_event WHERE entry IN (67712,67758);
INSERT INTO spell_proc_event (entry,SchoolMask,SpellFamilyName,SpellFamilyMask0,SpellFamilyMask1,SpellFamilyMask2,procFlags,procEx,ppmRate,CustomChance,Cooldown) VALUES
(67712,0,0,0,0,0,0x00011000,0x0000002,0,0,2),
(67758,0,0,0,0,0,0x00011000,0x0000002,0,0,2);


-- Fix Stacks  Earth and Moon & Ebon Plague & Curse of Elements
DELETE FROM `spell_group` WHERE `id` = 1114;
INSERT INTO `spell_group` (`id`, `spell_id`) VALUES
(1114,1490),
(1114,60431),
(1114,60432),
(1114,60433),
(1114,51726),
(1114,51734),
(1114,51735);
DELETE FROM `spell_group_stack_rules` WHERE `group_id` = 1114;
INSERT INTO `spell_group_stack_rules` (`group_id`, `stack_rule`) VALUES
(1114,1);


-- 15_[Gral]Demonic_Circle_Bota_Flag.sql
-- Demonic Circle: Teleport
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=48020;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
( 48020,-23335, 0, 'Bota la flag Demonic Circle: Teleport en WSG'),-- Warsong Gulch
( 48020,-23333, 0, 'Bota la flag Demonic Circle: Teleport en WSG'),-- Warsong Gulch
( 48020,-34976, 0, 'Bota la flag Demonic Circle: Teleport en EOS');-- Eye of Storm


-- 16_[Paladinl]Hear_of_the_crusader_J_Of_just.sql
-- Fix Heart of the Crusader and Judgements of the Just proc. 
UPDATE `spell_proc_event` SET `procFlags` = 272, `CustomChance` = 100 WHERE `entry` IN (53695,53696,20335,20336,20337);

-- 17_[Mago]]Brain_Freeze.sql
-- Brain Freeze
DELETE FROM `spell_proc_event` WHERE `entry` IN (44549, 44548, 44546);

-- 18_[Mechanic]Binari_Resistecias.sql
DELETE FROM `playercreateinfo_spell` WHERE `Spell` IN ('199995');
INSERT INTO `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) VALUES
('5','9','199995','Chaos Bolt Passive (SERVERSIDE)'),
('2','9','199995','Chaos Bolt Passive (SERVERSIDE)'),
('1','9','199995','Chaos Bolt Passive (SERVERSIDE)'),
('7','9','199995','Chaos Bolt Passive (SERVERSIDE)'),
('10','9','199995','Chaos Bolt Passive (SERVERSIDE)');




