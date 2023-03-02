DROP DATABASE IF EXISTS gescom;
CREATE DATABASE gescom;
USE gescom;


DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS orders; 
DROP TABLE IF EXISTS details;
DROP TABLE IF EXISTS suppliers;
DROP TABLE IF EXISTS customers;



CREATE TABLE products(
    pro_id VARCHAR(50) NOT NULL,
    pro_ref VARCHAR(10) NOT NULL,
    pro_name VARCHAR(200) NOT NULL,
    pro_desc CHAR(1000) NOT NULL,
    pro_price NOT NULL DECIMAL(6,2),
    pro_stock SMALLINT,
    pro_color VARCHAR(30),
    pro_picture VARCHAR(40),
    pro_add_date DATE NOT NULL,
    pro_update_date DATE NOT NULL,
    pro_publish NOT NULL TINYINT(1),
    PRIMARY KEY(pro_id)
);

CREATE TABLE orders(
    ord_id INT NOT NULL,
    ord_order_date DATE NOT NULL,
    ord_ship_date DATE,
    ord_bill_date DATE,
    ord_reception_date DATE NOT NULL,
    ord_status VARCHAR(25) NOT NULL,
    PRIMARY KEY(ord_id)
);

CREATE TABLE details(
    det_idINT NOT NULL,
    det_price DECIMAL(6,2)NOT NULL,
    det_quantity NT(5) NOT NULL,
    PRIMARY KEY(det_id)
);

CREATE TABLE suppliers(
    sup_id INT NOT NULL,
    sup_name VARCHAR(50) NOT NULL,
    sup_cityVARCHAR(50) NOT NULL ,
    sup_adress VARCHAR(150) NOT NULL,
    sup_mail VARCHAR(75),
    sup_phone INT(10),
    PRIMARY KEY(sup_id)
);

CREATE TABLE customers(
    cus_id INT NOT NULL,
    cus_lastname VARCHAR(50) NOT NULL,
    cus_firstname VARCHAR(50) NOT NULL,
    cus_adress VARCHAR(150) NOT NULL,
    cus_zipcode VARCHAR(50) NOT NULL,
    cus_city VARCHAR(50) NOT NULL,
    cus_mail VARCHAR(75),
    cus_phone INT(10),
    PRIMARY KEY(cus_id)
);


CREATE INDEX `pro_ref` ON products (`pro_ref` ASC);




ALTER TABLE orders ADD CONSTRAINT ord_id FOREIGN KEY (pro_id) REFERENCES products (pro_id);

ALTER TABLE suppliers ADD CONSTRAINT sup_id FOREIGN KEY (pro_id) REFERENCES products (pro_id);

ALTER TABLE details ADD CONSTRAINT det_id FOREIGN KEY (pro_ref) REFERENCES produits (pro_ref);



