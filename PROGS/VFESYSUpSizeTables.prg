ALTER TABLE [dbo].[apprites] DROP CONSTRAINT FK_apprites_cgroupd_id
GO

ALTER TABLE [dbo].[appusers] DROP CONSTRAINT FK_appusers_cgroupd_id
GO

/****** Object: Table [dbo].[appgroups] Script Date: 1/4/2001 11:17:00 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[appgroups]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[appgroups]
GO

/****** Object: Table [dbo].[appinfo] Script Date: 1/4/2001 11:17:00 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[appinfo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[appinfo]
GO

/****** Object: Table [dbo].[applogin] Script Date: 1/4/2001 11:17:00 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[applogin]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[applogin]
GO

/****** Object: Table [dbo].[appnames] Script Date: 1/4/2001 11:17:00 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[appnames]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[appnames]
GO

/****** Object: Table [dbo].[apprites] Script Date: 1/4/2001 11:17:00 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[apprites]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[apprites]
GO

/****** Object: Table [dbo].[appusers] Script Date: 1/4/2001 11:17:00 AM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[appusers]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[appusers]
GO

/****** Object: Table [dbo].[appgroups] Script Date: 1/4/2001 11:17:06 AM ******/
CREATE TABLE [dbo].[appgroups] (
	[cgroup_id] [char] (16) NOT NULL ,
	[cname] [char] (40) NOT NULL ,
	[mdescript] [text] NOT NULL ,
	[timestamp_column] [timestamp] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object: Table [dbo].[appinfo] Script Date: 1/4/2001 11:17:06 AM ******/
CREATE TABLE [dbo].[appinfo] (
	[cid] [char] (16) NOT NULL ,
	[nminpasswordlength] [numeric](2, 0) NOT NULL ,
	[nminuseridlength] [numeric](2, 0) NOT NULL ,
	[nmaxlogins] [numeric](2, 0) NOT NULL ,
	[nfailures] [numeric](2, 0) NOT NULL ,
	[luniquepassword] [bit] NOT NULL ,
	[nchangepassword] [numeric](4, 0) NOT NULL ,
	[ndefaultlevel] [numeric](1, 0) NOT NULL ,
	[timestamp_column] [timestamp] NULL
) ON [PRIMARY]
GO

/****** Object: Table [dbo].[applogin] Script Date: 1/4/2001 11:17:07 AM ******/
CREATE TABLE [dbo].[applogin] (
	[cuserid] [char] (30) NOT NULL ,
	[tloggedin] [datetime] NOT NULL ,
	[tloggedout] [datetime] NULL ,
	[tcleared] [datetime] NULL ,
	[cclearedby] [char] (30) NOT NULL ,
	[timestamp_column] [timestamp] NULL
) ON [PRIMARY]
GO

/****** Object: Table [dbo].[appnames] Script Date: 1/4/2001 11:17:07 AM ******/
CREATE TABLE [dbo].[appnames] (
	[cname] [char] (40) NOT NULL ,
	[mdescription] [text] NOT NULL ,
	[timestamp_column] [timestamp] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object: Table [dbo].[apprites] Script Date: 1/4/2001 11:17:07 AM ******/
CREATE TABLE [dbo].[apprites] (
	[cgroup_id] [char] (16) NOT NULL ,
	[cname] [char] (40) NOT NULL ,
	[nrights] [numeric](1, 0) NOT NULL ,
	[timestamp_column] [timestamp] NULL
) ON [PRIMARY]
GO

/****** Object: Table [dbo].[appusers] Script Date: 1/4/2001 11:17:08 AM ******/
CREATE TABLE [dbo].[appusers] (
	[cuserid] [char] (30) NOT NULL ,
	[cfirst_name] [char] (20) NULL ,
	[clast_name] [char] (25) NULL ,
	[cpassword] [char] (30) NOT NULL ,
	[dlastchanged] [datetime] NOT NULL ,
	[ladministrator] [bit] NOT NULL ,
	[cgroup_id] [char] (16) NULL ,
	[moldpasswords] [text] NOT NULL ,
	[linactive] [bit] NOT NULL ,
	[timestamp_column] [timestamp] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[appgroups] WITH NOCHECK ADD
	 PRIMARY KEY CLUSTERED
	(
		[cgroup_id]
	) ON [PRIMARY]
GO

ALTER TABLE [dbo].[appinfo] WITH NOCHECK ADD
	 PRIMARY KEY CLUSTERED
	(
		[cid]
	) ON [PRIMARY]
GO

ALTER TABLE [dbo].[appnames] WITH NOCHECK ADD
	 PRIMARY KEY CLUSTERED
	(
		[cname]
	) ON [PRIMARY]
GO

ALTER TABLE [dbo].[apprites] WITH NOCHECK ADD
	CONSTRAINT [PK_apprites] PRIMARY KEY CLUSTERED
	(
		[cgroup_id],
		[cname]
	) ON [PRIMARY]
GO

ALTER TABLE [dbo].[appusers] WITH NOCHECK ADD
	CONSTRAINT [PK__appusers__2DF4EC6C] PRIMARY KEY CLUSTERED
	(
		[cuserid]
	) ON [PRIMARY]
GO

ALTER TABLE [dbo].[appinfo] WITH NOCHECK ADD
	 CHECK ([nchangepassword] >= 0),
	 CHECK ([ndefaultlevel] >= 1 and [ndefaultlevel] <= 3),
	 CHECK ([nfailures] >= 3),
	 CHECK ([nmaxlogins] >= 0),
	 CHECK ([nminpasswordlength] >= 0),
	 CHECK ([nminuseridlength] >= 0)
GO

ALTER TABLE [dbo].[applogin] WITH NOCHECK ADD
	CONSTRAINT [DF__applogin__tlogge__255FA66B] DEFAULT (getdate()) FOR [tloggedin],
	CONSTRAINT [DF__applogin__cclear__2653CAA4] DEFAULT ('') FOR [cclearedby]
GO

ALTER TABLE [dbo].[appnames] WITH NOCHECK ADD
	CONSTRAINT [DF__appnames__mdescr__2930374F] DEFAULT ('') FOR [mdescription]
GO

ALTER TABLE [dbo].[apprites] WITH NOCHECK ADD
	CONSTRAINT [DF__apprites__nright__2C0CA3FA] DEFAULT (0) FOR [nrights]
GO

ALTER TABLE [dbo].[appusers] WITH NOCHECK ADD
	CONSTRAINT [DF__appusers__cfirst__2EE910A5] DEFAULT ('') FOR [cfirst_name],
	CONSTRAINT [DF__appusers__clast___2FDD34DE] DEFAULT ('') FOR [clast_name],
	CONSTRAINT [DF_appusers_cpassword] DEFAULT ('') FOR [cpassword],
	CONSTRAINT [DF__appusers__dlastc__30D15917] DEFAULT (getdate()) FOR [dlastchanged],
	CONSTRAINT [DF__appusers__ladmin__31C57D50] DEFAULT (0) FOR [ladministrator],
	CONSTRAINT [DF_appusers_moldpasswords] DEFAULT ('') FOR [moldpasswords],
	CONSTRAINT [DF__appusers__linact__32B9A189] DEFAULT (0) FOR [linactive]
GO

ALTER TABLE [dbo].[apprites] ADD
	CONSTRAINT [FK_apprites_cgroupd_id] FOREIGN KEY
	(
		[cgroup_id]
	) REFERENCES [dbo].[appgroups] (
		[cgroup_id]
	)
GO

ALTER TABLE [dbo].[appusers] ADD
	CONSTRAINT [FK_appusers_cgroupd_id] FOREIGN KEY
	(
		[cgroup_id]
	) REFERENCES [dbo].[appgroups] (
		[cgroup_id]
	)
GO