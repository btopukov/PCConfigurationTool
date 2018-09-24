CREATE TABLE [dbo].[PCComponentConfiguration] (
    [Id]                INT IDENTITY (1, 1) NOT NULL,
    [ComponentId]       INT NOT NULL,
    [PCConfigurationId] INT NOT NULL,
    CONSTRAINT [PK_PC_Configuration] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Component_PCConfiguration] FOREIGN KEY ([ComponentId]) REFERENCES [dbo].[Component] ([Id]),
    CONSTRAINT [FK_Configuration_PCConfiguration] FOREIGN KEY ([PCConfigurationId]) REFERENCES [dbo].[PCConfiguration] ([Id])
);



