-- Active: 1691416914754@@127.0.0.1@3306@bd_interprise
SELECT * FROM pessoa;

SELECT * FROM funcionario;

SELECT * FROM relacao_dependente;

SELECT * FROM cliente;

SELECT * FROM pedido;

SELECT * FROM produto;

SELECT * FROM itenspedido;

# Listando todos os funcionários com seus nomes e sobrenome da tabela Pessoa:
SELECT f.id_funcionario, p.nome, p.sobrenome, f.setor 
FROM funcionario f
JOIN pessoa p ON f.id_pessoa = p.id_pessoa;

# Listando todos os dependentes de um funcionário:
SELECT p1.nome AS Nome_Dependente, p2.nome AS Nome_Funcionario
FROM relacao_dependente rd
JOIN pessoa p1 ON rd.id_pessoa = p1.id_pessoa
JOIN funcionario f ON rd.id_funcionario = f.id_funcionario
JOIN pessoa p2 ON f.id_pessoa = p2.id_pessoa;


# Listando todos os clientes que são funcionários:
SELECT p.nome, p.sobrenome, f.setor
FROM cliente c
JOIN pessoa p ON c.id_pessoa = p.id_pessoa
JOIN funcionario f ON c.id_pessoa = f.id_pessoa;

# Listando todos os pedidos feitos pelos clientes com o nome do cliente e o valor total do pedido:
SELECT p.nome, pe.valortotal
FROM pedido pe
JOIN cliente c ON pe.id_cliente = c.id_cliente
JOIN pessoa p ON c.id_pessoa = p.id_pessoa;

# Listando os produtos de um pedido específico (por exemplo, id_pedido = 1):
SELECT pr.nomeproduto, pr.descricaoproduto, ip.quantidade, ip.precovenda
FROM itenspedido ip
JOIN produto pr ON ip.id_produto = pr.id_produto
WHERE ip.id_pedido = 1;