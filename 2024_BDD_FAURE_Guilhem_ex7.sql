-- Utilisateurs ayant emprunté au moins un équipement
SELECT DISTINCT
    e.*
FROM
    etudiant AS e
JOIN
    reservation AS r ON e.id = r.etudiant;

-- Équipements n’ayant jamais été empruntés
SELECT
    m.*
FROM
    materiel AS m
LEFT JOIN
    reservation AS r ON m.id = r.materiel
WHERE
    r.materiel IS NULL;

-- Équipements ayant été emprunté plus de 3 fois (aucun avec nos données ex.)
SELECT
    m.nom,
    COUNT(r.id) AS nombre_emprunts
FROM
    materiel AS m
JOIN
    reservation AS r ON m.id = r.materiel
GROUP BY
    m.nom
HAVING
    COUNT(r.id) > 3;

-- Nombre d’emprunts pour chaque utilisateur, ordonné par numéro d'étudiant
SELECT
    e.*,
    COUNT(r.id) AS nombre_emprunts
FROM
    etudiant AS e
LEFT JOIN
    reservation AS r ON e.id = r.etudiant
GROUP BY
    e.id
ORDER BY
    e.num_etudiant;
