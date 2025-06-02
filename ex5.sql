UPDATE materiel
SET quantite = 5
WHERE nom = 'Ordinateur Portable Dell XPS';

UPDATE materiel m
SET quantite = m.quantite - 1
FROM reservation r
WHERE m.id = r.materiel
  AND r.statut = 'Approuvée'
  AND r.fin > CURRENT_TIMESTAMP + INTERVAL '2 days';
