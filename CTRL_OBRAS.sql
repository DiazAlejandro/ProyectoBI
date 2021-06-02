CREATE DATABASE IF NOT EXISTS control_obras;

USE control_obras;

-- Tabla Clientes 
CREATE TABLE cliente (
	RFC       CHAR(13) PRIMARY KEY,
	nombre    VARCHAR(40) NOT NULL,
	direccion VARCHAR(60) NOT NULL,
	telefono  VARCHAR(10) NOT NULL,
	correo_e  VARCHAR(25) NOT NULL,
	fecha_registro DATE NOT NULL,
	UNIQUE (correo_e)
);

-- Tabla material
CREATE TABLE material (
	id_material CHAR(7) PRIMARY KEY,
	nombre VARCHAR(40) NOT NULL,
	descripcion VARCHAR(60) NOT NULL,
	precio DOUBLE(10,2) NOT NULL,
	unidad_medida VARCHAR(20) NOT NULL
);

CREATE TABLE obra (
	id_obra     CHAR(7) PRIMARY KEY, 
	RFC         CHAR(13) NOT NULL,
	nombre_obra VARCHAR(40) NOT NULL,
	fecha_registro DATE NOT NULL,
	porcentaje_avance INT(3) UNSIGNED,
	tipo_obra       VARCHAR(30) NOT NULL,
	ubicacion       VARCHAR(50) NOT NULL,
	tiempo_estimado VARCHAR(30) NOT NULL,
	fecha_inicio    DATE NOT NULL,
	fecha_fin       DATE NOT NULL,
	FOREIGN KEY (RFC)
		REFERENCES cliente(RFC)
	ON DELETE CASCADE 
	ON UPDATE CASCADE
);

CREATE TABLE cotizacion(
	id_cotizacion CHAR(7) PRIMARY KEY,
	id_obra CHAR(7) NOT NULL,
	tiempo_realizacion VARCHAR(10) NOT NULL,
	capital_humano INT NOT NULL,
	material VARCHAR(80) NOT NULL,
	costo_aproximado DOUBLE(12,2) NOT NULL,
	FOREIGN KEY (id_obra)
		REFERENCES obra(id_obra)
	ON DELETE CASCADE 
	ON UPDATE CASCADE
);

CREATE TABLE plano (
	folio_p CHAR(10) PRIMARY KEY,
	id_obra CHAR(7) NOT NULL,
	archivo_plano VARCHAR(100) NOT NULL,
	FOREIGN KEY (id_obra)
		REFERENCES obra(id_obra)
	ON DELETE CASCADE 
	ON UPDATE CASCADE
);

CREATE TABLE contrato (
	no_contrato  CHAR(7) PRIMARY KEY,
	id_obra      CHAR(7) NOT NULL,
	fecha        DATE NOT NULL,
	costo        DOUBLE(12,2) NOT NULL,
	descripcion  VARCHAR(200) NOT NULL,
	derechos     VARCHAR(150) NOT NULL,
	obligaciones VARCHAR(150) NOT NULL,
	FOREIGN KEY (id_obra)
		REFERENCES obra(id_obra)
	ON DELETE CASCADE 
	ON UPDATE CASCADE
);

CREATE TABLE pago (
	user_id INT AUTO_INCREMENT PRIMARY KEY,
	RFC     CHAR(13) NOT NULL,
	id_obra CHAR(7) NOT NULL, 
	monto   DOUBLE(10,2) NOT NULL,
	concepto VARCHAR(80) NOT NULL,
	FOREIGN KEY (RFC)
		REFERENCES cliente(RFC),
	FOREIGN KEY (id_obra)
		REFERENCES obra(id_obra)
	ON DELETE CASCADE 
	ON UPDATE CASCADE
);

CREATE TABLE entrega (
	id_entrega int AUTO_INCREMENT PRIMARY KEY,
	nombreResponsable VARCHAR(30) NOT NULL,
	fecha DATE NOT NULL, 
	observaciones VARCHAR(300),
	id_obra CHAR(7) NOT NULL, 
	FOREIGN KEY (id_obra)
		REFERENCES obra(id_obra)
	ON DELETE CASCADE 
	ON UPDATE CASCADE
);
