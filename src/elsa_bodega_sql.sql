DROP DATABASE IF EXISTS elsa_bodega;
CREATE DATABASE elsa_bodega;
USE elsa_bodega;

DROP TABLE IF EXISTS productos;
CREATE TABLE productos (
  id_producto INT(100) NOT NULL AUTO_INCREMENT,
  producto VARCHAR(255) DEFAULT NULL,
  tiempo_barrica varchar(100) DEFAULT NULL,
  bodega varchar(100),
  denominacion varchar(50),
  nacionalidad varchar(50),
  descripcion varchar(255),
  coste int(6) DEFAULT NULL,
  PRIMARY KEY (id_producto)
);


DROP TABLE IF EXISTS vendedores;
CREATE TABLE vendedores (
  id_vendedor INT(11) NOT NULL AUTO_INCREMENT,
  vendedor VARCHAR(255) DEFAULT NULL,
  sueldo int(8) default null,
  comision int(8) default null,
  PRIMARY KEY (id_vendedor)
);

DROP TABLE IF EXISTS clientes;
CREATE TABLE clientes (
 id_cliente INT(11) NOT NULL AUTO_INCREMENT,
 cliente VARCHAR(255) DEFAULT NULL,
 direccion varchar(255) DEFAULT NULL,
 attn varchar(127) DEFAULT NULL,
 telefono int(11) DEFAULT NULL,
 email varchar(127),
 zona varchar(127) DEFAULT NULL,
 PRIMARY KEY (id_cliente)
);

DROP TABLE IF EXISTS pedidos;
CREATE TABLE pedidos (
  id_pedido INT(11) NOT NULL AUTO_INCREMENT,
  f_pedido date DEFAULT NULL,
  f_entrega date DEFAULT NULL,
  forma_pago varchar(127) DEFAULT NULL,
  PRIMARY KEY (id_pedido)
);

DROP table IF EXISTS venden;
CREATE TABLE venden(
  id_vende int AUTO_INCREMENT,
  id_producto int,
  id_vendedor int,
  id_cliente int,
  id_pedido int,
  cantidad int DEFAULT 1,
  precio float NOT NULL,
  PRIMARY KEY(id_vende),
  FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
  FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
  FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
  FOREIGN KEY (id_vendedor) REFERENCES vendedores(id_vendedor)
  );

DROP table IF EXISTS uvas;
CREATE TABLE uvas(
  id_uva int AUTO_INCREMENT,
  uva varchar(60),
  id_vende int,
  id_producto int,
  id_vendedor int,
  id_cliente int,
  id_pedido int,
  PRIMARY KEY(id_uva),
  FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
  FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
  FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
  FOREIGN KEY (id_vendedor) REFERENCES vendedores(id_vendedor)
  );

DROP table IF EXISTS tipos;
CREATE TABLE tipos(
  id_vende int,
  id_producto int,
  id_vendedor int,
  id_cliente int,
  id_pedido int,
  id_tipo int AUTO_INCREMENT,
  tipo varchar(60),
  PRIMARY KEY(id_tipo),
  FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
  FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
  FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
  FOREIGN KEY (id_vendedor) REFERENCES vendedores(id_vendedor)
  );







/*INSERT productos (producto,tipo,uva,tiempo_barrica,bodega,denominacion,nacionalidad,descripcion,coste)
  VALUES('Milmanda','blanco','chardonay','12','Torres','Penedés','España','seco,sabroso y potente','20'),
        ('Pago de Carrovejas','tinto','tinto fino, cavernet sauvignon, merlot','24','Pago de Carrovejas','Ribera del Duero','España','Muy frutal, con cereza, ciruela pasa, redondo y sabroso','30'),
        ('Golden Duck','espumoso','cavernet sauvignon','no',' ',' ','Sudáfrica','Alegre y frutal','6');





SELECT * FROM productos;*/