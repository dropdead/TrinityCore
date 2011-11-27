-- 10_[Quest][10852]Missing_Friends.sql
-- Quest 10852 Missing Friends
UPDATE `gameobject_template` SET `ScriptName`='go_veil_skith_cage' WHERE `entry`IN (185202,185203,185204,185205);
DELETE FROM `script_texts`  WHERE `entry` IN (-1000590,-1000591,-1000592,-1000593);
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
(0, -1000590, 'Woot!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 'Captive Child SAY_THANKS_1'),
(0, -1000591, 'I think those weird bird guys were going to eat us. Gross!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 'Captive Child SAY_THANKS_2'),
(0, -1000592, 'Yay! We''re free!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 'Captive Child SAY_THANKS_3'),
(0, -1000593, 'Gross!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 'Captive Child SAY_THANKS_4');


