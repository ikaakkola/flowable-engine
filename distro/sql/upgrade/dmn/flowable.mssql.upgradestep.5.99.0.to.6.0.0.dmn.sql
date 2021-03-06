

CREATE TABLE [ACT_DMN_DATABASECHANGELOGLOCK] ([ID] [int] NOT NULL, [LOCKED] [bit] NOT NULL, [LOCKGRANTED] [datetime2](3), [LOCKEDBY] [nvarchar](255), CONSTRAINT [PK_ACT_DMN_DATABASECHANGELOGLOCK] PRIMARY KEY ([ID]))

DELETE FROM [ACT_DMN_DATABASECHANGELOGLOCK]

INSERT INTO [ACT_DMN_DATABASECHANGELOGLOCK] ([ID], [LOCKED]) VALUES (1, 0)

UPDATE [ACT_DMN_DATABASECHANGELOGLOCK] SET [LOCKED] = 1, [LOCKEDBY] = '192.168.1.5 (192.168.1.5)', [LOCKGRANTED] = '2019-03-13T21:37:36.267' WHERE [ID] = 1 AND [LOCKED] = 0

CREATE TABLE [ACT_DMN_DATABASECHANGELOG] ([ID] [nvarchar](255) NOT NULL, [AUTHOR] [nvarchar](255) NOT NULL, [FILENAME] [nvarchar](255) NOT NULL, [DATEEXECUTED] [datetime2](3) NOT NULL, [ORDEREXECUTED] [int] NOT NULL, [EXECTYPE] [nvarchar](10) NOT NULL, [MD5SUM] [nvarchar](35), [DESCRIPTION] [nvarchar](255), [COMMENTS] [nvarchar](255), [TAG] [nvarchar](255), [LIQUIBASE] [nvarchar](20), [CONTEXTS] [nvarchar](255), [LABELS] [nvarchar](255), [DEPLOYMENT_ID] [nvarchar](10))

CREATE TABLE [ACT_DMN_DEPLOYMENT] ([ID_] [varchar](255) NOT NULL, [NAME_] [varchar](255), [CATEGORY_] [varchar](255), [DEPLOY_TIME_] [datetime], [TENANT_ID_] [varchar](255), [PARENT_DEPLOYMENT_ID_] [varchar](255), CONSTRAINT [PK_ACT_DMN_DEPLOYMENT] PRIMARY KEY ([ID_]))

CREATE TABLE [ACT_DMN_DEPLOYMENT_RESOURCE] ([ID_] [varchar](255) NOT NULL, [NAME_] [varchar](255), [DEPLOYMENT_ID_] [varchar](255), [RESOURCE_BYTES_] [varbinary](MAX), CONSTRAINT [PK_ACT_DMN_DEPLOYMENT_RESOURCE] PRIMARY KEY ([ID_]))

CREATE TABLE [ACT_DMN_DECISION_TABLE] ([ID_] [varchar](255) NOT NULL, [NAME_] [varchar](255), [VERSION_] [int], [KEY_] [varchar](255), [CATEGORY_] [varchar](255), [DEPLOYMENT_ID_] [varchar](255), [PARENT_DEPLOYMENT_ID_] [varchar](255), [TENANT_ID_] [varchar](255), [RESOURCE_NAME_] [varchar](255), [DESCRIPTION_] [varchar](255), CONSTRAINT [PK_ACT_DMN_DECISION_TABLE] PRIMARY KEY ([ID_]))

INSERT INTO [ACT_DMN_DATABASECHANGELOG] ([ID], [AUTHOR], [FILENAME], [DATEEXECUTED], [ORDEREXECUTED], [MD5SUM], [DESCRIPTION], [COMMENTS], [EXECTYPE], [CONTEXTS], [LABELS], [LIQUIBASE], [DEPLOYMENT_ID]) VALUES ('1', 'activiti', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', GETDATE(), 1, '7:d878c2672ead57b5801578fd39c423af', 'createTable tableName=ACT_DMN_DEPLOYMENT; createTable tableName=ACT_DMN_DEPLOYMENT_RESOURCE; createTable tableName=ACT_DMN_DECISION_TABLE', '', 'EXECUTED', NULL, NULL, '3.5.3', '2509456381')

UPDATE [ACT_DMN_DATABASECHANGELOGLOCK] SET [LOCKED] = 0, [LOCKEDBY] = NULL, [LOCKGRANTED] = NULL WHERE [ID] = 1

