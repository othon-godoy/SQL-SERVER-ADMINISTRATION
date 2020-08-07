-- SETANDO BANCO DE DADOS
USE dbModelDatabase
GO

-- CRIANDO FUNÇÃO ESCALAR QUE REMOVE ESPAÇOS EM BRANCO
CREATE FUNCTION ALLTRIM(@STR_ENTRADA VARCHAR(200))
RETURNS VARCHAR(200)
AS
BEGIN
	RETURN RTRIM(LTRIM(@STR_ENTRADA))
END
GO

-- CHAMANDO A FUNÇÃO
SELECT NOMECLIENTE
      ,dbo.ALLTRIM(NomeCliente)
	  ,dbo.ALLTRIM(' A')
FROM CLIENTES