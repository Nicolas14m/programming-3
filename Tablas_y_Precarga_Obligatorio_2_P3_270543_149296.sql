-- ***************** Creación de tablas y precarga de datos *****************
USE Obligatorio_2_P3_270543_149296;

-- ***************** Creación de tablas *****************

--CREATE TABLE TiposIluminacion(
--Id int identity(1,1) primary key,
--Tipo nvarchar(50) not null,
--Descripcion nvarchar(100)
--)


--CREATE TABLE FichasCuidado(
--Id int identity(1,1) primary key,
--FrecuenciaRiego int not null,
--FrecuenciaUnidadTiempo nvarchar(20) not null,
--Id_TipoIluminacion int references TiposIluminacion(Id) not null,
--Temperatura decimal(4,1) not null
--)

--CREATE TABLE Ambientes(
--Id int identity(1,1) primary key,
--Nombre nvarchar(25) not null,
--)

--CREATE TABLE TiposPlanta(
--Id int identity(1,1) primary key,
--Nombre nvarchar(50) not null unique,
--Descripcion nvarchar(200)
--)


--CREATE TABLE Plantas (
--Id int identity(1,1) primary key,
--Id_TipoPlanta int references TiposPlanta (Id) not null,
--NombreCientifico nvarchar(50) not null unique,
--NombresVulgares nvarchar(100) not null,
--Descripcion nvarchar(500) not null,
--Id_Ambiente int references Ambientes(Id) not null,
--Foto nvarchar(50) not null,
--AlturaMaxima int not null,
--Id_FichaCuidado int references FichasCuidado(Id) not null
--)

--CREATE TABLE Fotos(
--Id int identity(1,1) primary key,
--NombreFoto nvarchar(50) not null,
--Id_Planta int references Plantas (Id) not null
--)


--CREATE TABLE Usuarios(
--Id int identity(1,1) primary key,
--email nvarchar(50) not null unique,
--password nvarchar(50) not null
--)


--CREATE TABLE Compras(
--Id int identity(1,1) primary key,
--FechaCompra datetime not null,
--Id_Usuario int references Usuarios(id) not null,
--)

--CREATE TABLE ComprasPlaza (
--Id int primary key references Compras(Id),
--CostoFlete decimal(10,2),
--TasaCobradaIva decimal(8,2),
--)

--CREATE TABLE ComprasImportacion(
--Id int primary key references Compras(Id),
--OrigenAmericaSur BIT,
--DescMedidasSanitarias varchar(200),
--TasaCobradaImportacion decimal(8,2),
--TasaCobradaArancel decimal(8,2)
--)

--CREATE TABLE ItemsCompra(
--Id_Compra int not null,
--Id_Planta int not null,
--cantidad int not null,
--precioCompraUnitario decimal(8,2) not null,

--CONSTRAINT Control_FK_Id_Compra FOREIGN KEY (Id_Compra) REFERENCES Compras(Id),
--CONSTRAINT Control_FK_Id_Planta FOREIGN KEY (Id_Planta) REFERENCES Plantas(Id),
--CONSTRAINT Control_PK PRIMARY KEY (Id_Compra, Id_Planta)
--)

--CREATE TABLE Parametros(
--Id int identity(1,1) primary key,
--Nombre nvarchar(50) not null,
--Valor int not null,
--Descripcion nvarchar(200)
--)


-- ***************** Precarga de datos *****************

INSERT INTO Usuarios VALUES('admin@gmail.com', 'Admin1234');
INSERT INTO Usuarios VALUES('admin2@gmail.com', 'Pass1234');
INSERT INTO Usuarios VALUES('admin3@gmail.com', 'Contra1234');


INSERT INTO TiposPlanta VALUES ('Arboles', 'Los árboles son plantas con tallo leñoso que se ramifica a cierta altura del suelo.'),
('Arbustos', 'Llamamos arbusto a una planta leñosa que, a diferencia del árbol, no se eleva sobre un solo tronco o fuste, sino que se ramifica desde la misma base.'),
('Matas', 'La mata es un subarbusto o arbusto enano que se distingue del arbusto por la disposición de las ramas a ras del suelo, y por tener menor altura'),
('Hierbas', 'Es una planta que no presenta órganos decididamente leñosos. Los tallos de las hierbas son verdes y generalmente mueren al acabar la buena estación'),
('Glaucofitas','Las glaucofitas es un pequeño grupo de algas unicelulares de agua dulce que comprende unas 13 especies.'),
('Algas rojas','Las algas rojas o rodófitas (filo Rhodophyta)  son un importante grupo de algas que comprende unas 7000 especies de una gran diversidad de formas y tamaños.'),
('Algas verdes', 'Las algas verdes o Chlorophyta sensu lato es el grupo parafilético de las algas estrechamente relacionadas con las plantas terrestres. Se han descrito hasta ahora unas 10.000 especies diferentes'),
('Helechos y afines', 'Las pteridofitas o criptógamas vasculares son plantas terrestres que no producen semillas, ya que se reproducen a través de esporas.'),
('Angiospermas', 'Las angiospermas, comúnmente llamadas plantas con flores, son las plantas que presentan las semillas maduras encerradas en el fruto.'),
('Espermatofitas', 'Son un grupo de plantas que comprende a todos los linajes de plantas vasculares que producen semillas. ');

