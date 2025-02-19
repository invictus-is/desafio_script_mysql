-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS Oficina;
USE Oficina;

-- Tabela Cliente
CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(15),
    email VARCHAR(100),
    endereco VARCHAR(200)
);

-- Tabela Veiculo
CREATE TABLE Veiculo (
    idVeiculo INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    ano INT,
    placa VARCHAR(10) NOT NULL,
    idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

-- Tabela Servico
CREATE TABLE Servico (
    idServico INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(200) NOT NULL,
    dataServico DATE NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    idVeiculo INT,
    FOREIGN KEY (idVeiculo) REFERENCES Veiculo(idVeiculo)
);

-- Tabela Peca
CREATE TABLE Peca (
    idPeca INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    quantidadeEstoque INT NOT NULL
);

-- Tabela ServicoPeca
CREATE TABLE ServicoPeca (
    idServico INT,
    idPeca INT,
    quantidade INT NOT NULL,
    PRIMARY KEY (idServico, idPeca),
    FOREIGN KEY (idServico) REFERENCES Servico(idServico),
    FOREIGN KEY (idPeca) REFERENCES Peca(idPeca)
);

-- Tabela Funcionario
CREATE TABLE Funcionario (
    idFuncionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    salario DECIMAL(10, 2) NOT NULL
);

-- Tabela ServicoFuncionario
CREATE TABLE ServicoFuncionario (
    idServico INT,
    idFuncionario INT,
    PRIMARY KEY (idServico, idFuncionario),
    FOREIGN KEY (idServico) REFERENCES Servico(idServico),
    FOREIGN KEY (idFuncionario) REFERENCES Funcionario(idFuncionario)
);

-- Inserção de dados na tabela Cliente
INSERT INTO Cliente (nome, telefone, email, endereco) VALUES
('João Silva', '(11) 9999-8888', 'joao.silva@email.com', 'Rua A, 123'),
('Maria Oliveira', '(11) 7777-6666', 'maria.oliveira@email.com', 'Rua B, 456');

-- Inserção de dados na tabela Veiculo
INSERT INTO Veiculo (marca, modelo, ano, placa, idCliente) VALUES
('Ford', 'Fiesta', 2018, 'ABC-1234', 1),
('Chevrolet', 'Onix', 2020, 'XYZ-5678', 2);

-- Inserção de dados na tabela Servico
INSERT INTO Servico (descricao, dataServico, valor, idVeiculo) VALUES
('Troca de óleo', '2023-10-01', 150.00, 1),
('Revisão geral', '2023-10-05', 500.00, 2);

-- Inserção de dados na tabela Peca
INSERT INTO Peca (nome, valor, quantidadeEstoque) VALUES
('Filtro de óleo', 20.00, 50),
('Pastilha de freio', 80.00, 30);

-- Inserção de dados na tabela ServicoPeca
INSERT INTO ServicoPeca (idServico, idPeca, quantidade) VALUES
(1, 1, 1),  -- Serviço 1 usa 1 Filtro de óleo
(2, 2, 2);  -- Serviço 2 usa 2 Pastilhas de freio

-- Inserção de dados na tabela Funcionario
INSERT INTO Funcionario (nome, cargo, salario) VALUES
('Carlos Souza', 'Mecânico', 3000.00),
('Ana Lima', 'Gerente', 5000.00);

-- Inserção de dados na tabela ServicoFuncionario
INSERT INTO ServicoFuncionario (idServico, idFuncionario) VALUES
(1, 1),  -- Serviço 1 realizado por Carlos Souza
(2, 2);  -- Serviço 2 realizado por Ana Lima

-- Queries de teste

-- 1. Recuperações simples com SELECT Statement
SELECT * FROM Cliente;
SELECT * FROM Veiculo;

-- 2. Filtros com WHERE Statement
SELECT * FROM Servico WHERE dataServico BETWEEN '2023-10-01' AND '2023-10-31';

-- 3. Expressões para gerar atributos derivados
SELECT c.nome, SUM(s.valor) AS total_gasto
FROM Cliente c
JOIN Veiculo v ON c.idCliente = v.idCliente
JOIN Servico s ON v.idVeiculo = s.idVeiculo
GROUP BY c.nome;

-- 4. Ordenações com ORDER BY
SELECT * FROM Servico ORDER BY valor DESC;

-- 5. Condições de filtros aos grupos – HAVING Statement
SELECT nome, quantidadeEstoque FROM Peca HAVING quantidadeEstoque < 40;

-- 6. Junções entre tabelas
SELECT s.descricao, s.dataServico, s.valor, v.marca, v.modelo, c.nome AS cliente
FROM Servico s
JOIN Veiculo v ON s.idVeiculo = v.idVeiculo
JOIN Cliente c ON v.idCliente = c.idCliente;