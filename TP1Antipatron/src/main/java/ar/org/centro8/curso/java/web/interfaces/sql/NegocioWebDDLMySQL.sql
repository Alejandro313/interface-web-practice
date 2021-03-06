/*

	Host: db4free.net 
	Port: 3306
	BD: negociowebcfp8
	User: centro_8
	Pass: centro_8

*/
-- drop database if exists negocioWeb;
-- create database negocioWeb;
-- use negocioWeb;

drop table if exists detalles;
drop table if exists facturas;
drop table if exists clientes;
drop table if exists direcciones;
drop table if exists articulos;

create table direcciones(
	id int auto_increment primary key,
	calle varchar(120) not null,
    numero int not null,
    piso varchar(12),
    depto varchar(12),
    torre varchar(12),
    codigoPostal varchar(12) not null,
    ciudad varchar(50) not null default 'CABA',
    provincia varchar(50) default 'CABA',
    pais varchar(50) default 'Argentina'
);



alter table direcciones
	add constraint CK_DireccionesNumero
    check (numero>=0);
 
create table clientes(
	id int auto_increment primary key,
    nombre varchar(20) not null,
    apellido varchar(20) not null,
    fenaci date not null,
    tipoDocumento enum('DNI','LC','LE','CI','PASS') default 'DNI' not null,
    numeroDocumento char(8) not null,
    telefono varchar(16),
    email varchar(50),
    idDireccion int not null,
    comentarios varchar(255)
);

alter table clientes
	add constraint UQ_ClientesTipoNumero
    unique(tipoDocumento,numeroDocumento);

alter table clientes
	add constraint FK_ClientesDirecciones
    foreign key (idDireccion)
    references direcciones(id);

alter table clientes 
	add constraint CK_ClientesNombre
	check (char_length(nombre)>=2);
    
-- alter table clientes
-- 	add constraint CK_ClientesFenaci
--  check (fenaci <= current_date());

-- insert into direcciones(calle,numero,codigoPostal) values ('Larrea',-1,'1065');
-- select version();

create table articulos(
	id int auto_increment primary key,
    nombre varchar(40) not null,
    descripcion varchar(150) not null,
    tipo enum('PRENDA','JUGUETE','ALIMENTO','SNACK','ACCESORIO','CORREAS','MEDICAMENTO'),
    especieRecomendada enum('CANINO','FELINO','AVE','PEZ','ROEDOR') not null,
    costo double not null,
    precio double not null,
    stock int not null,
    stockMinimo int not null,
    stockMaximo int not null,
    comentarios varchar(255),
    activo boolean default(true)
);

alter table articulos
	add constraint CK_ArticulosCosto
    check (costo>=0);

alter table articulos
	add constraint CK_ArticulosPrecio
    check (precio>=costo);

alter table articulos
	add constraint CK_ArticulosStock
    check (stock>=0);

alter table articulos
	add constraint CK_ArticulosStockMinimo
    check (stockMinimo>0);

alter table articulos
	add constraint CK_ArticulosStockMaximo
    check (stockMaximo>=stockMinimo);

create table facturas(
	id int primary key auto_increment,
    letra enum('A','B','C') not null,
    numero int not null,
    fecha date not null,
    hora time not null,
	medioPago enum ('EFECTIVO','MERCADOPAGO','TARJETA','DEBITO') default 'EFECTIVO' not null,
    idCliente int not null,
    comentarios varchar(255)
);

alter table facturas
	add constraint FK_Facturas_Clientes
    foreign key(idCliente)
    references clientes(id);
    
alter table facturas 
	add constraint CK_FacturasNumero
    check(numero>0);

alter table facturas
	add constraint UQ_FacturasLetraNumero
    unique(letra,numero);
    
create table detalles(
	id int auto_increment primary key,
    idFactura int not null,
    idArticulo int not null,
    cantidad int not null,
    precioVenta float not null
);

alter table detalles
	add constraint FK_Detalles_Facturas
    foreign key(idFactura)
    references facturas(id);

alter table detalles
	add constraint FK_Detalles_Articulos
    foreign key(idArticulo)
    references articulos(id);

alter table detalles
	add constraint UQ_DetallesIdFacturaIdArticulo
    unique(idFactura,idArticulo);

alter table detalles
	add constraint CK_DetallesCantidad
    check (cantidad>0);

alter table detalles
	add constraint CK_DetallesPrecioVenta
    check (precioVenta>=0);

show tables;

create view V_clientes_direcciones as
    select 
        c.id idCliente,nombre,apellido,fenaci,tipoDocumento,numeroDocumento, telefono, email, comentarios, 
        idDireccion,calle,numero,piso,depto,torre,codigoPostal,ciudad,provincia,pais
        from clientes c join direcciones d on c.idDireccion = d.id;

select * from V_clientes_direcciones;

select * from V_clientes_direcciones where apellido like "%Mo%";

select * from clientes;