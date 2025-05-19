-- Données example pour la table étudiant, avec numeros étudiants, noms prénoms
-- et email aléatoires.
INSERT INTO Etudiant (num_etudiant, nom, prenom, email, classe) VALUES
(22030010, 'Dupont', 'Jean', 'jean.dupont@univ-tours.fr', 'ISIE'),
(22030020, 'Martin', 'Sophie', 'sophie.martin@univ-tours.fr', 'ISIE'),
(22040030, 'Petit', 'Luc', 'luc.petit@univ-tours.fr', 'ISIE'),
(22040040, 'Durand', 'Marie', 'marie.durand@univ-tours.fr', 'ISIE'),
(22050050, 'Lefevre', 'Pierre', 'pierre.lefevre@univ-tours.fr', 'ISIE'),
(22050060, 'Dubois', 'Camille', 'camille.dubois@univ-tours.fr', 'ISIE'),
(22030070, 'Garcia', 'Antoine', 'antoine.garcia@univ-tours.fr', 'ISIE'),
(22030080, 'Leroy', 'Chloé', 'chloe.leroy@univ-tours.fr', 'ISIE'),
(22040090, 'Moreau', 'Thomas', 'thomas.moreau@univ-tours.fr', 'ISIE'),
(22040100, 'Roux', 'Manon', 'manon.roux@univ-tours.fr', 'ISIE'),
(22050110, 'Fournier', 'Nicolas', 'nicolas.fournier@univ-tours.fr', 'ISIE'),
(22050120, 'Simon', 'Emma', 'emma.simon@univ-tours.fr', 'ISIE');

-- Données example pour la table materiel, avec des numéros de série, noms et
-- descriptions aléatoires.
INSERT INTO Materiel (num_serie, nom, description, categorie) VALUES
(101, 'Ordinateur Portable Dell XPS',
    'Modèle 2022, Core i7, 16Go RAM', 'Informatique'),
(102, 'Ordinateur Portable HP ProBook',
    'Modèle 2021, Core i5, 8Go RAM', 'Informatique'),
(203, 'Projecteur Epson',
    'Haute luminosité, HDMI/VGA', 'Audiovisuel'),
(204, 'Projecteur BenQ',
    'Portable, courte focale', 'Audiovisuel'),
(305, 'Kit Arduino Uno',
    'Kit de démarrage avec composants', 'Électronique'),
(306, 'Carte Arduino Mega',
    'Carte avancée avec plus de pins', 'Électronique'),
(207, 'Webcam Logitech HD',
    'Résolution 1080p', 'Audiovisuel'),
(208, 'Microphone Blue Yeti',
    'Micro USB pour enregistrement', 'Audiovisuel'),
(109, 'Raspberry Pi 4 (4Go)',
    'Mini-ordinateur pour prototypage', 'Informatique'),
(110, 'Raspberry Pi 4 (8Go)',
    'Mini-ordinateur pour prototypage avancé', 'Informatique'),
(311, 'Kit d''outils électroniques',
    'Fer à souder, pinces, multimètre', 'Électronique'),
(312, 'Multimètre numérique',
    'Mesure tension, courant, résistance', 'Électronique');

-- Données example pour la table reservation
-- Les etudiant_id et materiel_id sont des clés étrangères référençant
-- les identifiant SERIAL dans les tables etudiant et materiel, qui doivent
-- être connus lors de l’ajout
-- On considère qu’ils sont incrémentés dans l’ordre d’ajout
INSERT INTO Reservation (etudiant, materiel, debut, fin, statut) VALUES
 -- Jean Dupont (id 1) réserve Dell (id 1)
(1, 1, '2025-05-20 09:00:00', '2025-05-20 12:00:00', 'Approuvée'),
 -- Sophie Martin (id 2) réserve Epson (id 3)
(2, 3, '2025-05-21 14:00:00', '2025-05-21 17:00:00', 'Approuvée'),
 -- Luc Petit (id 3) réserve Uno (id 5)
(3, 5, '2025-05-22 10:00:00', '2025-05-22 16:00:00', 'En attente'),
 -- Marie Durand (id 4) réserve Logitech (id 7)
(4, 7, '2025-05-20 14:00:00', '2025-05-20 16:00:00', 'Approuvée'),
 -- Pierre Lefevre (id 5) réserve RPi 4 (id 9)
(5, 9, '2025-05-23 09:00:00', '2025-05-25 18:00:00', 'Approuvée'),
 -- Camille Dubois (id 6) a réservé HP (id 2)
(6, 2, '2025-05-21 09:00:00', '2025-05-21 12:00:00', 'Terminée'),
 -- Jean Dupont (id 1) réserve Blue Yeti (id 8)
(1, 8, '2025-05-23 14:00:00', '2025-05-23 17:00:00', 'Approuvée'),
 -- Antoine Garcia (id 7) réserve RPi 4 (8Go) (id 10)
(7, 10, '2025-05-20 10:00:00', '2025-05-22 10:00:00', 'Approuvée'),
 -- Chloé Leroy (id 8) réserve Dell (id 1)
(8, 1, '2025-05-26 09:00:00', '2025-05-26 12:00:00', 'En attente'),
 -- Thomas Moreau (id 9) avait réservé Outils (id 11)
(9, 11, '2025-05-20 10:00:00', '2025-05-20 11:00:00', 'Annulée'),
 -- Manon Roux (id 10) réserve Multimètre (id 12)
(10, 12, '2025-06-01 09:00:00', '2025-06-01 18:00:00', 'En attente'),
 -- Nicolas Fournier (id 11) réserve Uno (id 5)
(11, 5, '2025-05-27 13:00:00', '2025-05-27 17:00:00', 'Approuvée');
