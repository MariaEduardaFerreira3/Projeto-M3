CREATE DATABASE projeto1;
USE projeto1;
DROP DATABASE projeto1;

CREATE TABLE tb_company (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cnpj CHAR(14) NOT NULL,
  name VARCHAR(50) NOT NULL,
  location VARCHAR(50),
  stock_id INT,
  supplier_id INT
);
-- FOREIGN KEYS
ALTER TABLE tb_company ADD FOREIGN KEY (stock_id) REFERENCES tb_stock(id);
ALTER TABLE tb_company ADD FOREIGN KEY (supplier_id) REFERENCES tb_supplier(id);

-- ADICIONANDO DADOS
-- SABRINA: Company e Supplier
INSERT INTO tb_company (cnpj, name, location, stock_id, supplier_id) VALUES
('12345678000190', 'GásBrasil', 'Moinhos de Vento, Porto Alegre, RS', 1, 15),
('23456789000191', 'WaterTech', 'Boa Viagem, Recife, PE', 4, 20),
('34567890000192', 'EcoH2O', 'Savassi, Belo Horizonte, MG', 2, 05),
('45678901000193', 'GásLíder', 'Itaim Bibi, São Paulo, SP', 5, 90),
('56789012000194', 'Suprimento Drink', 'Copacabana, Rio de Janeiro, RJ', 3, 10);

-- CONSULTANDO
SELECT * FROM tb_company;

CREATE TABLE tb_supplier (
  id INT AUTO_INCREMENT PRIMARY KEY,
  supplied_product VARCHAR(50),
  name VARCHAR(50),
  cnpj CHAR(14),
  phone VARCHAR(20)
);

ALTER TABLE tb_supplier DROP COLUMN phone;
ALTER TABLE tb_supplier ADD COLUMN phone VARCHAR(20); 
-- ADICIONANDO DADOS
INSERT INTO tb_supplier (id, supplied_product, name, cnpj, phone) VALUES 
(20, 'Gás Natural', 'GásFórmula', '12345678901234', 8294567890),
(10, 'Gás Propano', 'GásEsfera', '23456789012345', 219678901), 
(15, 'Gás de Cozinha', 'GásInfinity', '34567890123456', 9996789012),
(05, 'Água Mineral', 'Minerale', '45678901234567', 9897890123), 
(90, 'Bebidas', 'Cia das Bebidas', '56789012345678', 3198901245);


-- CONSULTANDO
SELECT * FROM tb_supplier;

CREATE TABLE tb_stock (
  id INT AUTO_INCREMENT PRIMARY KEY,
  capacity INT,
  company_id INT,
  supplier_id INT
);


DROP TABLE tb_stock;
-- FOREIGN KEYS
ALTER TABLE tb_stock ADD FOREIGN KEY (company_id) REFERENCES tb_company(id);
ALTER TABLE tb_stock ADD FOREIGN KEY (supplier_id) REFERENCES tb_supplier(id);

-- ADICIONANDO DADOS
INSERT INTO tb_stock (capacity) VALUES('10000'), ('15000'), ('50000'), ('20000'), ('30000');

-- CONSULTANDO
SELECT * FROM tb_stock;

CREATE TABLE tb_product (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50),
  type_product VARCHAR(50),
  validity DATETIME,
  description VARCHAR(100),
  stock_id INT,
  transaction_id INT
); 

-- FOREIGN KEYS
ALTER TABLE tb_product ADD FOREIGN KEY (stock_id) REFERENCES tb_stock(id);
ALTER TABLE tb_product ADD FOREIGN KEY (transaction_id) REFERENCES tb_transaction(id);


-- ADICIONANDO DADOS
INSERT INTO tb_product (name, type_product, validity, description, stock_id) VALUES
('Gás', 'Gás Propano', '2039-02-21','Botijão de gás, 5kg', '2'),
('Gás', 'Gás Natural', '2044-10-13','Botijão de gás', '1'),
('Gás', 'Gás de Cozinha', '2039-05-31','Botijão de gás, 5kg','3'),
('Água', 'Água Mineral', '2026-12-06','Galão de água sem gás, 20l', '4'),
('Coca-Cola', 'Refrigerante', '2025-01-10','Coca-cola retornável, 2l','5'),
('Brahma', 'Cerveja', '2024-10-20','Engradado de latinhas, 6l','5');

