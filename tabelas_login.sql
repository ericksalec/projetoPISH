CREATE TABLE [dbo].[ApplicationUser]
(
    [Id] INT NOT NULL PRIMARY KEY IDENTITY,
    [UserName] NVARCHAR(256) NOT NULL,
    [NormalizedUserName] NVARCHAR(256) NOT NULL,
    [Name] NVARCHAR(256) NULL,
    [Email] NVARCHAR(256) NULL,
    [NormalizedEmail] NVARCHAR(256) NULL,
    [PasswordHash] NVARCHAR(MAX) NULL,
)

GO

CREATE INDEX [IX_ApplicationUser_NormalizedUserName] ON [dbo].[ApplicationUser] ([NormalizedUserName])

GO

CREATE INDEX [IX_ApplicationUser_NormalizedEmail] ON [dbo].[ApplicationUser] ([NormalizedEmail])




CREATE TABLE [dbo].[ApplicationRole]
(
    [Id] INT NOT NULL PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(256) NOT NULL,
    [NormalizedName] NVARCHAR(256) NOT NULL
)



GO

CREATE INDEX [IX_ApplicationRole_NormalizedName] ON [dbo].[ApplicationRole] ([NormalizedName])




CREATE TABLE [dbo].[ApplicationUserRole]
(
    [UserId] INT NOT NULL,
    [RoleId] INT NOT NULL
    PRIMARY KEY ([UserId], [RoleId]),
    CONSTRAINT [FK_ApplicationUserRole_User] FOREIGN KEY ([UserId]) REFERENCES [ApplicationUser]([Id]),
    CONSTRAINT [FK_ApplicationUserRole_Role] FOREIGN KEY ([RoleId]) REFERENCES [ApplicationRole]([Id])
)



INSERT [dbo].[ApplicationRole] ([Name],[NormalizedName])  
    VALUES ('user', 'USER')  
GO

INSERT [dbo].[ApplicationRole] ([Name],[NormalizedName]) 
    VALUES ('admin', 'ADMIN')  
GO


