BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS Clientes (
    ID_Cliente INTEGER PRIMARY KEY AUTOINCREMENT,
    Nombre     TEXT    NOT NULL,
    Email      TEXT    NOT NULL UNIQUE,
    Telefono   TEXT
);
CREATE TABLE IF NOT EXISTS Detalles_Pedido (
    ID_Detalle  INTEGER PRIMARY KEY AUTOINCREMENT,
    ID_Pedido   INTEGER NOT NULL,
    ID_Producto INTEGER NOT NULL,
    Cantidad    INTEGER NOT NULL,
    Subtotal    REAL    NOT NULL,
    FOREIGN KEY (ID_Pedido)   REFERENCES Pedidos(ID_Pedido),
    FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto)
);
CREATE TABLE IF NOT EXISTS Pedidos (
    ID_Pedido    INTEGER PRIMARY KEY AUTOINCREMENT,
    ID_Cliente   INTEGER NOT NULL,
    Fecha_compra TEXT    NOT NULL,
    Total_compra REAL    NOT NULL,
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente)
);
CREATE TABLE IF NOT EXISTS Productos (
    ID_Producto INTEGER PRIMARY KEY AUTOINCREMENT,
    Nombre      TEXT,
    Precio      REAL,
    Stock       INTEGER NOT NULL DEFAULT 0
);
INSERT INTO "Clientes" ("ID_Cliente","Nombre","Email","Telefono") VALUES (1,'Mariana','Mariana@email.com','3022611383'),
 (2,'Fernando','Fernando.Carvajal@email.com','3207654321');
INSERT INTO "Detalles_Pedido" ("ID_Detalle","ID_Pedido","ID_Producto","Cantidad","Subtotal") VALUES (1,1,1,1,120000.0),
 (2,1,2,2,90000.0),
 (3,1,1,1,120000.0),
 (4,1,2,2,90000.0);
INSERT INTO "Pedidos" ("ID_Pedido","ID_Cliente","Fecha_compra","Total_compra") VALUES (1,1,'2025-03-19',210000.0),
 (2,1,'2025-03-19',210000.0);
INSERT INTO "Productos" ("ID_Producto","Nombre","Precio","Stock") VALUES (1,'Shampoo',120000.0,30),
 (2,'Perfume Capilar',45000.0,90),
 (3,'Gloss"',350000.0,5),
 (4,'Shampoo',120000.0,30),
 (5,'Perfume Capilar',45000.0,90),
 (6,'Gloss"',350000.0,5);
COMMIT;
