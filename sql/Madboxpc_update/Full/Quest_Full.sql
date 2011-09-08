-- 01_[Quest]Argent_Tournament.sql
-- Spells Torneo Montas
DELETE FROM `spell_script_names` WHERE `spell_id` IN (62960,62575,62544,62863);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
('62960', 'spell_tournament_charge'),
('62575', 'spell_tournament_shield'),
('62544', 'spell_tournament_melee'),
('62863', 'spell_tournament_duel');
-- Quest Threat From Above
-- UPDATE `creature_template` SET `ScriptName`='npc_chillmaw' WHERE `entry`=33687;
-- -----------------------------------------------
-- ARGENT TOURNAMENT SOPORTE BLIZLIKE.
-- QUEST SOPORTES:
-- Quest The Argent Tournament A/H 13668 - 13667
-- Quest Mastery Of Melee A/H 13829 - 13828
-- Quest Mastery Of The Charge A/H 13839 - 13837
-- Quest Mastery Of The Shield-Breaker A/H 13838 - 13835
-- Quest Up To The Challenge A/H 13678 - 13672
-- Quest A Worthy Weapon A/H (daily) 13600-13669-13674-13742-13747-13753-13758-13763-13769-13774-13779-13784.
-- Quest The Edge of Winter A/H (daily) 13616-13670-13675-13743-13748-13754-13759-13764-13770-13775-13780-13785. (Faltante Agregar Textos Al EAI Segun video http://www.youtube.com/watch?v=iPzCEwf7B5Y).
-- Quest The Aspirant's Challenge 13679 - 13680
-- Quest A Blade Fit For A Champion (daily) 13603, 13666, 13673, 13741, 13746, 13752, 13757, 13762, 13768, 13773, 13778, 13783. Spawnear mas Ranas segun video http://www.youtube.com/watch?v=hYdl0BeR8a0 y darle movimiento.
-- Quest A Valiant's Field Training (daily) 13592-13744-13749-13755-13760-13765-13771-13776-13781-13786.
-- Quest The Grand Melee (daily) 13665-13745-13750-13756-13761-13767-13772-13777-13782-13787.
-- Quest At The Enemy's Gates NO FUNCIONAL YA QUE SE NECEISTA UN SNIF DE BLIZARD PARA SABER EL AURA QUE DEJA A LOS PLAYER EN LA OTAR FASE PARA PODER SPAWNEAR ESOS NPCS Y EL PUEBLO DE ESTA QUEST.
-- Quest The Valiant's Challenge 13699-13713-13723-13724-13725-13726-13727-13728-13729-13731.
-- -----------------------------------------------

-- -----------------------------------------------
-- TEXTOS
-- -----------------------------------------------
-- DELETE FROM `script_texts` WHERE `entry` BETWEEN -1850003 AND -1850013;
DELETE FROM `script_texts` WHERE `entry` IN (-1850000,-1850001,-1850002,-1850003,-1850004,-1850005,-1850006,-1850007,-1850008,-1850009,-1850010,-1850011,-1850012);
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc2`,`comment`) VALUES
(0, -1850004, 'Stand ready !', 'Stand ready !',''),
(0, -1850005, 'Let the battle begin!', 'Let the battle begin!',''),
(0, -1850006, 'Prepare your self !', 'Prepare your self! !',''),
(0, -1850007, 'You think you have the courage?  We shall see.', 'You think you have the courage in you? Will see.',''),
(0, -1850008, 'Impressive demonstration. I think you\'re able to join the ranks of the valiants.', 'Impressive demonstration. I think you\'re able to join the ranks of the valiants.',''),
(0, -1850009, 'I\ve won. Youll probably have more luck next time.', 'Ive won. Youll probably have more luck next time.',''),
(0, -1850010, 'I stand defeated. Nice battle !', 'I stand defeated. Nice battle !',''),
(0, -1850011, 'It seems that I\'ve underestimated your skills. Well done.', 'It seems that I\'ve underestimated your skills. Well done.',''),
(0, -1850012, 'You\'ll probably have more luck next time.', 'You\'ll probably have more luck next time.','');
 
-- -----------------------------------------------
-- ASIGNACION SCRIPTS.
-- -----------------------------------------------
UPDATE `creature_template` SET `ScriptName`='quest_givers_argent_tournament' WHERE `entry` IN (33593, 33592, 33225, 33312, 33335, 33379, 33373, 33361, 33403, 33372);
UPDATE `creature_template` SET `ScriptName`='npc_quest_givers_for_crusaders' WHERE `entry` IN (34882, 35094);
UPDATE `creature_template` SET `ScriptName`='npc_crusader_rhydalla' WHERE `entry`= 33417;
UPDATE `creature_template` SET `ScriptName`='npc_eadric_the_pure' WHERE `entry`= 33759;
UPDATE `creature_template` SET `ScriptName`='npc_crok_scourgebane' WHERE `entry`= 33762;
UPDATE `creature_template` SET `ScriptName`='npc_valis_windchaser' WHERE `entry`= 33974;
UPDATE `creature_template` SET `ScriptName`='npc_rugan_steelbelly' WHERE `entry`= 33972;
UPDATE `creature_template` SET `ScriptName`='npc_jeran_lockwood' WHERE `entry`= 33973;
UPDATE `creature_template` SET `ScriptName`='npc_training_dummy_argent' WHERE `entry` IN (33272,33243,33229);
UPDATE `creature_template` SET `npcflag`='3' ,`ScriptName` = 'npc_variant' WHERE `entry` IN (33739, 33749, 33745, 33744, 33748,  33746, 33740, 33743, 33747, 33738); 
UPDATE `creature_template` SET `ScriptName` = 'npc_keritose', `npcflag`='3' WHERE `entry`= 30946;
UPDATE `creature_template` SET `ScriptName`='npc_vendor_argent_tournament' WHERE `entry` IN (33553, 33554, 33556, 33555, 33557, 33307, 33310, 33653, 33650, 33657);
UPDATE `creature_template` SET `ScriptName`='npc_justicar_mariel_trueheart' WHERE `entry`=33817;

-- -----------------------------------------------
-- Misc
-- -----------------------------------------------
-- Monturas Soporte DB al hacer click Montas.
DELETE FROM `npc_spellclick_spells` WHERE npc_entry IN (33842,33796,33798,33791,33792,33799,33843,33800,33795,33790,33793,33794);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `quest_start`, `quest_start_active`, `quest_end`, `cast_flags`, `aura_required`, `aura_forbidden`, `user_type`) VALUES
(33842, 63791, 13668, 1, 13680, 1, 0, 0, 0),-- Aspirant
-- Orgrimmar
(33799, 62783, 13726, 0, 0, 1, 0, 0, 0), -- Champion Of Orgrimmar
(33799, 62783, 13691, 0, 0, 1, 0, 0, 0), -- A Valiant Of Orgrimmar
(33799, 62783, 13707, 0, 0, 1, 0, 0, 0), -- Valiant Of Orgrimmar
-- Sen'jin
(33796, 62784, 13727, 0, 0, 1, 0, 0, 0), -- Champion Of Sen'jin
(33796, 62784, 13693, 0, 0, 1, 0, 0, 0), -- A Valiant Of Sen'jin
(33796, 62784, 13708, 0, 0, 1, 0, 0, 0), -- Valiant Of Sen'jin
-- Thunder Bluff
(33792, 62785, 13728, 0, 0, 1, 0, 0, 0), -- Champion Of Thunder Bluff
(33792, 62785, 13694, 0, 0, 1, 0, 0, 0), -- A Valiant Of Thunder Bluff
(33792, 62785, 13709, 0, 0, 1, 0, 0, 0), -- Valiant Of Thunder Bluff
-- Undercity
(33798, 62787, 13729, 0, 0, 1, 0, 0, 0), -- Champion Of Undercity
(33798, 62787, 13695, 0, 0, 1, 0, 0, 0), -- A Valiant Of Undercity
(33798, 62787, 13710, 0, 0, 1, 0, 0, 0), -- Valiant Of Undercity
-- Silvermoon
(33791, 62786, 13731, 0, 0, 1, 0, 0, 0), -- Champion Of Silvermoon
(33791, 62786, 13696, 0, 0, 1, 0, 0, 0), -- A Valiant Of Silvermoon
(33791, 62786, 13711, 0, 0, 1, 0, 0, 0), -- Valiant Of Silvermoon
(33843, 63792, 13667, 1, 13679, 1, 0, 0, 0), -- Aspirant
-- Darnassus
(33794, 62782, 13725, 0, 0, 1, 0, 0, 0), -- Champion Of Darnassus
(33794, 62782, 13689, 0, 0, 1, 0, 0, 0), -- A Valiant Of Darnassus
(33794, 62782, 13706, 0, 0, 1, 0, 0, 0), -- Valiant Of Darnassus
-- Hurlevent
(33800, 62774, 13699, 0, 0, 1, 0, 0, 0), -- Champion Of Sen'jin
(33800, 62774, 13593, 0, 0, 1, 0, 0, 0), -- A Valiant Of Sen'jin
(33800, 62774, 13684, 0, 0, 1, 0, 0, 0), -- Valiant Of Sen'jin
-- Gnomregan
(33793, 62780, 13723, 0, 0, 1, 0, 0, 0), -- Champion Of Thunder Bluff
(33793, 62780, 13688, 0, 0, 1, 0, 0, 0), -- A Valiant Of Thunder Bluff
(33793, 62780, 13704, 0, 0, 1, 0, 0, 0), -- Valiant Of Thunder Bluff
-- Forgefer
(33795, 62779, 13713, 0, 0, 1, 0, 0, 0), -- Champion Of Forgefer
(33795, 62779, 13685, 0, 0, 1, 0, 0, 0), -- A Valiant Of Undercity
(33795, 62779, 13703, 0, 0, 1, 0, 0, 0), -- Valiant Of Forgefer
-- Exodar
(33790, 62781, 13724, 0, 0, 1, 0, 0, 0), -- Champion Of Exodar
(33790, 62781, 13690, 0, 0, 1, 0, 0, 0), -- A Valiant Of Exodar
(33790, 62781, 13705, 0, 0, 1, 0, 0, 0); -- Valiant Of Exodar
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask` | 2 WHERE `entry` IN (33845, 33319, 33317, 33318, 33217, 33316);-- Inmunidades MOnturas Alliance.
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask` | 2 WHERE `entry` IN (33844, 33320, 33321, 33322, 33323, 33324);-- Inmunidades MOnturas Horde.
UPDATE `creature_template` SET `speed_run`= 1.571429 WHERE `entry` IN (33845, 33319, 33317, 33318, 33217, 33316);-- Velocidad Correspondiente Monturas Alliance.
UPDATE `creature_template` SET `speed_run` = 1.571429 WHERE `entry` IN (33844, 33320, 33321, 33322, 33323, 33324);-- Velocidad Correspondiente Monturas Hordas.
UPDATE `creature_template` SET `Armor_mod`=0 WHERE `entry` IN (33243, 33272, 33229);-- Armor 0
-- Teleports Locations Tabard
DELETE FROM `spell_target_position` WHERE `id` IN (63986,63987);
INSERT INTO `spell_target_position` (`id`,`target_map`,`target_position_x`,`target_position_y`,`target_position_z`,`target_orientation`) VALUES
(63986,571,8574.87,700.595,547.29,5.48),
(63987,571,8460,700,547.4,3.839);
-- Spells Monturas Horda
UPDATE `creature_template` SET `spell1`=62544, `spell2`=62575, `spell3`=62960, `spell4`=62552, `spell5`=64077 WHERE `entry` IN (33844, 33320, 33321, 33322, 33323, 33324);
-- Spells Monturas Ally
UPDATE `creature_template` SET `spell1`=62544, `spell2`=62575, `spell3`=62960, `spell4`=62552, `spell5`=64077 WHERE `entry` IN (33845, 33319, 33317, 33318, 33217, 33316);

-- -----------------------------------------------
-- HORDE UPDATE QUEST
-- -----------------------------------------------
-- Aspirant Quest.
UPDATE `quest_template` SET `PrevQuestId`=0, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13668;
UPDATE `quest_template` SET `PrevQuestId`=13668, `NextQuestId`=13678, `ExclusiveGroup`=-13829, `NextQuestInChain`=0 WHERE `entry` IN (13829, 13839, 13838);
-- Daily Aspirant Quests
UPDATE `quest_template` SET `PrevQuestId`=-13678, `NextQuestId`=0, `ExclusiveGroup`=13673, `NextQuestInChain`=0 WHERE `entry`=13673;
UPDATE `quest_template` SET `PrevQuestId`=-13678, `NextQuestId`=0, `ExclusiveGroup`=13673, `NextQuestInChain`=0 WHERE `entry`=13675;
UPDATE `quest_template` SET `PrevQuestId`=-13678, `NextQuestId`=0, `ExclusiveGroup`=13673, `NextQuestInChain`=0 WHERE `entry`=13674;
UPDATE `quest_template` SET `PrevQuestId`=-13678, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13676;
UPDATE `quest_template` SET `PrevQuestId`=-13678, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13677;
-- End Of Aspirant Quests
UPDATE `quest_template` SET `PrevQuestId`=13678, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13680;
-- Valiant Quests
UPDATE `quest_template` SET `PrevQuestId`=13680 WHERE `entry` IN (13691, 13693, 13694, 13695, 13696);
UPDATE `quest_template` SET `RequiredRaces`=2, `NextQuestId`=13697, `NextQuestInChain`=13697, `ExclusiveGroup`=13691 WHERE `entry`=13691;
UPDATE `quest_template` SET `RequiredRaces`=128, `NextQuestId`=13719, `NextQuestInChain`=13719, `ExclusiveGroup`=13693 WHERE `entry`=13693;
UPDATE `quest_template` SET `RequiredRaces`=32, `NextQuestId`=13720, `NextQuestInChain`=13720, `ExclusiveGroup`=13694 WHERE `entry`=13694;
UPDATE `quest_template` SET `RequiredRaces`=16, `NextQuestId`=13721, `NextQuestInChain`=13721, `ExclusiveGroup`=13695 WHERE `entry`=13695;
UPDATE `quest_template` SET `RequiredRaces`=512, `NextQuestId`=13722, `NextQuestInChain`=13722, `ExclusiveGroup`=13696 WHERE `entry`=13696;
-- INFOS DEV  13687 --  13701
UPDATE `quest_template` SET `PrevQuestId`=13701 WHERE `entry` IN (13707, 13708, 13709, 13710, 13711); -- TOScript en el core (revisar 13687)
UPDATE `quest_template` SET `NextQuestId`=13697, `NextQuestInChain`=13697, `ExclusiveGroup`=13691 WHERE `entry`=13707;
UPDATE `quest_template` SET `NextQuestId`=13719, `NextQuestInChain`=13719, `ExclusiveGroup`=13693 WHERE `entry`=13708;
UPDATE `quest_template` SET `NextQuestId`=13720, `NextQuestInChain`=13720, `ExclusiveGroup`=13694 WHERE `entry`=13709;
UPDATE `quest_template` SET `NextQuestId`=13721, `NextQuestInChain`=13721, `ExclusiveGroup`=13695 WHERE `entry`=13710;
UPDATE `quest_template` SET `NextQuestId`=13722, `NextQuestInChain`=13722, `ExclusiveGroup`=13696 WHERE `entry`=13711;
UPDATE `quest_template` SET `PrevQuestId`=0, `ExclusiveGroup`=0 WHERE `entry` IN (13697, 13719, 13720, 13721, 13722);
UPDATE `quest_template` SET `PrevQuestId`=0, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=13680 WHERE `entry`=13678;
UPDATE `quest_template` SET `NextQuestId`=13726, `NextQuestInChain`=13726 WHERE `entry`=13697;
UPDATE `quest_template` SET `NextQuestId`=13727, `NextQuestInChain`=13727  WHERE `entry`=13719;
UPDATE `quest_template` SET `NextQuestId`=13728, `NextQuestInChain`=13728  WHERE `entry`=13720;
UPDATE `quest_template` SET `NextQuestId`=13729, `NextQuestInChain`=13729  WHERE `entry`=13721;
UPDATE `quest_template` SET `NextQuestId`=13731, `NextQuestInChain`=13731  WHERE `entry`=13722;
-- Valiant Daily Quests
-- A Blade Fit For A Champion
-- The Edge Of Winter
-- A Worthy Weapon
UPDATE `quest_template` SET `PrevQuestId`=-13697, `NextQuestId`=0, `ExclusiveGroup`=13762, `NextQuestInChain`=0 WHERE `entry` IN (13762, 13763, 13764);
UPDATE `quest_template` SET `PrevQuestId`=-13719, `NextQuestId`=0, `ExclusiveGroup`=13768, `NextQuestInChain`=0 WHERE `entry` IN (13768, 13769, 13770);
UPDATE `quest_template` SET `PrevQuestId`=-13720, `NextQuestId`=0, `ExclusiveGroup`=13773, `NextQuestInChain`=0 WHERE `entry` IN (13773, 13774, 13775);
UPDATE `quest_template` SET `PrevQuestId`=-13721, `NextQuestId`=0, `ExclusiveGroup`=13778, `NextQuestInChain`=0 WHERE `entry` IN (13778, 13779, 13780);
UPDATE `quest_template` SET `PrevQuestId`=-13722, `NextQuestId`=0, `ExclusiveGroup`=13783, `NextQuestInChain`=0 WHERE `entry` IN (13783, 13784, 13785);
-- A Valiant's Field Training
-- The Grand Melee
-- At The Enemy's Gates
UPDATE `quest_template` SET `PrevQuestId`=-13697, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry` IN (13765, 13767, 13856);
UPDATE `quest_template` SET `PrevQuestId`=-13719, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry` IN (13771, 13772, 13857);
UPDATE `quest_template` SET `PrevQuestId`=-13720, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry` IN (13776, 13777, 13858);
UPDATE `quest_template` SET `PrevQuestId`=-13721, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry` IN (13781, 13782, 13860);
UPDATE `quest_template` SET `PrevQuestId`=-13722, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry` IN (13786, 13787, 13859);
-- End Of Valiant Quests
UPDATE `quest_template` SET `PrevQuestId`=13697, `NextQuestId`=13736, `ExclusiveGroup`=0, `NextQuestInChain`=13736 WHERE `entry`=13726;
UPDATE `quest_template` SET `PrevQuestId`=13719, `NextQuestId`=13737, `ExclusiveGroup`=0, `NextQuestInChain`=13737 WHERE `entry`=13727;
UPDATE `quest_template` SET `PrevQuestId`=13720, `NextQuestId`=13738, `ExclusiveGroup`=0, `NextQuestInChain`=13738 WHERE `entry`=13728;
UPDATE `quest_template` SET `PrevQuestId`=13721, `NextQuestId`=13739, `ExclusiveGroup`=0, `NextQuestInChain`=13739 WHERE `entry`=13729;
UPDATE `quest_template` SET `PrevQuestId`=13722, `NextQuestId`=13740, `ExclusiveGroup`=0, `NextQuestInChain`=13740 WHERE `entry`=13731;
-- A Champion Rises (Final Quest)
UPDATE `quest_template` SET `PrevQuestId`=13726, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13736;
UPDATE `quest_template` SET `PrevQuestId`=13727, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13737;
UPDATE `quest_template` SET `PrevQuestId`=13728, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13738;
UPDATE `quest_template` SET `PrevQuestId`=13729, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13739;
UPDATE `quest_template` SET `PrevQuestId`=13740, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13740;
-- Debug Quest Requirements
UPDATE `quest_template` SET `RequiredRaces`=690 WHERE `entry` IN (13697, 13719, 13720, 13721, 13722);
UPDATE `quest_template` SET `RequiredRaces`=690 WHERE `entry` IN (13726, 13727, 13728, 13729, 13731);
UPDATE `quest_template` SET `RequiredRaces`=690 WHERE `entry` IN (13736, 13737, 13738, 13739, 13740);
-- Debug QuestRelation H2
DELETE FROM `creature_questrelation` WHERE `quest` IN (13691, 13693, 13694, 13695, 13696, 13829, 13680, 13678);
INSERT `creature_questrelation` (`id`, `quest`) VALUES 
(33542, 13691), 
(33542, 13693), 
(33542, 13694), 
(33542, 13695), 
(33542, 13696), 
(33542,13829), 
(33542, 13680), 
(33542, 13678);

-- -----------------------------------------------
-- ALLIANCE UPDATE QUEST
-- -----------------------------------------------
-- Aspirant Quests
UPDATE `quest_template` SET `PrevQuestId`=0, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13667;
UPDATE `quest_template` SET `PrevQuestId`=13667, `NextQuestId`=13672, `ExclusiveGroup`=-13828, `NextQuestInChain`=0 WHERE `entry` IN (13828, 13837, 13835);
UPDATE `quest_template` SET `PrevQuestId`=0, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=13679 WHERE `entry`=13672;
-- Daily Aspirant Quests
UPDATE `quest_template` SET `PrevQuestId`=-13672, `NextQuestId`=0, `ExclusiveGroup`=13666, `NextQuestInChain`=0 WHERE `entry`=13666;
UPDATE `quest_template` SET `PrevQuestId`=-13672, `NextQuestId`=0, `ExclusiveGroup`=13666, `NextQuestInChain`=0 WHERE `entry`=13670;
UPDATE `quest_template` SET `PrevQuestId`=-13672, `NextQuestId`=0, `ExclusiveGroup`=13666, `NextQuestInChain`=0 WHERE `entry`=13669;
UPDATE `quest_template` SET `PrevQuestId`=-13672, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13671;
UPDATE `quest_template` SET `PrevQuestId`=-13672, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13625;
-- End Of Aspirant Quests
UPDATE `quest_template` SET `PrevQuestId`=13672, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13679;
-- Valiant Quests
UPDATE `quest_template` SET `PrevQuestId`=13679 WHERE `entry` IN (13684, 13685, 13689, 13688, 13690);
UPDATE `quest_template` SET `RequiredRaces`=1, `NextQuestId`=13718, `NextQuestInChain`=13718, `ExclusiveGroup`=13684 WHERE `entry`=13684;
UPDATE `quest_template` SET `RequiredRaces`=4, `NextQuestId`=13714, `NextQuestInChain`=13714, `ExclusiveGroup`=13685 WHERE `entry`=13685;
UPDATE `quest_template` SET `RequiredRaces`=8, `NextQuestId`=13717, `NextQuestInChain`=13717, `ExclusiveGroup`=13689 WHERE `entry`=13689;
UPDATE `quest_template` SET `RequiredRaces`=64, `NextQuestId`=13715, `NextQuestInChain`=13715, `ExclusiveGroup`=13688 WHERE `entry`=13688;
UPDATE `quest_template` SET `RequiredRaces`=1024, `NextQuestId`=13716, `NextQuestInChain`=13716, `ExclusiveGroup`=13690 WHERE `entry`=13690;
-- INFOS DEV  13686 -- 13700
UPDATE `quest_template` SET `PrevQuestId`=13700 WHERE `entry` IN (13593, 13703, 13706, 13704, 13705); -- TOScript into the core (check of 13686)
UPDATE `quest_template` SET `NextQuestId`=13718, `NextQuestInChain`=13718, `ExclusiveGroup`=13718 WHERE `entry`=13593;
UPDATE `quest_template` SET `NextQuestId`=13714, `NextQuestInChain`=13714, `ExclusiveGroup`=13714 WHERE `entry`=13703;
UPDATE `quest_template` SET `NextQuestId`=13717, `NextQuestInChain`=13717, `ExclusiveGroup`=13717 WHERE `entry`=13706;
UPDATE `quest_template` SET `NextQuestId`=13715, `NextQuestInChain`=13715, `ExclusiveGroup`=13715 WHERE `entry`=13704;
UPDATE `quest_template` SET `NextQuestId`=13716, `NextQuestInChain`=13716, `ExclusiveGroup`=13716 WHERE `entry`=13705;
UPDATE `quest_template` SET `PrevQuestId`=0, `ExclusiveGroup`=0 WHERE `entry` IN (13718, 13714, 13717, 13715, 13716);
UPDATE `quest_template` SET `NextQuestId`=13699, `NextQuestInChain`=13699 WHERE `entry`=13718;
UPDATE `quest_template` SET `NextQuestId`=13713, `NextQuestInChain`=13713  WHERE `entry`=13714;
UPDATE `quest_template` SET `NextQuestId`=13725, `NextQuestInChain`=13725  WHERE `entry`=13717;
UPDATE `quest_template` SET `NextQuestId`=13723, `NextQuestInChain`=13723  WHERE `entry`=13715;
UPDATE `quest_template` SET `NextQuestId`=13724, `NextQuestInChain`=13724  WHERE `entry`=13716;
-- Valiant Daily Quests
-- A Blade Fit For A Champion
-- The Edge Of Winter
-- A Worthy Weapon
UPDATE `quest_template` SET `PrevQuestId`=-13718, `NextQuestId`=0, `ExclusiveGroup`=13603, `NextQuestInChain`=0 WHERE `entry` IN (13603, 13600, 13616);
UPDATE `quest_template` SET `PrevQuestId`=-13714, `NextQuestId`=0, `ExclusiveGroup`=13741, `NextQuestInChain`=0 WHERE `entry` IN (13741, 13742, 13743);
UPDATE `quest_template` SET `PrevQuestId`=-13717, `NextQuestId`=0, `ExclusiveGroup`=13757, `NextQuestInChain`=0 WHERE `entry` IN (13757, 13758, 13759);
UPDATE `quest_template` SET `PrevQuestId`=-13715, `NextQuestId`=0, `ExclusiveGroup`=13746, `NextQuestInChain`=0 WHERE `entry` IN (13746, 13747, 13748);
UPDATE `quest_template` SET `PrevQuestId`=-13716, `NextQuestId`=0, `ExclusiveGroup`=13752, `NextQuestInChain`=0 WHERE `entry` IN (13752, 13753, 13754);
-- A Valiant's Field Training
-- The Grand Melee
-- At The Enemy's Gates
UPDATE `quest_template` SET `PrevQuestId`=-13718, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry` IN (13592, 13665, 13847);
UPDATE `quest_template` SET `PrevQuestId`=-13714, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry` IN (13744, 13745, 13851);
UPDATE `quest_template` SET `PrevQuestId`=-13717, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry` IN (13760, 13761, 13855);
UPDATE `quest_template` SET `PrevQuestId`=-13715, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry` IN (13749, 13750, 13852);
UPDATE `quest_template` SET `PrevQuestId`=-13716, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry` IN (13755, 13756, 13854);
-- End Of Valiant Quests
UPDATE `quest_template` SET `PrevQuestId`=13718, `NextQuestId`=13702, `ExclusiveGroup`=0, `NextQuestInChain`=13702 WHERE `entry`=13699;
UPDATE `quest_template` SET `PrevQuestId`=13714, `NextQuestId`=13732, `ExclusiveGroup`=0, `NextQuestInChain`=13732 WHERE `entry`=13713;
UPDATE `quest_template` SET `PrevQuestId`=13717, `NextQuestId`=13735, `ExclusiveGroup`=0, `NextQuestInChain`=13735 WHERE `entry`=13725;
UPDATE `quest_template` SET `PrevQuestId`=13715, `NextQuestId`=13733, `ExclusiveGroup`=0, `NextQuestInChain`=13733 WHERE `entry`=13723;
UPDATE `quest_template` SET `PrevQuestId`=13716, `NextQuestId`=13734, `ExclusiveGroup`=0, `NextQuestInChain`=13734 WHERE `entry`=13724;
-- A Champion Rises (Final Quest)
UPDATE `quest_template` SET `PrevQuestId`=13699, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13702;
UPDATE `quest_template` SET `PrevQuestId`=13713, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13732;
UPDATE `quest_template` SET `PrevQuestId`=13725, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13735;
UPDATE `quest_template` SET `PrevQuestId`=13723, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13733;
UPDATE `quest_template` SET `PrevQuestId`=13734, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13734;
-- Debug Quest Requirements
UPDATE `quest_template` SET `RequiredRaces`=1101 WHERE `entry` IN (13718, 13714, 13717, 13715, 13716);
UPDATE `quest_template` SET `RequiredRaces`=1101 WHERE `entry` IN (13699, 13713, 13725, 13723, 13724);
UPDATE `quest_template` SET `RequiredRaces`=1101 WHERE `entry` IN (13702, 13732, 13735, 13733, 13734);
-- Debug QuestRelation A2
DELETE FROM `creature_questrelation` WHERE `quest` IN (13828, 13672, 13679, 13684, 13685, 13689, 13688, 13690);
INSERT `creature_questrelation` (`id`, `quest`) VALUES 
(33625, 13828), 
(33625, 13672), 
(33625, 13679), 
(33625, 13684), 
(33625, 13685), 
(33625,13689), 
(33625, 13688), 
(33625, 13690);

-- -----------------------------------------------
-- QUEST GRAL. UPDATE
-- -----------------------------------------------
-- Black Night chain
UPDATE `quest_template` SET `PrevQuestId`=0, `NextQuestId`=13641, `ExclusiveGroup`=13633, `NextQuestInChain`=13641 WHERE `entry` IN (13633, 13634);
UPDATE `quest_template` SET `PrevQuestId`=0, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=13643 WHERE `entry`=13641;
UPDATE `quest_template` SET `PrevQuestId`=13641, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=13654 WHERE `entry`=13643;
UPDATE `quest_template` SET `PrevQuestId`=13643, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=13663 WHERE `entry`=13654;
UPDATE `quest_template` SET `PrevQuestId`=13654, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=13664 WHERE `entry`=13663;
UPDATE `quest_template` SET `PrevQuestId`=13663, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=14016 WHERE `entry`=13664;
UPDATE `quest_template` SET `PrevQuestId`=13664, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=14017 WHERE `entry`=14016;
UPDATE `quest_template` SET `PrevQuestId`=14016, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=14017;
-- Champion Dailies
UPDATE `quest_template` SET `PrevQuestId`=0, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13794; -- Eadric the Pure 
UPDATE `quest_template` SET `PrevQuestId`=0, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13795; -- The Scourgebane
-- Among The Champions
UPDATE `quest_template` SET `RequiredRaces`=1101, `PrevQuestId`=13794, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13790; -- Alliance Among The Champions
UPDATE `quest_template` SET `RequiredRaces`=1101, `PrevQuestId`=13795, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13793; -- Alliance DK Among The Champions
UPDATE `quest_template` SET `RequiredRaces`=690, `PrevQuestId`=13794, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13811; -- Horde Among The Champions
UPDATE `quest_template` SET `RequiredRaces`=690, `PrevQuestId`=13795, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13814; -- Horde DK Among The Champions
-- Battle Before The Citadel
UPDATE `quest_template` SET `RequiredRaces`=1101, `PrevQuestId`=13794, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13861; -- Alliance Battle Before The Citadel
UPDATE `quest_template` SET `RequiredRaces`=1101, `PrevQuestId`=13795, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13864; -- Alliance DK Battle Before The Citadel
UPDATE `quest_template` SET `RequiredRaces`=690, `PrevQuestId`=13794, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13862; -- Horde Battle Before The Citadel
UPDATE `quest_template` SET `RequiredRaces`=690, `PrevQuestId`=13795, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13863; -- Horde DK Battle Before The Citadel
-- Taking Battle To The Enemy
UPDATE `quest_template` SET `RequiredRaces`=1101, `PrevQuestId`=13794, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13789; -- Alliance Taking Battle To The Enemy
UPDATE `quest_template` SET `RequiredRaces`=1101, `PrevQuestId`=13795, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13791; -- Alliance DK Taking Battle To The Enemy
UPDATE `quest_template` SET `RequiredRaces`=690, `PrevQuestId`=13794, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13810; -- Horde Taking Battle To The Enemy
UPDATE `quest_template` SET `RequiredRaces`=690, `PrevQuestId`=13795, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13813; -- Horde DK Taking Battle To The Enemy
-- Threat From Above
UPDATE `quest_template` SET `RequiredRaces`=1101, `PrevQuestId`=13794, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13682; -- Alliance Threat From Above
UPDATE `quest_template` SET `RequiredRaces`=1101, `PrevQuestId`=13795, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13788; -- Alliance DK Threat From Above
UPDATE `quest_template` SET `RequiredRaces`=690, `PrevQuestId`=13794, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13809; -- Horde Threat From Above
UPDATE `quest_template` SET `RequiredRaces`=690, `PrevQuestId`=13795, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=13812; -- Horde DK Threat From Above
-- Crusader dailies
-- Mistcaller Yngvar
-- Drottinn Hrothgar
-- Ornolf The Scarred
-- Deathspeaker Kharos
UPDATE `quest_template` SET `ExclusiveGroup`=14102, `NextQuestId`=0, `NextQuestInChain`=0 WHERE `entry` IN (14102, 14101, 14104, 14105);
-- The Fate Of The Fallen
-- Get Kraken!
-- Identifying the Remains
UPDATE `quest_template` SET `ExclusiveGroup`=14107, `NextQuestId`=0, `NextQuestInChain`=0 WHERE `entry` IN (14107, 14108, 14095);
-- Covenant Quests
UPDATE `quest_template` SET `PrevQuestId`=13700, `RequiredMinRepFaction`=1094, `RequiredMinRepValue`=42000, `NextQuestId`=0, `NextQuestInChain`=0 WHERE `entry` IN (14112, 14076, 14090, 14096, 14152, 14080, 14077, 14074); -- Alliance
UPDATE `quest_template` SET `PrevQuestId`=13701, `RequiredMinRepFaction`=1124, `RequiredMinRepValue`=42000, `NextQuestId`=0, `NextQuestInChain`=0 WHERE `entry` IN (14145, 14092, 14141, 14142, 14136, 14140, 14144, 14143); -- Horde
-- What Do You Feed A Yeti, Anyway?
-- Breakfast Of Champions
-- Gormok Wants His Snobolds
UPDATE `quest_template` SET `ExclusiveGroup`=14112 WHERE `entry` IN (14112, 14145, 14076, 14092, 14090, 14141); -- A1, H1, A2, H2, A3, H3
-- You've Really Done It This Time, Kul
-- Rescue At Sea
-- Stop The Agressors
-- The Light's Mercy
-- A Leg Up
UPDATE `quest_template` SET `ExclusiveGroup`=14152 WHERE `entry` IN (14152, 14136, 14080, 14140, 14077, 14144, 14074, 14143); -- A1, H1, A2, H2, A3, H3, A4, H4
-- Champion Marker
UPDATE `quest_template` SET `NextQuestId`=13846, `ExclusiveGroup`=13700 WHERE `entry` IN (13700, 13701); -- Alliance, Horde
-- Contributin' To The Cause
UPDATE `quest_template` SET `RequiredMaxRepFaction`=1106, `RequiredMaxRepValue`=42000 WHERE `entry`=13846;
-- Goblin Dailies Removing
-- The Blastbolt Brothers
-- A Chip Off the Ulduar Block
-- Jack Me Some Lumber
DELETE FROM `creature_questrelation` WHERE `quest` IN (13820, 13681, 13627);
-- DK Quests Restrictions
-- The Scourgebane
-- Taking Battle To The Enemy (A, H)
-- Threat From Above (A, H)
-- Among the Champions (A, H)
-- Battle Before The Citadel (A, H)
UPDATE `quest_template` SET `SkillOrClassMask`=-32 WHERE `entry` IN (13795, 13791, 13813, 13788, 13812, 13793, 13814, 13864, 13863);
-- Non DK Quests Restrictions
-- Eadric The Pure
-- Taking Battle To The Enemy (A, H)
-- Threat From Above (A, H)
-- Among the Champions (A, H)
-- Battle Before The Citadel (A, H)
UPDATE `quest_template` SET `SkillOrClassMask`=-1503 WHERE `entry` IN (13794, 13788, 13789, 13810, 13682, 13809, 13790, 13811, 13861, 13862);
-- Quest A Blade Fit For A Champion: 13603, 13666, 13673, 13741, 13746, 13752, 13757, 13762, 13768, 13773, 13778, 13783
-- Lake Frog
-- Maiden Of Ahswood Lake
UPDATE `creature_template` SET `ScriptName` = 'npc_lake_frog' WHERE `entry` =33211;
UPDATE `creature_template` SET `npcflag` = `npcflag` | 1, `ScriptName` = 'npc_maiden_of_ashwood_lake' WHERE `creature_template`.`entry` =33220;
DELETE FROM `creature` WHERE `id` =33211;
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`)
VALUES 
('33211','571','1','1','0','0','3725.43','-4311.13','180.978','2.05551','300','0','0','40','120','0','0');-- Spawn Rana Quest (faltante añadir movimiento por la laguna con waypoints).
DELETE FROM `script_texts` WHERE `entry` = -1850015;
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES 
('0','-1850015','Can it really be? Free after all these years?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0','0','0','');

