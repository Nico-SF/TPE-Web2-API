-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-11-2023 a las 03:40:02
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ecommerce_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `categoria_id` int(11) NOT NULL,
  `categoria_nombre` varchar(200) NOT NULL,
  `categoria_img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`categoria_id`, `categoria_nombre`, `categoria_img`) VALUES
(1, 'Almacenamiento', 'https://us.123rf.com/450wm/maxpraym/maxpraym2006/maxpraym200600001/148739475-conjunto-de-disco-duro-unidades-de-estado-s%C3%B3lido-cuadradas-nuevas-isom%C3%A9tricas-negras-ilustraciones.jpg'),
(2, 'Procesadores', 'https://assets-global.website-files.com/63a9fb94e473f36dbe99c1b1/648a3b59b2b26d52c0636d34_lY8CSUf2QTW7sfIWR3GY.svg'),
(3, 'Motherboars', 'https://previews.123rf.com/images/vadymg/vadymg1506/vadymg150600044/41834357-motherboard-isom%C3%A9trica-detallada-icono-de-gr%C3%A1fico-vectorial-ilustraci%C3%B3n.jpg'),
(4, 'Placas de Video', 'https://img.freepik.com/vector-premium/tarjeta-grafica-video-isometrica-3d-isometrica-tarjeta-grafica-dispositivo-componente-hardware-computadora-personal-ilustracion-vectorial_561158-2686.jpg?w=2000'),
(5, 'Memorias RAM', 'https://thumbs.dreamstime.com/z/dise%C3%B1o-simple-e-isom%C3%A9trico-de-ram-computadora-memoria-del-ordenador-isom%C3%A9trica-dise%C3%B1ada-sobre-fondo-blanco-187605011.jpg'),
(6, 'Fuentes de alimentacion', 'https://previews.123rf.com/images/reenya/reenya1706/reenya170600052/80272866-isom%C3%A9trico-plano-3d-aislado-concepto-vector-hardware-fuente-de-alimentaci%C3%B3n-icono-para-el-dise%C3%B1o-del.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `producto_id` int(11) NOT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `producto_nombre` varchar(200) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(15,2) NOT NULL,
  `imagen_url` varchar(255) NOT NULL,
  `oferta` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`producto_id`, `categoria_id`, `producto_nombre`, `descripcion`, `precio`, `imagen_url`, `oferta`) VALUES
(1, 1, 'Disco Solido interno Kingston SA400S37/960G 960GB', 'Considerado un dispositivo de alto rendimiento, la unidad en estado sólido A400 de Kingston está diseñada para las personas más exigentes. Mejora de forma notable la capacidad de respuesta de su sistema, ya que alcanza velocidades de lectura/escritura de hasta 500MB/seg y 450MB/seg. Por ende, es 10 veces más rápido que un disco duro tradicional. Al estar compuesta por una memoria flash es silenciosa y posee pocas probabilidades de tener fallas.', 15000.00, 'https://http2.mlstatic.com/D_NQ_NP_2X_833729-MLA71520897901_092023-F.webp', 0),
(2, 1, 'Disco Solido Ssd 500 Gb Sata Crucial Bx500', 'Añada memoria flash a tu portátil u ordenador de escritorio con la unidad de estado sólido Crucial BX500. Vas a poder cargar todo tipo de archivos en tu PC con rapidez.', 11500.00, 'https://http2.mlstatic.com/D_NQ_NP_2X_925187-MLA51839759055_102022-F.webp', 1),
(3, 1, 'Disco Solido Ssd Adata Su650 120gb 2.5 Sata Nand 3d', 'Mejora el rendimiento de tu computadora con el disco sólido interno Adata Ultimate SU650 ASU650SS-120GT-R de 120GB. Este SSD de alta calidad te brinda una capacidad de almacenamiento de 120GB, perfecta para guardar tus archivos, documentos y programas más importantes. Gracias a su tecnología de almacenamiento SSD y su interfaz SATA III, experimentarás una velocidad de lectura y escritura increíblemente rápida, lo que se traduce en un arranque más veloz y un mejor rendimiento en tus aplicaciones. Además, su factor de forma de 2.5 pulgadas lo hace compatible con la mayoría de las computadoras portátiles y de escritorio. No esperes más y dale a tu equipo la actualización que necesita con el disco sólido interno Adata Ultimate SU650.', 23450.00, 'https://http2.mlstatic.com/D_NQ_NP_2X_687068-MLA50401103109_062022-F.webp', 0),
(4, 2, 'Procesador AMD RYZEN 3 3200G 4.0GHz Turbo', 'Mejora tu experiencia de juego con el Procesador gamer AMD Ryzen 3 3200G, diseñado para brindarte un rendimiento óptimo en tus partidas. Con sus 4 núcleos y una frecuencia máxima de 4 GHz, disfrutarás de una velocidad y fluidez excepcionales en tus juegos favoritos. Además, su arquitectura x86-64 te garantiza una compatibilidad amplia con diversos sistemas y aplicaciones.', 89500.00, 'https://http2.mlstatic.com/D_NQ_NP_2X_873867-MLA54354748945_032023-F.webp', 0),
(5, 2, 'Procesador AMD RYZEN 5 3600 4.2GHz Turbo AM4 Wraith Stealth Cooler', 'Clave en el rendimiento de tu computadora de escritorio, ya no tenés que pensar en cómo distribuir el tiempo y acciones porque ahora las tareas en simultáneo son posibles.AMD cuenta con un catálogo de productos que se adaptan a los requerimientos de todo tipo de usuarios: juegos en línea, edición a gran escala, contenido en múltiples plataformas y más.', 185000.00, 'https://http2.mlstatic.com/D_NQ_NP_981849-MLA70281492071_072023-O.webp', 1),
(6, 2, 'Procesador AMD Ryzen 9 5950X 4.9GHz Turbo AM4', 'Clave en el rendimiento de tu computadora de escritorio, ya no tenés que pensar en cómo distribuir el tiempo y acciones porque ahora las tareas en simultáneo son posibles.AMD cuenta con un catálogo de productos que se adaptan a los requerimientos de todo tipo de usuarios: juegos en línea, edición a gran escala, contenido en múltiples plataformas y más.', 559900.00, 'https://http2.mlstatic.com/D_NQ_NP_981849-MLA70281492071_072023-O.webp', 0),
(7, 3, 'Mother ASUS ROG STRIX B650-A GAMING WIFI AM5 DDR5', 'la placa base asus rog strix b650-a gaming wifi 6e en blanco y plateado esta diseñada con un suministro de energia mejorado y refrigeracion optimizada para hacer frente a las demandas de los potentes procesadores de la serie ryzen 7000. junto con wi-fi 6e y pci express 5.0 para velocidades de transferencia y almacenamiento ultrarrapidos, rog strix b650-a gaming wifi 6e esta listo para tomar el timon de su equipo de juego blanco limpio y ordenado.', 570000.00, 'https://http2.mlstatic.com/D_NQ_NP_2X_839139-MLA71655979091_092023-F.webp', 0),
(8, 3, 'Mother ASUS ROG STRIX Z790-A GAMING WIFI LGA1700 DDR4', 'La placa madre ASUS ROG STRIX Z790-A GAMING WIFI es la elección definitiva para los entusiastas de los juegos y los creadores de contenido que buscan una potencia extraordinaria y un rendimiento excepcional. Equipada con el último zócalo LGA1700 de Intel y compatibilidad con memorias DDR4 de alta velocidad, esta placa madre está diseñada para ofrecer un impulso significativo en el rendimiento de tu PC.', 560000.00, 'https://http2.mlstatic.com/D_NQ_NP_2X_998740-MLU69631589660_052023-F.webp', 0),
(9, 3, 'Mother GIGABYTE H610M S2H DDR4 S1700', 'La placa madre GIGABYTE H610M S2H DDR4 S1700 es la elección ideal para aquellos que buscan una solución confiable y eficiente para su sistema. Diseñada con la última tecnología y compatibilidad con la memoria DDR4, esta placa madre ofrece un rendimiento sólido y un conjunto de características esenciales.', 105000.00, 'https://http2.mlstatic.com/D_NQ_NP_2X_752324-MLU54982169178_042023-F.webp', 0),
(10, 4, 'Placa de Video ASUS Phoenix GeForce GTX 1630 4GB GDDR6', 'La Placa de Video ASUS Phoenix GeForce GTX 1630 4GB GDDR6 es la elección definitiva para los jugadores y creadores de contenido que buscan un rendimiento de juego excepcional a un precio asequible. Con la última arquitectura de NVIDIA, esta tarjeta gráfica está diseñada para brindar un impulso significativo en el rendimiento de tus juegos favoritos y tareas de edición de video.', 212000.00, 'https://http2.mlstatic.com/D_NQ_NP_2X_973294-MLA54584820810_032023-F.webp', 1),
(11, 4, 'Placa de Video ASUS GeForce GTX 1660 SUPER 6GB GDDR6 TUF', 'La Placa de Video ASUS GeForce GTX 1660 SUPER 6GB GDDR6 TUF es la elección perfecta para los jugadores que buscan un rendimiento de juego excepcional y una construcción robusta que dure. Con la tecnología de juegos más avanzada y una potente capacidad de procesamiento, esta tarjeta gráfica está diseñada para brindar una experiencia de juego excepcional.', 105000.00, 'https://http2.mlstatic.com/D_NQ_NP_2X_966508-MLA54494547397_032023-F.webp', 0),
(12, 4, 'Placa de Video MSI GeForce RTX 3090 24GB GDDR6X VENTUS 3X OC', 'La Placa de Video MSI GeForce RTX 3090 24GB GDDR6X VENTUS 3X OC es la elección definitiva para los jugadores y creadores de contenido que buscan una potencia gráfica sin igual. Con una memoria masiva y una arquitectura avanzada, esta tarjeta gráfica está diseñada para brindar un rendimiento de juego y una capacidad de creación de contenido que desafía los límites de lo posible.', 805000.00, 'https://http2.mlstatic.com/D_NQ_NP_2X_842496-MLA51455371057_092022-F.webp', 0),
(13, 5, 'Memoria Adata DDR4 16GB (2x8GB) 4133MHz XPG Spectrix D60G RGB', 'La memoria DDR4 Adata XPG Spectrix D60G RGB de 16GB (2x8GB) 4133MHz combina un rendimiento excepcional con una iluminación RGB deslumbrante para llevar tus experiencias de juego y rendimiento de PC al siguiente nivel.', 65000.00, 'https://http2.mlstatic.com/D_NQ_NP_2X_830927-MLA41934592089_052020-F.webp', 1),
(14, 5, 'Memoria Corsair DDR4 8GB 2666Mhz Vengeance LPX Black', 'La memoria Corsair DDR4 8GB 2666MHz Vengeance LPX Black es la elección perfecta para mejorar el rendimiento de tu PC. Con una velocidad de memoria sólida y la calidad reconocida de Corsair, esta memoria es una opción confiable y eficiente para satisfacer tus necesidades informáticas.', 24000.00, 'https://http2.mlstatic.com/D_NQ_NP_2X_743504-MLA48049378159_102021-F.webp', 1),
(15, 5, 'Memoria GeiL DDR4 16GB (2x8GB) 3600MHz Orion RGB', 'La memoria GeiL DDR4 16GB (2x8GB) 3600MHz Orion RGB combina un rendimiento de alta velocidad con una iluminación RGB espectacular para ofrecerte una experiencia de juego y rendimiento de PC excepcionales.', 47000.00, 'https://http2.mlstatic.com/D_NQ_NP_704398-MLA70940109075_082023-O.webp', 0),
(16, 6, 'Fuente Be Quiet 1000W 80 Plus Gold PURE POWER 11 Full Modular', 'La fuente de poder Be Quiet! 1000W 80 Plus Gold PURE POWER 11 Full Modular es la elección perfecta para aquellos que buscan una fuente de alimentación confiable y eficiente para sus sistemas de alta potencia. Con un diseño completamente modular, eficiencia energética y un funcionamiento silencioso, esta fuente de poder es esencial para los entusiastas y constructores de PC.', 58000.00, 'https://imagenes.compragamer.com/productos/compragamer_Imganen_general_34993_Fuente_Be_Quiet_1000W_80_Plus_Gold_PURE_POWER_11_Full_Modular_3d25f718-grn.jpg', 0),
(17, 6, 'Fuente ASUS ROG STRIX 1000W 80 Plus Gold Full Modular 1000G', 'La fuente de poder ASUS ROG STRIX 1000W 80 Plus Gold Full Modular 1000G es la elección perfecta para los jugadores y constructores de sistemas de alto rendimiento. Con una capacidad de 1000W, certificación 80 Plus Gold y diseño completamente modular, esta fuente de poder garantiza un rendimiento confiable y eficiencia energética.', 124000.00, 'https://imagenes.compragamer.com/productos/compragamer_Imganen_general_33006_Fuente_ASUS_ROG_STRIX_1000W_80_Plus_Gold_Full_Modular_1000G_8c2a799c-grn.jpg', 0),
(18, 6, 'Fuente Deepcool 700W DA700 80 Plus Bronze', 'La fuente de poder Deepcool 700W DA700 80 Plus Bronze es una opción sólida para aquellos que buscan una fuente de alimentación confiable y eficiente para sus sistemas de nivel medio. Con una capacidad de 700W y certificación 80 Plus Bronze, esta fuente de poder ofrece un rendimiento eficiente y estable.', 43000.00, 'https://imagenes.compragamer.com/productos/compragamer_Imganen_general_33806_Fuente_Deepcool_700W_DA700_80_Plus_Bronze_65a49133-grn.jpg', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario_id` int(11) NOT NULL,
  `usuario_nombre` varchar(200) NOT NULL,
  `usuario_pass` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario_id`, `usuario_nombre`, `usuario_pass`) VALUES
(2, 'webadmin', '$2y$10$7yTAQ1oEKPk071dHEpxVJ.sQJY8fbWH9BAvCbi8XJ2bJzjG52bKWy');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`categoria_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`producto_id`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `categoria_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `producto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usuario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`categoria_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
