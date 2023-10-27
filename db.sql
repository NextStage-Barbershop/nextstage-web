CREATE SCHEMA IF NOT EXISTS `nextstagebarber`;
USE `nextstagebarber`;


-- Tabela "Cargos"
CREATE TABLE IF NOT EXISTS `Cargos` (
    cargo_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255)
);

INSERT INTO `Cargos` (nome) VALUES ('Cliente'), ('Funcionário'), ('Gerente'), ('Admin');

-- Tabela "Usuarios"
CREATE TABLE IF NOT EXISTS `Usuarios` (
    usuario_id INT AUTO_INCREMENT PRIMARY KEY,
    login VARCHAR(255),
    email VARCHAR(255),
    senha VARCHAR(255),
    cargo_id INT,
    FOREIGN KEY (cargo_id) REFERENCES Cargos(cargo_id)
);

INSERT INTO `Usuarios` (login, email, senha, cargo_id) VALUES('admin', 'admin@admin.com', SHA2('admin', 224), 4);

-- Tabela "Produtos"
CREATE TABLE IF NOT EXISTS `Produtos` (
    produto_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    descricao TEXT,
    preco DECIMAL(10, 2),
    imagem VARCHAR(255)
);

-- Tabela "Carrinho"
CREATE TABLE IF NOT EXISTS `Carrinho` (
    carrinho_id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    data_criacao DATETIME,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(usuario_id)
);

-- Tabela "ItensCarrinho"
CREATE TABLE IF NOT EXISTS `ItensCarrinho` (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    carrinho_id INT,
    produto_id INT,
    quantidade INT,
    FOREIGN KEY (carrinho_id) REFERENCES Carrinho(carrinho_id),
    FOREIGN KEY (produto_id) REFERENCES Produtos(produto_id)
);

-- Tabela "Agendamentos"
CREATE TABLE IF NOT EXISTS `Agendamentos` (
    agendamento_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    funcionario_id INT,
    data_hora DATETIME,
    servico TEXT,
    status VARCHAR(50),
    FOREIGN KEY (cliente_id) REFERENCES Usuarios(usuario_id),
    FOREIGN KEY (funcionario_id) REFERENCES Usuarios(usuario_id)
);