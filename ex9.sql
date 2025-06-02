-- Création de la table retour matériel
CREATE TABLE retour_materiel (
    id_retour SERIAL PRIMARY KEY,
    id_reservation INT UNIQUE NOT NULL,
    date_retour TIMESTAMP NOT NULL,
    retard BOOLEAN DEFAULT FALSE NOT NULL,

    FOREIGN KEY (id_reservation) REFERENCES reservation(id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Ajout de la date de retour effective
ALTER TABLE reservation ADD COLUMN date_retour_effectif TIMESTAMP;
