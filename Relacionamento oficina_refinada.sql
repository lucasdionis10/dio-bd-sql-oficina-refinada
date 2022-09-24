 -- Drop database oficina_refinada;

create database if not exists oficina_refinada ;

use oficina_refinada;

-- cria cliente
CREATE TABLE IF NOT EXISTS CLIENTE (
  idCliente INT NOT NULL AUTO_INCREMENT,
  Nome VARCHAR(128) NOT NULL,
  Sobrenome VARCHAR(64) NOT NULL,
  Cidade VARCHAR(64) NULL,
  UF VARCHAR(2) NULL,
  Endereco VARCHAR(45) NULL,
  Numero_endereco VARCHAR(45) NULL,
  Telefone INT NOT NULL,
  CPF_CNPJ INT NOT NULL,
  Email VARCHAR(128) NULL,
  PRIMARY KEY (`idCliente`)
  );

ALTER table CLIENTE auto_increment =1;

-- cria veiculo

CREATE TABLE IF NOT EXISTS VEICULO (
  Licenca INT NOT NULL,
  Modelo VARCHAR(45) NOT NULL,
  Ano INT NOT NULL,
  Placa VARCHAR(10) NOT NULL,
  Cor VARCHAR(16) NOT NULL,
  Peso_aproximado INT NULL,
  Quantidade_eixos INT NULL,
  Tipo_veiculo ENUM("Moto", "Carro", "Caminhão", "Ônibus", "Outro") NOT NULL DEFAULT 'Carro',
  Descrição_adicional VARCHAR(128) NULL,
  PRIMARY KEY(Licenca)
);

-- cria possui

CREATE TABLE IF NOT EXISTS POSSUI (
  VEICULO_Licenca INT NOT NULL,
  CLIENTE_idCliente INT NOT NULL,
  PRIMARY KEY (VEICULO_Licenca, CLIENTE_idCliente),
  CONSTRAINT fk_POSSUI_VEICULO
    FOREIGN KEY (VEICULO_Licenca)
    REFERENCES VEICULO (Licenca),
 CONSTRAINT fk_POSSUI_CLIENTE
    FOREIGN KEY (CLIENTE_idCliente)
    REFERENCES CLIENTE (idCliente)
);
    
-- cria mecanico

CREATE TABLE IF NOT EXISTS MECANICO (
  idMecanico INT NOT NULL auto_increment,
  id_equipe INT NOT NULL,
  Nome_completo VARCHAR(128) NOT NULL,
  Endereco VARCHAR(128),
  Especialidade VARCHAR(45) NOT NULL,
  PRIMARY KEY (idMecanico, Nome_completo, Especialidade)
);

ALTER table MECANICO auto_increment =1;


-- cria pecas
CREATE TABLE IF NOT EXISTS PECAS (
  idPeca INT NOT NULL AUTO_INCREMENT,
  Nome_peca VARCHAR(128) NOT NULL,
  Valor FLOAT NOT NULL,
  Peso FLOAT NULL,
  Tamanho VARCHAR(45) NULL,
  Em_estoque ENUM("Em estoque", "Fora de estoque", "Aguardando envio") NOT NULL DEFAULT 'Em estoque',
  Cor VARCHAR(20) NULL,
  PRIMARY KEY (idPeca, Nome_peca, Valor)
  );

ALTER table PECAS auto_increment =1;


-- cria servicos

CREATE TABLE IF NOT EXISTS SERVICOS (
  idServico INT NOT NULL AUTO_INCREMENT,
  Nome_servico VARCHAR(64) NOT NULL,
  Valor FLOAT NOT NULL,
  Tempo INT NOT NULL,
  Descricao VARCHAR(128) NULL,
  Quantidade_mecanicos INT NOT NULL DEFAULT 1,
  PRIMARY KEY (idServico, Nome_servico, Valor, Tempo)
  );

ALTER table SERVICOS auto_increment =1;


-- cria avalia_executa

CREATE TABLE IF NOT EXISTS AVALIA_EXECUTA (
  idAvaliacao INT NOT NULL AUTO_INCREMENT,
  VEICULO_Licenca INT NOT NULL,
  Status_servico ENUM("Em espera", "Em andamento", "Finalizado") NOT NULL DEFAULT "Em espera",
  MECANICO_idEquipe INT NOT NULL,
  PRIMARY KEY (idAvaliacao),
  CONSTRAINT fk_AVALIA_EXECUTA_VEICULO1
    FOREIGN KEY (VEICULO_Licenca)
    REFERENCES VEICULO (Licenca)
);

ALTER table AVALIA_EXECUTA auto_increment =1;

-- cria ordem_servico
CREATE TABLE IF NOT EXISTS ORDEM_SERVICO (
  idOrdem INT NOT NULL AUTO_INCREMENT,
  Data_emissao DATE NULL,
  Data_entrega DATE NULL,
  Descricao VARCHAR(256) NULL,
  Tipo_servico ENUM("Revisao", "Conserto") NOT NULL default "Conserto",
  Status ENUM("Aguardando inicio", "Em andamento", "Finalizada", "Recusada") NOT NULL default "Em andamento",
  CLIENTE_idCliente INT NOT NULL,
  SERVICOS_idServico INT NOT NULL,
  AVALIA_EXECUTA_idAvaliacao INT NOT NULL,
  SERVICOS_Tempo INT NOT NULL default 1,
  PECAS_idPeca INT NOT NULL,
  Quantidade_peca INT NOT NULL DEFAULT 1,
  Valor FLOAT NULL,
  PRIMARY KEY (idOrdem),
  CONSTRAINT fk_ORDEM_SERVICO_CLIENTE1
    FOREIGN KEY (CLIENTE_idCliente)
    REFERENCES CLIENTE (idCliente),
  CONSTRAINT fk_ORDEM_SERVICO_AVALIA_EXECUTA1
    FOREIGN KEY (AVALIA_EXECUTA_idAvaliacao)
    REFERENCES AVALIA_EXECUTA (idAvaliacao)

);

ALTER table ORDEM_SERVICO auto_increment =1;