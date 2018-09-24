CREATE TABLE [dbo].[PCConfiguration] (
    [Id]          INT             IDENTITY (1, 1) NOT NULL,
    [TotalAmount] DECIMAL (18, 2) NOT NULL,
    CONSTRAINT [PK_PCConfiguration] PRIMARY KEY CLUSTERED ([Id] ASC)
);



