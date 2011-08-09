-- 08_[Dungeon]Draktharon_Keep.sql
UPDATE creature_template SET unit_flags = unit_flags | 2 WHERE entry IN (26620,31339);
-- Fix Drak'Tharon Keep reward for DF.
UPDATE `instance_encounters` SET `creditType` = '0', `creditEntry` = '26632' WHERE `entry` IN ('376', '375')