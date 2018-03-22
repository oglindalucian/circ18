#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------
DROP DATABASE h18circuits;
Create DATABASE  h18circuits;
use  h18circuits;
#------------------------------------------------------------
# Table: circuit
#------------------------------------------------------------

CREATE TABLE circuit(
        IdCircuit         int (11) Auto_increment  NOT NULL ,
        nomCircuit        Varchar (25) NOT NULL ,
        nbPlacesMinimum   Int NOT NULL ,
        nbrPlacesMaximum  Int NOT NULL ,
        nbPlacesReservees Int ,
        etat              BOOLEAN NOT NULL ,
        dateDepart        Date NOT NULL ,
        dateArrivee       Date NOT NULL ,
        photoCircuit      Varchar (100) ,
        prixCircuit       Float NOT NULL ,
        guide             Varchar (255) ,
        transport         Varchar (50) ,
        idRabais          Int NOT NULL ,
        PRIMARY KEY (IdCircuit )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: etape
#------------------------------------------------------------

CREATE TABLE etape(
        idEtape          int (11) Auto_increment  NOT NULL ,
        nomEtape         Varchar (25) NOT NULL ,
        id_circuit       Int NOT NULL ,
        nombreJour       Int NOT NULL ,
        dateArrivee      Date NOT NULL ,
        dateDepart       Date NOT NULL ,
        descriptionEtape Varchar (250) ,
        photoEtape       Varchar (100) ,
        IdCircuit        Int NOT NULL ,
        PRIMARY KEY (idEtape )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Accompagnateur
#------------------------------------------------------------

CREATE TABLE Accompagnateur(
        IdAccompagnateur     int (11) Auto_increment  NOT NULL ,
        NomAccompagnateur    Varchar (25) NOT NULL ,
        PrenomAccompagnateur Varchar (25) ,
        TelAccompagnateur    Varchar (25) ,
        MailAccompagnateur   Varchar (45) NOT NULL ,
        idReservation        Int NOT NULL ,
        PRIMARY KEY (IdAccompagnateur )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: jour
#------------------------------------------------------------

CREATE TABLE jour(
        idJour     int (11) Auto_increment  NOT NULL ,
        nomJour    Varchar (25) NOT NULL ,
        nomVille   Varchar (25) NOT NULL ,
        id_etape   Int NOT NULL ,
        hotel      Varchar (250) ,
        restaurant Varchar (250) ,
        idEtape    Int NOT NULL ,
        PRIMARY KEY (idJour )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: usager
#------------------------------------------------------------

CREATE TABLE usager(
        idUsager        int (11) Auto_increment  NOT NULL ,
        nomUsager       Varchar (25) NOT NULL ,
        prenomUsager    Varchar (25) NOT NULL ,
        adresse         Varchar (250) NOT NULL ,
        ddnUsager       Date NOT NULL ,
        telephoneUsager Varchar (25) NOT NULL ,
        etat           	BOOLEAN NOT NULL ,
        idReservation   Int NOT NULL ,
        courriel        Varchar (50) NOT NULL ,
        idConnexion     Int NOT NULL ,
        PRIMARY KEY (idUsager )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: reservation
#------------------------------------------------------------

CREATE TABLE reservation(
        idReservation     int (11) Auto_increment  NOT NULL ,
        idCircuit         Int NOT NULL ,
        idUsager          Int NOT NULL ,
        dateReservation   Date NOT NULL ,
        soldeInitiale     Float NOT NULL ,
        depot             Float NOT NULL ,
        dateEcheance      Date NOT NULL ,
        idAccompagniateur Int ,
        idUsager_usager   Int NOT NULL ,
        PRIMARY KEY (idReservation )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: rabais
#------------------------------------------------------------

CREATE TABLE rabais(
        idRabais    Int NOT NULL ,
        nomRabais   Varchar (25) NOT NULL ,
        description Varchar (250) NOT NULL ,
        idCircuit   Int NOT NULL ,
        pourcentage Float NOT NULL ,
        codePromo   Varchar (50) ,
        
        PRIMARY KEY (idRabais )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: connexion
#------------------------------------------------------------

CREATE TABLE connexion(
        courriel    Varchar (50) NOT NULL ,
        mdp         Varchar (50) NOT NULL ,
        idConnexion int (11) Auto_increment  NOT NULL ,
        idUsager    Int NOT NULL ,
        PRIMARY KEY (idConnexion )
)ENGINE=InnoDB;

ALTER TABLE circuit ADD CONSTRAINT FK_circuit_idRabais FOREIGN KEY (idRabais) REFERENCES rabais(idRabais);
ALTER TABLE etape ADD CONSTRAINT FK_etape_IdCircuit FOREIGN KEY (IdCircuit) REFERENCES circuit(IdCircuit);
ALTER TABLE Accompagnateur ADD CONSTRAINT FK_Accompagnateur_idReservation FOREIGN KEY (idReservation) REFERENCES reservation(idReservation);
ALTER TABLE jour ADD CONSTRAINT FK_jour_idEtape FOREIGN KEY (idEtape) REFERENCES etape(idEtape);
ALTER TABLE usager ADD CONSTRAINT FK_usager_idConnexion FOREIGN KEY (idConnexion) REFERENCES connexion(idConnexion);
ALTER TABLE reservation ADD CONSTRAINT FK_reservation_idUsager_usager FOREIGN KEY (idUsager_usager) REFERENCES usager(idUsager);
ALTER TABLE rabais ADD CONSTRAINT FK_rabais_IdCircuit FOREIGN KEY (IdCircuit) REFERENCES circuit(IdCircuit);
ALTER TABLE connexion ADD CONSTRAINT FK_connexion_idUsager FOREIGN KEY (idUsager) REFERENCES usager(idUsager);
