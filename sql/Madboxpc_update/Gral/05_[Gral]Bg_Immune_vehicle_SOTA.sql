-- Inmunidades para vehiculos en SOTA - exploit heal
UPDATE `creature_template` SET `mechanic_immune_mask` = 2144337919 WHERE `entry` IN (28781, 32796);
UPDATE `creature_template` SET `RegenHealth` = 0 WHERE `entry` IN (28781, 32659,32796);