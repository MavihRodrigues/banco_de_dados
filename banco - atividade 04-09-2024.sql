create database instagram;
use instagram;

create table usuarios(
	id int not null auto_increment primary key,
    nome varchar (100) not null,
    email varchar (255) not null,
    data_criacao date
);

create table postagens(
	id int not null auto_increment primary key,
    texto varchar (100),
    data_publicacao date not null,
    imagem varchar (45)
);

create table comentarios( 
	id int not null auto_increment primary key,
    texto varchar (45),
    data_criacao date not null
);

create table curtidas( 
	
);

insert into usuarios (nome, email) values ('liam', 'payne@liam.com', 5);

insert into usuarios (nome, email) values ('harry', 'styles@harry.com');

insert into usuarios (nome, email) values ('zayn', 'malik@zayn.com');

insert into usuarios (nome, email) values ('louis', 'tomlinson@louis.com');

insert into usuarios (nome, email) values ('niall', 'horan@niall.com');

select * from usuarios;
select * from postagens;
select * from comentarios;

