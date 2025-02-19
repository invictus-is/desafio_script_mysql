# Projeto: Banco de Dados para Oficina Mecânica

Este projeto consiste na criação de um banco de dados para gerenciar informações de uma oficina mecânica. O banco de dados foi desenvolvido em MySQL e inclui tabelas para clientes, veículos, serviços, peças, funcionários e relacionamentos entre eles.

## Esquema Lógico

O banco de dados possui as seguintes tabelas:

1. **Cliente**: Armazena informações dos clientes.
2. **Veiculo**: Armazena informações dos veículos dos clientes.
3. **Servico**: Armazena informações sobre os serviços realizados.
4. **Peca**: Armazena informações sobre as peças utilizadas.
5. **ServicoPeca**: Relaciona serviços e peças.
6. **Funcionario**: Armazena informações dos funcionários.
7. **ServicoFuncionario**: Relaciona serviços e funcionários.

## Script SQL

O script completo para criação do banco de dados, inserção de dados e queries de teste está disponível no arquivo [script.sql](script.sql).

## Queries Exemplo

Algumas queries foram desenvolvidas para testar o banco de dados, incluindo:

1. Recuperações simples com `SELECT`.
2. Filtros com `WHERE`.
3. Criação de atributos derivados.
4. Ordenações com `ORDER BY`.
5. Filtros em grupos com `HAVING`.
6. Junções entre tabelas com `JOIN`.

## Como Executar

1. Abra o MySQL Workbench.
2. Conecte-se ao seu servidor MySQL.
3. Execute o script `script.sql` para criar o banco de dados e inserir os dados de teste.
4. Execute as queries de teste para validar o funcionamento.
