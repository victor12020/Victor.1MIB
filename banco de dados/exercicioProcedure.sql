create database exercicio
use exercicio
create table personagens(
id int primary key identity (1,1),
nome varchar(30) not null,
tipoPersonagem varchar(15) not null
)
create table itens(
id int primary key identity (1,1),
nomeItem varchar(25) not null,
dano int not null
)
create table personagem_item(
id int primary key identity (1,1),
idPersonagem int not null,
idItem int not null,
constraint fk_personagem_personagemItem
foreign key (idPersonagem) references personagens(id),
constraint fk_item_personagemItem
foreign key (idItem) references itens(id)
)
create procedure inserirPersonagem
@Nome varchar(30),
@tipoPersonagem varchar(15)
as
insert into personagens
values(@Nome,@tipoPersonagem)

exec inserirPersonagem 'José','Mago'
exec inserirPersonagem 'Alex','Policial'
exec inserirPersonagem 'Mateus','Guerreiro'

create procedure inserirItem
@nomeItem varchar(25),
@dano int
as
insert into itens
values(@nomeItem,@dano)

exec inserirItem 'Cajado',10
exec inserirItem 'Revolver',50
exec inserirItem 'Machado',30
exec inserirItem 'Escudo',2

create procedure inserirInv
@idPersonagem int,
@idItem int
as
insert into personagem_item
values(@idPersonagem,@idItem)

exec inserirInv 3,3
exec inserirInv 3,4
exec inserirInv 2,2

create procedure selectPersonagemItems
as
SELECT personagens.nome,itens.nomeItem FROM personagem_item
INNER JOIN personagens ON personagens.id = personagem_item.idPersonagem
INNER JOIN itens ON itens.id = personagem_item.idItem
ORDER by personagens.nome

exec selectPersonagemItems
/*EXERCÍCIO 02*/

create procedure selectPersonagem
@idPersonagem int
as
SELECT personagens.nome,itens.nomeItem FROM personagem_item
INNER JOIN personagens ON personagens.id = personagem_item.idPersonagem
INNER JOIN itens ON itens.id = personagem_item.idItem
where personagens.id=@idPersonagem

exec selectPersonagem 3
/*EXERCÍCIO 03*/

create procedure selectItem
@idItem int
as
SELECT itens.nomeItem,personagens.nome FROM personagem_item
INNER JOIN personagens ON personagens.id = personagem_item.idPersonagem
INNER JOIN itens ON itens.id = personagem_item.idItem
where itens.id=@idItem

exec selectItem 4