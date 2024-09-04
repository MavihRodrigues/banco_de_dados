;create database games;
use games;

-- Criar tabela
create table jogos (
	id int not null auto_increment primary key,
    titulo varchar(100) not null,
    genero varchar(50) null,
    plataforma varchar(50) not null,
    preco decimal(15,2) not null,
    estoque int not null,
    lancamento int,
    classificacao_etaria varchar(10),
    desenvolvedora varchar(100)
);

-- Inserir dados
insert into jogos (titulo, genero, plataforma, preco, estoque, lancamento, classificacao_etaria, desenvolvedora)
values ('The Last Of Us', 'Ação', 'PlayStation', 199.99, 10, 2013, '18', 'Naughty Dog');

insert into jogos (titulo, genero, plataforma, preco, estoque, lancamento, classificacao_etaria, desenvolvedora)
values ('FIFA 23', 'Esporte', 'Xbox', 249.90, 15, 2023, 'L', 'EA Sports');

insert into jogos (titulo, genero, plataforma, preco, estoque, lancamento, classificacao_etaria, desenvolvedora)
values ('Minecraft', 'Aventura', 'PC', 99.90, 20, 2011, '10', 'Mojang');

insert into jogos (titulo, genero, plataforma, preco, estoque, lancamento, classificacao_etaria, desenvolvedora)
values ('God of War', 'Ação', 'PlayStation', 299.90, 5, 2018, '18', 'Santa Monica Studio');

insert into jogos (titulo, genero, plataforma, preco, estoque, lancamento, classificacao_etaria, desenvolvedora)
values ('Forza Horizon 5', 'Corrida', 'Xbox', 249.99, 8, 2021, '12', 'Playground Games');

insert into jogos (titulo, genero, plataforma, preco, estoque, lancamento, classificacao_etaria, desenvolvedora)
values ('The Witcher 3', 'RPG', 'PC', 149.90, 12, 2015, '18', 'CD Projekt Red');

insert into jogos (titulo, genero, plataforma, preco, estoque, lancamento, classificacao_etaria, desenvolvedora)
values ('Mario Kart 8', 'Corrida', 'Nintendo Switch', 199.90, 9, 2017, 'L', 'Nintendo');

insert into jogos (titulo, genero, plataforma, preco, estoque, lancamento, classificacao_etaria, desenvolvedora)
values ('Horizon Zero Dawn', 'Aventura', 'Play Station', 159.99, 4, 2017, '14', 'Guerrilha Games');

insert into jogos (titulo, genero, plataforma, preco, estoque, lancamento, classificacao_etaria, desenvolvedora)
values ('Call of Duty: Modern Warfare', 'Ação', 'Xbox', 219.90, 7, 2019, '18', 'Infinity Ward');

insert into jogos (titulo, genero, plataforma, preco, estoque, lancamento, classificacao_etaria, desenvolvedora)
values ('Super Smash Bros', 'Luta', 'Nintendo Switch', 249.90, 6, 2018, 'L', 'Nintendo');

-- Selecionar todos os jogos
select * from jogos;

-- Selecionar todos os jogos de uma determinada plataforma
select * from jogos where plataforma = 'PlayStation';

-- Selecionar os jogos com preço menor que R$100,00
select * from jogos where preco <100;

-- Selecionar os jogos lançados em um ano específico
select * from jogos where lancamento = 2018;

-- Selecionar todos os jogos de um gênero específico
select * from jogos where genero = 'Ação';

-- Selecionar os jogos com uma classificação etária de 18 anos
select * from jogos where classificacao_etaria = '18';

-- Selecionar o título e o preço dos jogos em estoque
select titulo, preco from jogos where quantidade > 0;
select titulo, preco from jogos where quantidade >= 1;

-- Selecionar os jogos desenvolvidos por uma determinada desenvolvedora
select * from jogos where desenvolvedora = 'Nintendo';

-- Selecionar os jogos com quantidade em estoque menor que 5 unidades
select * from jogos where estoque < 5;

-- Selecionar os jogos com preço maior ou igual a R$100,00
select * from jogos where preco >= 100;

-- Selecionar o jogo com o identificador três
select * from jogos where id = 3;

-- Atualizar o preço de um jogo específico
update jogos set preco = 120 where titulo = 'Minecraft';

-- Atualizar a quantidade em estoque após uma venda
update jogos set estoque = -1 where titulo = 'The Last of Us';
update jogos set estoque = lancamento -1 where id = 1;

-- Atualizar a plataforma de um jogo
update jogos set plataforma = 'PC' where titulo = 'fifa 23';

-- Atualizar a classificação etária de um jogo
update  jogos set classificacao_etaria = '16' where titulo = 'Horizon Zero Dawn';

-- Atualizar o título para SenaiPlay do jogo com identificador três
update jogos set titulo = 'SenaiPlay' where id = 3;

-- Excluir todos os jogos que não está mais disponível no estoque
delete from jogos where quantidade < 1;

-- Excluir um jogo com o identificador três
delete from jogos where id = 3;

-- Excluir todos os jogos do gênero Aventura
delete from jogos where generto = 'Aventura';

-- Excluir todos os jogos do gênero Esporte
delete from jogos where genero = 'Esporte';

-- Excluir todos os jogos que foi lançado antes do ano de 2000
delete from jogos where lancamento < 2000

select * from jogos;