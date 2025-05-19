CREATE DATABASE IF NOT EXISTS reservation_ecole_inge;
USE reservation_ecole_inge;

-- Informations sur les étudiants
CREATE TABLE etudiant (
    id SERIAL PRIMARY KEY,
    numero_etudiant INT UNIQUE NOT NULL,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100),
    email VARCHAR(255) UNIQUE NOT NULL,
    classe VARCHAR(50)
);

-- Informations sur le materiel disponible
CREATE TABLE materiel (
    id SERIAL PRIMARY KEY,
    numero_serie INT UNIQUE NOT NULL,
    nom VARCHAR(100) NOT NULL,
    description TEXT,
    categorie VARCHAR(50),
);

-- Les différentes réservations
CREATE TABLE reservation (
    id SERIAL PRIMARY KEY,
    etudiant_id INT NOT NULL,
    materiel_id INT NOT NULL,
    date_heure_debut DATETIME NOT NULL,
    date_heure_fin DATETIME NOT NULL,
    date_heure_reservation DATETIME DEFAULT CURRENT_TIMESTAMP,
    statut VARCHAR(50) DEFAULT 'En attente',

    FOREIGN KEY (etudiant_id) REFERENCES etudiant(id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (materiel_id) REFERENCES materiel(id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);
