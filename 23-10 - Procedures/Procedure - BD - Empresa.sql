/*
USE Empresa

CREATE PROCEDURE usp_BuscarCliente
	@nomeBusca varchar (50)
AS
SELECT CodCli, Nome FROM Clientes WHERE Nome LIKE '%' + @nomeBusca + '%'

EXEC usp_BuscarCliente "ana"

-----------------------------------------------------------------------------------

CREATE PROC usp_contaCliente 
@nomeBusca VARCHAR(50)
AS
DECLARE @contagem INT, @mensagem CHAR(100)
SELECT @contagem = COUNT(*) FROM clientes
	WHERE nome LIKE '%' + @nomeBusca + '%'
	IF @contagem = 0 
		BEGIN
			SELECT @mensagem = 'Nenhum cliente contém "' + @nomeBusca + '"'
		END
	ELSE
		BEGIN
			SELECT @mensagem = 'Foram encontrados' + '' + 
				CONVERT(CHAR(3),@contagem) + 'clientes'
			PRINT @mensagem
		END
	EXEC usp_contaCliente '4'
	EXEC usp_contaCliente 'ana'

-----------------------------------------------------------------------------------

ALTER PROCEDURE usp_insereDetalhesPed
	@numPed INT,
	@codPred INT,
	@preco DECIMAL(17,2),
	@qtde INT,
	@desconto DEC (17,2)
AS
	IF (@numPed <> 0) OR (@codPred <> 0)
	BEGIN
		INSERT DetalhesPed VALUES
			(@numPed,@codPred,@preco,@qtde,@desconto)
	END
	ELSE
		BEGIN
			PRINT 'Valores incorretos'
		END
	EXEC usp_insereDetalhesPed 11074,1,100.25,25,10
	EXEC usp_insereDetalhesPed 0,0,0,0,0
*/