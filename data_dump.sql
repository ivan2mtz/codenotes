DELETE FROM vehiculos;
ALTER TABLE vehiculos AUTO_INCREMENT= 1;
INSERT INTO vehiculos(nombre) VALUES('Audi');
INSERT INTO vehiculos(nombre) VALUES('BMW');
INSERT INTO vehiculos(nombre) VALUES('Chevrolet');
INSERT INTO vehiculos(nombre) VALUES('Chrysler');
INSERT INTO vehiculos(nombre) VALUES('Dodge');
INSERT INTO vehiculos(nombre) VALUES('Ford');
INSERT INTO vehiculos(nombre) VALUES('Honda');
INSERT INTO vehiculos(nombre) VALUES('Hyundai');
INSERT INTO vehiculos(nombre) VALUES('Nissan');
INSERT INTO vehiculos(nombre) VALUES('Volkswagen');

INSERT INTO tarifas (nombre, fijo, cantidad, activo) VALUES ('Normal', 1, 50, 1);

INSERT INTO lugares (nombre, activo, disponible) VALUES ('A1', 1, 1);
INSERT INTO lugares (nombre, activo, disponible) VALUES ('A2', 1, 1);
INSERT INTO lugares (nombre, activo, disponible) VALUES ('A3', 1, 1);
INSERT INTO lugares (nombre, activo, disponible) VALUES ('A4', 1, 1);
INSERT INTO lugares (nombre, activo, disponible) VALUES ('A5', 1, 1);

INSERT INTO notas (placas, color, modelo, vehiculo_id, tarifa_id, lugar_id, entrada, salida, total, estado) 
VALUES ('12387', 'NEGRO', 'FIGO', 6, 1, 1, '2018-08-02 09:00:00', '2018-08-02 10:00:00', 50, 'PAGADO');
INSERT INTO notas (placas, color, modelo, vehiculo_id, tarifa_id, lugar_id, entrada, salida, total, estado) 
VALUES ('98799', 'ROJO', 'FIESTA', 6, 1, 2, '2018-08-02 09:00:00', '2018-08-02 11:00:00', 50, 'PAGADO');
INSERT INTO notas (placas, color, modelo, vehiculo_id, tarifa_id, lugar_id, entrada, salida, total, estado) 
VALUES ('99009', 'AZUL', 'FOCUS', 6, 1, 3, '2018-08-02 10:00:00', '2018-08-02 12:00:00', 50, 'PAGADO');
INSERT INTO notas (placas, color, modelo, vehiculo_id, tarifa_id, lugar_id, entrada, salida, total, estado) 
VALUES ('34567', 'BLANCO', 'ECOSPORT', 6, 1, 4, '2018-08-02 12:00:00', '2018-08-02 14:00:00', 50, 'PAGADO');
INSERT INTO notas (placas, color, modelo, vehiculo_id, tarifa_id, lugar_id, entrada, salida, total, estado) 
VALUES ('98732', 'VERDE', 'ESCAPE', 6, 1, 5, '2018-08-02 13:00:00', '2018-08-02 14:00:00', 50, 'PAGADO');
INSERT INTO notas (placas, color, modelo, vehiculo_id, tarifa_id, lugar_id, entrada, salida, total, estado) 
VALUES ('12327', 'NEGRO', 'EXPLORER', 6, 1, 1, '2018-08-02 15:00:00', '2018-08-02 17:00:00', 50, 'PAGADO');
INSERT INTO notas (placas, color, modelo, vehiculo_id, tarifa_id, lugar_id, entrada, salida, total, estado) 
VALUES ('98739', 'ROJO', 'EXPEDITION', 6, 1, 2, '2018-08-02 16:00:00', '2018-08-02 18:00:00', 50, 'PAGADO');
INSERT INTO notas (placas, color, modelo, vehiculo_id, tarifa_id, lugar_id, entrada, salida, total, estado) 
VALUES ('99029', 'AZUL', 'LOBO', 6, 1, 3, '2018-08-02 16:00:00', '2018-08-02 17:00:00', 50, 'PAGADO');
INSERT INTO notas (placas, color, modelo, vehiculo_id, tarifa_id, lugar_id, entrada, salida, total, estado) 
VALUES ('34507', 'BLANCO', 'MUSTANG', 6, 1, 4, '2018-08-02 17:00:00', '2018-08-02 19:00:00', 50, 'PAGADO');
INSERT INTO notas (placas, color, modelo, vehiculo_id, tarifa_id, lugar_id, entrada, salida, total, estado) 
VALUES ('98789', 'VERDE', 'RANGER', 6, 1, 5, '2018-08-02 18:00:00', '2018-08-02 20:00:00', 50, 'PAGADO');
