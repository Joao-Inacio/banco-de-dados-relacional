## Documentação das Tabelas SQL

### Tabela `pessoa`

Esta tabela é responsável por armazenar informações básicas de uma pessoa.

- **id_pessoa**: Chave primária da tabela. Auto-incrementável.
- **nome**: Nome da pessoa.
- **sobrenome**: Sobrenome da pessoa.
- **rg**: Registro Geral da pessoa.
- **cpf**: CPF da pessoa. Deve ser único.
- **endereco**: Endereço residencial da pessoa.
- **telefone**: Número de telefone da pessoa.

### Tabela `funcionario`

Armazena informações específicas dos funcionários.

- **id_funcionario**: Chave primária da tabela. Auto-incrementável.
- **id_pessoa**: Chave estrangeira que referencia a tabela pessoa, indicando qual pessoa é esse funcionário.
- **setor**: Setor onde o funcionário trabalha.

### Tabela `relacao_dependente`

Registra a relação entre um funcionário e seus dependentes.

- **id_dependente**: Chave primária da tabela. Auto-incrementável.
- **id_pessoa**: Chave estrangeira que referencia a tabela pessoa, indicando quem é o dependente.
- **id_funcionario**: Chave estrangeira que referencia a tabela funcionario, indicando a qual funcionário essa pessoa é dependente.

### Tabela `cliente`

Armazena informações dos clientes.

- **id_cliente**: Chave primária da tabela. Auto-incrementável.
- **id_pessoa**: Chave estrangeira que referencia a tabela pessoa, indicando quem é o cliente.
- **id_funcionario**: Caso não seja NULL, indica que o cliente também é um funcionário.
- **desconto**: Desconto específico para o cliente que não é um funcionário nem dependente.

### Tabela `emailscliente`

Armazena os emails dos clientes.

- **id_email**: Chave primária da tabela. Auto-incrementável.
- **enderecoemail**: Endereço de e-mail do cliente.
- **id_cliente**: Chave estrangeira que referencia a tabela cliente, indicando a qual cliente pertence este email.

### Tabela `produto`

Guarda informações dos produtos.

- **id_produto**: Chave primária da tabela. Auto-incrementável.
- **nomeproduto**: Nome do produto.
- **descricaoproduto**: Descrição detalhada do produto.
- **preco**: Preço do produto.
- **condicao**: Estado do produto, pode ser 'Novo' ou 'Seminovo'.

### Tabela `pedido`

Armazena informações dos pedidos feitos pelos clientes.

- **id_pedido**: Chave primária da tabela. Auto-incrementável.
- **id_cliente**: Chave estrangeira que referencia a tabela cliente, indicando quem fez o pedido.
- **datapedido**: Data e hora em que o pedido foi realizado.
- **valortotal**: Valor total do pedido.

### Tabela `itenspedido`

Registra os produtos que fazem parte de um pedido.

- **id_itempedido**: Chave primária da tabela. Auto-incrementável.
- **id_pedido**: Chave estrangeira que referencia a tabela pedido, indicando a qual pedido pertence este item.
- **id_produto**: Chave estrangeira que referencia a tabela produto, indicando qual produto é este item.
- **quantidade**: Quantidade do produto no pedido.
- **precovenda**: Preço de venda do produto no momento do pedido.
