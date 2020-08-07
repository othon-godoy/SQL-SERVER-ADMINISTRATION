-- SETANDO BANCO DE DADOS
USE dbModelDatabase
GO

-- CRIANDO TABELA DESTINO
CREATE TABLE PRODUCTS
(
	PRODUCTID INT PRIMARY KEY,
	PRODUCTNAME VARCHAR(100),
	RATE MONEY
) 
GO

-- INSERINDO DADOS NA TABELA DESTINO
INSERT INTO PRODUCTS
VALUES
(1, 'TEA', 10.00),
(2, 'COFFEE', 20.00),
(3, 'MUFFIN', 30.00),
(4, 'BISCUIT', 40.00)
GO

-- CRIANDO TABELA FONTE
CREATE TABLE UPDATEDPRODUCTS
(
	PRODUCTID INT PRIMARY KEY,
	PRODUCTNAME VARCHAR(100),
	RATE MONEY
) 
GO

-- INSERINDO DADOS NA TABELA FONTE
INSERT INTO UPDATEDPRODUCTS
VALUES
(1, 'TEA', 10.00),
(2, 'COFFEE', 25.00),
(3, 'MUFFIN', 35.00),
(4, 'BISCUIT', 60.00)
GO

-- VISUALIZANDO TABELA DESTINO
SELECT * FROM PRODUCTS
GO

-- VISUALIZANDO TABELA FONTE
SELECT * FROM UPDATEDPRODUCTS
GO

-- SINCRONIZANDO DADOS DAS DUAS TABELAS
MERGE PRODUCTS		  AS TARGET
USING UPDATEDPRODUCTS AS SOURCE 
ON (TARGET.PRODUCTID = SOURCE.PRODUCTID) 

WHEN MATCHED THEN 
		UPDATE SET TARGET.RATE = SOURCE.RATE

WHEN NOT MATCHED BY TARGET THEN 
	INSERT (PRODUCTID, PRODUCTNAME, RATE) 
	VALUES (SOURCE.PRODUCTID, SOURCE.PRODUCTNAME, SOURCE.RATE)

WHEN NOT MATCHED BY SOURCE THEN 
DELETE;
GO