/* Relación tipo 1:1 */
-- PASO 1
-- Tu código aquí


-- PASO 2
-- Tu código aquí


-- PASO 3
-- Tu código aquí

ALTER TABLE usuarios 
ADD COLUMN id_rol INT 

UPDATE usuarios
SET id_rol=FLOOR(17+RAND()* 4)
WHERE id_rol IS NULL
-- Valores roles.nombre se posicionan en id_rol :17 a 20

ALTER TABLE usuarios ADD FOREIGN KEY (id_rol) REFERENCES roles(id_rol);



-- PASO 4
-- Tu código aquí
SELECT usuarios.id_usuario, usuarios.nombre, usuarios.apellido, usuarios.email, usuarios.edad, roles.nombre_rol
FROM usuarios JOIN roles ON usuarios.id_rol=roles.id_rol;


/* Relación tipo 1:N */
-- PASO 1
-- Tu código aquí

CREATE TABLE categorias (
id_categoria INT auto_increment primary KEY,
nombre_categoria varchar(50)
);

INSERT INTO categorias (nombre_categoria) VALUES
('Electrónicos'),
('Ropa y Accesorios'),
('Libros'),
('Hogar y Cocina'),
('Deportes y aire libre'),
('Salud y cuidado personal'),
('Herramientas y mejoras para el hogar'),
('Juguetes y juegos'),
('Automotriz'),
('Música y Películas');


-- PASO 2
-- Tu código aquí
alter TABLE usuarios
ADD COLUMN id_categoria INT;

-- PASO 3
-- Tu código aquí
SET SQL_SAFE_UPDATES= 0;
--Se desactiva el mode safe para poder no usar el WHERE al actualizar datos y asociar id_categorias aleatorios del 1 al 10

UPDATE usuarios
SET id_categoria=FLOOR(1+RAND()* 10)


-- PASO 4
-- Tu código aquí
SELECT usuarios.id_usuario, usuarios.nombre, usuarios.apellido, usuarios.email, usuarios.edad, roles.nombre_rol, categorias.nombre_categoria
FROM usuarios 
JOIN categorias ON usuarios.id_categoria=categorias.id_categoria
JOIN roles ON usuarios.id_rol=roles.id_rol;

/* Relación tipo N:M */
-- PASO 1
-- Tu código aquí
CREATE TABLE usuarios_categorias (
id_usuario_categoria INT auto_increment primary KEY,
id_categoria INT,
id_usuario INT
);


ALTER TABLE usuarios_categorias ADD FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario);
ALTER TABLE usuarios_categorias ADD FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria);




-- PASO 2
-- Tu código aquí


INSERT INTO usuarios_categorias (id_usuario, id_categoria) VALUES
(1, 1), (1, 2), (1, 3),
(2, 4), (2, 5),
(3, 6), (3, 7),
(4, 8), (4, 9), (4, 10);


-- PASO 3
-- Tu código aquí
select usuarios.id_usuario, usuarios.nombre, usuarios.apellido, usuarios.email, usuarios.edad,
 categorias.nombre_categoria,roles.nombre_rol
FROM usuarios_categorias
join usuarios ON usuarios_categorias.id_usuario=usuarios.id_usuario
join categorias ON usuarios_categorias.id_categoria=categorias.id_categoria
join roles ON usuarios.id_rol=roles.id_rol