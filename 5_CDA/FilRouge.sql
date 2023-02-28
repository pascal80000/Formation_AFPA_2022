DROP DATABASE IF EXISTS filrouge;
CREATE DATABASE filrouge;
USE filrouge;


CREATE TABLE Clients(
   num_cli INT NOT NULL AUTO_INCREMENT,
   nom_cli VARCHAR(50),
   com_cli VARCHAR(50) NOT NULL,
   cde_cli VARCHAR(50) NOT NULL,
   adr_cli VARCHAR(50),
   typ_cli LOGICAL,
   rem_cli DECIMAL(4,2),
   PRIMARY KEY(num_cli)
);

CREATE TABLE Fournisseurs(
   id_fou INT NOT NULL AUTO_INCREMENT,
   nom_fou VARCHAR(50),
   adr_fou VARCHAR(255),
   PRIMARY KEY(id_fou)
);

CREATE TABLE Commerciaux(
   nom_com VARCHAR(50),
   cli_com VARCHAR(50) NOT NULL,
   num_cli INT NOT NULL,
   PRIMARY KEY(nom_com),
   FOREIGN KEY(num_cli) REFERENCES Clients(num_cli)
);

CREATE TABLE Produits(
   ref_pdt VARCHAR(50),
   nom_pdt VARCHAR(50),
   lib_pdt VARCHAR(255),
   rub_pdt VARCHAR(255),
   sru_pdt VARCHAR(255),
   pra_pdt DECIMAL(7,2),
   pvp_pdt DECIMAL(7,2),
   pvi_pdt DECIMAL(7,2),
   vue_pdt LOGICAL,
   stk_pdt SMALLINT,
   img_pdt VARCHAR(50),
   rff_pdt VARCHAR(50),
   id_fou INT NOT NULL,
   PRIMARY KEY(ref_pdt),
   FOREIGN KEY(id_fou) REFERENCES Fournisseurs(id_fou)
);

CREATE TABLE Commandes(
   num_cde VARCHAR(50),
   lig_cde VARCHAR(50),
   art_cde VARCHAR(50),
   dat_cde DATE,
   val_cde INT,
   env_cde INT,
   rec_cde DATE,
   acc_cde INT,
   rem_cde DECIMAL(4,2),
   pay_cde INT,
   num_cli INT NOT NULL,
   PRIMARY KEY(num_cde),
   FOREIGN KEY(num_cli) REFERENCES Clients(num_cli)
);

CREATE TABLE Panier(
   lig_pan INT,
   ref_pan VARCHAR(50),
   qte_pan SMALLINT,
   pri_pan DECIMAL(15,2),
   tot_pan DECIMAL(15,2),
   val_pan SMALLINT,
   ref_pdt VARCHAR(50) NOT NULL,
   num_cde VARCHAR(50) NOT NULL,
   PRIMARY KEY(lig_pan),
   FOREIGN KEY(ref_pdt) REFERENCES Produits(ref_pdt),
   FOREIGN KEY(num_cde) REFERENCES Commandes(num_cde)
);
