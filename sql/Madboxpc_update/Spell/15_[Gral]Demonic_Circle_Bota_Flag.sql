-- Demonic Circle: Teleport
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=48020;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
( 48020,-23335, 0, 'Bota la flag Demonic Circle: Teleport en WSG'),-- Warsong Gulch
( 48020,-23333, 0, 'Bota la flag Demonic Circle: Teleport en WSG'),-- Warsong Gulch
( 48020,-34976, 0, 'Bota la flag Demonic Circle: Teleport en EOS');-- Eye of Storm
