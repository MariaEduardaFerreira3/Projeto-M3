CREATE DATABASE projeto;
USE projeto;
DROP DATABASE projeto;

CREATE TABLE tb_supplier (
  id INT PRIMARY KEY,
  supplied_product VARCHAR(50),
  name VARCHAR(50),
  cnpj CHAR(14),
  phone VARCHAR(20)
);
 
 CREATE TABLE tb_stock (
  id INT PRIMARY KEY,
  capacity INT,
  created_at DATETIME DEFAULT(NOW()),
  updated_at DATETIME
);

CREATE TABLE tb_company (
  id INT PRIMARY KEY,
  cnpj CHAR(18) NOT NULL,
  name VARCHAR(50) NOT NULL,
  location VARCHAR(50),
  selled_product VARCHAR(50),
  stock_id INT,
  supplier_id INT,
  FOREIGN KEY (stock_id) REFERENCES tb_stock (id),
  FOREIGN KEY (supplier_id) REFERENCES tb_supplier (id)
);

CREATE TABLE tb_product (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  type_product VARCHAR(50),
  validity DATE,
  description VARCHAR(100),
  quantity_stock INT DEFAULT(0),
  price DECIMAL(5,2),
  stock_id INT,
  FOREIGN KEY (stock_id) REFERENCES tb_stock (id)
); 

CREATE TABLE tb_client (
  id INT PRIMARY KEY,
  cpf CHAR(11),
  name VARCHAR(50),
  phone VARCHAR(20),
  location VARCHAR(50)
);

CREATE TABLE tb_delivery (
  id INT PRIMARY KEY,
  status ENUM('Entregue','Atrasado','Separado','Cancelado','Aguardando Pagamento'),
  delivery_location VARCHAR(50),
  delivery_date DATE
);

CREATE TABLE tb_transaction (
  id INT PRIMARY KEY,
  value DECIMAL(5,2),
  date DATE,
  form_payment ENUM('Pix','Cartão de Crédito','Cartão de Débito','Boleto'),
  quantity_product INT,
  client_id INT,
  product_id INT,
  delivery_id INT,
  company_id int,
  FOREIGN KEY (client_id) REFERENCES tb_client(id),
  FOREIGN KEY (product_id) REFERENCES tb_product(id),
  FOREIGN KEY (delivery_id) REFERENCES tb_delivery(id),
  FOREIGN KEY (company_id) REFERENCES tb_company(id)
);
-- ----------------------------------------------
 INSERT INTO tb_supplier (id, supplied_product, name, cnpj, phone) VALUES 
(10, 'Gás Industrial', 'GásFórmula', '12345678901234', 8294567890),
(30, 'Gás de Cozinha', 'GásInfinity', '34567890123456', 9996789012),
(40, 'Água Mineral', 'Minerale', '45678901234567', 9897890123), 
(50, 'Bebidas', 'Cia das Bebidas', '56789012345678', 3198901245),
(60, 'Leite Bovino', 'Nata Laticínios', '34548769295458', 4998941538);

INSERT INTO tb_stock (id, capacity, updated_at) VALUES
(15, '500', '2024-06-29 23:44:55'),
(25, '480', '2024-06-17 14:35:56'),
(35, '2000', '2024-06-30 12:34:12'),
(45, '600', '2024-06-23 07:45:01'),
(55, '1000', '2024-08-12 03:02:23'),
(65, '1300', '2024-06-14 08:23:14');
 
 INSERT INTO tb_company (id, cnpj, name, location, selled_product, stock_id, supplier_id) VALUES