-- frog speed from sniff
UPDATE `creature_template` SET `speed_run` = 1 WHERE `entry` = 33211;
UPDATE `creature_template` SET `speed_walk` = 1.6 WHERE `entry` = 33211;
-- Quest : Le fil de l'hiver
DELETE FROM `creature` WHERE `guid` = '336364';
INSERT INTO `creature` (`guid`,`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES  
(336364,33289,571,1,1,0,0,5136.74,-83.3769,347.326,1.44434,300,0,0,12600,3994,0,0);
DELETE FROM `creature_loot_template` WHERE `entry`=33289 AND `item`=45005;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`) VALUES (33289, 45005, -100);
DELETE FROM `script_texts` WHERE `entry` IN (-1850000,-1850001,-1850002,-1850003);
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc2`,`comment`) VALUES
(0, -1850000, 'Oh, these are winter hyacinths? For me ?', 'Oh, these are hyacinth\'s winter? For me  ?',''),
(0, -1850001, 'We had not had brought flowers here for so long.', 'We had not had brought flowers here for so long.',''),
(0, -1850002, 'The lake is a lonely spot for some years. Travelers have stopped coming over, and evil has invaded the waters.', 'The lake is a lonely spot some years. Travelers to come over, and evil has invaded the waters.',''),
(0, -1850003, 'Your gift shows a rare kindness, traveler. Please, take this blade as a token of my gratitude. Long ago, there was another traveler who had left it here, but I do not need it. ',' Your gift shows a rare kindness, traveler. Please, take this blade as a token of my gratitude. Long ago, there was another traveler who had left it here, but I do not need it.','');
DELETE FROM `event_scripts` WHERE `id`=20990;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `x`, `y`, `z`, `o`) 
VALUES (20990, 0, 10, 33273, 42000, 4602.977, -1600.141, 156.7834, 0.7504916);

UPDATE `creature_template` SET `InhabitType`=5, `ScriptName`='npc_maiden_of_drak_mar' WHERE `entry`=33273;

DELETE FROM `creature_template_addon` WHERE `entry`=33273;
INSERT INTO `creature_template_addon` (`entry`, `emote`) VALUES (33273, 13); -- 13 = EMOTE_STATE_SIT
-- Quest : 
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16 WHERE `entry` IN (29720,29719,29722);
DELETE FROM `creature` WHERE `id` IN (29720,29719,29722);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(NULL, 29720, 571, 1, 1, 0, 0, 8562.48, 2771.93, 759.958, 6.10672, 300, 15, 0, 12175, 0, 0, 1),
(NULL, 29720, 571, 1, 1, 0, 0, 8584.64, 2760.8, 759.958, 2.59599, 300, 15, 0, 12600, 0, 0, 1),
(NULL, 29720, 571, 1, 1, 0, 0, 8617.49, 2735.11, 759.958, 2.32895, 300, 15, 0, 12175, 0, 0, 1),
(NULL, 29720, 571, 1, 1, 0, 0, 8420.8, 2688.71, 759.957, 1.33806, 300, 15, 0, 12600, 0, 0, 1),
(NULL, 29719, 571, 1, 1, 0, 0, 8417.11, 2641.07, 759.957, 1.57604, 300, 15, 0, 12600, 0, 0, 1),
(NULL, 29719, 571, 1, 1, 0, 0, 8435.89, 2596.91, 759.957, 2.30577, 300, 15, 0, 12175, 0, 0, 1),
(NULL, 29720, 571, 1, 1, 0, 0, 8477.25, 2565.16, 759.957, 2.51783, 300, 15, 0, 12175, 0, 0, 1),
(NULL, 29719, 571, 1, 1, 0, 0, 8522.14, 2556.99, 759.957, 3.11709, 300, 15, 0, 12175, 0, 0, 1),
(NULL, 29720, 571, 1, 1, 0, 0, 8571.58, 2559.95, 759.957, 4.05564, 300, 0, 0, 12600, 0, 0, 0),
(NULL, 29720, 571, 1, 1, 0, 0, 8609.24, 2589.19, 759.958, 0.155352, 300, 15, 0, 12175, 0, 0, 1),
(NULL, 29719, 571, 1, 1, 0, 0, 8637.35, 2651.77, 759.958, 4.15303, 300, 15, 0, 12600, 0, 0, 1),
(NULL, 29719, 571, 1, 1, 0, 0, 8636.85, 2679.47, 759.958, 4.93842, 300, 15, 0, 12175, 0, 0, 1);
-- Quest Support Among the Champions 13790-13811-13793-13814
UPDATE `creature_template` SET `ScriptName`='npc_valiant', `dmg_multiplier`=2 WHERE `entry` IN (33285,33306,33384,33383,33382,33739,33749,33745,33744,33748,33740,33743,33747,33738,33746,33561,33558,33559,33562);
-- Fix Quest The Seer's Crystal - It Could Kill Us All
UPDATE `creature_template` SET `lootid`=33422,`mingold`=1584,`maxgold`=2640 WHERE `entry`=33422;
DELETE FROM `creature_loot_template` WHERE `entry`=33422;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES 
(33422,45064,-17,1,0,1,1);
-- Quest Gormok Wants His Snobolds
DELETE FROM `creature_ai_texts` WHERE `entry` IN (-7033,-7035,-7034);
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=29618;
UPDATE `creature_template` SET `AIName`='EventAI' WHERE `entry` =29618;
INSERT INTO `creature_ai_scripts`(`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES
(77770084,29618,8,0,100,1,66474,-1,6000,6000,33,34899,6,0,22,1,0,0,0,0,0,0,'Snowblind Follower Proxy credit - q14141 q14090'),
(77770085,29618,0,1,100,1,4000,4000,6000,6000,23,-1,0,0,41,0,0,0,0,0,0,0,'Snowblind Follower Proxy credit - q14141 q14090'),
(77770086,29618,1,1,100,1,4000,4000,6000,6000,23,-1,0,0,41,0,0,0,0,0,0,0,'Snowblind Follower Proxy credit - q14141 q14090'),
(77770087,29618,0,1,100,1,2000,2000,6000,6000,1,-7033,-7034,-7035,0,0,0,0,0,0,0,0,'Snowblind Follower say - q14141 q14090'),
(77770088,29618,1,1,100,1,2000,2000,6000,6000,1,-7033,-7034,-7035,0,0,0,0,0,0,0,0,'Snowblind Follower say - q14141 q14090');
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
(-7033,'You no take... me!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,5,'c29618 Snowblind Follower - q14141 q14090'),
(-7034,'No! Me not afraid! Grrrrr! No kill me!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,5,'c29618 Snowblind Follower - q14141 q14090'),
(-7035,'Net not stop me! No... net stop me',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,5,'c29618 Snowblind Follower - q14141 q14090');
-- Quest A Worthy Weapon A/H (daily) 13600-13669-13674-13742-13747-13753-13758-13763-13769-13774-13779-13784
DELETE FROM `creature_ai_texts` WHERE `entry` IN (-7012,-7011);
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=33273;
UPDATE `creature_template` SET `AIName`='EventAI' WHERE `entry` = 33273;
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES
(77770019,33273,1,0,100,1,17000,17000,60000,60000,1,-7011,0,0,0,0,0,0,0,0,0,0,'Maiden of Drak\'Mar - all quest named \&quot;A Worthy Weapon\&quot;'),
(77770020,33273,1,0,100,1,9000,9000,60000,60000,1,-7012,0,0,0,0,0,0,0,0,0,0,'Maiden of Drak\'Mar - all quest named \&quot;A Worthy Weapon\&quot;');
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
(-7012,'It\'s been so long since a traveler has come here bearing flowers.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,'c33273 Maiden of Drak\'Mar - all quest named \&quot;A Worthy Weapon\&quot;'),
(-7011,'The lake has been too lonely these past years. The travelers stopped coming and evil came to these waters.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,'c33273 Maiden of Drak\'Mar - all quest named \&quot;A Worthy Weapon\&quot;');
DELETE FROM `gameobject` WHERE `id` =300009;
INSERT INTO `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`)VALUES 
('300009','571','1','1','4601.68','-1601.91','156.659','1.0243','0','0','0.490051','0.871694','1','0','1');
-- Quest The Grand Melee Quests 13665-13745-13750-13756-13761-13767-13772-13777-13782-13787.- http://www.wowhead.com/search?q=The+Grand+Melee 
UPDATE `creature_template` SET `ScriptName`='npc_ValiantGrandMelee' WHERE `entry` IN (33561,33564,33558,33559,33562);
-- Quest The Valiant's Challenge 13699-13713-13723-13724-13725-13726-13727-13728-13729-13731. 
UPDATE `creature_template` SET `ScriptName`='npc_squire_danny' WHERE `entry` = 33518;
UPDATE `creature_template` SET `faction_a`=14,`faction_h`=14,`movementId`=48,`ScriptName`='npc_argent_champion' WHERE `entry` = 33707;
DELETE FROM `creature_template_addon` WHERE `entry`=33707;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES 
('33707','0','28918','0','0','0',NULL);-- Montura no es la original porfavor cambiar.
DELETE FROM `script_texts` WHERE `entry` IN (-1850013,-1850014);
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES 
('0','-1850013','You believe you are ready to be a champion? Defend yourself!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0','0','0',''),
('0','-1850014','Most impressive. You are worthy to gain the rank of champion!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0','0','0','');

-- Fix Quest There's Something About the Squire (http://www.wowhead.com/quest=13654)
-- http://code.google.com/p/madboxpcwow/issues/detail?id=169&sort=-id#makechanges
UPDATE `creature_template` SET `scriptname`='npc_maloric' WHERE `entry`=33498;
-- Creature Script
UPDATE creature_template SET scriptname='npc_maloric' WHERE entry=33498;
-- Conditions
DELETE FROM `conditions` WHERE `SourceEntry` = 63124 AND `ConditionValue1` = 33498;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ErrorTextId`,`Comment`) VALUES 
(17,63124,1,19,33498,447,'Item Large Femur - Npc Maloric');
-- loot item Large Femur
UPDATE `creature_template` SET lootid = 33499 WHERE `entry` = 33499;
DELETE FROM `creature_loot_template` WHERE `item` = 45080;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('33499','45080','-100','1','0','1','1');
-- Spawn
UPDATE `creature_template` SET MovementType = 1 WHERE `entry` = '33499';
DELETE FROM `creature` WHERE `id` = '33499';
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
('33499','571','1','1','0','1858','5470.29','400.611','160.27','5.40927','300','5','0','12175','0','0','1'),
('33499','571','1','1','0','1858','5478.44','369.635','152.741','5.60091','300','5','0','12175','0','0','1'),
('33499','571','1','1','0','1858','5456.16','335.95','154.495','5.24198','300','5','0','12175','0','0','1'),
('33499','571','1','1','0','1858','5380.89','373.719','173.494','5.53258','300','5','0','12175','0','0','1'),
('33499','571','1','1','0','1858','5417.8','337.264','161.858','4.87128','300','5','0','12175','0','0','1'),
('33499','571','1','1','0','1858','5450.22','317.678','153.375','5.7957','300','5','0','12175','0','0','1'),
('33499','571','1','1','0','1858','5427.31','285.311','155.185','5.34723','300','5','0','12175','0','0','1'),
('33499','571','1','1','0','1858','5446.45','250','151.935','6.22845','300','5','0','12175','0','0','1'),
('33499','571','1','1','0','1858','5379','238.12','166.777','5.09198','300','5','0','12175','0','0','1'),
('33499','571','1','1','0','1858','5419.02','200.04','153.596','5.89073','300','5','0','12175','0','0','1'),
('33499','571','1','1','0','1858','5365.49','173.051','163.403','5.81062','300','5','0','12175','0','0','1'),
('33499','571','1','1','0','1858','5421.02','149.316','150.516','0.0583642','300','5','0','12175','0','0','1'),
('33499','571','1','1','0','1858','5443.25','371.767','163.366','4.35449','300','5','0','12175','0','0','1');
SET @Guid=1000141; -- SELECT creature.guid FROM creature ORDER BY creature.guid DESC LIMIT 1;
DELETE FROM `creature` WHERE id=33429;
INSERT INTO `creature` (guid,id,map,spawnMask,phaseMask,modelid,equipment_id,position_x,position_y,position_z,orientation,spawntimesecs,spawndist,currentwaypoint,curhealth,curmana,DeathState,MovementType,npcflag,unit_flags,dynamicflags) VALUES
(@Guid+0,33429,571,1,256,0,0,6253.47,2263.21,244.456,0.488692,120,0,0,1,0,0,0,0,0,0),
(@Guid+1,33429,571,1,256,0,0,6217.16,2252.59,496.038,0.488692,120,0,0,1,0,0,0,0,0,0),
(@Guid+2,33429,571,1,256,0,0,6234.1,2301.56,488.447,0.488692,120,0,0,1,0,0,0,0,0,0),
(@Guid+3,33429,571,1,256,0,0,6163.18,2231.77,506.981,0.488692,120,0,0,1,0,0,0,0,0,0),
(@Guid+4,33429,571,1,256,0,0,6172.18,2257.27,503.146,0.488692,120,0,0,1,0,0,0,0,0,0),
(@Guid+5,33429,571,1,256,0,0,6242.42,2246.47,491.941,0.56266,120,0,0,1,0,0,0,0,0,0),
(@Guid+6,33429,571,1,256,0,0,6202.35,2284.08,495.286,0.488692,120,0,0,1,0,0,0,0,0,0),
(@Guid+7,33429,571,1,256,0,0,6145.68,2208.17,512.426,0.488692,120,0,0,1,0,0,0,0,0,0);
-- Template updates for creature 33429 (Boneguard Lieutenant)
UPDATE `creature_template` SET speed_run=2 WHERE entry=33429; -- Boneguard Lieutenant
-- Model data 29098 (creature 33429 (Boneguard Lieutenant))
UPDATE creature_model_info SET bounding_radius=0.459,combat_reach=2.25,gender=0 WHERE modelid=29098; -- Boneguard Lieutenant
-- Addon data for creature 33429 (Boneguard Lieutenant)
DELETE FROM creature_template_addon WHERE entry=33429;
INSERT INTO creature_template_addon (entry,mount,bytes1,bytes2,emote,auras) VALUES
(33429,25678,0,1,0,NULL); -- Boneguard Lieutenant


-- ----------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------

-- 02_[Quest]IceCrown_Crusaders.sql
-- ########################## Citadel Footsteps #########################
-- ############# Complete Questlinking ##################################
-- Blackwatch ... Prev: The Shadow Vault Allianz OR The Shadow Vault Horde
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13106;
DELETE FROM conditions WHERE SourceEntry = 13106 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13106,0,8,12898,0,0,0,'',''),
(19,0,13106,0,8,12898,0,0,0,'',''),
(20,0,13106,1,8,12899,0,0,0,'',''),
(19,0,13106,1,8,12899,0,0,0,'','');
-- Where Are They Coming From? ... Prev: Blackwatch
UPDATE quest_template SET PrevQuestId = 13106, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13117;
-- Death's Gaze ... Prev: Where Are They Coming From?
UPDATE quest_template SET PrevQuestId = 13117, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13120;
-- Destroying the Altars ... Prev: Where Are They Coming From?
UPDATE quest_template SET PrevQuestId = 13117, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13119;
-- I'm Not Dead Yet! H ... Prev: Death's Gaze AND Destroying the Altars
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13229;
DELETE FROM conditions WHERE SourceEntry = 13229 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13229,0,8,13120,0,0,0,'',''),
(19,0,13229,0,8,13120,0,0,0,'',''),
(20,0,13229,0,8,13119,0,0,0,'',''),
(19,0,13229,0,8,13119,0,0,0,'','');
-- I'm Not Dead Yet! A ... Prev: Death's Gaze AND Destroying the Altars
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13221;
DELETE FROM conditions WHERE SourceEntry = 13221 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13221,0,8,13120,0,0,0,'',''),
(19,0,13221,0,8,13120,0,0,0,'',''),
(20,0,13221,0,8,13119,0,0,0,'',''),
(19,0,13221,0,8,13119,0,0,0,'','');
-- Spill Their Blood ... Prev: Death's Gaze AND Destroying the Altars
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13134;
DELETE FROM conditions WHERE SourceEntry = 13134 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13134,0,8,13120,0,0,0,'',''),
(19,0,13134,0,8,13120,0,0,0,'',''),
(20,0,13134,0,8,13119,0,0,0,'',''),
(19,0,13134,0,8,13119,0,0,0,'','');
-- Jagged Shards ... Prev: Death's Gaze AND Destroying the Altars
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13136;
DELETE FROM conditions WHERE SourceEntry = 13136 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13136,0,8,13120,0,0,0,'',''),
(19,0,13136,0,8,13120,0,0,0,'',''),
(20,0,13136,0,8,13119,0,0,0,'',''),
(19,0,13136,0,8,13119,0,0,0,'','');
-- The Runesmiths of Malykriss ... Prev: Jagged Shards     
UPDATE quest_template SET PrevQuestId = 13136, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13140;
-- I'm Smelting... Smelting! ... Prev: Jagged Shards
UPDATE quest_template SET PrevQuestId = 13136, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13138;
-- By Fire Be Purged ... Prev: I'm Smelting... Smelting! AND The Runesmiths of Malykriss AND Spill Their Blood 
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13211;
DELETE FROM conditions WHERE SourceEntry = 13211 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13211,0,8,13140,0,0,0,'',''),
(19,0,13211,0,8,13140,0,0,0,'',''),
(20,0,13211,0,8,13134,0,0,0,'',''),
(19,0,13211,0,8,13134,0,0,0,'',''),
(20,0,13211,0,8,13138,0,0,0,'',''),
(19,0,13211,0,8,13138,0,0,0,'','');
-- A Visit to the Doctor ... Prev: I'm Smelting... Smelting! AND The Runesmiths of Malykriss AND Spill Their Blood 
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13152;
DELETE FROM conditions WHERE SourceEntry = 13152 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13152,0,8,13140,0,0,0,'',''),
(19,0,13152,0,8,13140,0,0,0,'',''),
(20,0,13152,0,8,13134,0,0,0,'',''),
(19,0,13152,0,8,13134,0,0,0,'',''),
(20,0,13152,0,8,13138,0,0,0,'',''),
(19,0,13152,0,8,13138,0,0,0,'','');
-- Killing Two Scourge With One Skeleton ... Prev: A Visit to the Doctor AND By Fire Be Purged
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13144;
DELETE FROM conditions WHERE SourceEntry = 13144 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13144,0,8,13152,0,0,0,'',''),
(19,0,13144,0,8,13152,0,0,0,'',''),
(20,0,13144,0,8,13211,0,0,0,'',''),
(19,0,13144,0,8,13211,0,0,0,'','');
-- Let's Get Out of Here A ... Prev: Killing Two Scourge With One Skeleton 
UPDATE quest_template SET PrevQuestId = 13144, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13482;
-- Let's Get Out of Here H ... Prev: Killing Two Scourge With One Skeleton
UPDATE quest_template SET PrevQuestId = 13144, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13481;
-- He's Gone to Pieces ... Prev: Killing Two Scourge With One Skeleton ... NextQuestInChain: Putting Olakin Back Together Again
UPDATE quest_template SET PrevQuestId = 13144, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13220 WHERE entry = 13212;
-- Putting Olakin Back Together Again ... Prev: He's Gone to Pieces ... NextQuestInChain: The Flesh Giant Champion
UPDATE quest_template SET PrevQuestId = 13212, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13235 WHERE entry = 13220;
-- The Flesh Giant Champion ... Prev: Putting Olakin Back Together Again
UPDATE quest_template SET PrevQuestId = 13220, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13235;
-- ####################################################
-- Exploiting an Opening(A) ... Prev: The SkyBreaker AND The ShadowVault ... NextQuestInChain: Securing the Perimeter
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13387 WHERE entry = 13386;
DELETE FROM conditions WHERE SourceEntry = 13386 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13386,0,8,12898,0,0,0,'',''),
(19,0,13386,0,8,12898,0,0,0,'',''),
(20,0,13386,0,8,13225,0,0,0,'',''),
(19,0,13386,0,8,13225,0,0,0,'','');
-- Securing the Perimeter ... Prev: Exploiting an Opening ... NextQuestInChain: Set it Off!
UPDATE quest_template SET PrevQuestId = 13386, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13388 WHERE entry = 13387;
-- Set it Off! ... Prev: Securing the Perimeter ... NextQuestInChain: A Short Fuse
UPDATE quest_template SET PrevQuestId = 13387, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13389 WHERE entry = 13388;
-- A Short Fuse ... Prev: Set it Off! ... NextQuestInChain: A Voice in the Dark
UPDATE quest_template SET PrevQuestId = 13388, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13390 WHERE entry = 13389;
-- A Voice in the Dark ... Prev: A Short Fuse ... NextQuestInChain: Time to Hide
UPDATE quest_template SET PrevQuestId = 13389, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13391 WHERE entry = 13390;
--  Time to Hide ... Prev:  A Voice in the Dark ... NextQuestInChain: Return to the Surface
UPDATE quest_template SET PrevQuestId = 13390, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13392 WHERE entry = 13391;
-- Return to the Surface ... Prev: Time to Hide ... NextQuestInChain: Field Repairs
UPDATE quest_template SET PrevQuestId = 13391, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13393 WHERE entry = 13392;
-- Field Repairs ... Prev: Return to the Surface 
UPDATE quest_template SET PrevQuestId = 13392, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13393;
-- Do Your Worst ... Prev: Field Repairs ... NextQuestInChain: Army of the Damned
UPDATE quest_template SET PrevQuestId = 13393, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13395 WHERE entry = 13394;
-- Army of the Damned ... Prev: Do Your Worst ... NextQuestInChain: Futility
UPDATE quest_template SET PrevQuestId = 13394, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13396 WHERE entry = 13395;
-- Futility ... Prev: Army of the Damned ... NextQuestInChain: Sindragosa's Fall
UPDATE quest_template SET PrevQuestId = 13395, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13397 WHERE entry = 13396;
-- Sindragosa's Fall ... Prev: Futility 
UPDATE quest_template SET PrevQuestId = 13396, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13397;
-- Where Dragons Fell ... Prev: Futility ... NextQuestInChain:	Time for Answers	
UPDATE quest_template SET PrevQuestId = 13396, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13399 WHERE entry = 13398;
-- Time for Answers ... Prev: Where Dragons Fell ... NextQuestInChain: The Hunter and the Prince
UPDATE quest_template SET PrevQuestId = 13398, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13400 WHERE entry = 13399;
-- The Hunter and the Prince ... Prev: Time for Answers ... NextQuestInChain: Knowledge is a Terrible Burden
UPDATE quest_template SET PrevQuestId = 13399, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13401 WHERE entry = 13400;
-- Knowledge is a Terrible Burden ... Prev: The Hunter and the Prince ... NextQuestInChain: Tirion's Help
UPDATE quest_template SET PrevQuestId = 13400, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13402 WHERE entry = 13401;
-- Tirion's Help ... Prev: Knowledge is a Terrible Burden ... NextQuestInChain: Tirion's Gambit
UPDATE quest_template SET PrevQuestId = 13401, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13403 WHERE entry = 13402;
-- Tirion's Gambit ... Prev: Tirion's Help
UPDATE quest_template SET PrevQuestId = 13402, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13403;
-- ####################################################
-- Opportunity ... Prev: Orgrim's Hammer AND The ShadowVault ... NextQuestInChain: Establishing Superiority
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13259 WHERE entry = 13258;
DELETE FROM conditions WHERE SourceEntry = 13258 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13258,0,8,13224,0,0,0,'',''),
(19,0,13258,0,8,13224,0,0,0,'',''),
(20,0,13258,0,8,12899,0,0,0,'',''),
(19,0,13258,0,8,12899,0,0,0,'','');
-- Establishing Superiority ... Prev: Opportunity ... NextQuestInChain: Blow it Up!
UPDATE quest_template SET PrevQuestId = 13258, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13262 WHERE entry = 13259;
-- Blow it Up! ... Prev:  Establishing Superiority ... NextQuestInChain: A Short Fuse
UPDATE quest_template SET PrevQuestId = 13259, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13263 WHERE entry = 13262;
-- A Short Fuse ... Prev: Blow it Up! ... NextQuestInChain: A Voice in the Dark
UPDATE quest_template SET PrevQuestId = 13262, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13271 WHERE entry = 13263;
-- A Voice in the Dark ... Prev: A Short Fuse ... NextQuestInChain: Time to Hide
UPDATE quest_template SET PrevQuestId = 13263, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13275 WHERE entry = 13271;
-- Time to Hide ... Prev: A Voice in the Dark ... NextQuestInChain: Return to the Surface
UPDATE quest_template SET PrevQuestId = 13271, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13282 WHERE entry = 13275;
-- Return to the Surface ... Prev: Time to Hide ... NextQuestInChain: Field Repairs
UPDATE quest_template SET PrevQuestId = 13275, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13304 WHERE entry = 13282;
-- Field Repairs ... Prev: Return to the Surface
UPDATE quest_template SET PrevQuestId = 13282, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13304;
-- Do Your Worst ... Prev: Field Repairs ... NextQuestInChain: Army of the Damned
UPDATE quest_template SET PrevQuestId = 13304, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13236 WHERE entry = 13305;
-- Army of the Damned ... Prev: Do Your Worst ... NextQuestInChain: Futility
UPDATE quest_template SET PrevQuestId = 13305, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13348 WHERE entry = 13236;
-- Futility ... Prev: Army of the Damned ... NextQuestInChain: Cradle of the Frostbrood
UPDATE quest_template SET PrevQuestId = 13236, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13349 WHERE entry = 13348;
-- Cradle of the Frostbrood ... Prev: Futility
UPDATE quest_template SET PrevQuestId = 13348, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13349;
-- Where Dragons Fell ... Prev: Futility
UPDATE quest_template SET PrevQuestId = 13349, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13359;
-- Time for Answers ... Prev: Where Dragons Fell ... NextQuestInChain: The Hunter and the Prince
UPDATE quest_template SET PrevQuestId = 13359, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13361 WHERE entry = 13360;
-- The Hunter and the Prince ... Prev: Time for Answers ... NextQuestInChain: Knowledge is a Terrible Burden
UPDATE quest_template SET PrevQuestId = 13360, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13362 WHERE entry = 13361;
-- Knowledge is a Terrible Burden ... Prev: The Hunter and the Prince
UPDATE quest_template SET PrevQuestId = 13361, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13362;

-- Argent Aid ... Prev: Knowledge is a Terrible Burden ... NextQuestInChain: Tirion's Gambit
UPDATE quest_template SET PrevQuestId = 13362, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13364 WHERE entry = 13363;
-- Tirion's Gambit ... Prev: Argent Aid
UPDATE quest_template SET PrevQuestId = 13363, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13364;
-- ###############################
-- Parting Gifts ... Prev: A Short Fuse A OR A Short Fuse H
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13168;
DELETE FROM conditions WHERE SourceEntry = 13168 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13168,0,8,13263,0,0,0,'',''),
(19,0,13168,0,8,13263,0,0,0,'',''),
(20,0,13168,1,8,13389,0,0,0,'',''),
(19,0,13168,1,8,13389,0,0,0,'','');
-- An Undead's Best Friend ... Prev: Parting Gifts
UPDATE quest_template SET PrevQuestId = 13168, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13169;
-- Honor is for the Weak ... Prev: Parting Gifts
UPDATE quest_template SET PrevQuestId = 13168, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13170;
-- From Whence They Came ... Prev: Parting Gifts
UPDATE quest_template SET PrevQuestId = 13168, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13171;
-- Seeds of Chaos ... Prev: An Undead's Best Friend AND Honor is for the Weak AND From Whence They Came
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13172;
DELETE FROM conditions WHERE SourceEntry = 13172 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13172,0,8,13169,0,0,0,'',''),
(19,0,13172,0,8,13169,0,0,0,'',''),
(20,0,13172,0,8,13170,0,0,0,'',''),
(19,0,13172,0,8,13170,0,0,0,'',''),
(20,0,13172,0,8,13171,0,0,0,'',''),
(19,0,13172,0,8,13171,0,0,0,'','');
-- Amidst the Confusion ... Prev: An Undead's Best Friend AND Honor is for the Weak AND From Whence They Came
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13174;
DELETE FROM conditions WHERE SourceEntry = 13174 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13174,0,8,13169,0,0,0,'',''),
(19,0,13174,0,8,13169,0,0,0,'',''),
(20,0,13174,0,8,13170,0,0,0,'',''),
(19,0,13174,0,8,13170,0,0,0,'',''),
(20,0,13174,0,8,13171,0,0,0,'',''),
(19,0,13174,0,8,13171,0,0,0,'','');
-- Vereth the Cunning ... Prev: Amidst the Confusion AND Seeds of Chaos ... NextQuestInChain: New Recruit
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13143 WHERE entry = 13155;
DELETE FROM conditions WHERE SourceEntry = 13155 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13155,0,8,13174,0,0,0,'',''),
(19,0,13155,0,8,13174,0,0,0,'',''),
(20,0,13155,0,8,13172,0,0,0,'',''),
(19,0,13155,0,8,13172,0,0,0,'','');
-- New Recruit ... Prev: Vereth the Cunning ... NextQuestInChain: The Vile Hold
UPDATE quest_template SET PrevQuestId = 13155, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13145 WHERE entry = 13143;
-- The Vile Hold ... Prev: New Recruit
UPDATE quest_template SET PrevQuestId = 13143, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13145;
-- Generosity Abounds ... Prev: The Vile Hold
UPDATE quest_template SET PrevQuestId = 13145, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13146;
-- Stunning View ... Prev: The Vile Hold
UPDATE quest_template SET PrevQuestId = 13145, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13160;
-- Matchmaker ... Prev: The Vile Hold
UPDATE quest_template SET PrevQuestId = 13145, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13147;
-- The Rider of the Unholy ... Prev: Generosity Abounds AND Stunning View AND Matchmaker
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13161;
DELETE FROM conditions WHERE SourceEntry = 13161 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13161,0,8,13146,0,0,0,'',''),
(19,0,13161,0,8,13146,0,0,0,'',''),
(20,0,13161,0,8,13160,0,0,0,'',''),
(19,0,13161,0,8,13160,0,0,0,'',''),
(20,0,13161,0,8,13147,0,0,0,'',''),
(19,0,13161,0,8,13147,0,0,0,'','');
-- The Rider of the Frost ... Prev: Generosity Abounds AND Stunning View AND Matchmaker
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13162;
DELETE FROM conditions WHERE SourceEntry = 13162 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13162,0,8,13146,0,0,0,'',''),
(19,0,13162,0,8,13146,0,0,0,'',''),
(20,0,13162,0,8,13160,0,0,0,'',''),
(19,0,13162,0,8,13160,0,0,0,'',''),
(20,0,13162,0,8,13147,0,0,0,'',''),
(19,0,13162,0,8,13147,0,0,0,'','');
-- The Rider of the Blood ... Prev: Generosity Abounds AND Stunning View AND Matchmaker
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13163;
DELETE FROM conditions WHERE SourceEntry = 13163 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13163,0,8,13146,0,0,0,'',''),
(19,0,13163,0,8,13146,0,0,0,'',''),
(20,0,13163,0,8,13160,0,0,0,'',''),
(19,0,13163,0,8,13160,0,0,0,'',''),
(20,0,13163,0,8,13147,0,0,0,'',''),
(19,0,13163,0,8,13147,0,0,0,'','');
-- The Fate of Bloodbane ... Prev: The Rider of the Blood AND Frost AND Unholy
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13164;
DELETE FROM conditions WHERE SourceEntry = 13164 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13164,0,8,13161,0,0,0,'',''),
(19,0,13164,0,8,13161,0,0,0,'',''),
(20,0,13164,0,8,13162,0,0,0,'',''),
(19,0,13164,0,8,13162,0,0,0,'',''),
(20,0,13164,0,8,13163,0,0,0,'',''),
(19,0,13164,0,8,13163,0,0,0,'','');


-- ##########################  Crusaders' Pinnacle ##########################
-- Judgment Day Comes! Allianz ... Next Quest: Honor Above All Else
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 13036, ExclusiveGroup = 13226, NextQuestInChain = 0 WHERE entry = 13226;
-- Judgment Day Comes! Horde ... Next Quest: Honor Above All Else
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 13036, ExclusiveGroup = 13226, NextQuestInChain = 0 WHERE entry = 13227;
-- Wenn das nicht funktioniert:
-- Honor Above All Else ... Prev: Judgment Day Comes! Allianz ODER Judgment Day Comes! Horde ... NextInChain: Scourge Tactics
-- DELETE FROM conditions WHERE SourceEntry = 13036 AND SourceTypeOrReferenceId IN (20,19);
-- INSERT INTO conditions VALUES
-- (20,0,13036,0,8,13226,0,0,0,'',''),
-- (19,0,13036,0,8,13226,0,0,0,'',''),
-- (20,0,13036,1,8,13227,0,0,0,'',''),
-- (19,0,13036,1,8,13227,0,0,0,'','');
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13008 WHERE entry = 13036;
-- Scourge Tactics ... Prev: Honor Above All Else
UPDATE quest_template SET PrevQuestId = 13036, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13008;
-- Defending The Vanguard ... Prev: Honor Above All Else
UPDATE quest_template SET PrevQuestId = 13036, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13039;
-- Curing The Incurable ... Prev: Honor Above All Else
UPDATE quest_template SET PrevQuestId = 13036, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13040;
-- If There Are Survivors... Prev: Scourge Tactics AND Defending The Vanguard AND Curing The Incurable
-- NextInChain: Into The Wild Green Yonder
UPDATE quest_template SET ExclusiveGroup = -13008 WHERE entry = 13008;
UPDATE quest_template SET ExclusiveGroup = -13008 WHERE entry = 13039;
UPDATE quest_template SET ExclusiveGroup = -13008 WHERE entry = 13040;
UPDATE quest_template SET PrevQuestId = 13008, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13045 WHERE entry = 13044;
-- Into The Wild Green Yonder ... Prev:  If There Are Survivors ... NextInChain: A Cold Front Approaches
UPDATE quest_template SET PrevQuestId = 13044, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13070 WHERE entry = 13045;
-- A Cold Front Approaches ... Prev: Into The Wild Green Yonder ... NextInChain: The Last Line Of Defense
UPDATE quest_template SET PrevQuestId = 13045, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13086 WHERE entry = 13070;
-- The Last Line Of Defense ... Prev: A Cold Front Approaches
UPDATE quest_template SET PrevQuestId = 13070, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13086;
-- Once More Unto The Breach, Hero
-- Once More Unto The Breach, Hero  DK only
UPDATE quest_template SET PrevQuestId = 13086, NextQuestId = 0, ExclusiveGroup = 13104, NextQuestInChain = 0 WHERE entry = 13104;
UPDATE quest_template SET PrevQuestId = 13086, NextQuestId = 0, ExclusiveGroup = 13104, NextQuestInChain = 0 WHERE entry = 13105;
-- The Scourgestone ... Prev: Once More Unto The Breach, Hero ODER Once More Unto The Breach, Hero DK only
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13122;
DELETE FROM conditions WHERE SourceEntry = 13122 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13122,0,8,13104,0,0,0,'',''),
(19,0,13122,0,8,13104,0,0,0,'',''),
(20,0,13122,1,8,13105,0,0,0,'',''),
(19,0,13122,1,8,13105,0,0,0,'','');
-- The Purging Of Scourgeholme ... Prev: Once More Unto The Breach, Hero ODER Once More Unto The Breach, Hero DK only
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13118;
DELETE FROM conditions WHERE SourceEntry = 13118 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13118,0,8,13104,0,0,0,'',''),
(19,0,13118,0,8,13104,0,0,0,'',''),
(20,0,13118,1,8,13105,0,0,0,'',''),
(19,0,13118,1,8,13105,0,0,0,'','');
-- The Restless Dead ... Prev: Once More Unto The Breach, Hero ODER Once More Unto The Breach, Hero DK only
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13110;
DELETE FROM conditions WHERE SourceEntry = 13110 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13110,0,8,13104,0,0,0,'',''),
(19,0,13110,0,8,13104,0,0,0,'',''),
(20,0,13110,1,8,13105,0,0,0,'',''),
(19,0,13110,1,8,13105,0,0,0,'','');
-- It Could Kill Us All ... Prev: Once More Unto The Breach, Hero ODER Once More Unto The Breach, Hero DK only
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13135;
DELETE FROM conditions WHERE SourceEntry = 13135 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13135,0,8,13104,0,0,0,'',''),
(19,0,13135,0,8,13104,0,0,0,'',''),
(20,0,13135,1,8,13105,0,0,0,'',''),
(19,0,13135,1,8,13105,0,0,0,'','');
-- The Stone That Started A Revolution ... Prev: Once More Unto The Breach, Hero ODER Once More Unto The Breach, Hero DK only
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13130;
DELETE FROM conditions WHERE SourceEntry = 13130 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13130,0,8,13104,0,0,0,'',''),
(19,0,13130,0,8,13104,0,0,0,'',''),
(20,0,13130,1,8,13105,0,0,0,'',''),
(19,0,13130,1,8,13105,0,0,0,'','');
-- The Air Stands Still ... Prev: The Scourgestone UND The Purging Of Scourgeholme
UPDATE quest_template SET NextQuestId = 13125, ExclusiveGroup = -13122 WHERE entry = 13122;
UPDATE quest_template SET NextQuestId = 13125, ExclusiveGroup = -13122 WHERE entry = 13118;
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13125;
-- Into The Frozen Heart Of Northrend ... Prev: The Air Stands Still AND The Restless Dead AND The Stone That Started A Revolution AND It Could Kill Us All
-- NextQuestInChain: The Battle For Crusaders' Pinnacle
UPDATE quest_template SET NextQuestId = 13139, ExclusiveGroup = -13135 WHERE entry = 13135;
UPDATE quest_template SET NextQuestId = 13139, ExclusiveGroup = -13135 WHERE entry = 13110;
UPDATE quest_template SET NextQuestId = 13139, ExclusiveGroup = -13135 WHERE entry = 13130;
UPDATE quest_template SET NextQuestId = 13139, ExclusiveGroup = -13135 WHERE entry = 13125;
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13141 WHERE entry = 13139;
-- The Battle For Crusaders' Pinnacle ... Prev: Into The Frozen Heart Of Northrend ... NextQuestInChain: The Crusaders' Pinnacle
UPDATE quest_template SET PrevQuestId = 13139, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13157 WHERE entry = 13141;
-- The Crusaders' Pinnacle ... PRev: The Battle For Crusaders' Pinnacle
UPDATE quest_template SET PrevQuestId = 13141, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13157;


-- ##########################  Orgrim's Hammer ##########################
-- ############# Complete Questlinking ##################################
--
-- DELETE FROM `creature_transport` WHERE `guid`=77 AND `transport_entry`=192241 AND `npc_entry`=31261;
-- INSERT INTO `creature_transport` (`guid`,`transport_entry`,`npc_entry`,`TransOffsetX`,`TransOffsetY`,`TransOffsetZ`,`TransOffsetO`,`emote`) VALUES
-- (77,192241,31261,52.5,5.3,30.5268,3.94314,0);
-- Orgrim's Hammer ... Prequest Crusader Pinacle
UPDATE quest_template SET PrevQuestId = 13157, NextQuestId = 0, ExclusiveGroup = 13225, NextQuestInChain = 0 WHERE entry = 13224;
-- Expoiting a Openinig ... Prev: Orgrim's Hammer AND The Shadow Vault - Next in Chain: Securing the Perimeter
UPDATE quest_template SET NextQuestId = 0 WHERE entry = 13224;
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13259 WHERE entry = 13258;
DELETE FROM conditions WHERE SourceEntry = 13258 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13258,0,8,12899,0,0,0,'',''),
(19,0,13258,0,8,12899,0,0,0,'',''),
(20,0,13258,0,8,13224,0,0,0,'',''),
(19,0,13258,0,8,13224,0,0,0,'','');
-- Blood of the Choosen ... Prev: Orgrim's Hammer
UPDATE quest_template SET PrevQuestId = 13224, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13330;
-- Joining the Assault ... Prev: Orgrim's Hammer
UPDATE quest_template SET PrevQuestId = 13224, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13340;
-- -- Assault by ... Prev: Joining the Assault
UPDATE quest_template SET PrevQuestId = 13340, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13310;
UPDATE quest_template SET PrevQuestId = 13340, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13301;
-- Mind Tricks ... Prev: Orgrim's Hammer
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13308;
DELETE FROM conditions WHERE SourceEntry = 13308 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13308,0,8,13225,0,0,0,'',''),
(19,0,13308,0,8,13225,0,0,0,'',''),
(20,0,13308,1,8,13224,0,0,0,'',''),
(19,0,13308,1,8,13224,0,0,0,'','');
-- Slaves to Saronite ... Prev: Orgrim's Hammer
UPDATE quest_template SET PrevQuestId = 13224, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13302;
-- Get to Ymirheim! ... Prev: Orgrim's Hammer ... NextChain: King of the Mountain
UPDATE quest_template SET PrevQuestId = 13224, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13283 WHERE entry = 13293;
-- -- King of the Mountain ... Prev Get to Ymirheim
UPDATE quest_template SET PrevQuestId = 13293, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13283;
-- The Broken Front ... Prev: Orgrim's Hammer
UPDATE quest_template SET PrevQuestId = 13224, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13228;
-- -- Avenge me... Prev: Orgrim's Hammer
UPDATE quest_template SET PrevQuestId = 13224, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13230;
-- Make Them Pay! ... Prev: The Broken Front
UPDATE quest_template SET PrevQuestId = 13228, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13234;
-- Good For Something? ... Prev: The Broken Front ... Next in Chain: Volatility
UPDATE quest_template SET PrevQuestId = 13228, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13239 WHERE entry = 13238;
-- -- Volatility
UPDATE quest_template SET PrevQuestId = 13238, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13239;
-- -- -- Volatility Daily ... Prev: Volatility
UPDATE quest_template SET PrevQuestId = 13239, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13261;
-- -- Green Technology ... Prev: Volatility ... NextinChain: Fringe Science Benefits
UPDATE quest_template SET PrevQuestId = 13239, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13373 WHERE entry = 13379;
-- -- -- Fringe Science Benefits
UPDATE quest_template SET PrevQuestId = 13379, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13373;
-- -- -- -- Riding the Wavelength: The Bombardment ... Prev: Fringe Science Benefits
UPDATE quest_template SET PrevQuestId = 13373, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13406;
-- -- -- -- Total Ohmage: The Valley of Lost Hope! ... Prev: Fringe Science Benefits
UPDATE quest_template SET PrevQuestId = 13373, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13376;
-- Takes One to Know One ... Prev: The Broken Front ... NextInChain: Poke and Prod
UPDATE quest_template SET PrevQuestId = 13228, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13237 WHERE entry = 13260;
-- Poke and Prod ... Prev: Takes One to Know One
UPDATE quest_template SET PrevQuestId =  13260, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13237;
-- Against the Giants ... Prev: Poke and Prod ... Next in Chain: Basic Chemistry
UPDATE quest_template SET PrevQuestId = 13237, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13279 WHERE entry = 13277;
-- Coprous the Defiled ... Prev: Against the Giants
UPDATE quest_template SET PrevQuestId = 13277, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13278;
-- Basic Chemistry ... Prev: Against the Giants
UPDATE quest_template SET PrevQuestId = 13277, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13279;
-- -- Neutralizing the Plague ... Prev: Basic Chemistry
UPDATE quest_template SET PrevQuestId = 13279, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13281;
-- That's Abominable! ... Prev: Poke and Prod 
UPDATE quest_template SET PrevQuestId = 13237, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13264;
-- -- That's Abominable! Daily ... Prev: That's Abominable!
UPDATE quest_template SET PrevQuestId = 13264, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13276;
-- Sneak Preview ... Prev: That's Abominable!
UPDATE quest_template SET PrevQuestId = 13264, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13351;
-- Chain of Command ... Prev: Sneak Preview
UPDATE quest_template SET PrevQuestId = 13351, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13354;
-- Cannot Reproduce ... Prev: Sneak Preview ... Next In Chain: Retest Now
UPDATE quest_template SET PrevQuestId = 13351, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13356 WHERE entry = 13355;
-- -- Retest Now ... Prev: Cannot Reproduce
UPDATE quest_template SET PrevQuestId = 13355, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13356;
-- -- Retest Now Daily ... Prev: Retest Now
UPDATE quest_template SET PrevQuestId = 13356, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13357;
-- Drag and Drop ... Prev: Sneak Preview  
UPDATE quest_template SET PrevQuestId = 13351, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13352;
-- -- Drag and Drop Daily ... Prev: Drag and Drop
UPDATE quest_template SET PrevQuestId = 13352, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13353;
-- -- Not a Bug ... Prev: Drag and Drop
UPDATE quest_template SET PrevQuestId = 13352, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13358;
-- -- -- Not a Bug Daily ... Prev: Not a Bug
UPDATE quest_template SET PrevQuestId = 13358, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13365;
-- Need more Info ... Prev: Drag and Drop ... Next in Chain: No Rest For The Wicked
UPDATE quest_template SET PrevQuestId = 13352, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13367 WHERE entry = 13366;
-- No Rest For the Wicked ... Prev: Need more Info 
UPDATE quest_template SET PrevQuestId = 13366, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13367;
-- -- No Rest For the Wicked Daily ... Prev: No Rest For the Wicked
UPDATE quest_template SET PrevQuestId = 13367, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13368;
-- Raise the Barricades ... Prev: Need more Info 
UPDATE quest_template SET PrevQuestId = 13366, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13306;
-- The Ironwall Rampart ... Prev: Raise the Barricades AND No Rest For the Wicked
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13312;
-- * NextQuestId not used yet so:
UPDATE quest_template SET NextQuestId = 0 WHERE entry = 13306;
UPDATE quest_template SET NextQuestId = 0 WHERE entry = 13367;
DELETE FROM conditions WHERE SourceEntry = 13312 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13312,0,8,13306,0,0,0,'',''),
(19,0,13312,0,8,13306,0,0,0,'',''),
(20,0,13312,0,8,13367,0,0,0,'',''),
(19,0,13312,0,8,13367,0,0,0,'','');
-- Blinding the Eyes in the Sky ... Prev: Raise the Barricades
UPDATE quest_template SET PrevQuestId = 13306, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13313;
-- -- Keeping the Alliance Blind ... Prev: Blinding the Eyes in the Sky
UPDATE quest_template SET PrevQuestId = 13313, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13331;
-- Bloodspattered Banners ... Prev: Raise the Barricades
UPDATE quest_template SET PrevQuestId = 13306, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13307;
-- Before the Gate of Horror ... Prev:  Bloodspattered Banners AND The Ironwall Rampart
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13329;
-- * NextQuestId not used yet so:
UPDATE quest_template SET NextQuestId = 0 WHERE entry = 13307;
UPDATE quest_template SET NextQuestId = 0 WHERE entry = 13312;
DELETE FROM conditions WHERE SourceEntry = 13329 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13329,0,8,13307,0,0,0,'',''),
(19,0,13329,0,8,13307,0,0,0,'',''),
(20,0,13329,0,8,13312,0,0,0,'',''),
(19,0,13329,0,8,13312,0,0,0,'','');
-- Shatter the Shards ... Prev: Before the Gate of Horror
UPDATE quest_template SET PrevQuestId = 13329, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13328;
-- The Guardians of Corp'rethar ... Prev: Before the Gate of Horror
UPDATE quest_template SET PrevQuestId = 13329, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13316;

-- ##########################  The Shadow Vault #########################
-- ############# Complete Questlinking ##################################

-- If He Cannot Be Turned Alliance ... Prev: Non ... NextInChain: The Shadow Vault
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 12898 WHERE entry = 12896;
-- If He Cannot Be Turned Horde ... Prev: Non ... NextInChain: The Shadow Vault
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 12899 WHERE entry = 12897;
-- The Shadow Vault Alliance... Prev: If He Cannot Be Turned Alliance ... NextInChain: The Duke
UPDATE quest_template SET PrevQuestId = 12896, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 12938 WHERE entry = 12898;
-- The Shadow Vault Horde... Prev: If He Cannot Be Turned Alliance ... NextInChain: The Duke
UPDATE quest_template SET PrevQuestId = 12897, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 12938 WHERE entry = 12899;
-- The Duke... Prev: The Shadow Vault Alliance OR Horde ... NextInChain: Honor Challenge
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 12939 WHERE entry = 12938;
DELETE FROM conditions WHERE SourceEntry = 12938 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,12938,0,8,12898,0,0,0,'',''),
(19,0,12938,0,8,12898,0,0,0,'',''),
(20,0,12938,1,8,12899,0,0,0,'',''),
(19,0,12938,1,8,12899,0,0,0,'','');
-- Honor Challenge ... Prev: The Duke ... NextInChain: Shadow Vault Decree
UPDATE quest_template SET PrevQuestId = 12938, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 12943 WHERE entry = 12939;
-- Shadow Vault Decree ... Prev: Honor Challenge
UPDATE quest_template SET PrevQuestId = 12939, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 12943;
-- Get the Key ... Prev: Honor Challenge ... NextInChain: Let the Baron Know
UPDATE quest_template SET PrevQuestId = 12938, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 12951 WHERE entry = 12949;
-- Let the Baron Know ... Prev: Get the Key 
UPDATE quest_template SET PrevQuestId = 12949, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 12951;
-- Vandalizing Jotunheim ... Prev: Let the Baron Know AND Shadow Vault Decree 
UPDATE quest_template SET PrevQuestId = 12943, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13084;
DELETE FROM conditions WHERE SourceEntry = 13084 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13084,0,8,12951,0,0,0,'',''),
(19,0,13084,0,8,12951,0,0,0,'',''),
(20,0,13084,0,8,12943,0,0,0,'',''),
(19,0,13084,0,8,12943,0,0,0,'','');
-- Leave Our Mark ... Prev: Let the Baron Know AND Shadow Vault Decree 
UPDATE quest_template SET PrevQuestId = 12943, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 12995;
DELETE FROM conditions WHERE SourceEntry = 12995 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,12995,0,8,12951,0,0,0,'',''),
(19,0,12995,0,8,12951,0,0,0,'',''),
(20,0,12995,0,8,12943,0,0,0,'',''),
(19,0,12995,0,8,12943,0,0,0,'','');
/*
DELETE FROM conditions WHERE SourceTypeOrReferenceId = 13 AND SourceEntry = 23301;
INSERT INTO conditions VALUES
(13,0,23301,0,18,2,29880,0,0,'',''),
(13,0,23301,0,18,2,30243,0,0,'',''),
(13,0,23301,0,18,2,30632,0,0,'',''),
(13,0,23301,0,18,2,30725,0,0,'','');*/
-- Crush Dem Vrykuls! ... Prev: Let the Baron Know AND Shadow Vault Decree ... NextInChain: Vile Like Fire!
UPDATE quest_template SET PrevQuestId = 12943, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13071 WHERE entry = 12992;
DELETE FROM conditions WHERE SourceEntry = 12992 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,12992,0,8,12951,0,0,0,'',''),
(19,0,12992,0,8,12951,0,0,0,'',''),
(20,0,12992,0,8,12943,0,0,0,'',''),
(19,0,12992,0,8,12943,0,0,0,'','');
-- -- Vile Like Fire! ... Prev: Crush Dem Vrykuls!
UPDATE quest_template SET PrevQuestId = 12992, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13071;
-- Vaelen Has Returned ... Prev: Let the Baron Know AND Shadow Vault Decree ... NextInChain: Ebon Blade Prisoners
UPDATE quest_template SET PrevQuestId = 12943, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 12982 WHERE entry = 13085;
-- Ebon Blade Prisoners ... Prev: Vaelen Has Returned
UPDATE quest_template SET PrevQuestId = 13085, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 12982;
-- -- Shoot 'Em Up ... Prev: Ebon Blade Prisoners
UPDATE quest_template SET PrevQuestId = 12982, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13069;
-- To the Rise with all Due Haste! ... Prev: Ebon Blade Prisoners ... NextInChain: The Story Thus Far...
UPDATE quest_template SET PrevQuestId = 12982, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 12807 WHERE entry = 12806;
-- The Story Thus Far... ... Prev: To the Rise with all Due Haste! ... NextInChain: Blood in the Water 
UPDATE quest_template SET PrevQuestId = 12806, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 12810 WHERE entry = 12807;
-- Blood in the Water ... Prev: The Story Thus Far... ... NextInChain: You'll Need a Gryphon
UPDATE quest_template SET PrevQuestId = 12807, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 12814 WHERE entry = 12810;
-- You'll Need a Gryphon
UPDATE quest_template SET PrevQuestId = 12810, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 12814;
-- -- From Their Corpses, Rise! ... Prev: The Story Thus Far...
UPDATE quest_template SET PrevQuestId = 12807, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 12813;
-- -- No Fly Zone ... Prev: You'll Need a Gryphon
UPDATE quest_template SET PrevQuestId = 12814, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 12815;
-- -- Intelligence Gathering ... Prev: The Story Thus Far...
UPDATE quest_template SET PrevQuestId = 12807, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 12838;
-- -- -- The Grand (Admiral's) Plan ... Prev:  The Story Thus Far... ... NextInChain: In Strict Confidence
UPDATE quest_template SET PrevQuestId = 12807, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 12840 WHERE entry = 12839;
-- -- -- In Strict Confidence ... Prev: The Grand (Admiral's) Plan ... NextInChain: Second Chances
UPDATE quest_template SET PrevQuestId = 12839, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 12847 WHERE entry = 12840;
-- -- -- Second Chances ... Prev: In Strict Confidence ... NextInChain: The Admiral Revealed
UPDATE quest_template SET PrevQuestId = 12840, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 12852 WHERE entry = 12847;
-- -- -- The Admiral Revealed ... Prev: Second Chances
UPDATE quest_template SET PrevQuestId = 12847, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 12852;

-- Eliminate the Competition ... Prev: The Duke ... NextInChain: The Bone Witch
UPDATE quest_template SET PrevQuestId = 12938, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 12999 WHERE entry = 12955;
-- The Bone Witch ... Prev: Eliminate the Competition
UPDATE quest_template SET PrevQuestId = 12955, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 12999;
-- -- Reading the Bones ... Prev: The Bone Witch
UPDATE quest_template SET PrevQuestId = 12999, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13092;
-- -- Reading the Bones Repeatable ... Prev: Reading the Bones
UPDATE quest_template SET PrevQuestId = 13092, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13093;
-- Deep in the Bowels of The Underhalls ... Prev: The Bone Witch
UPDATE quest_template SET PrevQuestId = 12999, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13042;
-- Revenge for the Vargul ... Prev: The Bone Witch
UPDATE quest_template SET PrevQuestId = 12999, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13059;
-- The Sum is Greater than the Parts ... Prev: The Bone Witch ... NextInChain: The Art of Being a Water Terror
UPDATE quest_template SET PrevQuestId = 12999, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13091 WHERE entry = 13043;
-- The Art of Being a Water Terror ... Prev: The Sum is Greater than the Parts ... NextInChain: Through the Eye
UPDATE quest_template SET PrevQuestId = 13043, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13121 WHERE entry = 13091;
--  Through the Eye ... Prev: The Art of Being a Water Terror ... NextInChain: Find the Ancient Hero
UPDATE quest_template SET PrevQuestId = 13091, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13133 WHERE entry = 13121;
-- Find the Ancient Hero ... Prev: Through the Eye  ... NextInChain: Not-So-Honorable Combat
UPDATE quest_template SET PrevQuestId = 13121, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13137 WHERE entry = 13133;
-- Not-So-Honorable Combat ... Prev: Find the Ancient Hero  ... NextInChain: Banshee's Revenge
UPDATE quest_template SET PrevQuestId = 13133, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13142 WHERE entry =13137;
-- Banshee's Revenge ... Prev: Not-So-Honorable Combat ... NextInChain: Battle at Valhalas
UPDATE quest_template SET PrevQuestId = 13137, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13213 WHERE entry = 13142;
-- Battle at Valhalas ... Prev: Banshee's Revenge
UPDATE quest_template SET PrevQuestId = 13142, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13213;
-- Battle at Valhalas: Fallen Heroes ... Prev: Battle at Valhalas
UPDATE quest_template SET PrevQuestId = 13213, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13214;
-- Battle at Valhalas: Khit'rix the Dark Master ... Prev: Battle at Valhalas: Fallen Heroes
UPDATE quest_template SET PrevQuestId = 13214, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13215;
-- Battle at Valhalas: The Return of Sigrid Iceborn ... Prev: Battle at Valhalas: Khit'rix the Dark Master
UPDATE quest_template SET PrevQuestId = 13215, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13216;
-- Battle at Valhalas: Carnage! ... Prev: Battle at Valhalas: The Return of Sigrid Iceborn
UPDATE quest_template SET PrevQuestId = 13216, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13217;
-- Battle at Valhalas: Thane Deathblow ... Prev: Battle at Valhalas: Carnage!
UPDATE quest_template SET PrevQuestId = 13217, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13218;
-- Battle at Valhalas: Final Challenge ... Prev: Battle at Valhalas: Thane Deathblow
UPDATE quest_template SET PrevQuestId = 13217, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13219;

-- ##########################  The Skybreaker ###########################
-- ############# Complete Questlinking ##################################

-- The Skybreaker ... Prequest Crusader Pinacle
UPDATE quest_template SET PrevQuestId = 13157, NextQuestId = 0, ExclusiveGroup = 13225, NextQuestInChain = 0 WHERE entry = 13225;
-- Expoiting a Openinig ... Prev: The Skybreaker AND The Shadow Vault - Next in Chain: Securing the Perimeter
UPDATE quest_template SET NextQuestId = 0 WHERE entry = 13225;
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13387 WHERE entry = 13386;
DELETE FROM conditions WHERE SourceEntry = 13386 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13386,0,8,12898,0,0,0,'',''),
(19,0,13386,0,8,12898,0,0,0,'',''),
(20,0,13386,0,8,13225,0,0,0,'',''),
(19,0,13386,0,8,13225,0,0,0,'','');
-- Blood of the Choosen ... Prev: The Skybreaker
UPDATE quest_template SET PrevQuestId = 13225, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13336;
-- Joining the Assault ... Prev: The Skybreaker
UPDATE quest_template SET PrevQuestId = 13225, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13341;
-- -- Assault by ... Prev: Joining the Assault
UPDATE quest_template SET PrevQuestId = 13341, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13309;
UPDATE quest_template SET PrevQuestId = 13341, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13284;
-- Mind Tricks ... Prev: Skybreaker OR Orgrims Hammer
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13308;
DELETE FROM conditions WHERE SourceEntry = 13308 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13308,0,8,13225,0,0,0,'',''),
(19,0,13308,0,8,13225,0,0,0,'',''),
(20,0,13308,1,8,13224,0,0,0,'',''),
(19,0,13308,1,8,13224,0,0,0,'','');
-- Slaves to Saronite ... Prev: Skybreaker
UPDATE quest_template SET PrevQuestId = 13225, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13300;
-- Get to Ymirheim! ... Prev: Skybreaker ... NextChain: King of the Mountain
UPDATE quest_template SET PrevQuestId = 13225, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13280 WHERE entry = 13296;
-- -- King of the Mountain ... Prev Get to Ymirheim
UPDATE quest_template SET PrevQuestId = 13296, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13280;
-- The Broken Front ... Prev: Skybreaker
UPDATE quest_template SET PrevQuestId = 13225, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13231;
-- -- Finish Me ... Prev: Skybreaker
UPDATE quest_template SET PrevQuestId = 13225, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13232;
-- No Mercy ... Prev: The Broken Front
UPDATE quest_template SET PrevQuestId = 13231, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13233;
-- Your Attention, Please ... Prev: The Broken Front ... Next in Chain: Borrowed Technology
UPDATE quest_template SET PrevQuestId = 13231, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13291 WHERE entry = 13290;
-- -- Borrowed Technology
UPDATE quest_template SET PrevQuestId = 13290, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13291;
-- -- -- The Solution Solution Prev: Borrowed Technology
UPDATE quest_template SET PrevQuestId = 13291, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13292;
-- -- Killohertz ... Prev: Borrowed Technology ... NextinChain: Leading the Charge
UPDATE quest_template SET PrevQuestId = 13291, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13380 WHERE entry = 13383;
-- -- -- Leading the Charge
UPDATE quest_template SET PrevQuestId = 13383, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13380;
-- -- -- -- Static Shock Troops: the Bombardment Prev: Leading the Charge
UPDATE quest_template SET PrevQuestId = 13380, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13404;
-- -- -- -- Putting the Hertz: The Valley of Lost Hope Prev: Leading the Charge
UPDATE quest_template SET PrevQuestId = 13380, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13382;
-- ...All the Help We Can Get. ... Prev: The Broken Front ... NextInChain: Poke and Prod
UPDATE quest_template SET PrevQuestId = 13231, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13287 WHERE entry = 13286;
-- Poke and Prod ... Prev: ...All the Help We Can Get.
UPDATE quest_template SET PrevQuestId = 13286, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13287;
-- Against the Giants ... Prev: Poke and Prod ... Next in Chain: Basic Chemistry
UPDATE quest_template SET PrevQuestId = 13287, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13295 WHERE entry = 13294;
-- Coprous the Defiled ... Prev: Against the Giants
UPDATE quest_template SET PrevQuestId = 13294, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13298;
-- Basic Chemistry ... Prev: Against the Giants
UPDATE quest_template SET PrevQuestId = 13294, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13295;
-- -- Neutralizing the Plague ... Prev: Basic Chemistry
UPDATE quest_template SET PrevQuestId = 13295, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13297;
-- That's Abominable! ... Prev: Poke and Prod 
UPDATE quest_template SET PrevQuestId = 13287, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13288;
-- -- That's Abominable! Daily ... Prev: That's Abominable!
UPDATE quest_template SET PrevQuestId = 13288, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13289;
-- Sneak Preview ... Prev: That's Abominable!
UPDATE quest_template SET PrevQuestId = 13288, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13315;
-- Chain of Command ... Prev: Sneak Preview
UPDATE quest_template SET PrevQuestId = 13315, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13319;
-- Cannot Reproduce ... Prev: Sneak Preview ... Next In Chain: Retest Now
UPDATE quest_template SET PrevQuestId = 13315, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13321 WHERE entry = 13320;
-- -- Retest Now ... Prev: Cannot Reproduce
UPDATE quest_template SET PrevQuestId = 13320, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13321;
-- -- Retest Now Daily ... Prev: Retest Now
UPDATE quest_template SET PrevQuestId = 13321, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13322;
-- Drag and Drop ... Prev: Sneak Preview  
UPDATE quest_template SET PrevQuestId = 13315, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13318;
-- -- Drag and Drop Daily ... Prev: Drag and Drop
UPDATE quest_template SET PrevQuestId = 13318, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13323;
-- -- Not a Bug ... Prev: Drag and Drop
UPDATE quest_template SET PrevQuestId = 13318, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13342;
-- -- -- Not a Bug Daily ... Prev: Not a Bug
UPDATE quest_template SET PrevQuestId = 13342, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13344;
-- Need more Info ... Prev: Drag and Drop ... Next in Chain: No Rest For The Wicked
UPDATE quest_template SET PrevQuestId = 13318, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 13346 WHERE entry = 13345;
-- No Rest For the Wicked ... Prev: Need more Info 
UPDATE quest_template SET PrevQuestId = 13345, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13346;
-- -- No Rest For the Wicked Daily ... Prev: No Rest For the Wicked
UPDATE quest_template SET PrevQuestId = 13346, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13350;
-- Raise the Barricades ... Prev: Need more Info 
UPDATE quest_template SET PrevQuestId = 13345, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13332;
-- The Ironwall Rampart ... Prev: Raise the Barricades AND No Rest For the Wicked
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13337;
UPDATE quest_template SET NextQuestId = 0 WHERE entry = 13346;
UPDATE quest_template SET NextQuestId = 0 WHERE entry = 13332;
DELETE FROM conditions WHERE SourceEntry = 13337 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13337,0,8,13346,0,0,0,'',''),
(19,0,13337,0,8,13346,0,0,0,'',''),
(20,0,13337,0,8,13332,0,0,0,'',''),
(19,0,13337,0,8,13332,0,0,0,'','');
-- Get the Message ... Prev: Raise the Barricades
UPDATE quest_template SET PrevQuestId = 13332, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13314;
-- -- Capture More Dispatches ... Prev: Get the Message
UPDATE quest_template SET PrevQuestId = 13314, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13333;
-- Bloodspattered Banners ... Prev: Raise the Barricades
UPDATE quest_template SET PrevQuestId = 13332, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13334;
-- Before the Gate of Horror ... Prev:  Bloodspattered Banners AND The Ironwall Rampart
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13335;
-- * NextQuestId not used yet so:
UPDATE quest_template SET NextQuestId = 0 WHERE entry = 13334;
UPDATE quest_template SET NextQuestId = 0 WHERE entry = 13337;
DELETE FROM conditions WHERE SourceEntry = 13335 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13335,0,8,13334,0,0,0,'',''),
(19,0,13335,0,8,13334,0,0,0,'',''),
(20,0,13335,0,8,13337,0,0,0,'',''),
(19,0,13335,0,8,13337,0,0,0,'','');
-- Shatter the Shards ... Prev: Before the Gate of Horror
UPDATE quest_template SET PrevQuestId = 13335, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13339;
-- The Guardians of Corp'rethar ... Prev: Before the Gate of Horror
UPDATE quest_template SET PrevQuestId = 13335, NextQuestId = 0, ExclusiveGroup = 0, NextQuestInChain = 0 WHERE entry = 13338;
-- Scripts
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=29747;
DELETE FROM `smart_scripts` WHERE `entryorguid`=29747;
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|268435456,`AIName`='',`InhabitType`=`InhabitType`|4,`ScriptName`='npc_the_ocular' WHERE `entry`=29747;
UPDATE `creature_model_info` SET `combat_reach`=100 WHERE `modelid`=26533;
DELETE FROM `creature_template_addon` WHERE `entry`=29747;
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(29747,0,0,0,0,0,'55162'); -- The Ocular: Transform
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|2|33554432 WHERE `entry`=29790;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=30740;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,30740,0,18,1,29747,0,63,'','Eyesore Blaster only target The Oculus');
UPDATE `creature_template` SET faction_A = 2050, faction_H = 2050 WHERE `entry` in (29860,29859,29858);
UPDATE `creature_template` SET AIName='', `ScriptName`='npc_general_lightsbane' WHERE `entry` = 29851;
UPDATE `creature_template` SET `dmg_multiplier`=2 WHERE `entry` = 29851;
UPDATE `creature_template` SET ScriptName = 'npc_saronite_mine_slave' WHERE `entry` = 31397;
UPDATE `creature_template` SET ScriptName = 'npc_free_your_mind' WHERE `entry` IN (29769,29770,29840);



-- ----------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------

-- 03_[Quest][12644]Still_At_It.sql
-- Quest Still At it  http://thottbot.com/q12644 
UPDATE `creature_template` SET `scriptname` = 'npc_tipsy_mcmanus' WHERE entry = 28566;
UPDATE `gameobject_template` SET `scriptname` = 'go_brew_event' WHERE entry IN (190635,190636,190637,190638,190639);
DELETE FROM `script_texts` WHERE entry = -1850040 AND `npc_entry`=28566;
INSERT INTO `script_texts` (`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
('28566','-1850040','We''ve done it! Come get the cask...!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0','0','0','Say - Complete Quest');


-- ----------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------

-- 04_[Quest][11145]Prisioners_of_the_grimtotems.sql
-- Fix Quest Prisoners of the Grimtotems
-- http://www.wowhead.com/quest=11145/deprecated-prisoners-of-the-grimtotems
UPDATE `gameobject_template` SET `ScriptName`='go_Prisoners_Of_The_Grim_Totems_cage' WHERE `entry`=186287;
