# Documentação do Banco de Dados `bd_interprise`

## **Tabelas:**

### Tabela `pessoa`

Armazena informações básicas sobre pessoas.

- **id_pessoa**: Chave primária, autoincremental.
- **nome**: Nome da pessoa.
- **sobrenome**: Sobrenome da pessoa.
- **rg**: Registro Geral da pessoa.
- **cpf**: CPF da pessoa, deve ser único.
- **endereco**: Endereço completo da pessoa.
- **telefone**: Número de contato da pessoa.

### Tabela `funcionario`

Registra informações específicas dos funcionários.

- **id_funcionario**: Chave primária, autoincremental.
- **id_pessoa**: Chave estrangeira referente à tabela `pessoa`, indicando qual pessoa é esse funcionário.
- **setor**: Setor ou departamento onde o funcionário trabalha.

### Tabela `relacao_dependente`

Define a relação entre um funcionário e seus dependentes.

- **id_dependente**: Chave primária, autoincremental.
- **id_pessoa**: Chave estrangeira que referencia a tabela `pessoa`, indicando quem é o dependente.
- **id_funcionario**: Chave estrangeira que referencia a tabela `funcionario`, indicando de qual funcionário essa pessoa é dependente.

### Tabela `cliente`

Guarda informações sobre os clientes.

- **id_cliente**: Chave primária, autoincremental.
- **id_pessoa**: Chave estrangeira referente à tabela `pessoa`, indicando quem é o cliente.
- **id_funcionario**: Se não for NULL, indica que o cliente também é um funcionário da empresa.
- **desconto**: Percentual de desconto para o cliente, usado para casos especiais.

### Tabela `emailscliente`

Armazena os emails associados a cada cliente.

- **id_email**: Chave primária, autoincremental.
- **enderecoemail**: O endereço de email do cliente.
- **id_cliente**: Chave estrangeira que referencia a tabela `cliente`.

### Tabela `produto`

Contém informações sobre os produtos disponíveis.

- **id_produto**: Chave primária, autoincremental.
- **nomeproduto**: Nome ou título do produto.
- **descricaoproduto**: Uma descrição detalhada do produto.
- **preco**: O preço padrão do produto.
- **condicao**: Estado do produto, pode ser 'Novo' ou 'Seminovo'.

### Tabela `pedido`

Guarda registros de pedidos feitos pelos clientes.

- **id_pedido**: Chave primária, autoincremental.
- **id_cliente**: Chave estrangeira que referencia a tabela `cliente`.
- **datapedido**: Data e hora do pedido.
- **valortotal**: Valor total do pedido.

### Tabela `itenspedido`

Lista os produtos específicos que fazem parte de um pedido.

- **id_itempedido**: Chave primária, autoincremental.
- **id_pedido**: Chave estrangeira que referencia a tabela `pedido`.
- **id_produto**: Chave estrangeira que referencia a tabela `produto`.
- **quantidade**: Quantidade do produto no pedido.
- **precovenda**: Preço de venda do produto no momento do pedido.
