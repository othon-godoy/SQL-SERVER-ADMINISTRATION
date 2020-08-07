-- SETANDO BANCO DE DADOS
USE dbModelDatabase
GO

-- CRIANDO UMA VIEW
CREATE VIEW VW_CUSTOMERS
AS 
SELECT *
FROM CLIENTES
GO

-- VISUALIZANDO A VIEW
SELECT *
FROM VW_CUSTOMERS
GO

-- VISUALIZANDO A ESTRUTURA DE UMA VIEW
SP_HELPTEXT VW_CUSTOMERS
GO

-- ALTERANDO UMA VIEW
ALTER VIEW VW_CUSTOMERS
AS
SELECT *
FROM CLIENTES
WHERE NomeCliente LIKE '%a'
GO

-- VISUALIZANDO VIEW
SELECT * 
FROM VW_CUSTOMERS
GO

-- APAGANDO UMA VIEW
DROP VIEW VW_CUSTOMERS