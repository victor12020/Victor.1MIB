create database exc3
use exc3

create table Personagem(
Id int primary key identity(1,1),
Nickname varchar(20) not null,
Raça varchar(10) not null,
Classe varchar(20) not null,
Genero char(1) not null,
altu float not null,
Items int,
descriçao varchar(100)
)

create table items(
id int primary key identity(1,1),
Nome varchar(20) not null,
Descricao varchar(100) not null,
IdP int,
constraint fk_items_personagem foreign key(IdP)
references Personagem(Id)
)

alter table Personagem
add constraint fk_Personagem_Items foreign key(Items)
references items(id)

insert into Personagem
values('Shin','Humano','Archer','M',1.78,1,null)

insert into Personagem
values('Lita','Anjo','Combatente','F',1.72,2,null)

insert into Personagem
values('Yuhan','Elfo','Mago','M',1.69,3,null)

select * from Personagem

insert into items
values('Gale Ring','Aumenta a velocidade do usuario com a benção do vento.',1)

insert into items
values('Luvas do gigante','Aumenta tremendamente a força do usuario com penalidade em velocidade',2)

insert into Items
values('Cajado de Archmago','Aumenta recuperação de mana e dano magico',3)

insert into items
values('Manto do Assasino','Aumenta furtividade',null)

select * from items

update Personagem set Items=1
where id=1