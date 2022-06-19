IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521073538_Added_Categories_and_Products_table')
BEGIN
    CREATE TABLE [Categories] (
        [ID] int NOT NULL IDENTITY,
        [CategoryName] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Categories] PRIMARY KEY ([ID])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521073538_Added_Categories_and_Products_table')
BEGIN
    CREATE TABLE [Products] (
        [ID] int NOT NULL IDENTITY,
        [ProductName] nvarchar(max) NOT NULL,
        [ProductPrice] float NOT NULL,
        [ProductImage] nvarchar(max) NOT NULL,
        [ProductSeller] nvarchar(max) NOT NULL,
        [ProductDescription] nvarchar(max) NOT NULL,
        [ProductCategory] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Products] PRIMARY KEY ([ID])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521073538_Added_Categories_and_Products_table')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220521073538_Added_Categories_and_Products_table', N'5.0.0');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523085748_Added_Users_table')
BEGIN
    CREATE TABLE [Users] (
        [ID] int NOT NULL IDENTITY,
        [FirstName] nvarchar(max) NOT NULL,
        [LastName] nvarchar(max) NOT NULL,
        [Email] nvarchar(max) NOT NULL,
        [Password] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Users] PRIMARY KEY ([ID])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523085748_Added_Users_table')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220523085748_Added_Users_table', N'5.0.0');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523115216_Added_Admin_table')
BEGIN
    CREATE TABLE [Admins] (
        [ID] int NOT NULL IDENTITY,
        [Email] nvarchar(max) NOT NULL,
        [Password] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Admins] PRIMARY KEY ([ID])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220523115216_Added_Admin_table')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220523115216_Added_Admin_table', N'5.0.0');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220524092839_added_carts_table')
BEGIN
    CREATE TABLE [Carts] (
        [ID] int NOT NULL IDENTITY,
        [UserEmailId] nvarchar(max) NOT NULL,
        [CartProuctId] nvarchar(max) NOT NULL,
        [CartProductName] nvarchar(max) NOT NULL,
        [CartProductPrice] float NOT NULL,
        [CartProductImage] nvarchar(max) NOT NULL,
        [CartProductQuantity] int NOT NULL,
        CONSTRAINT [PK_Carts] PRIMARY KEY ([ID])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220524092839_added_carts_table')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220524092839_added_carts_table', N'5.0.0');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220524093027_updated_carts_table')
BEGIN
    EXEC sp_rename N'[Carts].[CartProuctId]', N'CartProductId', N'COLUMN';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220524093027_updated_carts_table')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220524093027_updated_carts_table', N'5.0.0');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220524094022_updated_carts_table_2')
BEGIN
    DECLARE @var0 sysname;
    SELECT @var0 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Carts]') AND [c].[name] = N'CartProductId');
    IF @var0 IS NOT NULL EXEC(N'ALTER TABLE [Carts] DROP CONSTRAINT [' + @var0 + '];');
    ALTER TABLE [Carts] ALTER COLUMN [CartProductId] int NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220524094022_updated_carts_table_2')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220524094022_updated_carts_table_2', N'5.0.0');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220524144131_Added_Orders_table')
BEGIN
    CREATE TABLE [Orders] (
        [ID] int NOT NULL IDENTITY,
        [UserEmailId] nvarchar(max) NOT NULL,
        [Address] nvarchar(max) NOT NULL,
        [PhoneNumber] nvarchar(max) NOT NULL,
        [OrderProductId] int NOT NULL,
        [OrderProductName] nvarchar(max) NOT NULL,
        [OrderProductPrice] float NOT NULL,
        [OrderProductImage] nvarchar(max) NOT NULL,
        [OrderProductQuantity] int NOT NULL,
        [OrderProductDateTime] datetime2 NOT NULL,
        CONSTRAINT [PK_Orders] PRIMARY KEY ([ID])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220524144131_Added_Orders_table')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220524144131_Added_Orders_table', N'5.0.0');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220524152329_Updated_Orders_table')
BEGIN
    DECLARE @var1 sysname;
    SELECT @var1 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Orders]') AND [c].[name] = N'OrderProductDateTime');
    IF @var1 IS NOT NULL EXEC(N'ALTER TABLE [Orders] DROP CONSTRAINT [' + @var1 + '];');
    ALTER TABLE [Orders] ALTER COLUMN [OrderProductDateTime] nvarchar(max) NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220524152329_Updated_Orders_table')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220524152329_Updated_Orders_table', N'5.0.0');
END;
GO

COMMIT;
GO

