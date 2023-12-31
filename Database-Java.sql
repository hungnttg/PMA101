USE [java]
GO
/****** Object:  Table [dbo].[users]    Script Date: 11/08/2023 17:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[users] [nvarchar](50) NOT NULL,
	[passwords] [nvarchar](50) NULL,
	[roles] [nvarchar](50) NULL,
 CONSTRAINT [pk_user] PRIMARY KEY CLUSTERED 
(
	[users] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[users] ([users], [passwords], [roles]) VALUES (N'admin', N'1234', N'admin')
INSERT [dbo].[users] ([users], [passwords], [roles]) VALUES (N'teacher', N'1234', N'teacher')
/****** Object:  Table [dbo].[students]    Script Date: 11/08/2023 17:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students](
	[masv] [nvarchar](50) NOT NULL,
	[hoten] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[sdt] [nvarchar](15) NULL,
	[gioitinh] [bit] NULL,
	[diachi] [nvarchar](50) NULL,
	[hinh] [nvarchar](50) NULL,
 CONSTRAINT [pk_students] PRIMARY KEY CLUSTERED 
(
	[masv] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[students] ([masv], [hoten], [email], [sdt], [gioitinh], [diachi], [hinh]) VALUES (N'ph01', N'Nguyen Van A', N'Anv@gmail.com', N'0912222222', 1, N'Hà Nội', N'')
INSERT [dbo].[students] ([masv], [hoten], [email], [sdt], [gioitinh], [diachi], [hinh]) VALUES (N'ph02', N'Tran van b', N'a@fpt.edu', N'0999999999', 0, N'HN', NULL)
/****** Object:  Table [dbo].[grade]    Script Date: 11/08/2023 17:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grade](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[masv] [nvarchar](50) NULL,
	[tienganh] [int] NULL,
	[tinhoc] [int] NULL,
	[gdtc] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [fk_grade_students]    Script Date: 11/08/2023 17:30:00 ******/
ALTER TABLE [dbo].[grade]  WITH CHECK ADD  CONSTRAINT [fk_grade_students] FOREIGN KEY([masv])
REFERENCES [dbo].[students] ([masv])
GO
ALTER TABLE [dbo].[grade] CHECK CONSTRAINT [fk_grade_students]
GO
