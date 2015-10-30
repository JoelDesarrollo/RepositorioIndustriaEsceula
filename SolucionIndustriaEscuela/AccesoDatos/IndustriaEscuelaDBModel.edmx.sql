
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/29/2015 19:50:28
-- Generated from EDMX file: C:\Users\user\Documents\GitHub\RepositorioIndustriaEscuela\SolucionIndustriaEscuela\AccesoDatos\IndustriaEscuelaDBModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [IndustriaEscuelaDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Usuarios'
CREATE TABLE [dbo].[Usuarios] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(20)  NOT NULL,
    [Contrasenia] nvarchar(20)  NOT NULL,
    [Habilitado] bit  NOT NULL,
    [RolId] int  NOT NULL
);
GO

-- Creating table 'Roles'
CREATE TABLE [dbo].[Roles] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'Acciones'
CREATE TABLE [dbo].[Acciones] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'Personas'
CREATE TABLE [dbo].[Personas] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(100)  NOT NULL,
    [Dni] nvarchar(10)  NULL,
    [Domicilio] nvarchar(100)  NULL,
    [Telefono] nvarchar(15)  NULL,
    [Email] nvarchar(100)  NULL
);
GO

-- Creating table 'CuentasCorrientes'
CREATE TABLE [dbo].[CuentasCorrientes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [TipoMovimiento] nvarchar(50)  NOT NULL,
    [Monto] decimal(6,2)  NOT NULL,
    [Fecha] datetime  NOT NULL,
    [Descripcion] nvarchar(200)  NULL
);
GO

-- Creating table 'Productos'
CREATE TABLE [dbo].[Productos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Descripcion] nvarchar(100)  NOT NULL,
    [PrecioUnitario] decimal(6,2)  NOT NULL,
    [UnidadMedida] nvarchar(50)  NOT NULL,
    [Stock] decimal(6,2)  NULL,
    [Habilitado] bit  NOT NULL,
    [DetalleVenta_Id] int  NOT NULL
);
GO

-- Creating table 'Ventas'
CREATE TABLE [dbo].[Ventas] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Fecha] datetime  NOT NULL,
    [Total] decimal(6,2)  NOT NULL,
    [UsuarioId] int  NOT NULL,
    [ClienteId] int  NOT NULL
);
GO

-- Creating table 'Insumos'
CREATE TABLE [dbo].[Insumos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Descripcion] nvarchar(100)  NOT NULL,
    [Stock] decimal(6,2)  NULL,
    [Habilitado] bit  NOT NULL,
    [UnidadMedida] nvarchar(50)  NOT NULL,
    [ProductoId] int  NOT NULL
);
GO

-- Creating table 'DetallesVentas'
CREATE TABLE [dbo].[DetallesVentas] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Cantidad] decimal(6,2)  NOT NULL,
    [VentaId] int  NOT NULL
);
GO

-- Creating table 'Personas_Cliente'
CREATE TABLE [dbo].[Personas_Cliente] (
    [Habilitado] bit  NOT NULL,
    [Id] int  NOT NULL,
    [CuentaCorriente_Id] int  NOT NULL
);
GO

