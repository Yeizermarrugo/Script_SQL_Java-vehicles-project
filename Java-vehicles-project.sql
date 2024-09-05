CREATE TABLE "Usuario" (
  "id" int PRIMARY KEY,
  "nombre" varchar,
  "apellido" varchar,
  "id_tipodocumento" int,
  "numerodocumento" varchar,
  "email" varchar,
  "direccion" varchar,
  "telefono" varchar,
  "registro" date,
  "id_rol" int
);

CREATE TABLE "Rol" (
  "id" int PRIMARY KEY,
  "name" varchar,
  "alias" varchar
);

CREATE TABLE "TipoDocumento" (
  "id" int PRIMARY KEY,
  "name" varchar,
  "alias" varchar
);

CREATE TABLE "Administrador" (
  "id" int PRIMARY KEY,
  "id_usuario" int
);

CREATE TABLE "Vendedor" (
  "id" int PRIMARY KEY,
  "fecha_contratacion" date,
  "comision" int,
  "id_usuario" int
);

CREATE TABLE "Cliente" (
  "id" int PRIMARY KEY,
  "id_usuario" int
);

CREATE TABLE "TipoPago" (
  "id" int PRIMARY KEY,
  "name" varchar,
  "alias" varchar
);

CREATE TABLE "EstadoPago" (
  "id" int PRIMARY KEY,
  "name" varchar,
  "alias" varchar
);

CREATE TABLE "Venta" (
  "id" int PRIMARY KEY,
  "fecha" date,
  "precio" double,
  "id_tipopago" int,
  "id_vehiculo" int,
  "id_cliente" int,
  "id_vendedor" int
);

CREATE TABLE "Vehiculo" (
  "id" int PRIMARY KEY,
  "name" varchar,
  "marca" varchar,
  "placas" varchar,
  "id_tipovehiculo" int,
  "precio" double,
  "especificaciones" varchar,
  "id_ubicacion" int,
  "estado" boolean
);

CREATE TABLE "Categoria" (
  "id" int PRIMARY KEY,
  "name" varchar,
  "alias" varchar
);

CREATE TABLE "TipoVehiculo" (
  "id" int PRIMARY KEY,
  "name" varchar,
  "alias" varchar
);

CREATE TABLE "Ubicacion" (
  "id" int PRIMARY KEY,
  "pais" varchar,
  "ciudad" varchar,
  "estado" boolean
);

CREATE TABLE "Inventario" (
  "id" int PRIMARY KEY,
  "cantidad_disponible" int,
  "id_vehiculo" int,
  "fecha_actualizacion" date
);

CREATE TABLE "EstadoEnvio" (
  "id" int PRIMARY KEY,
  "name" varchar,
  "alias" varchar
);

CREATE TABLE "Envio" (
  "id" int PRIMARY KEY,
  "id_vehiculo" int,
  "cantidad" int,
  "fecha" date,
  "direccion" varchar,
  "id_estado" int
);

ALTER TABLE "Usuario" ADD FOREIGN KEY ("id_tipodocumento") REFERENCES "TipoDocumento" ("id");

ALTER TABLE "Usuario" ADD FOREIGN KEY ("id_rol") REFERENCES "Rol" ("id");

ALTER TABLE "Administrador" ADD FOREIGN KEY ("id_usuario") REFERENCES "Usuario" ("id");

ALTER TABLE "Vendedor" ADD FOREIGN KEY ("id_usuario") REFERENCES "Usuario" ("id");

ALTER TABLE "Cliente" ADD FOREIGN KEY ("id_usuario") REFERENCES "Usuario" ("id");

ALTER TABLE "Venta" ADD FOREIGN KEY ("id_tipopago") REFERENCES "TipoPago" ("id");

ALTER TABLE "Venta" ADD FOREIGN KEY ("id_vehiculo") REFERENCES "Vehiculo" ("id");

ALTER TABLE "Venta" ADD FOREIGN KEY ("id_cliente") REFERENCES "Cliente" ("id");

ALTER TABLE "Venta" ADD FOREIGN KEY ("id_vendedor") REFERENCES "Vendedor" ("id");

ALTER TABLE "Vehiculo" ADD FOREIGN KEY ("id_tipovehiculo") REFERENCES "TipoVehiculo" ("id");

ALTER TABLE "Vehiculo" ADD FOREIGN KEY ("id_ubicacion") REFERENCES "Ubicacion" ("id");

ALTER TABLE "Inventario" ADD FOREIGN KEY ("id_vehiculo") REFERENCES "Vehiculo" ("id");

ALTER TABLE "Envio" ADD FOREIGN KEY ("id_vehiculo") REFERENCES "Vehiculo" ("id");

ALTER TABLE "Envio" ADD FOREIGN KEY ("id_estado") REFERENCES "EstadoEnvio" ("id");