INSERT INTO TiposIluminacion VALUES('Luz solar directa', 'Ideales para exterior'),
('Luz solar indirecta', 'Ideales para apartamentos con poca luz'),
('Sombra', 'Ideales para lugares con muy poca luz');

INSERT INTO Ambientes VALUES('Interior'),('Exterior'),('Mixta');

INSERT INTO FichasCuidado VALUES(3,'dia',1,18), 
(1,'semana',2,12), 
(5,'año',1,25),
(5,'dia',2,30),
(7,'dia',1,10),
(4,'semana',3,14),
(5,'dia',2,40),
(7,'semana',1,45),
(3,'dia',2,10),
(3,'semana',3,20)

INSERT INTO Plantas (TipoId, NombreCientifico, NombreVulgar, Descripcion, AmbienteId, Foto, AlturaMaxima, FichaCuidadosId)  VALUES 
(2, 'Solanum sublobatum', 'Hierba mora', 'Es una planta herbácea de la familia de las solanáceas; crece silvestre en casi todo el mundo.', 2, 'solanum_sublobatum_001.jpg', 30, 1),
(3, 'Portulaca oleracea', 'Verdolaga', 'Es originaria de la India, Oriente Medio y el sur de Europa (hasta España), en América se considera exótica antigua o nativa', 3, 'portulaca_oleracea_001.jpg', 55, 2),
(7, 'Cyperus odoratus', 'Totorilla', 'Esta planta es un taxón llamativo y común de las ciperáceas, sobre todo en el trópico.', 1, 'cyperus_odoratus_001.jpg', 13, 3),
(2, 'Ipomoea cairica', 'Campanilla, Dedalera', 'Aunque la variedad más conocida es la campanula catharina, existen muchas más variedades interesante que os mostramos a continuación', 2, 'ipomoea_cairica_001.jpg', 60, 4),
(10, 'Cyperus rotundus', 'Cebollin, Cebollon', 'Es una hierba perenne de la familia de las ciperáceas. Dotada de un robusto sistema de raíces y rizomas subterráneos', 3, 'cyperus_rotundus_001.jpg', 32, 5),
(10, 'Eclipta alba', 'Eclipta', 'Son hierbas anuales o perennes, que alcanza un tamaño de hasta 1 m de alto pero frecuentemente mucho menos, raíz axonomorfa, base rizomatosa, estrigosas.', 1, 'eclipta_alba_001.jpg', 100, 6),
(8, 'Pistia stratiotes', 'Repollito de agua, Minirepollo acuatico', 'Su distribución nativa es incierta, pero probablemente pantropical; donde primero fue descrita en el río Nilo cerca del lago Victoria en el interior de África.', 3, 'pistia_stratiotes_001.jpg', 23, 7),
(2, 'Typha angustifolia', 'Totora', 'Varias partes de la planta son comestibles, incluidos durante varias estaciones los brotes latentes en las raíces y las bases de las hojas, el núcleo interno del tallo, las espigas de las flores verdes, el polen maduro y las raíces almidonadas.', 1, 'typha_angustifolia_001.jpg', 10, 8),
(2, 'Ephedra triandra', 'Pico de loro', 'Es un arbusto dioico, apoyante de hasta 2 m de altura, ramas flexuosaso, hojas escamosas opuestas.', 2, 'ephedra_triandra_001.jpg', 19, 9),
(4, 'Lantana camara', 'Lantana, Bandera española', 'Es un arbusto perennifolio de follaje caducifolio; de rápido crecimiento, puede alcanzar hasta 2,5 m de altura', 3, 'lantana_camara_001.jpg', 3, 10);


INSERT INTO Parametros VALUES ('MinDescTipo', 10, 'Cantidad mínima de caracteres para la descripción del tipo'), 
('MaxDescTipo', 200, 'Cantidad máxima de caracteres para la descripción del tipo'),
('MinDescPlanta', 10, 'Cantidad mínima de caracteres para la descripción de la planta'),
('MaxDescPlanta', 500, 'Cantidad máxima de caracteres para la descripción de la planta'),
('IVA', 22, 'El IVA local'),
('TasaImportacion', 60, 'La tasa de importacion'),
('PorcentajeDescuentoArancel', 20, 'Porcentaje descuento de paises de America Latina');
