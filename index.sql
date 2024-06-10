CREATE DATABASE projeto;
USE projeto;
DROP DATABASE projeto;
-- dd
CREATE TABLE tb_company (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cnpj CHAR(14) NOT NULL,
  name VARCHAR(50) NOT NULL,
  location VARCHAR(50),
  stock_id INT,
  supplier_id INT
  -- FOREIGN KEY (stock_id) REFERENCES tb_stock(id),
  -- FOREIGN KEY (supplier_id) REFERENCES tb_supplier(id)
);
-- FOREIGN KEYS
ALTER TABLE tb_company ADD FOREIGN KEY (stock_id) REFERENCES tb_stock(id);
ALTER TABLE tb_company ADD FOREIGN KEY (supplier_id) REFERENCES tb_supplier(id);

-- ADICIONANDO DADOS
-- SABRINA: Company e Supplier
INSERT INTO tb_company (cnpj, name, location, stock_id) VALUES('12345678901234', 'GásBrasil', 'Moinhos de Vento, Porto Alegre, RS', '1');

-- CONSULTANDO
SELECT * FROM tb_company;

CREATE TABLE tb_supplier (
  id INT AUTO_INCREMENT PRIMARY KEY,
  supplied_product VARCHAR(50),
  name VARCHAR(50),
  cnpj CHAR(14),
  phone INT(11)
);
-- ADICIONANDO DADOS
INSERT INTO tb_supplier(supplied_product, name, cnpj, phone) VALUES('', '', '', '');

-- CONSULTANDO
SELECT * FROM tb_supplier;

CREATE TABLE tb_stock (
  id INT AUTO_INCREMENT PRIMARY KEY,
  capacity INT,
  company_id INT,
  product_type VARCHAR(50),
  supplier_id INT
  -- FOREIGN KEY (company_id) REFERENCES tb_company(id),
  -- FOREIGN KEY (product_type) REFERENCES tb_product(type),
  -- FOREIGN KEY (supplier_id) REFERENCES tb_supplier(id)
);
-- FOREIGN KEYS
ALTER TABLE tb_stock ADD FOREIGN KEY (company_id) REFERENCES tb_company(id);
ALTER TABLE tb_stock ADD FOREIGN KEY (product_type) REFERENCES tb_product(type);
ALTER TABLE tb_stock ADD FOREIGN KEY (supplier_id) REFERENCES tb_supplier(id);

-- ADICIONANDO DADOS
INSERT INTO tb_stock (capacity) VALUES('10000');

-- CONSULTANDO
SELECT * FROM tb_stock;

CREATE TABLE tb_product (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50),
  type VARCHAR(50),
  validity DATETIME,
  description VARCHAR(100),
  stock_id INT,
  transaction_id INT
  -- FOREIGN KEY (stock_id) REFERENCES tb_stock(id),
  -- FOREIGN KEY (transaction_id) REFERENCES tb_transaction(id)
);
-- FOREIGN KEYS
ALTER TABLE tb_product ADD FOREIGN KEY (stock_id) REFERENCES tb_stock(id);
ALTER TABLE tb_product ADD FOREIGN KEY (transaction_id) REFERENCES tb_transaction(id);

-- ADICIONANDO DADOS
INSERT INTO tb_product (name, type, validity, desciption) VALUES('', '', '','');

-- CONSULTANDO
SELECT * FROM tb_product;

CREATE TABLE tb_client (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cpf CHAR(11),
  name VARCHAR(50),
  phone INT(11),
  location VARCHAR(50),
  transaction_id INT
  -- FOREIGN KEY (transaction_id) REFERENCES tb_transaction(id)
);
-- FOREIGN KEYS
ALTER TABLE tb_client ADD FOREIGN KEY (transaction_id) REFERENCES tb_transaction(id);

-- ADICIONANDO DADOS
INSERT INTO tb_client (cpf, name, phone, location) VALUES('', '', '','');

-- CONSULTANDO
SELECT * FROM tb_client;

CREATE TABLE tb_transaction (
  id INT AUTO_INCREMENT PRIMARY KEY,
  value DECIMAL(5,2),
  date DATETIME,
  form_payment VARCHAR(50),
  quantity_product INT,
  client_id INT,
  product_id INT,
  delivery_id INT
  -- FOREIGN KEY (client_id) REFERENCES tb_client(id),
  -- FOREIGN KEY (product_id) REFERENCES tb_product(id),
  -- FOREIGN KEY (delivery_id) REFERENCES tb_delivery(id)
);
-- FOREIGN KEYS
ALTER TABLE tb_transaction ADD FOREIGN KEY (client_id) REFERENCES tb_client(id);
ALTER TABLE tb_transaction ADD FOREIGN KEY (product_id) REFERENCES tb_product(id);
ALTER TABLE tb_transaction ADD FOREIGN KEY (delivery_id) REFERENCES tb_delivery(id);

-- ADICIONANDO DADOS
INSERT INTO tb_transaction (value, date, form_payment, quantity_product) VALUES('', '', '','');

-- CONSULTANDO
SELECT * FROM tb_transaction;

CREATE TABLE tb_delivery (
  id INT AUTO_INCREMENT PRIMARY KEY,
  status BOOL,
  delivery_location VARCHAR(50),
  delivery_date DATE,
  transation_id INT
  -- FOREIGN KEY (transaction_id) REFERENCES tb_transaction(id)
);
-- FOREIGN KEYS
ALTER TABLE tb_delivery ADD FOREIGN KEY (transaction_id) REFERENCES tb_transaction(id);

-- ADICIONANDO DADOS
INSERT INTO tb_delivery (status, delivery_location, delivery_date) VALUES('', '', '');

-- CONSULTANDO
SELECT * FROM tb_delivery;