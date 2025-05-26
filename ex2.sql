SELECT * FROM etudiant WHERE nom LIKE 'D%';

SELECT * FROM materiel WHERE categorie = 'Informatique';

SELECT * FROM reservation WHERE debut::time <= '12:00';