-- Creating table 'AccionesPorRol'
CREATE TABLE [dbo].[AccionesPorRol] (
    [Roles_Id] int  NOT NULL,
    [Acciones_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Usuarios'
ALTER TABLE [dbo].[Usuarios]
ADD CONSTRAINT [PK_Usuarios]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Roles'
ALTER TABLE [dbo].[Roles]
ADD CONSTRAINT [PK_Roles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Acciones'
ALTER TABLE [dbo].[Acciones]
ADD CONSTRAINT [PK_Acciones]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Personas'
ALTER TABLE [dbo].[Personas]
ADD CONSTRAINT [PK_Personas]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CuentasCorrientes'
ALTER TABLE [dbo].[CuentasCorrientes]
ADD CONSTRAINT [PK_CuentasCorrientes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Productos'
ALTER TABLE [dbo].[Productos]
ADD CONSTRAINT [PK_Productos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Ventas'
ALTER TABLE [dbo].[Ventas]
ADD CONSTRAINT [PK_Ventas]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Insumos'
ALTER TABLE [dbo].[Insumos]
ADD CONSTRAINT [PK_Insumos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'DetallesVentas'
ALTER TABLE [dbo].[DetallesVentas]
ADD CONSTRAINT [PK_DetallesVentas]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Personas_Cliente'
ALTER TABLE [dbo].[Personas_Cliente]
ADD CONSTRAINT [PK_Personas_Cliente]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Roles_Id], [Acciones_Id] in table 'AccionesPorRol'
ALTER TABLE [dbo].[AccionesPorRol]
ADD CONSTRAINT [PK_AccionesPorRol]
    PRIMARY KEY CLUSTERED ([Roles_Id], [Acciones_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [RolId] in table 'Usuarios'
ALTER TABLE [dbo].[Usuarios]
ADD CONSTRAINT [FK_RolesDeUsuario]
    FOREIGN KEY ([RolId])
    REFERENCES [dbo].[Roles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RolesDeUsuario'
CREATE INDEX [IX_FK_RolesDeUsuario]
ON [dbo].[Usuarios]
    ([RolId]);
GO

-- Creating foreign key on [Roles_Id] in table 'AccionesPorRol'
ALTER TABLE [dbo].[AccionesPorRol]
ADD CONSTRAINT [FK_AccionesPorRol_Rol]
    FOREIGN KEY ([Roles_Id])
    REFERENCES [dbo].[Roles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Acciones_Id] in table 'AccionesPorRol'
ALTER TABLE [dbo].[AccionesPorRol]
ADD CONSTRAINT [FK_AccionesPorRol_Accion]
    FOREIGN KEY ([Acciones_Id])
    REFERENCES [dbo].[Acciones]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_AccionesPorRol_Accion'
CREATE INDEX [IX_FK_AccionesPorRol_Accion]
ON [dbo].[AccionesPorRol]
    ([Acciones_Id]);
GO

-- Creating foreign key on [CuentaCorriente_Id] in table 'Personas_Cliente'
ALTER TABLE [dbo].[Personas_Cliente]
ADD CONSTRAINT [FK_CuentaCorrienteDelCliente]
    FOREIGN KEY ([CuentaCorriente_Id])
    REFERENCES [dbo].[CuentasCorrientes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CuentaCorrienteDelCliente'
CREATE INDEX [IX_FK_CuentaCorrienteDelCliente]
ON [dbo].[Personas_Cliente]
    ([CuentaCorriente_Id]);
GO

-- Creating foreign key on [VentaId] in table 'DetallesVentas'
ALTER TABLE [dbo].[DetallesVentas]
ADD CONSTRAINT [FK_DetalleVentaDeVenta]
    FOREIGN KEY ([VentaId])
    REFERENCES [dbo].[Ventas]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_DetalleVentaDeVenta'
CREATE INDEX [IX_FK_DetalleVentaDeVenta]
ON [dbo].[DetallesVentas]
    ([VentaId]);
GO

-- Creating foreign key on [DetalleVenta_Id] in table 'Productos'
ALTER TABLE [dbo].[Productos]
ADD CONSTRAINT [FK_DetalleVentaProducto]
    FOREIGN KEY ([DetalleVenta_Id])
    REFERENCES [dbo].[DetallesVentas]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_DetalleVentaProducto'
CREATE INDEX [IX_FK_DetalleVentaProducto]
ON [dbo].[Productos]
    ([DetalleVenta_Id]);
GO

-- Creating foreign key on [ProductoId] in table 'Insumos'
ALTER TABLE [dbo].[Insumos]
ADD CONSTRAINT [FK_InsumosDelProducto]
    FOREIGN KEY ([ProductoId])
    REFERENCES [dbo].[Productos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_InsumosDelProducto'
CREATE INDEX [IX_FK_InsumosDelProducto]
ON [dbo].[Insumos]
    ([ProductoId]);
GO

-- Creating foreign key on [UsuarioId] in table 'Ventas'
ALTER TABLE [dbo].[Ventas]
ADD CONSTRAINT [FK_UsuarioVenta]
    FOREIGN KEY ([UsuarioId])
    REFERENCES [dbo].[Usuarios]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UsuarioVenta'
CREATE INDEX [IX_FK_UsuarioVenta]
ON [dbo].[Ventas]
    ([UsuarioId]);
GO

-- Creating foreign key on [ClienteId] in table 'Ventas'
ALTER TABLE [dbo].[Ventas]
ADD CONSTRAINT [FK_ClienteCompra]
    FOREIGN KEY ([ClienteId])
    REFERENCES [dbo].[Personas_Cliente]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ClienteCompra'
CREATE INDEX [IX_FK_ClienteCompra]
ON [dbo].[Ventas]
    ([ClienteId]);
GO

-- Creating foreign key on [Id] in table 'Personas_Cliente'
ALTER TABLE [dbo].[Personas_Cliente]
ADD CONSTRAINT [FK_Cliente_inherits_Persona]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Personas]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------