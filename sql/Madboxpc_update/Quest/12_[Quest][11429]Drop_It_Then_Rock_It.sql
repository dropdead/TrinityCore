-- 12_[Quest][11429]Drop_It_Then_Rock_It.sql
-- Fix Quest Quest: Drop It Then Rock It
-- http://www.wowhead.com/quest=11429/drop-it-then-rock-it
UPDATE `creature_template` SET `ScriptName` = 'npc_alliance_banner_standard' WHERE `entry` = 24640;
