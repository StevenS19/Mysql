drop database Universidad;
create database Universidad;
use Universidad;

create table asignatura(
id_asignatura int primary key,
nombre_a varchar(40)not null,
creditos int not null);

Create table estudiante(
id_estudiante int primary key,
nombre_e varchar(40)not null,
apellidos varchar(40)not null,
F_Nacimiento date not null,
correo varchar(40),
telefono varchar(20),
nota1 int,
nota2 int,
nota3 int);

create table profesor(
id_profesor int primary key,
nombre_f varchar(40)not null,
apellidos varchar(40)not null,
F_Nacimiento date not null,
correo varchar(40),
telefono varchar(20));

create table grupo(
id_grupo int primary key,
id_asignatura int not null,
id_profesor int not null,
salon varchar(20)not null,
foreign key (id_asignatura) references asignatura(id_asignatura)
on delete cascade on update cascade,
foreign key (id_profesor) references profesor(id_profesor)
on delete cascade on update cascade);

create table estudianteGrupo(
id_estudiante int not null,
id_grupo int not null,
primary key (id_estudiante,id_grupo),
foreign key (id_estudiante) references estudiante(id_estudiante)
on delete cascade on update cascade,
foreign key (id_grupo) references grupo (id_grupo)
on delete cascade on update cascade);

insert into asignatura values(1,'Calculo integral',4);
insert into asignatura values(2,'Responsabilidad social',2);
insert into asignatura values(3,'Administracion',1);
insert into asignatura values(4,'Calculo multivariado',4);
insert into asignatura values(5,'Servidores',3);
insert into asignatura values(6,'Ingles',1);
insert into asignatura values(7,'Base de datos',4);
insert into asignatura values(8,'Programacion',4);
insert into asignatura values(9,'Sistemas digitales',2);
insert into asignatura values(10,'Calculo diferencial',2);

insert into estudiante values(119588798,'Andres','Fernando','2000/02/26','andfer@hotmail.com',3077011,25,30,45);
insert into estudiante values(525987962,'Pepito','Cortes','1995/05/26','pepcor@hotmail.com',5486466,25,25,12);
insert into estudiante values(547987623,'Pedro','Perez','1999/08/26','pedper@hotmail.com',3060204,50,30,45);
insert into estudiante values(169598464,'Angelica','Garcia','1810/12/14','angercia@hotmail.com',3078945,25,30,25);
insert into estudiante values(465548445,'Angela','Cortes','1950/11/30','angcortes@hotmail.com',3166464,25,30,38);
insert into estudiante values(797865316,'Cristian','Reyes','1998/08/10','cdreyes@hotmail.com',3054896,45,30,45);
insert into estudiante values(179761327,'Stiven','Tapia','1998/02/09','stitapia@hotmail.com',3078011,45,30,45);
insert into estudiante values(765849578,'Daniel','Guzman','1997/05/26','dguzmanm@hotmail.com',3078010,25,30,45);
insert into estudiante values(456465139,'Steven','Sandoval','2000/12/19','elisteven19@hotmail.com',3917014,25,30,45);
insert into estudiante values(789764610,'Carlos','Luis','1995/03/26','cluis@hotmail.com',3045987,25,30,45);

insert into profesor values(87869781,'Alejandro','Cautin','1950/04/14','aletin@hotmail.com',3678597);
insert into profesor values(87897872,'Alejandra','Gomez','1940/03/14','alemez@hotmail.com',3077144);
insert into profesor values(84551213,'Armando','Casas','1950/07/17','terminandocasas@hotmail.com',3646978);
insert into profesor values(53153154,'Carlos','Cardenas','1980/04/02','ccdenas@hotmail.com',3024585);
insert into profesor values(64545115,'Mar','Cortes','1960/05/14','mares@hotmail.com',3884487);
insert into profesor values(61321216,'Maria','Rodriguez','1975/07/24','mariar@hotmail.com',3678598);
insert into profesor values(54513517,'Oscar','Martin','1985/11/26','ostin@hotmail.com',54869755);
insert into profesor values(48458978,'Pablo','nilo','1986/08/08','panilo@hotmail.com',25489799);
insert into profesor values(12345649,'Henrry','Alfonzo','1993/09/30','zkn@hotmail.com',3288587);
insert into profesor values(83450210,'Kelly','Fonseca','1990/09/30','kelfon@hotmail.com',3216587);

