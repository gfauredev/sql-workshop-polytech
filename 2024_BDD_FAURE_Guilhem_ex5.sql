-- La quantité disponible n’est pas stockée dans la base, mais se calcule
-- en soustrayant à la quantité possédée le nombre de réservations en cours.
-- Modifier la quantité disponible signifie donc faire une réservation, mais
-- pour utiliser UPDATE nous allons modifier la quantité possédée à la place.
UPDATE materiel m
SET quantite = m.quantite + 5 -- Ajout de 5 ordinateurs
WHERE nom = 'Ordinateur Portable Dell XPS';

-- On donne définitivement aux élèves le materiel qu’ils
-- empruntent actuellement et ne devaient pas rendre avant au moins 2 jours
UPDATE materiel m
SET quantite = m.quantite - 1
FROM reservation r
WHERE m.id = r.materiel -- jointure implicite
  AND r.statut = 'Approuvée'
  AND r.fin > CURRENT_TIMESTAMP + INTERVAL '2 days'
  AND m.quantite > 0; -- on évite les quantités négatives
