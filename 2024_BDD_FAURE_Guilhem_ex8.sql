-- Ajout table disponibilité
CREATE TABLE disponibilite (
    id_disponibilite SERIAL PRIMARY KEY,
    id_materiel INT NOT NULL,
    date_debut TIMESTAMP NOT NULL,
    date_fin TIMESTAMP NOT NULL,

    FOREIGN KEY (id_materiel) REFERENCES materiel(id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Ajout de la colonne id_disponibilite dans la table reservation
ALTER TABLE reservation
ADD COLUMN id_disponibilite INT;
-- Ajout de la clé étrangère référençant la table disponibilite
ALTER TABLE reservation
ADD CONSTRAINT fk_disponibilite
FOREIGN KEY (id_disponibilite) REFERENCES disponibilite(id_disponibilite)
    ON DELETE RESTRICT ON UPDATE CASCADE;

-- Vérification de la disponibilite d’un materiel d’id 3
SELECT
    CASE
        WHEN EXISTS (
            SELECT 1
            FROM disponibilite AS d
            WHERE d.id_materiel = 3 -- ID du matériel à vérifier
              AND d.date_debut <= '2025-05-08'::TIMESTAMP
              AND d.date_fin >= '2025-05-29'::TIMESTAMP
        )
        THEN 'OK - Matériel disponible pour cette période.'
        ELSE 'KO - Aucune période de disponibilité enregistrée pour ce matériel sur la période spécifiée.'
    END AS statut_verification;

-- Ajout d’une disponibilité selon un materiel
INSERT INTO disponibilite (id_materiel, date_debut, date_fin)
VALUES (
    (SELECT id FROM materiel WHERE nom = 'Ordinateur Portable Dell XPS'),
    '2025-07-01 09:00:00',
    '2025-07-31 17:00:00'
);

-- Suppression d’une disponibilite d’ID 2
DELETE FROM disponibilite WHERE id_disponibilite = 2;
