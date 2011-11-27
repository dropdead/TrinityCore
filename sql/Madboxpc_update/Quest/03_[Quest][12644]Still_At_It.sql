-- 03_[Quest][12644]Still_At_It.sql
-- Quest Still At it  http://thottbot.com/q12644 
UPDATE `creature_template` SET `scriptname` = 'npc_tipsy_mcmanus' WHERE entry = 28566;
UPDATE `gameobject_template` SET `scriptname` = 'go_brew_event' WHERE entry IN (190635,190636,190637,190638,190639);
DELETE FROM `script_texts` WHERE entry = -1850040 AND `npc_entry`=28566;
INSERT INTO `script_texts` (`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
('28566','-1850040','We''ve done it! Come get the cask...!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0','0','0','Say - Complete Quest');
