-- 14_[Quest][11300]Stunning_Defeat_At_The_Ring.sql
-- Fix Quest Quest: Stunning Defeat at The Ring
-- http://www.wowhead.com/quest=11300
DELETE FROM `creature` WHERE `id` =23931;
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`)
VALUES
('23931','571','1','1','0','519','798.106','-4706.17','-96.144','4.93175','300','0','0','15968','0','0');
