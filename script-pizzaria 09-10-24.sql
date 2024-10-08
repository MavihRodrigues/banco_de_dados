drop database if exists pizzaria;

create database if not exists pizzaria;

use pizzaria;

CREATE TABLE Clientes (
id INt not null AUTO_INCREMENT primary key,
telefone VARCHAR(14),
nome VARCHAR(30),
logradouro VARCHAR(30),
numero DECIMAL(5,0),
complemento VARCHAR(30),
bairro VARCHAR(30),
referencia VARCHAR(30)
);

CREATE TABLE pizzas (
id INTEGER not null AUTO_INCREMENT primary key,
nome VARCHAR(30),
descricao VARCHAR(30),
valor DECIMAL(15 , 2 )
);

CREATE TABLE pedidos (
id INTEGER AUTO_INCREMENT primary key,
cliente_id INTEGER,
data DATETIME,
valor DECIMAL(15 , 2 )
);

alter table pedidos add FOREIGN KEY (cliente_id) REFERENCES Clientes (id);

CREATE TABLE itens_pedido (
pedido_id INTEGER,
pizza_id INTEGER,
quantidade int,
valor DECIMAL(15 , 2 ),
FOREIGN KEY (pizza_id)
REFERENCES Pizzas (id),
FOREIGN KEY (pedido_id)
REFERENCES Pedidos (id)
);

INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(11) 1111-1111', 'Alexandre Santos', 'Rua das Palmeiras', 111, NULL, 'Bela Vista', 'Em frente a escola');
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(22) 2222-2222','Bruna Dantas', 'Rua das Rosas',222,NULL,'Cantareira',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(33) 3333-3333','Bruno Vieira', 'Rua das Avencas',333,NULL,'Bela Vista',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(44) 4444-4444','Giulia Silva', 'Rua dos Cravos',444,NULL,'Cantareira','Esquina do mercado');
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(55) 5555-5555','José Silva', 'Rua das Acácias',555,NULL,'Bela Vista',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(66) 6666-6666','Laura Madureira','Rua das Gardências',666,NULL,'Cantareira',NULL);

-- select * from cliente c

INSERT INTO pizzas (nome, valor) VALUES ('Portuguesa', 15),
('Provolone', 17),
('4 Queijos', 20),
('Calabresa', 17);
INSERT INTO pizzas (nome) VALUES ('Escarola');

alter table pizzas modify valor decimal(15,2) default 99;

INSERT INTO pizzas (nome) VALUES ('Moda da Casa');

INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (1, 1, '2016-12-15 20:30:00', 32.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (2, 2, '2016-12-15 20:38:00', 40.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (3, 3, '2016-12-15 20:59:00', 22.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (4, 1, '2016-12-17 22:00:00', 42.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (5, 2, '2016-12-18 19:00:00', 45.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (6, 3, '2016-12-18 21:12:00', 44.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (7, 4, '2016-12-19 22:22:00', 72.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (8, 6, '2016-12-19 22:26:00', 34.0);

select * from pizzas;
select * from itens_pedido;
update pizzas set valor = 22.00 where id = 5;
insert into pizzas (nome,valor) values ('Frango com catupiry',19.00);
INSERT INTO itens_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (1, 1, 1, 15.00),
(1, 4, 1, 17.00),
(2, 3, 2, 40.00),
(3, 5, 1, 22.00),
(4, 3, 1, 20.00),
(4, 5, 1, 22.00),
(5, 1, 3, 45.00),
(6, 5, 2, 44.00),
(7, 1, 2, 30.00),
(7, 3, 1, 20.00),
(7, 5, 1, 22.00),
(8, 4, 2, 34.00);

select * from itens_pedido;
select * from pedidos; 
select * from pizzas;
select * from clientes;

-- 1. Liste todos os pedidos com o nome do cliente correspondente.
select clientes.id as id_cliente, nome,
 pedidos.id as pedido, data, valor from clientes inner join pedidos on 
 pedidos.cliente_id = clientes.id;
 
-- 2. Quantos pedidos foram feitos no total?
 select count(id) from pedidos;
 
-- 3. Liste os pedidos feitos após '2016-12-15' com o nome do cliente.
 select * from pedidos where data > '2016-12-15 23:59:59';
select pedidos.id as pedido, pedidos.data, clientes.nome from pedidos 
inner join clientes on pedidos.cliente_id = clientes.id where pedidos.data > '2016-12-15 23:59:59'; 

-- 4. Quantos pedidos foram feitos pelo cliente com o nome "Alexandre Santos"?
select count(id) from pedidos where cliente_id = 1;

-- 5. Liste todos os pedidos e seus respectivos clientes, incluindo pedidos feitos por clientes que foram excluídos da tabela clientes.
select pedidos.id as pedido, data, valor, nome from pedidos right join clientes on pedidos.cliente_id = clientes.id;

-- 6. Qual o valor total de todos os pedidos feitos até agora?
select sum(valor) from pedidos;

-- 7. Qual o total gasto por cada cliente?
select sum(valor) from pedidos group by (cliente_id);

-- 8. Liste todos os clientes e seus pedidos feitos no mês de dezembro de 2016 
select clientes.nome, pedidos.id as pedido from clientes
inner join pedidos on pedidos.cliente_id = clientes.id where pedidos.data between '2016-12-01' and '2016-12-31 23:59:59';

-- 9. Qual o valor médio dos pedidos realizados
select avg(valor) from pedidos;
select * from pedidos;

select clientes.id, nome, pedidos.id from clientes
inner join pedidos on pedidos.cliente_id = clientes.id;

-- 10. Liste o valor total dos pedidos por cliente
select clientes.id, cliente.nome, sum(pedidos.valor) as valor_total, count(pedidos.id) as total_pedidos from pedidos left join clientes on clientes.id = pedidos.cliente_id;

select clientes.nome, sum(valor) as valor_total from pedidos inner join clientes on pedidos.cliente_id = cliente.id;
select clientes.id, clientes.nome, pedidos.valor from pedidos join clientes where clientes.id = pedidos.cliente_id;
select pedidos.id, sum(valor) as valor_total from pedidos group by (cliente_id);
select * from clientes;

-- 14. Qual o pedido mais caro, exibir o nome do cliente e o valor do pedido
select clientes.id

-- 15. Qual a média de pizzas por pedido e quantos pedidos foram feitos?
select count(distinct pedido_id) as total_pedidos;

-- 16. Qual o total de pizzas vendidas e o número de pedidos do cliente "Bruna Dantas"?
select sum(quantidade) as total_pizzas, count(pedidos.id) as total_pedidos from itens_pedido
inner join pedidos on itens_pedido.pedido_id = pedidos.id;

select * from itens_pedido;

-- 17. Qual o pedido mais caro e o mais barato do cliente "Laura Madureira"?


-- 18. Quantas pizzas cada cliente comprou no total?


-- 19. Qual o pedido mais barato, exibir o nome do cliente e o valor do pedido


-- 20. Liste todos os clientes, mesmo que não tenham feito pedidos, com seus respectivos pedidos (se houver)


-- 21. Liste todos os clientes com o valor total de seus pedidos (mesmo que não tenham feito pedidos)


-- 22. Liste os 3 clientes que mais gastou, exibir nome do cliente e o valor gasto









