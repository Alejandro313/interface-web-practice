use negocioWeb;
select * from direcciones;
select * from clientes;
show tables;
select * from V_clientes_direcciones;

drop view V_clientes_direcciones;

create view V_clientes_direcciones as
	select c.id id, concat(nombre,' ',apellido) nombre,fenaci fecha_nacimiento, concat(tipoDocumento, '', numeroDocumento) documento,telefono,email,
            concat(calle,' ',numero,' ',ciudad) direccion,comentarios 
            from clientes c join direcciones d on c.idDireccion = d.id;



select * from V_clientes_direcciones;

delete from clientes where nombre like'%<%';