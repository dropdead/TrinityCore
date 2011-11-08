-- Fix Heart of the Crusader and Judgements of the Just proc. 
UPDATE `spell_proc_event` SET `procFlags` = 272, `CustomChance` = 100 WHERE `entry` IN (53695,53696,20335,20336,20337);