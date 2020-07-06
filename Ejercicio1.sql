create database BDEjercicio1;
go
use BDEjercicio1;
go

create table DIM_Destino(
	Id_Destino int primary key identity,
	Pais varchar(250),
	Tarifa_Exportacion int ,
);
create table DIM_Centro_Costo(
	Id_CentroCosto int primary key identity,
	Nombre varchar(250),
	Responsable varchar(250) ,
	Grupo varchar(250),
);
create table DIM_Modo_Transporte(
	Id_Modo_Transporte int primary key identity,
	Nombre varchar(250),
);
create table DIM_Lote(
	Id_Lote int primary key identity,
	Tarifa_Exportacion int ,
	Peso decimal(10,2),
	Grupo varchar(250),
);
create table DIM_Tiempo(
	Id_Tiempo int primary key identity,
	Año int ,
	Mes varchar(50),
);
create table FACT_ENVIO(
	Id_Destino int,
	Id_CentroCosto int,
	Id_Modo_Transporte int,
	Id_Tiempo int,
	Id_Lote int,
	Costo decimal(10,2),
);

alter table FACT_ENVIO add constraint FKId_Destino foreign key (Id_Destino) references DIM_Destino(Id_Destino);
alter table FACT_ENVIO add constraint FKId_CentroCosto foreign key (Id_CentroCosto) references DIM_Centro_Costo(Id_CentroCosto);
alter table FACT_ENVIO add constraint FKId_Modo_Transporte foreign key (Id_Modo_Transporte) references DIM_Modo_Transporte(Id_Modo_Transporte);
alter table FACT_ENVIO add constraint FKId_Tiempo foreign key (Id_Tiempo) references DIM_Tiempo(Id_Tiempo);
alter table FACT_ENVIO add constraint FKId_Lote foreign key (Id_Lote) references DIM_Lote(Id_Lote);
