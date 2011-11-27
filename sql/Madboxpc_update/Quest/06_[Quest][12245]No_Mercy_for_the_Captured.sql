-- 06_[Quest][12245]No_Mercy_for_the_Captured.sql
-- Quest] No Mercy for the Captured
--  http://www.wowhead.com/quest=12245#
UPDATE `creature_template`SET `ScriptName` = 'npc_no_mercy_for_the_captured' WHERE `entry` IN (27376,27378,27379,27381);