#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: circuit
#------------------------------------------------------------

CREATE TABLE circuit(
        IdCircuit         int (11) Auto_increment  NOT NULL ,
        nomCircuit        Varchar (25) NULL ,
        nbPlacesMinimum   Int NULL ,
        nbrPlacesMaximum  Int NULL ,
        nbPlacesReservees Int NULL,
        etat              Int NULL ,
        dateDepart        Date NULL ,
        dateArrivee       Date NULL ,
        photoCircuit      Varchar (100) null,
        prixCircuit       Int  NULL ,
        guide             Varchar (255) ,
        transport         Varchar (50) ,
        idRabais          Int NULL ,
        PRIMARY KEY (IdCircuit )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: etape
#------------------------------------------------------------

CREATE TABLE etape(
        idEtape          int (11) Auto_increment  NOT NULL ,
        nomEtape         Varchar (25) NULL ,
        IdCircuit       Int not NULL ,
        nombreJour       Int NULL ,
        dateArrivee      Date NOT NULL ,
        dateDepart       Date NOT NULL ,
        descriptionEtape Varchar (250) ,
        photoEtape       Varchar (100) ,
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
        idReservation        Int NULL ,
        PRIMARY KEY (IdAccompagnateur )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: jour
#------------------------------------------------------------

CREATE TABLE jour(
        idJour     int (11) Auto_increment  NOT NULL ,
        nomJour    Varchar (25) NOT NULL ,
        nomVille   Varchar (25) NOT NULL ,
        idEtape   Int NOT NULL ,
        hotel      Varchar (250) ,
        restaurant Varchar (250) ,
        PRIMARY KEY (idJour )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: usager
#------------------------------------------------------------

CREATE TABLE usager(
        idUsager           int (11) Auto_increment  NOT NULL ,
        nomUsager          Varchar (25) NOT NULL ,
        prenomUsager       Varchar (25) NOT NULL ,
        adresse            Varchar (250) NOT NULL ,
        ddnUsager          Date NOT NULL ,
        telephoneUsager    Varchar (25) NOT NULL ,
        etat               Int NOT NULL ,
        idReservation      Int NOT NULL ,
        courriel           Varchar (50) NOT NULL ,
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
        PRIMARY KEY (idReservation )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: rabais
#------------------------------------------------------------

CREATE TABLE rabais(
        idRabais    Int NOT NULL ,
        nomRabais   Varchar (25) NOT NULL ,
        description Varchar (250) NOT NULL ,
        pourcentage Float NOT NULL ,
        codePromo   Varchar (50) ,
        PRIMARY KEY (idRabais )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: connexion
#------------------------------------------------------------

CREATE TABLE connexion(
        courriel Varchar (50) NOT NULL ,
        mdp      Varchar (50) NOT NULL ,
        PRIMARY KEY (courriel )
)ENGINE=InnoDB;

ALTER TABLE circuit ADD CONSTRAINT FK_circuit_idRabais FOREIGN KEY (idRabais) REFERENCES rabais(idRabais);
ALTER TABLE etape ADD CONSTRAINT FK_etape_IdCircuit FOREIGN KEY (IdCircuit) REFERENCES circuit(IdCircuit);
ALTER TABLE Accompagnateur ADD CONSTRAINT FK_Accompagnateur_idReservation FOREIGN KEY (idReservation) REFERENCES reservation(idReservation);
ALTER TABLE jour ADD CONSTRAINT FK_jour_idEtape FOREIGN KEY (idEtape) REFERENCES etape(idEtape);
ALTER TABLE reservation ADD CONSTRAINT FK_reservation_idUsager_usager FOREIGN KEY (idUsager) REFERENCES usager(idUsager);

