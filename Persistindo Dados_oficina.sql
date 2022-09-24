use oficina_refinada;
SHOW TABLES;
desc CLIENTE;

Insert INTO CLIENTE (Nome, Sobrenome, Telefone, CPF_CNPJ, Cidade, UF)
    Values ("Lucas", "Silva", 46854548, 1198514894, "Tupã", "SP"),
		   ("Ana", 'Miranda', 19874689,169499874, "Quebrangulo", "MG"),
			("Ametista", "Fálvio", 56184815, 165485689, "Caiaseca", "MG"),
			("Joelma", 'Mônaco', 5468418, 897874841, "Gotham", "SP");
   
    SELECT * from CLIENTE;
    
Insert INTO VEICULO (Licenca, Modelo, Ano, Placa, Cor )
    Values (1684894, "Carango", 2015, "asdew85", "Verde Noite"),
		(18944874, "kata Cavaco", 2010, "aeuadw5", "Marrom Bombom"),
        (4987984, "Batecar", 2004, "1990", "Preto Piano"),
        (7987497, "Saci", 2018, "dwaeas", "Vermelho Acerola");
   
    SELECT * from VEICULO;
    
Insert INTO POSSUI (VEICULO_Licenca, CLIENTE_idCliente )
    Values (1684894, 1 ),
		(18944874, 3),
        (4987984, 2),
        (7987497, 4);
   
    SELECT * from POSSUI;
    
Insert INTO MECANICO (Nome_completo, Endereco, Especialidade, id_Equipe)
    Values ("Aparecido de Almeida" , "Rua dos Cherentes", "Direção", 1),
			("José Bomfim", "Avenida dos Viajantes" , "Câmbio", 2),
            ("Roseli Alves da Silva", "Rua 9 de novembro", "Eletrônica embarcada", 1),
            ("Rosa da Luz Pereira", "Rua dos Quebraqueixos", "Cabeçote", 1),
            ("Jéssica Menezes", "Alameda dos Bandeirantes", "Funilaria", 2),
            ("Luan Costa", "Rua das Lamentações", "Elétrica", 2),
            ("Carlos Gil", "Avenida dos Eucaliptos", "Motor", 2);
    
   
    SELECT * from MECANICO;

Insert INTO PECAS (Nome_peca, Valor)
    Values("Suspensão" , 100),
		("Carburador" , 250.50),
        ("Volante" , 487.40),
        ("Bateria", 300),
        ("Cooler" , 350),
        ("Radiador", 200),
        ("Rádio" , 150);
		
 SELECT * from PECAS;  
 
 Insert INTO SERVICOS (Nome_servico, Valor, Tempo)
  Values("Troca de óleo", 50, 1),
		("Troca de pastilhas de freios" , 100, 1),
        ("Alinhamento", 300, 1),
        ("Limpeza de cabeçotes", 500, 2),
        ("Retífica de cabeçote", 400, 2),
        ("Limpeza de tubulação", 350, 1);
        
SELECT * from SERVICOS; 

Insert INTO AVALIA_EXECUTA(VEICULO_Licenca, MECANICO_idEquipe)
values (1684894, 2),
	   (18944874, 2),
       (4987984, 1),
       (7987497, 2);
       
SELECT * from AVALIA_EXECUTA;

Insert INTO ORDEM_SERVICO(CLIENTE_idCliente, SERVICOS_idServico,  AVALIA_EXECUTA_idAvaliacao, SERVICOS_Tempo, PECAS_idPeca, Valor)
values (1, 1, 2, default, 2, 350.7),
		(4, 1, 4, default, 1, 850.5),
        (3, 5, 2, default, 5, 431.2),
        (2, 3, 3, default, 7, 840.4);

SELECT * from ORDEM_SERVICO;