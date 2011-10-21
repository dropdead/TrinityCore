-- Seguridad comandos. 
-- Añadimos todos los comandos con seguridad 5.
UPDATE `command` SET `security`=5;

-- Asignamos Comandos con seguridad 0
UPDATE `command` SET `security`='0' WHERE (`name`='save'); 
UPDATE `command` SET `security`='0' WHERE (`name`='server info'); 

-- Comandos seguridad 1
UPDATE `command` SET `security`='1' WHERE (`name`='announce');  
UPDATE `command` SET `security`='1' WHERE (`name`='freeze');
UPDATE `command` SET `security`='1' WHERE (`name`='gm chat');
UPDATE `command` SET `security`='1' WHERE (`name`='gm fly');
UPDATE `command` SET `security`='1' WHERE (`name`='gm ingame');
UPDATE `command` SET `security`='1' WHERE (`name`='gm list');
UPDATE `command` SET `security`='1' WHERE (`name`='gm visible');
UPDATE `command` SET `security`='1' WHERE (`name`='gm');   
UPDATE `command` SET `security`='1' WHERE (`name`='gmannounce'); 
UPDATE `command` SET `security`='1' WHERE (`name`='gmnameannounce'); 
UPDATE `command` SET `security`='1' WHERE (`name`='gmnotify'); 
UPDATE `command` SET `security`='1' WHERE (`name`='go creature'); 
UPDATE `command` SET `security`='1' WHERE (`name`='go object'); 
UPDATE `command` SET `security`='1' WHERE (`name`='summon'); 
UPDATE `command` SET `security`='1' WHERE (`name`='gps'); 
UPDATE `command` SET `security`='1' WHERE (`name`='groupsummon');  
UPDATE `command` SET `security`='1' WHERE (`name`='learn all my talents');  
UPDATE `command` SET `security`='1' WHERE (`name`='learn all my spells');  
UPDATE `command` SET `security`='1' WHERE (`name`='listfreeze'); 
UPDATE `command` SET `security`='1' WHERE (`name`='modify aspeed'); 
UPDATE `command` SET `security`='1' WHERE (`name`='modify fly');  
UPDATE `command` SET `security`='1' WHERE (`name`='mute');  
UPDATE `command` SET `security`='1' WHERE (`name`='nameannounce');  
UPDATE `command` SET `security`='1' WHERE (`name`='appear');  
UPDATE `command` SET `security`='1' WHERE (`name`='npc info');  
UPDATE `command` SET `security`='1' WHERE (`name`='pinfo');  
UPDATE `command` SET `security`='1' WHERE (`name`='recall');  
UPDATE `command` SET `security`='1' WHERE (`name`='tele name');  
UPDATE `command` SET `security`='1' WHERE (`name`='tele');
UPDATE `command` SET `security`='1' WHERE (`name`='unfreeze');  
UPDATE `command` SET `security`='1' WHERE `name` LIKE 'ticket%';
UPDATE `command` SET `security`='1' WHERE (`name`='whispers');  
-- Comandos seguridad 3
/*
SELECT
command.name,
command.help
FROM command
WHERE
command.name LIKE  'ban%'
*/
UPDATE `command` SET `security`='3' WHERE `name` LIKE 'ban%';
UPDATE `command` SET `security`='3' WHERE `name` LIKE 'unban%';
UPDATE `command` SET `security`='3' WHERE (`name`='additem');
UPDATE `command` SET `security`='3' WHERE (`name`='additemset');
UPDATE `command` SET `security`='3' WHERE (`name`='die');  
UPDATE `command` SET `security`='3' WHERE (`name`='learn'); 
UPDATE `command` SET `security`='3' WHERE (`name`='modify scale');
UPDATE `command` SET `security`='3' WHERE (`name`='modify hp');
UPDATE `command` SET `security`='3' WHERE (`name`='npc delete');
UPDATE `command` SET `security`='3' WHERE (`name`='npc add');  
UPDATE `command` SET `security`='3' WHERE (`name`='saveall');    
UPDATE `command` SET `security`='3' WHERE (`name`='server shutdown'); 
UPDATE `command` SET `security`='3' WHERE (`name`='server restart'); 
UPDATE `command` SET `security`='3' WHERE (`name`='dev');