(01, '12.345.678/0941-90', 'GásBrasil', 'Maceió, Alagoas, AL', 'Gás Industrial', 15, 10),
(02, '23.456.789/7801-19', 'WaterTech', 'Boa Viagem, Recife, PE', 'Água Mineral', 25, 40),
(03, '34.567.890/0201-47', 'EcoH2O', 'Savassi, Belo Horizonte, MG', 'Água Mineral', 55, 40),
(04, '45.678.901/0341-73', 'GásLíder', 'Copacabana, Rio de Janeiro, RJ', 'Gás de Cozinha', 45, 30),
(05, '56.789.012/0001-94', 'Suprimento Drink', 'Itaim Bibi, São Paulo, SP','Cerveja, Refrigerante e Isotônico', 35, 50),
(06, '67.854.670/9873-56', 'AQueijaria','Secretário, Petrópolis, RJ','Queijo', 65, 60);

INSERT INTO tb_product (id, name, type_product, validity, quantity_stock, description, price, stock_id) VALUES
(13, 'Gás Industrial', 'Gás', '2039-02-21', 300, 'Botijão de gás, 45kg, 1 unidade', 300.00, 15),
(23, 'Água Mineral sem Gás', 'Água', '2044-10-13', 450, 'Engradado de água sem gás, 300ml, 12 unidades', 17.00, 25),
(33, 'Gás de Cozinha', 'Gás', '2039-05-31', 330 , 'Botijão de gás, 13kg, 1 unidade', 150.00, 45),
(43, 'Galão de Água', 'Água', '2026-12-06', 240, 'Galão de água sem gás, 20l, 1 unidade', 35.00, 55),
(53, 'Coca-Cola', 'Refrigerante', '2025-01-10', 500, 'Coca-cola retornável, 2l, 1 unidade',8.80, 35),
(63, 'Brahma', 'Cerveja', '2024-10-20', 300, 'Pack de latinhas, 350ml, 12 unidades',35.00, 35),
(93, 'Heineken', 'Cerveja', '2024-10-20', 300, 'Heineken Long Neck 330ml, 1 unidades',8.00, 35),
(94, 'Guaraná Antártica', 'Refrigerante', '2025-01-10', 350, 'Guaraná Antártica 3l, 1 unidades',11.00, 35),
(95, 'Gatorade Morango', 'Isotônico', '2024-10-20', 150, 'Isotônico Gatorade De Morango, 500ml, 6 unidades',43.00, 35),
(96, 'Gatorade Limão', 'Isotônico', '2024-10-20', 150, 'Isotônico Gatorade De Limão, 500ml, 6 unidades',43.00, 35),
(73, 'Água Mineral com gás', 'Água', '2026-12-18', 400, 'Engradado de água com gás, 510ml, 12 unidades', 20.00, 25),
(83, 'Parmesão', 'Queijo', '2026-04-18', 250, 'Peça de Queijo Parmesão, 1kg, 1 unidade', 56.00, 65),
(84, 'Prato', 'Queijo', '2026-04-28', 250, 'Peça de Queijo Prato, 5kg, 1 unidade', 33.00, 65),
(85, 'Brie', 'Queijo', '2026-05-01', 250, 'Peça de Queijo Brie, 1kg, 1 unidade', 90.00, 65);

INSERT INTO tb_client (id, cpf, name, phone, location) VALUES
(47,'92738164520', 'Ana Clara Oliveira', '51938264950','Botafogo, Rio de Janeiro, RJ'),
(57,'48159673240', 'João Pedro Souza', '62974981330','Marechal Deodoro, Alagoas, AL'),
(67,'36527891470', 'Maria Fernanda Santos', '84929165380','Ibirapuera, São Paulo, SP'),
(77,'75231984608', 'Gabriel Almeida', '93941628770','Tijuca, Rio de Janeiro, RJ'),
(87,'19028347566', 'Beatriz Lima', '72936541820','Imbiribeira, Recife, PE'),
(97,'63814720519', 'Lucas Pereira', '28997513600','Barra de São Miguel, Alagoas, AL'),
(17,'74952083611', 'Larissa Costa', '31929458720','Serra, Belo Horizonte, MG'),
(27,'58263941704', 'Rafael Gomes', '43972961550','Cruzeiro, Belo Horizonte, MG'),
(37,'95173468200', 'Mariana Rodrigues', '62984713500','Vila Olímpia, São Paulo, SP'),
(38,'82615497330', 'Felipe Silva', '18959432600','Piedade, Recife, PE'),
(39,'88547508723', 'Roberto Aragão', '21993695408','Ermitage, Teresópolis, RJ'),
(29,'88548740723', 'Antônio Lima', '21998756408','Xerém, Duque de Caxias, RJ');

