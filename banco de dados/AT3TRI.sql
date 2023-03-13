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

exec inserirODS 'Erradicação da pobreza','Erradicar a pobreza em todas as formas e em todos os lugares',1
exec inserirODS 'Fome zero e agricultura sustentável','Erradicar a fome, alcançar a segurança alimentar, melhorar a nutrição e promover a agricultura sustentável',2
exec inserirODS 'Saúde e Bem-Estar','Garantir o acesso à saúde de qualidade e promover o bem-estar para todos, em todas as idades',3
exec inserirODS 'Educação de qualidade','Garantir o acesso à educação inclusiva, de qualidade e equitativa, e promover oportunidades de aprendizagem ao longo da vida para todos',4
exec inserirODS 'Igualdade de gênero','Alcançar a igualdade de gênero e empoderar todas as mulheres e meninas',5

create procedure inserirProjeto 
@id float,
@projeto varchar(900)
as
insert into projetos
values(@id,@projeto)

exec inserirProjeto 1.1,'Até 2030, erradicar a pobreza extrema para todas as pessoas em todos os lugares, atualmente medida como pessoas vivendo com menos de US$ 1,90 por dia'
exec inserirProjeto 1.2,'Até 2030, reduzir pelo menos à metade a proporção de homens, mulheres e crianças, de todas as idades, que vivem na pobreza, em todas as suas dimensões, de acordo com as definições nacionais'
exec inserirProjeto 1.3,'Implementar, em nível nacional, medidas e sistemas de proteção social adequados, para todos, incluindo pisos, e até 2030 atingir a cobertura substancial dos pobres e vulneráveis'
exec inserirProjeto 2.1,'Até 2030, acabar com a fome e garantir o acesso de todas as pessoas, em particular os pobres e pessoas em situações vulneráveis, incluindo crianças, a alimentos seguros, nutritivos e suficientes durante todo o ano'
exec inserirProjeto 2.2,'Até 2030, acabar com todas as formas de desnutrição, incluindo atingir, até 2025, as metas acordadas internacionalmente sobre nanismo e caquexia em crianças menores de cinco anos de idade, e atender às necessidades nutricionais dos adolescentes, mulheres grávidas e lactantes e pessoas idosas'
exec inserirProjeto 2.3,'Até 2030, dobrar a produtividade agrícola e a renda dos pequenos produtores de alimentos, particularmente das mulheres, povos indígenas, agricultores familiares, pastores e pescadores, inclusive por meio de acesso seguro e igual à terra, outros recursos produtivos e insumos, conhecimento, serviços financeiros, mercados e oportunidades de agregação de valor e de emprego não agrícola'
exec inserirProjeto 3.1,'Até 2030, reduzir a taxa de mortalidade materna global para menos de 70 mortes por 100.000 nascidos vivos'
exec inserirProjeto 3.2,'Até 2030, acabar com as mortes evitáveis de recém-nascidos e crianças menores de 5 anos, com todos os países objetivando reduzir a mortalidade neonatal para pelo menos 12 por 1.000 nascidos vivos e a mortalidade de crianças menores de 5 anos para pelo menos 25 por 1.000 nascidos vivos'
exec inserirProjeto 3.3,'Até 2030, acabar com as epidemias de AIDS, tuberculose, malária e doenças tropicais negligenciadas, e combater a hepatite, doenças transmitidas pela água, e outras doenças transmissíveis'
exec inserirProjeto 4.1,'Até 2030, garantir que todas as meninas e meninos completem o ensino primário e secundário livre, equitativo e de qualidade, que conduza a resultados de aprendizagem relevantes e eficazes'
exec inserirProjeto 4.2,'Até 2030, garantir que todos as meninas e meninos tenham acesso a um desenvolvimento de qualidade na primeira infância, cuidados e educação pré-escolar, de modo que eles estejam prontos para o ensino primário'
exec inserirProjeto 4.3,'Até 2030, assegurar a igualdade de acesso para todos os homens e mulheres à educação técnica, profissional e superior de qualidade, a preços acessíveis, incluindo universidade'
exec inserirProjeto 5.1,'Acabar com todas as formas de discriminação contra todas as mulheres e meninas em toda parte'
exec inserirProjeto 5.2,'Eliminar todas as formas de violência contra todas as mulheres e meninas nas esferas públicas e privadas, incluindo o tráfico e exploração sexual e de outros tipos'
exec inserirProjeto 5.3,'Eliminar todas as práticas nocivas, como os casamentos prematuros, forçados e de crianças e mutilações genitais femininas'

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
