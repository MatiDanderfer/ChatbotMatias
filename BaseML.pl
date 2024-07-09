producto('SmartTv', 'LG', 'Televisores', 300000, 'EstebanF').
producto('Laptop', 'Dell', 'Computacion', 80000, 'MariaS').
producto('Refrigerador', 'Samsung', 'Electrodomestico', 60000, 'CarlosG').
producto('RopaDeportiva', 'Nike', 'Ropa', 1500, 'LauraM').
producto('Tablet', 'Apple', 'Computacion', 25000, 'PedroA').
producto('CocinaGas', 'Bosch', 'Electrodomestico', 45000, 'AnaR').
producto('Reloj', 'Casio', 'Relojes', 2000, 'RobertoP').
producto('Zapatillas', 'Adidas', 'Zapatos', 3000, 'MariaL').
producto('Bicicleta', 'Trek', 'Bicicletas', 15000, 'JavierG').
producto('Aspiradora', 'Dyson', 'Electrodomestico', 12000, 'CarlaB').
producto('Libro', 'Penguin', 'Libros', 500, 'DanielC').
producto('Mesa', 'Ikea', 'Muebles', 3500, 'LuisE').
producto('CamaraDigital', 'Canon', 'Camaras', 7000, 'PaulaM').
producto('ZapatosDeportivos', 'Reebok', 'Zapatos', 2800, 'ElenaS').
producto('Licuadora', 'Oster', 'Electrodomestico', 1800, 'MiguelG').
producto('SillaPlegable', 'Lifetime', 'Muebles', 800, 'AndresL').
producto('GuitarraAcustica', 'Fender', 'InstrumentosMusicales', 12000, 'JuanP').
producto('Bolso', 'Louis Vuitton', 'Accesorios', 5000, 'IsabelD').
producto('Monitor', 'HP', 'Computacion', 6000, 'JorgeT').
producto('Microondas', 'Panasonic', 'Electrodomestico', 2500, 'CarmenP').
producto('PelotaFutbol', 'Nike', 'Deportes', 100, 'SergioR').
producto('CepilloDientes', 'Oral-B', 'Belleza', 150, 'AnaL').
producto('Teclado', 'Logitech', 'Computacion', 600, 'DavidC').
producto('MaquinaCafe', 'Nespresso', 'Electrodomestico', 4000, 'RaquelM').
producto('Toallas', 'Cannon', 'Belleza', 200, 'MartaP').
producto('BolsoPlaya', 'Speedo', 'Accesorios', 1200, 'RicardoV').
producto('MesaNoche', 'IKEA', 'Muebles', 1000, 'MonicaF').
producto('Gorra', 'New Era', 'Accesorios', 800, 'AdrianaR').
producto('Mouse', 'Microsoft', 'Computacion', 300, 'PedroG').
producto('SecadoraPelo', 'Remington', 'Belleza', 2200, 'LuciaC').
producto('GafasSol', 'Ray-Ban', 'Lentes', 1200, 'GabrielB').
producto('Botas', 'Timberland', 'Zapatos', 3500, 'TeresaM').
producto('LibrosCocina', 'Grijalbo', 'Libros', 600, 'OlgaS').
producto('Sofa', 'La-Z-Boy', 'Muebles', 7000, 'CarlosR').
producto('PianoDigital', 'Yamaha', 'InstrumentosMusicales', 9000, 'IsaacK').
producto('BicicletaEjercicio', 'ProForm', 'Deportes', 5500, 'RafaelN').
producto('CortadoraCesped', 'Black&Decker', 'Jardineria', 1200, 'AnaV').
producto('LaptopGaming', 'MSI', 'Computacion', 15000, 'FelipeS').
producto('AireAcondicionado', 'Carrier', 'Electrodomestico', 7000, 'LuisM').
producto('RelojPulsera', 'Fossil', 'Relojes', 350, 'SilviaL').
producto('SillaOficina', 'Herman Miller', 'Muebles', 4000, 'JavierR').
producto('TecladoMecanico', 'Corsair', 'Computacion', 1200, 'EduardoC').
producto('Sandwichera', 'Hamilton Beach', 'Electrodomestico', 600, 'CamilaP').
producto('BicicletaMontaña', 'Trek', 'Bicicletas', 7500, 'DiegoF').
producto('BolsoViaje', 'Samsonite', 'Maletas', 3000, 'MonicaL').
producto('Pendientes', 'Pandora', 'Joyeria', 120, 'LorenaG').
producto('Impresora', 'Epson', 'Computacion', 900, 'JorgeL').
producto('Cafetera', 'Keurig', 'Electrodomestico', 800, 'SandraR').
producto('RaquetaTenis', 'Wilson', 'Deportes', 2000, 'RobertoV').
producto('Mochila', 'North Face', 'Accesorios', 1500, 'ElenaG').
producto('SillaComedor', 'Ikea', 'Muebles', 350, 'AlejandroS').
producto('Altavoces', 'Bose', 'Electronica', 3500, 'AdrianP').
producto('GuitarraElectrica', 'Gibson', 'InstrumentosMusicales', 7000, 'MariaH').
producto('Lavadora', 'Whirlpool', 'Electrodomestico', 6500, 'RamonC').


buscar_nombre(nombre, Marca, Categoria, Precio, Duenio) :- producto(nombre, Marca, Categoria, Precio, Duenio).

buscarnom(X, Y, Z, P, D) :- producto(X, Y, Z, P, D).

buscar_marca(MarcaBuscada) :-  
    producto(X, MarcaBuscada, Y, Z, G).

buscar_marca(MarcaBuscada) :-
    producto(X, MarcaBuscada, Y, Z, G),
    buscar_marca(MarcaBuscada,X).

buscar_precioMenor(MaxPrecio) :- producto(Producto, Marca, Categoria, Precio, Duenio), Precio =< MaxPrecio.