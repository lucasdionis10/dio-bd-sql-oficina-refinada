use oficina_refinada;
SHOW TABLES;
-- quais carros estão presentes no banco de dados?
SELECT * FROM veiculo;

-- Quais clientes estão cadastrados?
select * from cliente;

-- Quais as especialidades dos nossos mecânicos? 
SELECT * FROM mecanico;

-- Quais mecânicos integram a equipe 1?
SELECT * FROM mecanico where id_equipe = 1;

-- Lista de clientes com as localidades
select concat(Nome, ' ', Sobrenome) as Nome_completo, UF, Cidade  from CLIENTE;

-- Quais licenças são da avaliação 3 e 4?
Select VEICULO_Licenca from AVALIA_EXECUTA where idAvaliacao > 2; 



-- Qual a licença e cor do carro do Cliente 1?

Select concat(Nome, ' ', Sobrenome) as Nome_completo, Cidade, UF, Modelo, Cor, VEICULO_Licenca, CLIENTE_idCliente 
FROM CLIENTE AS C cross Join VEICULO AS V cross join POSSUI AS P 
ON P.VEICULO_Licenca = V.Licenca and C.idCliente = P.CLIENTE_idCliente;

-- Qual cliente e modelo de carro é referente à avaliação 3?
-- Qual a cidade do cliente que pediu a avaliação 2?
-- Qual a cor do carro da avaliação 4?

Select concat(Nome, ' ', Sobrenome) as Nome_completo, Cidade, UF, Modelo, Cor, Licenca  , CLIENTE_idCliente, idAvaliacao 
FROM CLIENTE AS C cross Join VEICULO AS V cross join POSSUI AS P cross join AVALIA_EXECUTA AS A
ON P.VEICULO_Licenca = V.Licenca and V.Licenca = A.VEICULO_Licenca and C.idCliente = P.CLIENTE_idCliente
order by Nome_completo;




