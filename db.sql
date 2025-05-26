CREATE DATABASE reservation_ecole_inge;
-- Exécuter la ligne ci-dessus individuellement, puis clic-droit sur la base
-- nouvellement créée dans l’arborescence à gauche et y ouvrir un query tool

-- Informations sur les étudiants
CREATE TABLE etudiant (
    id SERIAL PRIMARY KEY,
    num_etudiant CHAR(9) UNIQUE NOT NULL,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(150),
    email VARCHAR(150) UNIQUE NOT NULL,
    classe VARCHAR(50)
);

-- Informations sur le materiel disponible
CREATE TABLE materiel (
    id SERIAL PRIMARY KEY,
    num_serie VARCHAR(50) UNIQUE,
    nom VARCHAR(100) NOT NULL,
    description TEXT,
    categorie VARCHAR(50),
    quantite INT DEFAULT 1 NOT NULL
);

-- Les différentes réservations
CREATE TABLE reservation (
    id SERIAL PRIMARY KEY,
    etudiant INT NOT NULL,
    materiel INT NOT NULL,
    debut TIMESTAMP NOT NULL,
    fin TIMESTAMP,
    statut VARCHAR(50) DEFAULT 'En attente',

    FOREIGN KEY (etudiant) REFERENCES etudiant(id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (materiel) REFERENCES materiel(id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);
