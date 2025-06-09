SELECT * FROM etudiant
JOIN reservation ON reservation.etudiant = etudiant.id
WHERE reservation.statut = 'En attente'
ORDER BY etudiant.id;

SELECT * FROM materiel
JOIN reservation ON reservation.materiel = materiel.id
JOIN etudiant ON etudiant.id = reservation.etudiant
WHERE etudiant.num_etudiant = 22030010
