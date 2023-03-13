create database AT3
use AT3

create table ODS(
ID int primary key,
Nome varchar(40) not null,
objetivo varchar(250) not null
)

create table projetos(
ID float primary key,
projeto varchar(900) not null,
)

create table projetos_ODS(
ID int primary key identity(1,1),
ODS_ID int not null,
projeto_ID float not null,
constraint fk_ODS_projetosODS
foreign key (ODS_ID) references ODS (ID),
constraint fk_projetos_projetosODS
foreign key (projeto_ID) references projetos (ID)
)



create procedure inserirODS
@Nome varchar(40),
@objetivo varchar(250),
@id int
as
insert into ODS(Nome,objetivo,ID)
values(@Nome,@objetivo,@id)

exec inserirODS 'Erradica��o da pobreza','Erradicar a pobreza em todas as formas e em todos os lugares',1
exec inserirODS 'Fome zero e agricultura sustent�vel','Erradicar a fome, alcan�ar a seguran�a alimentar, melhorar a nutri��o e promover a agricultura sustent�vel',2
exec inserirODS 'Sa�de e Bem-Estar','Garantir o acesso � sa�de de qualidade e promover o bem-estar para todos, em todas as idades',3
exec inserirODS 'Educa��o de qualidade','Garantir o acesso � educa��o inclusiva, de qualidade e equitativa, e promover oportunidades de aprendizagem ao longo da vida para todos',4
exec inserirODS 'Igualdade de g�nero','Alcan�ar a igualdade de g�nero e empoderar todas as mulheres e meninas',5

create procedure inserirProjeto 
@id float,
@projeto varchar(900)
as
insert into projetos
values(@id,@projeto)

exec inserirProjeto 1.1,'At� 2030, erradicar a pobreza extrema para todas as pessoas em todos os lugares, atualmente medida como pessoas vivendo com menos de US$ 1,90 por dia'
exec inserirProjeto 1.2,'At� 2030, reduzir pelo menos � metade a propor��o de homens, mulheres e crian�as, de todas as idades, que vivem na pobreza, em todas as suas dimens�es, de acordo com as defini��es nacionais'
exec inserirProjeto 1.3,'Implementar, em n�vel nacional, medidas e sistemas de prote��o social adequados, para todos, incluindo pisos, e at� 2030 atingir a cobertura substancial dos pobres e vulner�veis'
exec inserirProjeto 2.1,'At� 2030, acabar com a fome e garantir o acesso de todas as pessoas, em particular os pobres e pessoas em situa��es vulner�veis, incluindo crian�as, a alimentos seguros, nutritivos e suficientes durante todo o ano'
exec inserirProjeto 2.2,'At� 2030, acabar com todas as formas de desnutri��o, incluindo atingir, at� 2025, as metas acordadas internacionalmente sobre nanismo e caquexia em crian�as menores de cinco anos de idade, e atender �s necessidades nutricionais dos adolescentes, mulheres gr�vidas e lactantes e pessoas idosas'
exec inserirProjeto 2.3,'At� 2030, dobrar a produtividade agr�cola e a renda dos pequenos produtores de alimentos, particularmente das mulheres, povos ind�genas, agricultores familiares, pastores e pescadores, inclusive por meio de acesso seguro e igual � terra, outros recursos produtivos e insumos, conhecimento, servi�os financeiros, mercados e oportunidades de agrega��o de valor e de emprego n�o agr�cola'
exec inserirProjeto 3.1,'At� 2030, reduzir a taxa de mortalidade materna global para menos de 70 mortes por 100.000 nascidos vivos'
exec inserirProjeto 3.2,'At� 2030, acabar com as mortes evit�veis de rec�m-nascidos e crian�as menores de 5 anos, com todos os pa�ses objetivando reduzir a mortalidade neonatal para pelo menos 12 por 1.000 nascidos vivos e a mortalidade de crian�as menores de 5 anos para pelo menos 25 por 1.000 nascidos vivos'
exec inserirProjeto 3.3,'At� 2030, acabar com as epidemias de AIDS, tuberculose, mal�ria e doen�as tropicais negligenciadas, e combater a hepatite, doen�as transmitidas pela �gua, e outras doen�as transmiss�veis'
exec inserirProjeto 4.1,'At� 2030, garantir que todas as meninas e meninos completem o ensino prim�rio e secund�rio livre, equitativo e de qualidade, que conduza a resultados de aprendizagem relevantes e eficazes'
exec inserirProjeto 4.2,'At� 2030, garantir que todos as meninas e meninos tenham acesso a um desenvolvimento de qualidade na primeira inf�ncia, cuidados e educa��o pr�-escolar, de modo que eles estejam prontos para o ensino prim�rio'
exec inserirProjeto 4.3,'At� 2030, assegurar a igualdade de acesso para todos os homens e mulheres � educa��o t�cnica, profissional e superior de qualidade, a pre�os acess�veis, incluindo universidade'
exec inserirProjeto 5.1,'Acabar com todas as formas de discrimina��o contra todas as mulheres e meninas em toda parte'
exec inserirProjeto 5.2,'Eliminar todas as formas de viol�ncia contra todas as mulheres e meninas nas esferas p�blicas e privadas, incluindo o tr�fico e explora��o sexual e de outros tipos'
exec inserirProjeto 5.3,'Eliminar todas as pr�ticas nocivas, como os casamentos prematuros, for�ados e de crian�as e mutila��es genitais femininas'

create procedure inserirProjetoODs
@projeto_ID float,
@ODS_ID int
as
insert into projetos_ODS(projeto_ID,ODS_ID)
values(@projeto_ID,@ODS_ID)

exec inserirProjetoODs 1.1,1
exec inserirProjetoODs 1.2,1
exec inserirProjetoODs 1.3,1
exec inserirProjetoODs 2.1,2
exec inserirProjetoODs 2.2,2
exec inserirProjetoODs 2.3,2
exec inserirProjetoODs 3.1,3
exec inserirProjetoODs 3.2,3
exec inserirProjetoODs 3.3,3
exec inserirProjetoODs 4.1,4
exec inserirProjetoODs 4.2,4
exec inserirProjetoODs 4.3,4
exec inserirProjetoODs 5.1,5
exec inserirProjetoODs 5.2,5
exec inserirProjetoODs 5.3,5

create procedure selectODSs
as
select ODS.Nome as ODS,ODS.objetivo,projetos.projeto from projetos_ODS
inner join ODS on ODS.ID = projetos_ODS.ODS_ID
inner join projetos on projetos.ID = projetos_ODS.projeto_ID

exec selectODSs

create procedure selectprojeto
@idprojeto float
as
select ODS.Nome as ODS,ODS.objetivo,projetos.projeto from projetos_ODS
inner join ODS on ODS.ID = projetos_ODS.ODS_ID
inner join projetos on projetos.ID = projetos_ODS.projeto_ID
where projetos.ID=@idprojeto

exec selectprojeto 1.1

create procedure selectODS
@idODS int
as
select ODS.Nome as ODS,ODS.objetivo,projetos.projeto from projetos_ODS
inner join ODS on ODS.ID = projetos_ODS.ODS_ID
inner join projetos on projetos.ID = projetos_ODS.projeto_ID
where ODS.ID=@idODS

exec selectODS 5
