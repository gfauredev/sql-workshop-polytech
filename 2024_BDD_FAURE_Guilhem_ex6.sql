-- Suppression simple
DELETE FROM reservation
WHERE id = 3;
-- Suppression des réservations finies
DELETE FROM reservation
WHERE fin < CURRENT_TIMESTAMP;