insert into grupo values(123,1,87869781,205);
insert into grupo values(124,2,87897872,305);
insert into grupo values(125,3,84551213,106);
insert into grupo values(126,4,53153154,605);
insert into grupo values(127,5,64545115,115);
insert into grupo values(128,6,61321216,803);
insert into grupo values(129,7,54513517,123);
insert into grupo values(1210,8,48458978,119);
insert into grupo values(1211,9,12345649,465);
insert into grupo values(1212,10,83450210,789);

insert into grupo values(1213,10,87869781,666);



insert into estudianteGrupo values(119588798,123);
insert into estudianteGrupo values(525987962,124);
insert into estudianteGrupo values(547987623,125);
insert into estudianteGrupo values(169598464,126);
insert into estudianteGrupo values(465548445,127);
insert into estudianteGrupo values(797865316,128);
insert into estudianteGrupo values(179761327,129);
insert into estudianteGrupo values(765849578,1210);
insert into estudianteGrupo values(456465139,1211);
insert into estudianteGrupo values(789764610,1212);

insert into estudianteGrupo values(465548445,1211);

select * from asignatura;
select * from estudiante;
select * from profesor;
select * from grupo;
select * from estudianteGrupo;


select a. id_asignatura, a. id_profesor, b.nombre_a from grupo a, asignatura b where id_profesor=87869781 and a.id_asignatura=b.id_asignatura group by id_asignatura;
select a.id_estudiante, a.id_grupo, b.id_asignatura, c.nombre_a, d.nombre_e, d.apellidos from estudiantegrupo a, grupo b, asignatura c, estudiante d where a.id_grupo=b.id_grupo and c.id_asignatura=b.id_asignatura and a.id_estudiante=d.id_estudiante and nombre_a='sistemas digitales';
select b.id_estudiante, a.nombre_e, a.apellidos, a.F_Nacimiento, a.correo, a.telefono, a.nota1, a.nota2, a.nota3, b.id_grupo, c.nombre_a from estudiante a, estudiantegrupo b, asignatura c, grupo d where a.id_estudiante=465548445 and b.id_grupo=d.id_grupo and c.id_asignatura=d.id_asignatura and a.id_estudiante=b.id_estudiante;

---------------------------------------------------------------------------------------------///-----------------------------------------------------

select b.nombre_a, a.nombre_e, a.apellidos from estudiante a, asignatura b where id_asignatura=id_estudiante and id_estudiante=01;
select b.nombre_a, a.nombre_f, a.apellidos from profesor a, asignatura b where id_asignatura=id_profesor and id_profesor=02;
select b.nombre_a, (b.nota1+b.nota2+b.nota3)/3 as Definitiva, a.nombre_e, a.apellidos from estudiante a, asignatura b where id_asignatura=id_estudiante and id_estudiante=02;
select a.nombre_e, a.apellidos, a.F_Nacimiento from estudiante a where F_Nacimiento between '1998/01/01' and '1998/12/30';
select a.nombre_f, a.apellidos, b.nombre_a, (b.nota1+b.nota2+b.nota3)/3 as perdidas, c.nombre_e, c.apellidos, COUNT(c.nombre_e) as Cantidad_Personas_Perdieron from profesor a, asignatura b, estudiante c where id_asignatura=id_profesor and id_asignatura=id_estudiante and (b.nota1+b.nota2+b.nota3)/3<30 group by c.nombre_e;

        