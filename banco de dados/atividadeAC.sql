create database dmlsql
use dmlsql

create table funcionarios(
idFunc int primary key,
nomeFunc varchar(45) not null,
idadeFunc int not null,
sexo char(1) not null
)

create table departamentos(
idDept int primary key,
nomeDept varchar(20) not null,
ramalDept char(3) not null
)

alter table funcionarios
add endereco varchar(60)

alter table departamentos
add gerenteDepto varchar(45)

alter table departamentos
alter column nomeDept varchar(35) not null

alter table funcionarios
add CEP char(8)

alter table funcionarios
alter column endereco varchar(70)

alter table funcionarios
add pontoEntrada time not null

alter table funcionarios
add pontoSaida time

alter table funcionarios
add RG int not null


alter table departamentos
add sedeDept varchar(20)

alter table departamentos
add numeroFunc int not null

alter table departamentos
add datacDept date not null


alter table funcionarios
drop column idadeFunc

alter table departamentos
alter column sedeDept varchar(15)

alter table funcionarios
alter column pontoEntrada time

drop table funcionarios

drop table departamentos

use master
drop database dmlsql 