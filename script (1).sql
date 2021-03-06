create database [Qldasinhvien] 
go
USE [Qldasinhvien]
GO
/****** Object:  Table [dbo].[BangTieuChi]    Script Date: 6/4/2020 3:44:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BangTieuChi](
	[MaLop] [varchar](10) NOT NULL,
	[MaKhoa] [varchar](10) NOT NULL,
	[MaSV] [varchar](10) NOT NULL,
	[MaMon] [varchar](6) NOT NULL,
	[Diem] [decimal](18, 0) NULL,
	[Thamgiahoatdong] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Bangtieuchi] PRIMARY KEY CLUSTERED 
(
	[MaSV] ASC,
	[MaMon] ASC,
	[MaLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KetQua]    Script Date: 6/4/2020 3:44:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KetQua](
	[Masv] [varchar](10) NOT NULL,
	[MaMon] [varchar](6) NOT NULL,
	[LanThi] [tinyint] NOT NULL,
	[Diem] [decimal](4, 2) NULL,
 CONSTRAINT [KetQua_MaSV_MaMH_LanThi_pk] PRIMARY KEY CLUSTERED 
(
	[Masv] ASC,
	[MaMon] ASC,
	[LanThi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KetQuaPT]    Script Date: 6/4/2020 3:44:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KetQuaPT](
	[Masv] [varchar](10) NOT NULL,
	[Ma_PT] [int] NOT NULL,
	[TongDiem] [int] NULL,
 CONSTRAINT [PK_KetQuaPT] PRIMARY KEY CLUSTERED 
(
	[Masv] ASC,
	[Ma_PT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Khoa]    Script Date: 6/4/2020 3:44:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Khoa](
	[MaKhoa] [varchar](10) NOT NULL,
	[TenKhoa] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Khoa] PRIMARY KEY CLUSTERED 
(
	[MaKhoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Lop]    Script Date: 6/4/2020 3:44:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lop](
	[MaLop] [varchar](10) NOT NULL,
	[TenLop] [nvarchar](50) NOT NULL,
	[MaKhoa] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Lop] PRIMARY KEY CLUSTERED 
(
	[MaLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MaLoaiTV]    Script Date: 6/4/2020 3:44:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaLoaiTV](
	[ID_MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiTV] [nvarchar](50) NULL,
 CONSTRAINT [PK_MaLoaiTV] PRIMARY KEY CLUSTERED 
(
	[ID_MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MaLoaiTV_Quyen]    Script Date: 6/4/2020 3:44:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaLoaiTV_Quyen](
	[ID_MaLoai] [int] NOT NULL,
	[MaQuyen] [nvarchar](50) NOT NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_MaLoaiTV_Quyen] PRIMARY KEY CLUSTERED 
(
	[ID_MaLoai] ASC,
	[MaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mon]    Script Date: 6/4/2020 3:44:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mon](
	[MaMon] [varchar](6) NOT NULL,
	[TenMon] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Mon] PRIMARY KEY CLUSTERED 
(
	[MaMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhongTrao]    Script Date: 6/4/2020 3:44:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongTrao](
	[Ma_PT] [int] IDENTITY(1,1) NOT NULL,
	[Ten_PT] [nvarchar](250) NULL,
	[IM_PT] [text] NULL,
	[Diem_PT] [int] NULL,
	[TrangThai_PT] [bit] NULL,
 CONSTRAINT [PK_PhongTrao] PRIMARY KEY CLUSTERED 
(
	[Ma_PT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Quyen]    Script Date: 6/4/2020 3:44:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quyen](
	[MaQuyen] [nvarchar](50) NOT NULL,
	[TenQuyen] [nvarchar](50) NULL,
 CONSTRAINT [PK_Quyen] PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SinhVien]    Script Date: 6/4/2020 3:44:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SinhVien](
	[Masv] [varchar](10) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[Matkhau] [varchar](50) NOT NULL,
	[Email] [varchar](100) NULL,
	[Diachisv] [nvarchar](200) NULL,
	[Dienthoaisv] [varchar](50) NULL,
	[Ngaysinh] [datetime] NULL,
	[MaLop] [varchar](10) NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_Sinhvien] PRIMARY KEY CLUSTERED 
(
	[Masv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ThanhVien]    Script Date: 6/4/2020 3:44:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThanhVien](
	[ID_ThanhVien] [int] IDENTITY(1,1) NOT NULL,
	[TaiKhoan] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[ID_MaLoai] [int] NULL,
 CONSTRAINT [PK_ThanhVien] PRIMARY KEY CLUSTERED 
(
	[ID_ThanhVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'HUTECD', N'Duoc')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'HUTECHCK', N'Co Khi')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'HUTECHCNTT', N'Cong Nghe Thong Tin')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'HUTECHQTKD', N'Quan Tri Kinh Doanh')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (N'HUTECHTKTT', N'Thiet Ke Thoi Trang')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'16DCKA2001', N'16DCKA2', N'HUTECHCK')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'16DDF2001', N'16DDF2', N'HUTECD')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'16DQTKDA11', N'16DQTKDA1', N'HUTECHQTKD')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'16DTHA2001', N'16DTHA2', N'HUTECHCNTT')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaKhoa]) VALUES (N'16DTKTTC21', N'16DTKTTC2', N'HUTECHTKTT')
SET IDENTITY_INSERT [dbo].[MaLoaiTV] ON 

INSERT [dbo].[MaLoaiTV] ([ID_MaLoai], [TenLoaiTV]) VALUES (1, N'Admin')
INSERT [dbo].[MaLoaiTV] ([ID_MaLoai], [TenLoaiTV]) VALUES (2, N'Mod')
SET IDENTITY_INSERT [dbo].[MaLoaiTV] OFF
INSERT [dbo].[MaLoaiTV_Quyen] ([ID_MaLoai], [MaQuyen], [GhiChu]) VALUES (1, N'DangKi', NULL)
INSERT [dbo].[MaLoaiTV_Quyen] ([ID_MaLoai], [MaQuyen], [GhiChu]) VALUES (1, N'QuanTri', NULL)
INSERT [dbo].[Mon] ([MaMon], [TenMon]) VALUES (N'DACN01', N'Do An Chuyen Nganh')
SET IDENTITY_INSERT [dbo].[PhongTrao] ON 

INSERT [dbo].[PhongTrao] ([Ma_PT], [Ten_PT], [IM_PT], [Diem_PT], [TrangThai_PT]) VALUES (1, N'Hien Mau Nhan Dao', NULL, 30, NULL)
INSERT [dbo].[PhongTrao] ([Ma_PT], [Ten_PT], [IM_PT], [Diem_PT], [TrangThai_PT]) VALUES (2, N'Mua He Xanh', NULL, 30, NULL)
INSERT [dbo].[PhongTrao] ([Ma_PT], [Ten_PT], [IM_PT], [Diem_PT], [TrangThai_PT]) VALUES (3, N'The Thao', NULL, 20, NULL)
INSERT [dbo].[PhongTrao] ([Ma_PT], [Ten_PT], [IM_PT], [Diem_PT], [TrangThai_PT]) VALUES (4, N'Ho Tro Sinh Vien', NULL, 20, NULL)
INSERT [dbo].[PhongTrao] ([Ma_PT], [Ten_PT], [IM_PT], [Diem_PT], [TrangThai_PT]) VALUES (5, N'Diem Hoc Tap >= 8.5', NULL, 20, NULL)
INSERT [dbo].[PhongTrao] ([Ma_PT], [Ten_PT], [IM_PT], [Diem_PT], [TrangThai_PT]) VALUES (6, N'Sinh Vien Khoe', NULL, NULL, NULL)
INSERT [dbo].[PhongTrao] ([Ma_PT], [Ten_PT], [IM_PT], [Diem_PT], [TrangThai_PT]) VALUES (7, N'Sinh Vien 5 tot', N'Screenshot (4).png', 30, NULL)
INSERT [dbo].[PhongTrao] ([Ma_PT], [Ten_PT], [IM_PT], [Diem_PT], [TrangThai_PT]) VALUES (9, NULL, N'Screenshot (2).png', NULL, NULL)
INSERT [dbo].[PhongTrao] ([Ma_PT], [Ten_PT], [IM_PT], [Diem_PT], [TrangThai_PT]) VALUES (10, N'Sinh Vien 5 tot', N'Screenshot (1).png', 22, NULL)
SET IDENTITY_INSERT [dbo].[PhongTrao] OFF
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (N'DangKi', N'Dang Ki')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (N'QuanTri', N'Quan Tri Vien')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (N'VietBai', N'Dang Tin Moi')
INSERT [dbo].[SinhVien] ([Masv], [HoTen], [Matkhau], [Email], [Diachisv], [Dienthoaisv], [Ngaysinh], [MaLop], [TrangThai]) VALUES (N'1213144', N'phuoc hien', N'123', N'phuochien98@gmail.com', N'Tôn Đức Thắng', N'09747475757', CAST(N'1998-08-10 00:00:00.000' AS DateTime), N'16DCKA2001', NULL)
INSERT [dbo].[SinhVien] ([Masv], [HoTen], [Matkhau], [Email], [Diachisv], [Dienthoaisv], [Ngaysinh], [MaLop], [TrangThai]) VALUES (N'1611060001', N'Nguyen Trung Phung', N'123456', N'phung070374@gmail.com', N'Dien Bien Phu', N'0345655350', CAST(N'1998-07-03 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SinhVien] ([Masv], [HoTen], [Matkhau], [Email], [Diachisv], [Dienthoaisv], [Ngaysinh], [MaLop], [TrangThai]) VALUES (N'1611060002', N'Cam Ba Mao', N'mao1', N'mao070374@gmail.com', N'asvavavdv', N'0345655351', CAST(N'1998-01-03 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SinhVien] ([Masv], [HoTen], [Matkhau], [Email], [Diachisv], [Dienthoaisv], [Ngaysinh], [MaLop], [TrangThai]) VALUES (N'1611060003', N'Van Khanh Vuong', N'vuong1', N'vuong070375@gmail.com', N'asvavavdv', N'0345655352', CAST(N'1998-02-03 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SinhVien] ([Masv], [HoTen], [Matkhau], [Email], [Diachisv], [Dienthoaisv], [Ngaysinh], [MaLop], [TrangThai]) VALUES (N'1611060004', N'Bui Ngoc Khang', N'khang1', N'khang070374@gmail.com', N'asvavavdv', N'0345655353', CAST(N'1998-03-03 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SinhVien] ([Masv], [HoTen], [Matkhau], [Email], [Diachisv], [Dienthoaisv], [Ngaysinh], [MaLop], [TrangThai]) VALUES (N'1611060005', N'Kieu Nhat Thong', N'thong1', N'thong070376@gmail.com', N'asvavavdv', N'0345655355', CAST(N'1998-04-03 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SinhVien] ([Masv], [HoTen], [Matkhau], [Email], [Diachisv], [Dienthoaisv], [Ngaysinh], [MaLop], [TrangThai]) VALUES (N'1611060006', N'Pham Thanh Thien', N'thien1', N'thien070374@gmail.com', N'asvavavdv', N'0345655357', CAST(N'1998-05-03 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SinhVien] ([Masv], [HoTen], [Matkhau], [Email], [Diachisv], [Dienthoaisv], [Ngaysinh], [MaLop], [TrangThai]) VALUES (N'1611060007', N'Tran Tuan Nghia', N'nghia1', N'nghia070374@gmail.com', N'asvavavdv', N'0345655358', CAST(N'1998-06-03 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SinhVien] ([Masv], [HoTen], [Matkhau], [Email], [Diachisv], [Dienthoaisv], [Ngaysinh], [MaLop], [TrangThai]) VALUES (N'1611060008', N'Nguyen Huu Chinh', N'chinh1', N'chinh070374@gmail.com', N'asvavavdv', N'0345655359', CAST(N'1998-08-03 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SinhVien] ([Masv], [HoTen], [Matkhau], [Email], [Diachisv], [Dienthoaisv], [Ngaysinh], [MaLop], [TrangThai]) VALUES (N'1611060009', N'Bui Minh Tien', N'tien1', N'tien070374@gmail.com', N'asvavavdv', N'0345655361', CAST(N'1998-09-03 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SinhVien] ([Masv], [HoTen], [Matkhau], [Email], [Diachisv], [Dienthoaisv], [Ngaysinh], [MaLop], [TrangThai]) VALUES (N'1611060010', N'Nguyen Quoc Bao', N'bao1', N'bao070374@gmail.com', N'asvavavdv', N'0345655367', CAST(N'1998-10-03 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SinhVien] ([Masv], [HoTen], [Matkhau], [Email], [Diachisv], [Dienthoaisv], [Ngaysinh], [MaLop], [TrangThai]) VALUES (N'1611060732', N'Nguyen Ronaldo', N'123456', N'do.nguyen@gmail.com', N'dien bien phu', N'0128923841', CAST(N'1998-02-03 00:00:00.000' AS DateTime), N'16DDF2001', NULL)
SET IDENTITY_INSERT [dbo].[ThanhVien] ON 

INSERT [dbo].[ThanhVien] ([ID_ThanhVien], [TaiKhoan], [MatKhau], [ID_MaLoai]) VALUES (1, N'admin', N'123456', 1)
INSERT [dbo].[ThanhVien] ([ID_ThanhVien], [TaiKhoan], [MatKhau], [ID_MaLoai]) VALUES (4, N'mod', N'123456', 2)
SET IDENTITY_INSERT [dbo].[ThanhVien] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__SinhVien__A9D105346A5CEBCC]    Script Date: 6/4/2020 3:44:56 PM ******/
ALTER TABLE [dbo].[SinhVien] ADD  CONSTRAINT [UQ__SinhVien__A9D105346A5CEBCC] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BangTieuChi]  WITH CHECK ADD  CONSTRAINT [FK_Mon] FOREIGN KEY([MaMon])
REFERENCES [dbo].[Mon] ([MaMon])
GO
ALTER TABLE [dbo].[BangTieuChi] CHECK CONSTRAINT [FK_Mon]
GO
ALTER TABLE [dbo].[BangTieuChi]  WITH CHECK ADD  CONSTRAINT [FK_SV] FOREIGN KEY([MaSV])
REFERENCES [dbo].[SinhVien] ([Masv])
GO
ALTER TABLE [dbo].[BangTieuChi] CHECK CONSTRAINT [FK_SV]
GO
ALTER TABLE [dbo].[KetQua]  WITH CHECK ADD  CONSTRAINT [FK_KetQua_Mon] FOREIGN KEY([MaMon])
REFERENCES [dbo].[Mon] ([MaMon])
GO
ALTER TABLE [dbo].[KetQua] CHECK CONSTRAINT [FK_KetQua_Mon]
GO
ALTER TABLE [dbo].[KetQua]  WITH CHECK ADD  CONSTRAINT [FK_KetQua_SinhVien] FOREIGN KEY([Masv])
REFERENCES [dbo].[SinhVien] ([Masv])
GO
ALTER TABLE [dbo].[KetQua] CHECK CONSTRAINT [FK_KetQua_SinhVien]
GO
ALTER TABLE [dbo].[KetQuaPT]  WITH CHECK ADD  CONSTRAINT [FK_KetQuaPT_PhongTrao] FOREIGN KEY([Ma_PT])
REFERENCES [dbo].[PhongTrao] ([Ma_PT])
GO
ALTER TABLE [dbo].[KetQuaPT] CHECK CONSTRAINT [FK_KetQuaPT_PhongTrao]
GO
ALTER TABLE [dbo].[KetQuaPT]  WITH CHECK ADD  CONSTRAINT [FK_KetQuaPT_SinhVien] FOREIGN KEY([Masv])
REFERENCES [dbo].[SinhVien] ([Masv])
GO
ALTER TABLE [dbo].[KetQuaPT] CHECK CONSTRAINT [FK_KetQuaPT_SinhVien]
GO
ALTER TABLE [dbo].[Lop]  WITH CHECK ADD  CONSTRAINT [FK_Khoa_Lop] FOREIGN KEY([MaKhoa])
REFERENCES [dbo].[Khoa] ([MaKhoa])
GO
ALTER TABLE [dbo].[Lop] CHECK CONSTRAINT [FK_Khoa_Lop]
GO
ALTER TABLE [dbo].[MaLoaiTV_Quyen]  WITH CHECK ADD  CONSTRAINT [FK_MaLoaiTV_Quyen_MaLoaiTV] FOREIGN KEY([ID_MaLoai])
REFERENCES [dbo].[MaLoaiTV] ([ID_MaLoai])
GO
ALTER TABLE [dbo].[MaLoaiTV_Quyen] CHECK CONSTRAINT [FK_MaLoaiTV_Quyen_MaLoaiTV]
GO
ALTER TABLE [dbo].[MaLoaiTV_Quyen]  WITH CHECK ADD  CONSTRAINT [FK_MaLoaiTV_Quyen_Quyen] FOREIGN KEY([MaQuyen])
REFERENCES [dbo].[Quyen] ([MaQuyen])
GO
ALTER TABLE [dbo].[MaLoaiTV_Quyen] CHECK CONSTRAINT [FK_MaLoaiTV_Quyen_Quyen]
GO
ALTER TABLE [dbo].[SinhVien]  WITH CHECK ADD  CONSTRAINT [FK_SinhVien_Lop] FOREIGN KEY([MaLop])
REFERENCES [dbo].[Lop] ([MaLop])
GO
ALTER TABLE [dbo].[SinhVien] CHECK CONSTRAINT [FK_SinhVien_Lop]
GO
ALTER TABLE [dbo].[ThanhVien]  WITH CHECK ADD  CONSTRAINT [FK_ThanhVien_MaLoaiTV] FOREIGN KEY([ID_MaLoai])
REFERENCES [dbo].[MaLoaiTV] ([ID_MaLoai])
GO
ALTER TABLE [dbo].[ThanhVien] CHECK CONSTRAINT [FK_ThanhVien_MaLoaiTV]
GO
ALTER TABLE [dbo].[BangTieuChi]  WITH CHECK ADD CHECK  (([Diem]>=(2.5)))
GO
CREATE TABLE ADMIN
(
	UserAdmin varchar(30) primary key,
	PassAdmin varchar(30) not null,
	HoTen nvarchar(50)
)