INSERT INTO tb_delivery (id, status, delivery_location, delivery_date) VALUES
(07,'Entregue', 'Marechal Deodoro, Alagoas, AL', '2024-05-28'),
(08,'Entregue', 'Imbiribeira, Recife, PE', '2024-05-25'),
(09,'Entregue', 'Ermitage, Teresópolis, RJ', '2024-06-16'),
(10,'Entregue', 'Serra, Belo Horizonte, MG', '2024-05-26'),
(11,'Entregue', 'Botafogo, Rio de Janeiro, RJ', '2024-05-28'),
(12,'Atrasado', 'Ibirapuera, São Paulo, SP', '2024-05-31'),
(13,'Separado', 'Barra de São Miguel, Alagoas, AL', '2024-06-10'),
(14,'Entregue', 'Tijuca, Rio de Janeiro, RJ', '2024-06-02'),
(15,'Separado', 'Marechal Deodoro, Alagoas, AL', '2024-07-12'),
(16,'Entregue', 'Piedade, Recife, PE', '2024-06-02'),
(17,'Cancelado', 'Ermitage, Teresópolis, RJ', '2024-06-12'),
(18,'Entregue', 'Cruzeiro, Belo Horizonte, MG', '2024-06-04'),
(19,'Entregue', 'Vila Olímpia, São Paulo, SP', '2024-06-03'),
(20,'Cancelado', 'Ibirapuera, São Paulo, SP', '2024-06-08'),
(21,'Aguardando Pagamento', 'Imbiribeira, Recife, PE', '2024-06-08'),
(22,'Atrasado', 'Piedade, Recife, PE', '2024-06-08'),
(23,'Aguardando Pagamento', 'Imbiribeira, Recife, PE', '2024-06-10'),
(24,'Entregue', 'Barra de São Miguel, Alagoas, AL', '2024-06-30'),
(25,'Separado', 'Serra, Belo Horizonte, MG', '2024-06-10'),
(26,'Aguardando Pagamento', 'Xerém, Duque de Caxias, RJ', '2024-07-16'),
(27,'Separado', 'Xerém, Duque de Caxias, RJ', '2024-10-03');

INSERT INTO tb_transaction (id,value, date, form_payment, quantity_product, client_id, product_id, delivery_id, company_id) VALUES
(50,300.00, '2024-05-25', 'Pix', 1, 57, 13, 07, 1),
(51,34.00, '2024-05-25', 'Boleto', 2, 87, 23, 08, 2),
(52,600.00, '2024-06-09', 'Pix', 5, 39, 83, 09, 6),
(53,70.00, '2024-05-25', 'Cartão de Crédito', 2, 17, 43, 10, 3),
(54,150.00, '2024-05-28', 'Cartão de Crédito', 1, 47, 33, 11, 4),
(55,70.00, '2024-05-31', 'Cartão de Débito', 5, 67, 53, 12, 5),
(56,600.00, '2024-06-02', 'Pix', 2, 97, 13, 13, 1),
(57,450.00, '2024-06-02', 'Pix', 3, 77, 33, 14, 4),
(58,300.00, '2024-07-02', 'Pix', 1, 57, 13, 15, 1),
(59,51.00, '2024-06-02', 'Pix', 3, 38, 23, 16, 2),
(60,450.00, '2024-06-09', 'Cartão de Crédito', 3, 39, 83, 17, 6),
(61,175.00, '2024-06-02', 'Cartão de Débito', 5, 27, 43, 18, 3),
(62,350.00, '2024-06-03', 'Boleto', 10, 37, 63, 19, 5),
(63,14.00, '2024-06-04', 'Cartão de Crédito', 1, 67, 53, 20, 5),
(64,17.00, '2024-06-07', 'Cartão de Débito', 1, 87, 23, 21, 2),
(65,60.00, '2024-06-08', 'Pix', 3, 38, 73, 22, 2), 
(66,40.00, '2024-07-09', 'Boleto', 2, 87, 73, 23, 2), 
(67,300.00, '2024-06-28', 'Cartão de Crédito', 1, 97, 13, 24,1),
(68,105.00, '2024-06-09', 'Cartão de Crédito', 3, 17, 43, 25, 3),
(88,66.00, '2024-07-10', 'Boleto', 2, 29, 84, 26, 6),
(90,270.00, '2024-10-05', 'Cartão de Crédito', 3, 29, 85, 27, 6);
-- ----------------------------------------------
SELECT * FROM tb_company;
SELECT * FROM tb_supplier;
SELECT * FROM tb_stock;
SELECT * FROM tb_product;
SELECT * FROM tb_delivery;
SELECT * FROM tb_transaction;

