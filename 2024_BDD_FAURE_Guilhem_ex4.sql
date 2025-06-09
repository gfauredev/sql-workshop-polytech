SELECT * FROM reservation
WHERE debut::date >= '2025-05-23'
AND fin::date <= '2025-05-28';

SELECT COUNT(DISTINCT etudiant.id) FROM etudiant
JOIN reservation ON reservation.etudiant = etudiant.id;
