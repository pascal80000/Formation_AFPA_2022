DROP DATABASE IF EXISTS gescom;
CREATE DATABASE gescom;
USE gescom;


DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS orders; 
DROP TABLE IF EXISTS details;
DROP TABLE IF EXISTS suppliers;
DROP TABLE IF EXISTS customers;

CREATE TABLE orders(
    ord_id INT(4) NOT NULL AUTO_INCREMENT,
    ord_order_date DATE NOT NULL,
    ord_ship_date DATE,
    ord_bill_date DATE,
    ord_reception_date DATE NOT NULL,
    ord_status VARCHAR(25) NOT NULL,
    PRIMARY KEY(ord_id)
);

CREATE TABLE details(
    det_id INT(4) NOT NULL,
    det_price DECIMAL(6,2)NOT NULL,
    det_quantity INT(2) NOT NULL,
    PRIMARY KEY(det_id)
);

CREATE TABLE suppliers(
    sup_id INT NOT NULL,
    sup_name VARCHAR(50) NOT NULL,
    sup_city VARCHAR(50) NOT NULL,
    sup_adress VARCHAR(150) NOT NULL,
    sup_mail VARCHAR(75),
    sup_phone INT(10),
    PRIMARY KEY(sup_id)
);

CREATE TABLE customers(
    cus_id INT(5) NOT NULL,
    cus_lastname VARCHAR(50) NOT NULL,
    cus_firstname VARCHAR(50) NOT NULL,
    cus_adress VARCHAR(150) NOT NULL,
    cus_zipcode VARCHAR(50) NOT NULL,
    cus_city VARCHAR(50) NOT NULL,
    cus_mail VARCHAR(75),
    cus_phone INT(10),
    PRIMARY KEY(cus_id)
);

CREATE TABLE products(
    pro_id INT NOT NULL AUTO_INCREMENT,
    pro_ref VARCHAR(10) NOT NULL,
    pro_name VARCHAR(200) NOT NULL,
    pro_desc CHAR(255) NOT NULL,
    pro_price DECIMAL(6,2) NOT NULL,
    pro_stock INT(4),
    pro_color VARCHAR(30),
    pro_picture VARCHAR(40),
    pro_add_date DATE NOT NULL,
    pro_update_date DATE NOT NULL,
    pro_publish TINYINT(1) NOT NULL,
    PRIMARY KEY(pro_id)
    /*FOREIGN KEY(sup_id) REFERENCES suppliers(sup_id)*/
);



CREATE TABLE achete(
    ord_id INT(4),
    cus_id INT(5),
    PRIMARY KEY(ord_id, cus_id),
    FOREIGN KEY(ord_id) REFERENCES orders(ord_id),
    FOREIGN KEY(cus_id) REFERENCES customers(cus_id)
);

CREATE TABLE contient(
    pro_id INT,
    ord_id INT,
    PRIMARY KEY(pro_id, ord_id),
    FOREIGN KEY(pro_id) REFERENCES products(pro_id),
    FOREIGN KEY(ord_id) REFERENCES orders(ord_id)
);

CREATE TABLE detail_produit(
    pro_id INT,
    det_id INT(4),
    PRIMARY KEY(pro_id, det_id),
    FOREIGN KEY(pro_id) REFERENCES products(pro_id),
    FOREIGN KEY(det_id) REFERENCES details(det_id)
);



CREATE INDEX `pro_ref` ON products (`pro_ref` ASC);








