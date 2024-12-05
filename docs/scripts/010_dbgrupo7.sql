CREATE DATABASE v_economico;
use v_economico

    -- Tabla de usuarios
CREATE TABLE usuario (
    usercod BIGINT(10) NOT NULL AUTO_INCREMENT,
    useremail VARCHAR(80) DEFAULT NULL,
    username VARCHAR(80) DEFAULT NULL,
    userpswd VARCHAR(128) DEFAULT NULL,
    userfching DATETIME DEFAULT NULL,
    userpswdest CHAR(3) DEFAULT NULL,
    userpswdexp DATETIME DEFAULT NULL,
    userest CHAR(3) DEFAULT NULL,
    useractcod VARCHAR(128) DEFAULT NULL,
    userpswdchg VARCHAR(128) DEFAULT NULL,
    usertipo CHAR(3) DEFAULT NULL COMMENT 'Tipo de Usuario: ADM, PBL, AUD',
    PRIMARY KEY (usercod),
    UNIQUE KEY useremail_UNIQUE (useremail),
    KEY usertipo (usertipo, useremail, usercod, userest)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- Tabla de roles
CREATE TABLE roles (
    rolescod VARCHAR(128) NOT NULL,
    rolesdsc VARCHAR(45) DEFAULT NULL,
    rolesest CHAR(3) DEFAULT NULL,
    PRIMARY KEY (rolescod)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- Tabla roles_usuarios
CREATE TABLE roles_usuarios (
    usercod BIGINT(10) NOT NULL,
    rolescod VARCHAR(128) NOT NULL,
    roleuserest CHAR(3) DEFAULT NULL,
    roleuserfch DATETIME DEFAULT NULL,
    roleuserexp DATETIME DEFAULT NULL,
    PRIMARY KEY (usercod, rolescod),
    CONSTRAINT usuario_rol_key FOREIGN KEY (usercod) REFERENCES usuario (usercod),
    CONSTRAINT rol_usuario_key FOREIGN KEY (rolescod) REFERENCES roles (rolescod)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- Tabla funciones
CREATE TABLE funciones (
    fncod VARCHAR(255) NOT NULL,
    fndsc VARCHAR(255) DEFAULT NULL,
    fnest CHAR(3) DEFAULT NULL,
    fntyp CHAR(3) DEFAULT NULL,
    PRIMARY KEY (fncod)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Tabla funciones_roles
CREATE TABLE funciones_roles (
    rolescod VARCHAR(128) NOT NULL,
    fncod VARCHAR(255) NOT NULL,
    fnrolest CHAR(3) DEFAULT NULL,
    fnexp DATETIME DEFAULT NULL,
    PRIMARY KEY (rolescod, fncod),
    CONSTRAINT rol_funcion_key FOREIGN KEY (rolescod) REFERENCES roles (rolescod),
    CONSTRAINT funcion_rol_key FOREIGN KEY (fncod) REFERENCES funciones (fncod)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- Tabla categorías
CREATE TABLE categorias (
    categoria_id INT NOT NULL AUTO_INCREMENT,
    categoria_nombre VARCHAR(100) NOT NULL,
    categoria_descripcion VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (categoria_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




-- Tabla productos
CREATE TABLE productos (
    producto_id INT NOT NULL AUTO_INCREMENT,
    producto_nombre VARCHAR(100) NOT NULL,
    producto_descripcion VARCHAR(255) DEFAULT NULL,
    producto_precio DECIMAL(10,2) NOT NULL,
    producto_stock INT DEFAULT 0,
    producto_imagen VARCHAR(255) DEFAULT NULL,
    producto_estado CHAR(3) DEFAULT 'ACT',
    categoria_id INT NOT NULL,
    PRIMARY KEY (producto_id),
    FOREIGN KEY (categoria_id) REFERENCES categorias (categoria_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- Tabla carritos
CREATE TABLE carritos (
    carrito_id INT NOT NULL AUTO_INCREMENT,
    usercod BIGINT(10) NOT NULL,
    carrito_fch DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    carrito_estado CHAR(3) DEFAULT 'PEN',
    PRIMARY KEY (carrito_id),
    FOREIGN KEY (usercod) REFERENCES usuario (usercod)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




-- Tabla detalles del carrito
CREATE TABLE carrito_detalle (
    detalle_id INT NOT NULL AUTO_INCREMENT,
    carrito_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (detalle_id),
    FOREIGN KEY (carrito_id) REFERENCES carritos (carrito_id),
    FOREIGN KEY (producto_id) REFERENCES productos (producto_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




-- Tabla transacciones
CREATE TABLE transacciones (
    transaccion_id INT NOT NULL AUTO_INCREMENT,
    carrito_id INT NOT NULL,
    transaccion_fch DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    transaccion_total DECIMAL(10,2) NOT NULL,
    metodo_pago VARCHAR(50) NOT NULL,
    transaccion_estado CHAR(3) DEFAULT 'EXI',
    PRIMARY KEY (transaccion_id),
    FOREIGN KEY (carrito_id) REFERENCES carritos (carrito_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

