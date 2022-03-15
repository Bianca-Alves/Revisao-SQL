----- Criação do banco de dados -----

CREATE DATABASE bdRevisao
USE bdRevisao

-- Slide 3 --

----- Criação das tabelas -----

CREATE TABLE Clientes (
	Codigo INT PRIMARY KEY IDENTITY(1,1),
	Nome VARCHAR(15) NOT NULL,
	DataNascimento VARCHAR(10) NOT NULL
);

CREATE TABLE Telefones (
	Codigo INT FOREIGN KEY REFERENCES Clientes (Codigo) NOT NULL,
	Fone INT NOT NULL,
	Tipo VARCHAR(15) NOT NULL
);

----- Inserção de dados -----

INSERT INTO Clientes
VALUES ('Marcio', '01061975'),
       ('Marlos', '05081980'),
	   ('Luciane', '10051970'),
	   ('Wilkie', '12031974')

INSERT INTO Telefones
VALUES (1, 22548954, 'Recidencial'),
       (2, 88512547, 'Celular'),
	   (3, 89665485, 'Celular'),
	   (4, 26539955, 'Recidencial')

----- Realização do join -----

SELECT Nome, Fone
FROM Clientes c
LEFT JOIN Telefones t
ON t.Codigo = c.Codigo
WHERE Fone IS NOT NULL


-- Slide 4 --

----- Criação da tabela -----

CREATE TABLE dadosClientes (
	Codigo INT PRIMARY KEY IDENTITY(1,1),
	Nome VARCHAR(50) NOT NULL,
	Endereco VARCHAR(50) NOT NULL,
	Cidade VARCHAR(50) NOT NULL,
	Estado CHAR(02) NOT NULL,
	CEP CHAR(09) NOT NULL,
	Telefone CHAR(12) NOT NULL,
	Email VARCHAR(50) NOT NULL,
	Status CHAR(01) NOT NULL
);

----- Inserção de dados -----

INSERT INTO dadosClientes
VALUES ('Jose Carlos Macoratti', 'Rua Projetada 100', 'Brasília', 'DF', '75046-789', '61-7859-5599', 'macoratti@yahoo.com', 'A'),
       ('Janice Raquel', 'Av. Sol 28', 'São Paulo', 'SP', '01245-524', '11-4562-8877', 'janice@bol.com.br', 'C'),
	   ('Miriam Estela', 'Av. Mexico 100', 'Santos', 'SP', '01104-789', '11-2589-6644', 'miriam@net.com.br', 'C'),
	   ('Jefferson Santos', 'Pça. XV Novembro 12', 'Campinas', 'SP', '11245-002', '11-7895-0302', 'jeffs@uol.com.br', 'C'),
	   ('Maria Silva Sá', 'R. Peru 123', 'Limeira', 'SP', '13452-023', '11-4587-0299', 'mariasa@net.com.br', 'C'),
	   ('Amélia Lima Silva', 'Av. Hortencias 109', 'Americana', 'SP', '14570-258', '11-7568-9924', 'amelia@hotmail.com', 'C'),
	   ('Carlos Santos', 'R. Argentina 89', 'São Paulo', 'SP', '02505-852', '11-8546-8520', 'carlossantos@uol.com.br', 'C'),
	   ('Luiz Carlos Monteiro', 'R. Roma 909', 'Belo Horizonte', 'MG', '35420-789', '31-3254-0658', 'luizcarlos@yahoo.com', 'C'),
	   ('Debora Ribeiro', 'Pça. D. Pedro II 67', 'Rio de Janeiro', 'RJ', '21450-140', '21-4525-8500', 'debora@uol.com.br', 'A'),
	   ('Marcos Lima', 'R. Venezuela 34', 'São Paulo', 'SP', '00109-502', '11-3254-6600', 'marcos@uol.com.br', 'C'),
	   ('Roberto Santos', 'Av. São Luiz 55', 'Curitiba', 'PR', '85462-545', '81-5547-8833', 'roberto@net.com.br', 'C'),
	   ('Uilian Nascimento', 'Pça. do Carmo 44', 'Porto Alegre', 'RS', '98756-254', '91-6548-2088', 'uilian@hotmail.com', 'C'),
	   ('Silvia Sanches', 'R. Equador 89', 'Salvador', 'BA', '65402-456', '41-7895-1544', 'silvias@bol.com.br', 'C'),
	   ('Dilma Tadeu Santos', 'Trav. Particular 143', 'Vila Velha', 'ES', '58789-212', '51-4567-5193', 'dilma@bol.com.br', 'C')

