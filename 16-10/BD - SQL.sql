CREATE DATABASE Supermercado;
USE Supermercado;

CREATE TABLE fornecedores (
Cod_Fornec SMALLINT PRIMARY KEY,
Nome_Fornec VARCHAR(50));

CREATE TABLE produtos (
ID_Prod SMALLINT PRIMARY KEY,
Nome_Prod VARCHAR(50) NOT NULL,
Quant_Prod VARCHAR(50) NOT NULL,
Preco_Prod DECIMAL(10,2),
Cod_Fornec SMALLINT,
CONSTRAINT fk_cod_fornec FOREIGN KEY (Cod_Fornec)
REFERENCES Fornecedores(Cod_Fornec));

INSERT INTO Fornecedores (Cod_Fornec, Nome_Fornec) VALUES (1, 'Acme'),(2, 'ggs'),

INSERT INTO Produtos VALUES 

(100, 'Monitor LCD', 12, 550.00, 1),
(101, 'Roteador Banda Larga', 8, 130.00, 1),
(102, 'Teclado', 15, 40.00, 1),
(103, 'PenDrive 64GB', 22, 48.00, 1),
(104, 'Webcam', 6, 170.00, 1),
