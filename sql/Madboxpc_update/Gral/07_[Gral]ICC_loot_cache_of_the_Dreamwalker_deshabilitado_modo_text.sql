UPDATE `gameobject_template` SET `data1` = 0 WHERE NAME = 'Cache of the Dreamwalker' AND `entry` IN (201959, 202339, 202338, 202340);
/*
-- Revert
UPDATE `gameobject_template` SET `data1` = 28052 WHERE NAME = 'Cache of the Dreamwalker' AND `entry` IN (201959);
UPDATE `gameobject_template` SET `data1` = 28082 WHERE NAME = 'Cache of the Dreamwalker' AND `entry` IN (202339);
UPDATE `gameobject_template` SET `data1` = 28064 WHERE NAME = 'Cache of the Dreamwalker' AND `entry` IN (202338);
UPDATE `gameobject_template` SET `data1` = 28096 WHERE NAME = 'Cache of the Dreamwalker' AND `entry` IN (202340);
*/
