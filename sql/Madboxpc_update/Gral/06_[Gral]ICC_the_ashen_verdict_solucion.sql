-- Estos son todos los npc (trash) que dan reputacion en ICC y no dejan ID bindeada a la instancia, no encontre una mejor solucion, ya que al dejarlos bindeados a la instancia, no funcionara bien el modo test, y elmiminar por completo la repu desmotivara la causa.
UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1` = 1 WHERE `creature_id` IN 
(36724,
36725,
36805,
36807,
36808,
36811,
36829,
36880,
37007,
37011,
37012,
37022,
37030,
37031,
37032,
37033,
37035,
37125,
37126,
37127,
37132,
37133,
37134,
37531,
37532,
37546,
37571,
37595,
37662,
37663,
37664,
37665,
37666,
37782,
38125,
38258);

/*
-- revert
UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1` = 450 WHERE `creature_id` = 37126;
UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1` = 450 WHERE `creature_id` = 38258;
UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1` = 75 WHERE `creature_id` = 37007;
UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1` = 25 WHERE `creature_id` IN 
(36724,
36725,
36805,
36807,
36808,
36811,
36829,
36880,
37011,
37012,
37022,
37030,
37031,
37032,
37033,
37035,
37125,
37127,
37132,
37133,
37134,
37531,
37532,
37546,
37571,
37595,
37662,
37663,
37664,
37665,
37666,
37782,
38125);
*/

