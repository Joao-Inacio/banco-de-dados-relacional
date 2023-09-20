-- Active: 1691416914754@@127.0.0.1@3306@bd_interprise
INSERT INTO pessoa (nome, sobrenome, rg, cpf, endereco, telefone)
VALUES 
('João', 'Silva', '12345678', '111.111.111-11', 'Rua A, 123', '5555-5555'),
('Maria', 'Santos', '87654321', '222.222.222-22', 'Rua B, 456', '6666-6666'),
('Lucas', 'Boss', '85304591', '667.123.973-55', 'Rua F, 125', '2563-9045'),
('Ana', 'Lupo', '38520457', '235.189.630-50', 'Rua H, 709', '8490-7838'),
('Pedro', 'Lima', '11223344', '333.333.333-33', 'Rua C, 789', '7777-7777');

# Povoando a tabela Funcionarios
INSERT INTO funcionario (id_pessoa, setor)
VALUES 
(1, 'Vendas'), # João Trabalha no setor de vendas
(2, 'Financeiro'); # Maria trabalha no setor de financeiro

# Povoando a tabela Relacao_Dependentes
INSERT INTO relacao_dependente (id_pessoa, id_funcionario)
VALUES 
(3, 1);  # Pedro Lima é dependente de João Silva

# Povoando a tabela Clientes
# João é um cliente e também um funcionário 
INSERT INTO cliente (id_pessoa, id_funcionario, desconto)
VALUES 
(1, 1, 10), (3, NULL, 5), (4, NULL, 0);  # Pedro Lima é um cliente com desconto por ser dependente

# Povoando a tabela produto
INSERT INTO produto (nomeproduto, descricaoproduto, preco, condicao)
VALUES 
('Produto A', 'Descrição do Produto A', 100.00, 'Novo'),
('Produto B', 'Descrição do Produto B', 150.00, 'Novo'),
('Produto C', 'Descrição do Produto C', 80.00, 'Seminovo');

# Povoando a tabela pedido
INSERT INTO pedido (id_cliente, valortotal)
VALUES 
(1, 90.00), (3, 150.00);  # Pedido de João com desconto aplicado na lógica da aplicação

# Povoando a tabela itenspedido
INSERT INTO itenspedido (id_pedido, id_produto, quantidade, precovenda)
VALUES 
(1, 1, 1, 90.00), (2, 2, 1, 150.00);  # Produto A foi vendido para João com desconto

# Povoando a tabela emailscliente
INSERT INTO emailscliente (enderecoemail, id_cliente)
VALUES 
('joao.silva@email.com', 1),
('joaosilva123@email.com', 1),
('analupo@email.com', 3),
('pedrolima@email.com', 2);
