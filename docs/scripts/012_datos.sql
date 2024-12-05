use v_economico

---Tabla de Usuarios---
insert into usuario (usercod, useremail, username, userpswd, userfching, userpswdest, userpswdexp, userest, useractcod, userpswdchg, usertipo)
values
  ('1','alejandraorellana@gmail.com','AOrellana','$2y$10$pAOh.40Fr8mmsgY1HB7m.Ozlv0oAcl.opgnnBvrsZc82PYZctOiZ.','2024-11-15 21:19:20','ACT','2025-02-13 00:00:00','ACT','c2df22bdb1e03fe60a584740d817ad7dfee53726dcfbce2333e65e08e32c3be6','2024-11-15 21:19:20','ADM'),
  ('2','bdanielamolina.r@gmail.com','Bdmoli','$2y$10$E0Rl8SVR3GCpzF68vk.uGurO/7wguxF7tUdQ0LvuycL0yDBv61G0G','2024-11-15 21:19:57','ACT','2025-02-13 00:00:00','ACT','0e8f2af1beeb8cf06493d097ff89bf04955bfe7dca2b7c9fbff8b63fbaf434b2','2024-11-15 21:19:57','AUD'),
  ('3','molinajudith0402@gmail.com','RValladares','$2y$10$0JHGapRM93odP7vPghKtbudY647g9xsxfaRXlr6YDKKQUn4kDJlhi','2024-11-15 21:20:27','ACT','2025-02-13 00:00:00','ACT','cd57f91d6cea532119b648a0a4650adf3462fa91f46dbd97d8826fa201a51176','2024-11-15 21:20:27','PBL'),
  ('4','micheco43@gmail.com','MCorea','$2y$10$drZ6K/bH8hHolNcFZEwaaO5FfaI8g7ZBMPewOysEV7BD41KvZNjOS','2024-11-15 21:21:08','ACT','2025-02-13 00:00:00','ACT','6e1029a97ce11e00fc0f2fcc5d5a6b20a85a228090c74aa6cbfa763a8bba2d23','2024-11-15 21:21:08','PBL'),
  ('5','trejogrissel26@gmail.com','GTrejo','$2y$10$D0SHbp19pJIBSESqiODNxeNRzhvzsPoc3cEqh6nKEB0GGKVYI3N.u','2024-11-15 21:21:37','ACT','2025-02-13 00:00:00','ACT','d331970536d5625c5e5eeda61ec80e9dd3d4b80cc2723905ddde1488f8fed9ea','2024-11-15 21:21:37','ADM'),
  ('6','katherineaguilar575@gmail.com','KMAguilar','$2y$10$2tAGM/lFS5RC.b4Z7ERxWOX.xA7H4G8nw69PbGPZDKOkvMDQZwDr2','2024-11-15 21:22:11','ACT','2025-02-13 00:00:00','ACT','1eac9790c4d14dcca17f8f9341b0a7b4951432708fbcdaed33e13b95efc4accc','2024-11-15 21:22:11','PBL'),
  ('7','maylinchavez504@gmail.com','MayChavez','$2y$10$/lSBkMAaD4l3l1WSUn2P9uK8AUQoGQ4mQPS8FTnZXOtsZvRqFjgOa','2024-11-15 21:22:46','ACT','2025-02-13 00:00:00','ACT','1daff558e342a85fc055b132563cc123a135c23f48da977df11b799684e7475f','2024-11-15 21:22:46','PBL'),
  ('8','desarrollador@desa.com','Desarrollador','$2y$10$pJzjcuUeX2mjf4R8jsOtLuctL0qKX2RNjpjT2X1iLjvTGLD.wqW/2','2024-11-16 19:14:40','ACT','2025-02-13 00:00:00','ACT','5163b1f76734da71f24da4a985400f00c1ba928af2a465939cfa0b4edae30e2c','2024-11-16 19:14:40','ADM');

