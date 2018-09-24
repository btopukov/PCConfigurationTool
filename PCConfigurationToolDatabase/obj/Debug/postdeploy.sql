/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

INSERT INTO [Component] ([Name], [Amount]) VALUES (N'Motherboard', CAST(250.00 AS Decimal(18, 2)))
INSERT INTO [Component] ([Name], [Amount]) VALUES (N'Processor', CAST(350.00 AS Decimal(18, 2)))
INSERT INTO [Component] ([Name], [Amount]) VALUES (N'Memory', CAST(450.00 AS Decimal(18, 2)))
INSERT INTO [Component] ([Name], [Amount]) VALUES (N'Graphics processing unit', CAST(650.00 AS Decimal(18, 2)))
INSERT INTO [Component] ([Name], [Amount]) VALUES (N'Storage', CAST(550.00 AS Decimal(18, 2)))
INSERT INTO [Component] ([Name], [Amount]) VALUES (N'Power supply', CAST(340.00 AS Decimal(18, 2)))
INSERT INTO [Component] ([Name], [Amount]) VALUES (N'Case', CAST(255.00 AS Decimal(18, 2)))
INSERT INTO [Component] ([Name], [Amount]) VALUES (N'Keyboard ', CAST(150.00 AS Decimal(18, 2)))
INSERT INTO [Component] ([Name], [Amount]) VALUES (N'Mouse', CAST(100.00 AS Decimal(18, 2)))
GO