-- CONSULTANDO
SELECT * FROM tb_product;

CREATE TABLE tb_client (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cpf CHAR(11),
  name VARCHAR(50),
  phone VARCHAR(20),
  location VARCHAR(50),
  transaction_id INT
);
-- FOREIGN KEYS
ALTER TABLE tb_client ADD FOREIGN KEY (transaction_id) REFERENCES tb_transaction(id);

-- ADICIONANDO DADOS
INSERT INTO tb_client (cpf, name, phone, location) VALUES
('92738164520', 'Ana Clara Oliveira', '51938264950','Copacabana, Rio de Janeiro, RJ'),
('48159673240', 'João Pedro Souza', '62974981330','Moinhos de Vento, Porto Alegre, RS'),
('36527891470', 'Maria Fernanda Santos', '84929165380','Itaim Bibi, São Paulo, SP'),
('75231984608', 'Gabriel Almeida', '93941628770','Copacabana, Rio de Janeiro, RJ'),
('19028347566', 'Beatriz Lima', '72936541820','Boa Viagem, Recife, PE'),
('63814720519', 'Lucas Pereira', '28997513600','Moinhos de Vento, Porto Alegre, RS'),
('74952083611', 'Larissa Costa', '31929458720','Savassi, Belo Horizonte, MG'),
('58263941704', 'Rafael Gomes', '43972961550','Savassi, Belo Horizonte, MG'),
('95173468200', 'Mariana Rodrigues', '62984713500','Itaim Bibi, São Paulo, SP'),
('82615497330', 'Felipe Silva', '18959432600','Boa Viagem, Recife, PE');


ALTER TABLE tb_client DROP COLUMN phone;
ALTER TABLE tb_client ADD COLUMN phone VARCHAR(20); 
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
);
-- FOREIGN KEYS
ALTER TABLE tb_transaction ADD FOREIGN KEY (client_id) REFERENCES tb_client(id);
ALTER TABLE tb_transaction ADD FOREIGN KEY (product_id) REFERENCES tb_product(id);
ALTER TABLE tb_transaction ADD FOREIGN KEY (delivery_id) REFERENCES tb_delivery(id);

-- ADICIONANDO DADOS
INSERT INTO tb_transaction (value, date, form_payment, quantity_product, client_id, product_id) VALUES
('30.00', '2024-05-25', 'pix','3', '2','4'),
('40.00', '2024-05-25', 'boleto','4','5','4'),
('280.00', '2024-05-25', 'cartão de crédito','4','7','6'),
('70.00', '2024-05-28', 'cartão de crédito','1','1','6'),
('200.00', '2024-05-31', 'cartão de débito','2', '3','3'),
('110.00', '2024-06-02', 'pix','1','6','2'),
('54.00', '2024-06-02', 'pix','6','4','5'),
('30.00', '2024-06-02', 'pix','3','2','4'),
('330.00', '2024-06-02', 'pix','3', '10','2'),
('90.00', '2024-06-02', 'cartão de débito','10', '8','5'),
('300.00', '2024-06-03', 'boleto','2', '9','1'),
('10.00', '2024-06-04', 'cartão de crédito','1','3','4'),
('70.00', '2024-06-07', 'cartão de débito','1','5','6'),
('18.00', '2024-06-08', 'pix','2','10','5'),
('440.00', '2024-06-09', 'boleto','4','5','2'),
('800.00', '2024-06-09', 'cartão de crédito','8','6','3'),
('450.00', '2024-06-09', 'cartão de crédito','3','7','1');


-- CONSULTANDO
SELECT * FROM tb_transaction;

CREATE TABLE tb_delivery (
  id INT AUTO_INCREMENT PRIMARY KEY,
  status BOOL,
  delivery_location VARCHAR(50),
  delivery_date DATE,
  transation_id INT
);
-- FOREIGN KEYS
ALTER TABLE tb_delivery ADD FOREIGN KEY (transation_id) REFERENCES tb_transaction(id);

-- ADICIONANDO DADOS
INSERT INTO tb_delivery (status, delivery_location, delivery_date) VALUES('', '', '');

-- CONSULTANDO
SELECT * FROM tb_delivery;