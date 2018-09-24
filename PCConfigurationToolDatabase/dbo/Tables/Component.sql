CREATE TABLE [dbo].[Component] (
    [Id]     INT             IDENTITY (1, 1) NOT NULL,
    [Name]   NVARCHAR (100)  NOT NULL,
    [Amount] DECIMAL (18, 2) NOT NULL,
    CONSTRAINT [PK_Component] PRIMARY KEY CLUSTERED ([Id] ASC)
);

