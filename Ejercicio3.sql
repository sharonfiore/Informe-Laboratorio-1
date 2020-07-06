create database DBEjercicio3;
GO
use DBEjercicio3;
GO

create table DIM_Cliente(
	Id_Cliente int primary key identity,
	Nombre_Cliente varchar(250) unique,
	Telefono varchar(12) unique,
);

create table DIM_Responsable(
	Id_Responsable int primary key identity,
	Nombre_Responsable  varchar(250),
	Empresa varchar(250) ,
);
create table DIM_Localidad(
	Id_Localidad int primary key identity,
	Localidad varchar(250) ,
	Pais varchar(250),
);
create table DIM_Tiempo(
	Id_Tiempo int primary key identity,
	Dia int ,
	Mes int,
	Año int,
	Fecha datetime,
);

create table FACT_Proyecto(
	Id_Cliente int,
	Id_Responsable int,
	Id_Localidad int,
	Id_Tiempo int,
	Nombre_Proyecto varchar(250),
	Costo decimal(10,2),
	Fecha_Inicio Datetime ,
	Fecha_Fin Datetime,
	Duracion int,
);

alter table FACT_Proyecto add constraint FKId_Cliente foreign key (Id_Cliente) references DIM_Cliente(Id_Cliente);
alter table FACT_Proyecto add constraint FKId_Responsable foreign key (Id_Responsable) references DIM_Responsable(Id_Responsable);
alter table FACT_Proyecto add constraint FKId_Localidad foreign key (Id_Localidad) references DIM_Localidad(Id_Localidad);
alter table FACT_Proyecto add constraint FKId_Tiempo foreign key (Id_Tiempo) references DIM_Tiempo(Id_Tiempo);

alter authorization on database::Ejercicio3 to sa
