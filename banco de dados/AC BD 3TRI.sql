create database AC13TRI
use AC13TRI

create table equipes(
id int primary key identity(1,1),
nome varchar(20) not null,
estado char(2) not null,
cidade varchar(20) not null,
dês int not null
)

create table jogadores(
nick varchar(15) primary key,
nome varchar(35) not null,
equipe int not null,
constraint fk_equipes_jogadores
foreign key (equipe) references equipes(id)
)

insert into equipes
values('Chaos','SP','Jundiai',2018)

insert into equipes
values('Lotrick','PA','Belem',2019)

insert into jogadores
values('Mandir','João Pedro',1)

insert into jogadores
values('Lindsay','Maria Sancristina',1)

insert into jogadores
values('Jonny','Jorge Matheus',1)

insert into jogadores
values('Gyro','Valencio Oliveira',2)

insert into jogadores
values('Oliver','Olivier Olivia',2)

insert into jogadores
values('Anonymous','Abner Alves',2)

select equipes.id,equipes.nome,jogadores.nick from equipes
inner join jogadores ON jogadores.equipe = equipes.id
order by equipes.nome

select jogadores.nome,equipes.nome from jogadores
inner join equipes on equipes.id = jogadores.equipe
where jogadores.nick = 'Mandir'

select jogadores.nome,jogadores.nick,equipes.nome from equipes
inner join jogadores on jogadores.equipe = equipes.id
order by jogadores.nome