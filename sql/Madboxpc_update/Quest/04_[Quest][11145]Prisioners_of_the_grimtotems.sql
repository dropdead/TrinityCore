-- Fix Quest Prisoners of the Grimtotems
-- http://www.wowhead.com/quest=11145/deprecated-prisoners-of-the-grimtotems
UPDATE `gameobject_template` SET `ScriptName`='go_Prisoners_Of_The_Grim_Totems_cage' WHERE `entry`=186287;
