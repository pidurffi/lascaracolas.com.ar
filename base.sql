
CREATE TABLE `contacto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mensaje` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `fos_user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  `username_canonical` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_canonical` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `fos_user` (`id`, `username`, `email`, `enabled`, `salt`, `password`, `last_login`, `locked`, `expired`, `expires_at`, `confirmation_token`, `password_requested_at`, `roles`, `credentials_expired`, `credentials_expire_at`, `username_canonical`, `email_canonical`) VALUES
(1, 'admin', 'admin@example.com', 1, 'qg8sjnavsmoogo80w0ck0ooow0k8s04', '$2y$13$vYeEqbWVD4ZQG8JjLzjv/OjedUyn9n.g/eOK0WmyZDWQDrX0h45dO', '2018-07-24 02:50:59', 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:\"ROLE_ADMIN\";}', 0, NULL, 'admin', 'admin@example.com');

CREATE TABLE `galeria` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `galeria` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `galeria` (`id`, `nombre`, `galeria`) VALUES
(1, 'Galería Home', 'a:2:{i:0;s:52:\"cropped/c0aa23b56d0be8d46ac424917ac1466f2841b2bd.jpg\";i:1;s:52:\"cropped/ab39f51c8dc1d0d0e57f68b768910d6a0b5176ee.jpg\";}'),
(2, '2 Personas - Superior', 'a:4:{i:0;s:52:\"cropped/c6784a57fca0f9c98f956497db3e6112e64e3e5b.jpg\";i:1;s:52:\"cropped/d792075b5dddf6a9e24930e1cd60f1d1cc560afd.jpg\";i:2;s:52:\"cropped/f86c8e2109820508d9d90983c45d07b2058a7ead.jpg\";i:3;s:52:\"cropped/eb79b78c61cfc5a9564171d3810e54c0d826f24b.jpg\";}'),
(3, '2 Personas - Premium', 'a:0:{}'),
(4, '2 Personas - Classic', 'a:0:{}'),
(5, '3-5 Personas - Exclusivas', 'a:0:{}'),
(6, '3-5 Personas - Piedra Azul', 'a:0:{}'),
(7, '3-5 Personas - El Puente', 'a:0:{}'),
(8, '6-7 Personas - Cortaderas', 'a:0:{}'),
(9, '6-7 Personas - Mares', 'a:0:{}');

CREATE TABLE `promocion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_publicacion` date NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `generica` tinyint(1) DEFAULT NULL,
  `descripcion` longtext COLLATE utf8mb4_unicode_ci,
  `mensaje` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orden` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `promocion` (`id`, `nombre`, `fecha_publicacion`, `fecha_vencimiento`, `generica`, `descripcion`, `mensaje`, `imagen`, `orden`) VALUES
(1, 'Escapadas de Fin de Semana', '2013-01-01', '2020-01-01', 1, 'Reserva mínima: 2 noches\r\nLATE CHECK OUT', NULL, 'cropped/025c8bfe6c90c86c0ac1ca0fd92f8c95610b881a.jpg', NULL),
(2, 'Escapadas Entresemana', '2013-01-01', '2022-01-01', 1, 'De Lunes a Viernes te esperamos para disfrutar de la soledad del bosque y el mar.', NULL, 'cropped/a64593a2dce17cff439ab089032561d3a96faa1d.jpg', NULL),
(3, 'VACACIONES DE INVIERNO', '2013-01-01', '2022-01-01', 1, 'Tenemos muchas opciones para ofrecerte en este descanso de mitad de Año!!!', NULL, 'cropped/b9efdfe1e22443fa75123ec6ce7e77b9a4b676fc.jpg', NULL);


ALTER TABLE `contacto`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `fos_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  ADD UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`);

ALTER TABLE `galeria`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `promocion`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `contacto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `fos_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
ALTER TABLE `galeria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
ALTER TABLE `promocion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
  
  ALTER TABLE `contacto` ADD `fecha_ingreso` DATE NULL DEFAULT NULL AFTER `mensaje`, ADD `fecha_salida` DATE NULL DEFAULT NULL AFTER `fecha_ingreso`, ADD `cantidad_adultos` INT NOT NULL DEFAULT '0' AFTER `fecha_salida`, ADD `cantidad_ninos` INT NOT NULL DEFAULT '0' AFTER `cantidad_adultos`;
  ALTER TABLE `contacto` ADD `fecha` DATETIME NOT NULL AFTER `cantidad_ninos`;