----- Criação das procedures -----

CREATE PROCEDURE statusCliente(@Status CHAR(01))
AS
BEGIN
	IF @Status = 'A'
		SELECT * FROM dadosClientes WHERE Status = 'A'
	ELSE
		SELECT * FROM dadosClientes WHERE Status = 'C'
END

EXECUTE statusCliente 'A'

----------------------------------

CREATE PROCEDURE estadoCliente(@Estado CHAR(02))
AS
BEGIN
	IF @Estado = 'DF'
		SELECT Nome, Cidade, Endereco AS 'Endereço' FROM dadosClientes WHERE Estado = 'DF'
	ELSE IF @Estado = 'SP'
		SELECT Nome, Cidade, Endereco AS 'Endereço' FROM dadosClientes WHERE Estado = 'SP'
	ELSE IF @Estado = 'MG'
		SELECT Nome, Cidade, Endereco AS 'Endereço' FROM dadosClientes WHERE Estado = 'MG'
	ELSE IF @Estado = 'RJ'
		SELECT Nome, Cidade, Endereco AS 'Endereço' FROM dadosClientes WHERE Estado = 'RJ'
	ELSE IF @Estado = 'PR'
		SELECT Nome, Cidade, Endereco AS 'Endereço' FROM dadosClientes WHERE Estado = 'PR'
	ELSE IF @Estado = 'RS'
		SELECT Nome, Cidade, Endereco AS 'Endereço' FROM dadosClientes WHERE Estado = 'RS'
	ELSE IF @Estado = 'BA'
		SELECT Nome, Cidade, Endereco AS 'Endereço' FROM dadosClientes WHERE Estado = 'BA'
	ELSE
		SELECT Nome, Cidade, Endereco AS 'Endereço' FROM dadosClientes WHERE Estado = 'ES'
END

EXECUTE estadoCliente 'SP'


-- Slide 5 --

----- Criação da tabela -----

CREATE TABLE Vendas (
	Mes VARCHAR(05) NOT NULL,
	Produtos VARCHAR(15) NOT NULL,
	Vendedor CHAR(06) NOT NULL,
	Vendas DECIMAL(10,2) NOT NULL,
	Regiao VARCHAR(05) NOT NULL
);

----- Inserção de dados -----

INSERT INTO Vendas
VALUES ('Maio', 'Latricínios', 'Amaral', 5477, 'Oeste'),
       ('Maio', 'Carnes', 'Bomfim', 8012, 'Leste'),
	   ('Maio', 'Latricínios', 'Amaral', 9411, 'Oeste'),
	   ('Maio', 'Latricínios', 'Amaral', 8089, 'Sul'),
	   ('Maio', 'Carnes', 'Bomfim', 9566, 'Sul'),
	   ('Junho', 'Latricínios', 'Amaral', 6805, 'Leste'),
	   ('Junho', 'Carnes', 'Bomfim', 6085, 'Sul'),
	   ('Junho', 'Carnes', 'Bomfim', 265, 'Leste'),
	   ('Junho', 'Carnes', 'Amaral', 5575, 'Sul'),
	   ('Junho', 'Latricínios', 'Bomfim', 5971, 'Norte'),
	   ('Junho', 'Latricínios', 'Bomfim', 4046, 'Oeste'),
	   ('Junho', 'Carnes', 'Bomfim', 1361, 'Norte')

----- Realização das consultas -----

SELECT 'R$ ' + CAST(SUM(Vendas) AS VARCHAR) AS 'Total de Vendas'
FROM Vendas

SELECT COUNT(Vendas) AS 'Vendas no Leste'
FROM Vendas
WHERE Regiao = 'Leste'

SELECT CAST(AVG(Vendas) AS INT) 'Média vendida em maio'
FROM Vendas
WHERE Mes = 'Maio'

SELECT 'R$ ' + CAST(SUM(Vendas*0.20) AS VARCHAR) AS 'Total de Vendas com 20% de aumento'
FROM Vendas