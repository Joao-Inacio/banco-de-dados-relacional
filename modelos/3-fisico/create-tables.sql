-- Active: 1691416914754@@127.0.0.1@3306@bd_interprise
# Criando banco de dados
CREATE DATABASE bd_interprise
    DEFAULT CHARACTER SET = 'utf8mb4';

# Selecionando banco de dados
USE bd_interprise;

-- Tabela pessoa
CREATE TABLE IF NOT EXISTS pessoa (
    id_pessoa INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    sobrenome VARCHAR(255) NOT NULL,
    rg VARCHAR(50) NOT NULL,
    cpf VARCHAR(50) UNIQUE NOT NULL,
    endereco VARCHAR(500) NOT NULL,
    telefone VARCHAR(50) NOT NULL
);

-- Tabela Funcionários 
CREATE TABLE IF NOT EXISTS funcionario (
    id_funcionario INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    id_pessoa INT UNSIGNED,
    setor VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabela Relacao_Dependentes 
CREATE TABLE IF NOT EXISTS relacao_dependente (
    id_dependente INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    id_pessoa INT UNSIGNED,
    id_funcionario INT UNSIGNED,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabela Clientes 
CREATE TABLE IF NOT EXISTS cliente (
    id_cliente INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    id_pessoa INT UNSIGNED,
    id_funcionario INT UNSIGNED,  -- Se não for NULL, indica que o cliente é um funcionário
    desconto FLOAT DEFAULT 0, -- Este é para descontos específicos do cliente que não são funcionários nem dependentes
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabela EmailsClientes
CREATE TABLE IF NOT EXISTS emailscliente (
    id_email INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    enderecoemail VARCHAR(255) NOT NULL,
    id_cliente INT UNSIGNED,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabela Produtos
CREATE TABLE IF NOT EXISTS produto (
    id_produto INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nomeproduto VARCHAR(255) NOT NULL,
    descricaoproduto TEXT,
    preco FLOAT NOT NULL,
    condicao ENUM('Novo', 'Seminovo') NOT NULL
);
-- Tabela Pedidos
CREATE TABLE IF NOT EXISTS pedido (
    id_pedido INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT UNSIGNED,
    datapedido DATETIME DEFAULT NOW() NOT NULL,
    valortotal FLOAT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabela ItensPedido
CREATE TABLE IF NOT EXISTS itenspedido (
    id_itempedido INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT UNSIGNED,
    id_produto INT UNSIGNED,
    quantidade INT NOT NULL,
    precovenda FLOAT NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);
