-- 13_[Quest][11343]The_Echo_Of_Ymiron.sql
-- Quest  [The Echo of Ymiron] 
-- http://www.wowhead.com/quest=11343
DELETE FROM `creature` WHERE `id` IN (24327,35877);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES
(24327,571,1,2,0,0,1057.58,-4912.3,10.775,3.41592,300,0,0,9610,0,0),
(35877,571,1,2,0,0,1059.02,-4917.42,10.6867,3.41592,300,0,0,27890000,0,0);
UPDATE `item_template`     SET `ScriptName` = "item_ymiron_raeuchergefaess"  WHERE `entry` = 33637;
UPDATE `creature_template` SET `ScriptName` = "AncientFeMaleVrykul" WHERE `entry` = 24315;
UPDATE `creature_template` SET `ScriptName` = "AncientMaleVrykul"   WHERE `entry` = 24314;
UPDATE `creature_template` SET `ScriptName` = "ValkyreYmiron"       WHERE `entry` = 24327;
UPDATE `creature_template` SET `ScriptName` = "LichKingYmiron"      WHERE `entry` = 35877;
DELETE FROM `script_texts` WHERE `entry` IN (-1700010,-1700011,-1700012,-1700013,-1700014,-1700015,-1700005,-1700006,-1700007,-1700008,-1700009);
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
(0, -1700010, 'Shall we prepare it for you, my lord?', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL),
(0, -1700011, 'So then we too are cursed?', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL),
(0, -1700012, 'The gods have forsaken us! We must dispose of it before Ymiron is notified!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL),
(0, -1700013, 'Then what are we to do, wife? The others cannot find out. Should they learn of this aberration, we will all be executed.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL),
(0, -1700014, 'NO! You cannot! I beg of you! It is our child!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL),
(0, -1700015, 'I... I will hide it. I will hide it until I find it a home, far away from here...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL),
(0, -1700005, 'Shamanism has brought you here... Its scent permeates the air. I was once a shaman.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL),
(0, -1700006, 'No, minion. This one is not ready.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL),
(0, -1700007, 'Do you feel it, mortal? Death seeps through me, enveloping all that I touch. With just a snap of my finger your soul will languish in damnation for all eternity.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL),
(0, -1700008, 'But... It is not yet your time to serve the Lich King. Yes, a greater destiny awaits you. Power... You must become more powerful before you are to serve me.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL),
(0, -1700009, 'Now watch, val\'kyr. Observe as I apply pressure. Can you see that it is not yet ripe? Watch as it pops and falls lifeless to the floor.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL);