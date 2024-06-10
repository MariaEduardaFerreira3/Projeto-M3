CREATE DATABASE teste;
USE teste;

CREATE TABLE company (
  id int PRIMARY KEY,
  cnpj char(14),
  name varchar(50),
  location varchar(50),
  stock_id int,
  supplier_id int
);

CREATE TABLE supplier (
  id int PRIMARY KEY,
  supplied_product varchar(50),
  name varchar(50),
  cnpj char(14),
  phone int(11)
);

CREATE TABLE stock (
  id int PRIMARY KEY,
  company_id int,
  product_type varchar(50),
  capacity int,
  supplier_id int
);

CREATE TABLE product (
  id int PRIMARY KEY,
  name varchar(50),
  type varchar(50),
  validity datetime,
  description varchar(100),
  stock_product int,
  transaction_id int
);

CREATE TABLE client (
  id int PRIMARY KEY,
  cpf char(11),
  name varchar(50),
  phone int(11),
  location varchar(50),
  transaction_id int
);

CREATE TABLE transaction (
  id int PRIMARY KEY,
  value decimal(5,2),
  date datetime,
  form_payment varchar(50),
  quantity_product int,
  client_ind int,
  product_id int,
  delivery_id int
);

CREATE TABLE delivery (
  id int PRIMARY KEY,
  status bool,
  delivery_location varchar(50),
  delivery_date date,
  transation_id int
);

ALTER TABLE supplier ADD FOREIGN KEY (id) REFERENCES company (supplier_id);

ALTER TABLE product ADD FOREIGN KEY (stock_product) REFERENCES stock (id);

ALTER TABLE stock ADD FOREIGN KEY (company_id) REFERENCES company (id);

ALTER TABLE stock ADD FOREIGN KEY (id) REFERENCES company (stock_id);

ALTER TABLE product ADD FOREIGN KEY (transaction_id) REFERENCES transaction (id);

ALTER TABLE transaction ADD FOREIGN KEY (id) REFERENCES client (transaction_id);

ALTER TABLE delivery ADD FOREIGN KEY (transation_id) REFERENCES transaction (id);

ALTER TABLE delivery ADD FOREIGN KEY (id) REFERENCES transaction (delivery_id);

ALTER TABLE product ADD FOREIGN KEY (id) REFERENCES transaction (product_id);

ALTER TABLE transaction ADD FOREIGN KEY (client_ind) REFERENCES client (id);


INSERT INTO company (id, cnpj, name, location, stock_id, supplier_id) VALUES (1, '12345678901234', 'GásBrasil', 'Moinhos de Vento, Porto Alegre, RS', 101, 201); 

 INSERT INTO company (id, cnpj, name, location, stock_id, supplier_id) VALUES (2, '23456789012345', 'GásTech', 'Boa Viagem, Recife, PE', 102, 202);

 INSERT INTO company (id, cnpj, name, location, stock_id, supplier_id) VALUES (3, '34567890123456', 'EcoGás', 'Savassi, Belo Horizonte, MG', 103, 203); 

INSERT INTO company (id, cnpj, name, location, stock_id, supplier_id) VALUES (4, '45678901234567', 'GásLíder', 'Itaim Bibi, São Paulo, SP', 104, 204);

  INSERT INTO company (id, cnpj, name, location, stock_id, supplier_id) VALUES (5, '56789012345678', 'SuprimentoGás', 'Copacabana, Rio de Janeiro, RJ', 105, 205);
  
  SELECT * FROM company;