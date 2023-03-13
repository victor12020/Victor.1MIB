create database AC6
use AC6

create table Proprietários(
CPF int primary key identity(1,1),
Nome varchar(30) not null,
)
create table Multas(
cod int primary key identity(1,1),
multa varchar(40) not null,
)
create table Veiculos(
Placa int primary key identity(1,1),
Cor varchar(10) not null,
Modelo varchar(15) not null,
)

create table veiculosMultaProprietario(
Proprietario int,
Placa int,
Cod int,
constraint fk_proprietarios_veiculosMultaProprietario
foreign key (proprietario) references Proprietários(CPF), 
constraint fk_multas_veiculosMultaProprietario
foreign key (Cod) references Multas(cod),
constraint fk_Veiculos_veiculosMultaProprietario
foreign key (Placa) references Veiculos(Placa)
)

create procedure inserirProprietario
@Nome varchar(30)
as
insert into Proprietários
values(@Nome)

create procedure inserirCarro
@Cor varchar(10),
@Modelo varchar(15)
as
insert into Veiculos
values(@Cor,@Modelo)

create procedure inserirMulta
@multa varchar(40)
as
insert into Multas
values(@multa)

create procedure inserirmultaveiculos
@proprietario int,
@Placa int,
@Cod int
as
insert into veiculosMultaProprietario
values(@proprietario,@Placa,@Cod)

exec inserirProprietario 'Cleiton'
exec inserirProprietario 'Jerson'
exec inserirProprietario 'Cleide'

exec inserirMulta 'estacionamento proibido'
exec inserirMulta 'Direção perigosa'
exec inserirMulta 'Atravessou sinal vermelho'
exec inserirMulta 'Limite de velocidade'

exec inserirCarro 'Preto','Etios'
exec inserirCarro 'Prata','Gol'
exec inserirCarro 'Branco','Uno'
exec inserirCarro 'Branco','Gol'

exec inserirmultaveiculos 1,1,1
exec inserirmultaveiculos 1,1,2
exec inserirmultaveiculos 1,1,3
exec inserirmultaveiculos 2,2,4
exec inserirmultaveiculos 3,3,2
exec inserirmultaveiculos 3,3,1
exec inserirmultaveiculos 3,4,1


create procedure selectTodosVeiculos
as
select Veiculos.Placa,Multas.multa,Proprietários.Nome from veiculosMultaProprietario
inner join Veiculos on Veiculos.Placa = veiculosMultaProprietario.Placa
inner join Multas on Multas.cod = veiculosMultaProprietario.Cod
inner join Proprietários on Proprietários.CPF = veiculosMultaProprietario.Proprietario



create procedure select1Veiculo
@Placa int
as
select Veiculos.Placa,Multas.multa,Proprietários.Nome from veiculosMultaProprietario
inner join Veiculos on Veiculos.Placa = veiculosMultaProprietario.Placa
inner join Multas on Multas.cod = veiculosMultaProprietario.Cod
inner join Proprietários on Proprietários.CPF = veiculosMultaProprietario.Proprietario
where Veiculos.Placa=@Placa

create procedure select1Multa
@multa varchar(40)
as
select Multas.multa,Veiculos.Placa,Proprietários.Nome from veiculosMultaProprietario
inner join Veiculos on Veiculos.Placa = veiculosMultaProprietario.Placa
inner join Multas on Multas.cod = veiculosMultaProprietario.Cod
inner join Proprietários on Proprietários.CPF = veiculosMultaProprietario.Proprietario
where Multas.multa like @multa

create procedure selectProprietario
@CPF int
as
select Proprietários.Nome,Veiculos.Placa,Multas.multa from veiculosMultaProprietario
inner join Veiculos on Veiculos.Placa = veiculosMultaProprietario.Placa
inner join Multas on Multas.cod = veiculosMultaProprietario.Cod
inner join Proprietários on Proprietários.CPF = veiculosMultaProprietario.Proprietario
where CPF=@CPF

exec selectTodosVeiculos

exec select1Veiculo 3

exec select1Multa 'estacionamento%'

exec select1Multa '%vermelho'

exec select1Multa 'Limite de velocidade'

exec selectProprietario 3