SELECT * FROM tb_client;

-- Retornadno Estoques com Capacidade Entre 500 e 1000
SELECT * FROM tb_stock WHERE capacity BETWEEN 500 AND 1000;
-- Retornadno Fornecedor com o id Entre 15 e 100 e que Possui o Nome de Cia das Bebidas
SELECT * FROM tb_supplier WHERE id BETWEEN 15 AND 100 AND name = 'Cia das Bebidas';
-- Empresas que o Nome Começa com a Letra G
SELECT id, name, location FROM tb_company WHERE name LIKE 'G%' ORDER BY location ASC;
-- Todas as Compras Feitas com Cartão de Crédito
SELECT id, value, date, form_payment,client_id,product_id FROM tb_transaction WHERE form_payment = 'Cartão de Crédito';
-- Quantidade de Entrega por Estado que a Sigla Termina com a Letra J
SELECT COUNT(delivery_location) AS entregas_do_estado FROM tb_delivery WHERE delivery_location LIKE '%E';
-- Status de Entrega de Cada Empresa
SELECT tb_delivery.status, tb_transaction.company_id FROM tb_delivery, tb_transaction WHERE tb_delivery.id = tb_transaction.delivery_id; 
-- Valor Médio das Vendas da Empresa de ID = 2
SELECT ROUND(AVG(value)) as valor_mediano FROM tb_transaction WHERE company_id = 2;
-- Somando Toda a Receita da Empresa de ID = 6
SELECT SUM(value) as receita_final FROM tb_transaction WHERE company_id = 6;
-- Média de Preços dos Produtos por Tipo
SELECT type_product, ROUND(AVG(price)) AS média_preço FROM tb_product GROUP BY type_product HAVING AVG(price) < '130';
-- Quantas Vezes o Produto de ID = 13 foi Vendido
SELECT id AS transação, value AS preço_de_compra, quantity_product, product_id, client_id FROM tb_transaction WHERE product_id = 13;
-- Quantidade de Vendas de Cada Produto da Empresa com ID = 6
SELECT company_id, product_id, quantity_product AS quantidade_de_produtos, value AS valor_da_compra 
FROM tb_transaction WHERE company_id = 6 GROUP BY company_id, product_id, quantity_product, value ORDER BY company_id ASC;
-- Todas as Entregas que podem ser Entregues no mesmo dia da Compra
SELECT tb_transaction.product_id, tb_transaction.date AS data_de_compra, tb_delivery.delivery_date AS data_de_entrega, tb_delivery.status
FROM tb_transaction
INNER JOIN tb_delivery
ON tb_delivery.delivery_date = tb_transaction.date ORDER BY company_id ASC;