---Contraseñas---
---1    Qwerty1!---
---2    Qwerty2"---
---3    Qwerty3#---
---4    Qwerty4$---
---5    Qwerty5%---
---6    Qwerty6&---
---7    Qwerty7/---
---8    Qwerty8(---

---Tabla de Roles---
insert into roles (rolescod, rolesdsc, rolesest)
values
  ('Admin', 'Administrador de Tablas Genericas', 'ACT'),
  ('Auditor', 'Auditor del Sistema', 'ACT'),
  ('Desarrollador', 'Desarrollador del Sistema', 'ACT'),
  ('Comprador', 'Comprador de prueba del sistema', 'ACT'),
  ('Vendedor', 'Vendedor autorizado a mostrar el sistema', 'ACT');

---Tabla de Funciones---
insert into funciones (fncod, fndsc, fnest, fntyp)
values
  ('Menu_carrito', 'Menu_carrito', 'ACT', 'MNU'),
  ('Menu_PaymentCheckout', 'Menu_PaymentCheckout', 'ACT', 'MNU'),
  ('Menu_historial', 'Menu_historial', 'ACT', 'MNU'),
  ('Menu_Home_Products', 'Menu_Home_Products', 'ACT', 'MNU'),
  ('Menu_products', 'Menu_products', 'ACT', 'MNU'),
  ('Controllers\Carrito\CartController', 'Controllers\Carrito\CartController', 'ACT', 'CTR'),
  ('Controllers\Checkout\Checkout', 'Controllers\Checkout\Checkout', 'ACT', 'CTR'),
  ('Controllers\Checkout\Accept', 'Controllers\Checkout\Accept', 'ACT', 'CTR'),
  ('Controllers\Checkout\TransaccionC', 'Controllers\Checkout\TransaccionC', 'ACT', 'CTR'),
  ('Controllers\HomeController', 'Controllers\HomeController', 'ACT', 'CTR'),
  ('Controllers\Products\ProductF', 'Controllers\Products\Products', 'ACT', 'CTR'),
  ('Controllers\Products\Products', 'Controllers\Products\Product', 'ACT', 'CTR'),
  ('productos_DEL_enabled', 'productos_DEL_enabled', 'ACT', 'FNC'),
  ('productos_INS_enabled', 'productos_INS_enabled', 'ACT', 'FNC'),
  ('productos_UPD_enabled', 'productos_UPD_enabled', 'ACT', 'FNC');
  ---FNC funcion, CTR controlador---

---Tabla de Roles-Usuarios---
insert into roles_usuarios (usercod, rolescod, roleuserest, roleuserfch, roleuserexp)
values
  ('1', 'Admin', 'ACT', '2024-11-15 00:00:00', '2025-11-15 00:00:00'),
  ('2', 'Auditor', 'ACT', '2024-11-15 00:00:00', '2025-11-15 00:00:00'),
  ('3', 'Comprador', 'ACT', '2024-11-15 00:00:00', '2025-11-15 00:00:00'),
  ('4', 'Comprador', 'ACT', '2024-11-15 00:00:00', '2025-11-15 00:00:00'),
  ('5', 'Auditor', 'ACT', '2024-11-15 00:00:00', '2025-11-15 00:00:00'),
  ('6', 'Admin', 'ACT', '2024-11-15 00:00:00', '2025-11-15 00:00:00'),
  ('7', 'Comprador', 'ACT', '2024-11-15 00:00:00', '2025-11-15 00:00:00');
 
---Tabla de Funciones-Roles---
insert into funciones_roles (rolescod, fncod, fnrolest, fnexp)
values
  ('Admin', 'Controllers\Carrito\CartController', 'ACT', '2025-12-31'),
  ('Admin', 'Controllers\Checkout\Accept', 'ACT', '2025-12-31'),
  ('Admin', 'Controllers\Checkout\Checkout', 'ACT', '2025-12-31'),
  ('Admin', 'Controllers\Checkout\TransaccionC', 'ACT', '2025-12-31'),
  ('Admin', 'Controllers\HomeController', 'ACT', '2025-12-31'),
  ('Admin', 'Controllers\Products\ProductF', 'ACT', '2025-12-31'),
  ('Admin', 'Controllers\Products\Products', 'ACT', '2025-12-31'),
  ('Admin', 'Menu_carrito', 'ACT', '2025-12-31'),
  ('Admin', 'Menu_historial', 'ACT', '2025-12-31')
  ('Admin', 'Menu_Home_Products', 'ACT', '2025-12-31'),
  ('Admin', 'Menu_PaymentCheckout', 'ACT', '2025-12-31'),
  ('Admin', 'Menu_products', 'ACT', '2025-12-31'),
  ('Admin', 'productos_DEL_enabled', 'ACT', '2025-12-31'),
  ('Admin', 'productos_INS_enabled', 'ACT', '2025-12-31'),
  ('Admin', 'productos_UPD_enabled', 'ACT', '2025-12-31'),
  ('Auditor', 'Controllers\Carrito\CartController', 'ACT', '2025-12-31'),
  ('Auditor', 'Controllers\Checkout\Accept', 'ACT', '2025-12-31'),
  ('Auditor', 'Controllers\Checkout\Checkout', 'ACT', '2025-12-31'),
  ('Auditor', 'Controllers\Checkout\TransaccionC', 'ACT', '2025-12-31'),
  ('Auditor', 'Controllers\HomeController', 'ACT', '2025-12-31'),
  ('Auditor', 'Controllers\Products\ProductF', 'ACT', '2025-12-31'),
  ('Auditor', 'Controllers\Products\Products', 'ACT', '2025-12-31'),
  ('Auditor', 'Menu_carrito', 'ACT', '2025-12-31'),
  ('Auditor', 'Menu_historial', 'ACT', '2025-12-31')
  ('Auditor', 'Menu_Home_Products', 'ACT', '2025-12-31'),
  ('Auditor', 'Menu_PaymentCheckout', 'ACT', '2025-12-31'),
  ('Auditor', 'Menu_products', 'ACT', '2025-12-31'),
  ('Comprador', 'Controllers\Carrito\CartController', 'ACT', '2025-12-31'),
  ('Comprador', 'Controllers\Checkout\Accept', 'ACT', '2025-12-31'),
  ('Comprador', 'Controllers\Checkout\Checkout', 'ACT', '2025-12-31'),
  ('Comprador', 'Controllers\Checkout\TransaccionC', 'ACT', '2025-12-31'),
  ('Comprador', 'Controllers\HomeController', 'ACT', '2025-12-31'),
  ('Comprador', 'Menu_carrito', 'ACT', '2025-12-31'),
  ('Comprador', 'Menu_historial', 'ACT', '2025-12-31')
  ('Comprador', 'Menu_Home_Products', 'ACT', '2025-12-31'),
  ('Comprador', 'Menu_PaymentCheckout', 'ACT', '2025-12-31');

---Tabla de Categorias---
INSERT INTO categorias (categoria_nombre) 
VALUES
('Llantas'), 
('Accesorios'), 
('Herramientas');

---Tabla de Productos---
INSERT INTO productos (producto_nombre, producto_descripcion, producto_precio, producto_imagen, producto_estado, categoria_id) 
VALUES
('Llantas Michelin', 'Llantas de alta durabilidad para motos deportivas', 120.00, 'llantas_michelin.jpg', 'ACT', 1), 
('Casco Integral HJC', 'Casco de seguridad certificado con diseño aerodinámico', 180.00, 'casco_hjc.jpg', 'ACT', 2), 
('Juego de Herramientas Pro', 'Set de herramientas completo para mantenimiento', 85.00, 'herramientas_pro.jpg', 'ACT', 3), 
('Aceite de Motor Castrol', 'Aceite sintético de alto rendimiento', 30.00, 'aceite_castrol.jpg', 'ACT', 2), 
('Guantes Alpinestars', 'Guantes de protección para motociclistas', 40.00, 'guantes_alpinestars.jpg', 'ACT', 2), 
('Llantas Dunlop Sportmax', 'Llantas deportivas de alto rendimiento para motos', 130.00, 'llantas_dunlop.jpg', 'ACT', 1), 
('Casco de Moto AGV Pista', 'Casco de alto rendimiento para motociclismo', 450.00, 'casco_agv_pista.jpg', 'ACT', 2), 
('Kit de Herramientas para Mantenimiento', 'Kit de herramientas esenciales para motos deportivas', 75.00, 'kit_herramientas_mantenimiento.jpg', 'ACT', 3), 
('Aceite Motorex', 'Aceite sintético de alta calidad para motocicletas', 40.00, 'aceite_motorex.jpg', 'ACT', 2), 
('Guantes Fox Racing', 'Guantes de protección premium para motocross', 50.00, 'guantes_fox_racing.jpg', 'ACT', 2), 
('Llantas Metzeler Sportec', 'Llantas de motocicleta de alto rendimiento para carreteras secas', 145.00, 'llantas_metzeler.jpg', 'ACT', 1),
('Casco Bell Moto-9S', 'Casco de moto para carreras off-road con ventilación avanzada', 350.00, 'casco_bell_moto9s.jpg', 'ACT', 2),
('Aceite para Suspensión Ohlins', 'Aceite especializado para suspensión de motos deportivas', 55.00, 'aceite_ohlins.jpg', 'ACT', 2),
('Frenos Shimano XT', 'Frenos de disco hidráulicos para motos deportivas', 300.00, 'frenos_shimano_xt.jpg', 'ACT', 1),
('Kit Completo de Herramientas para Motos', 'Set completo de herramientas para reparación profesional de motos', 90.00, 'kit_herramientas_completo.jpg', 'ACT', 3);



