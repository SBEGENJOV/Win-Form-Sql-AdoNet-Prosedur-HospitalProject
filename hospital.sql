USE [master]
GO
/****** Object:  Database [hastane_otomasyon]    Script Date: 27.08.2023 10:38:02 ******/
CREATE DATABASE [hastane_otomasyon]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'hastane_otomasyon', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\hastane_otomasyon.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'hastane_otomasyon_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\hastane_otomasyon_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [hastane_otomasyon] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [hastane_otomasyon].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [hastane_otomasyon] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [hastane_otomasyon] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [hastane_otomasyon] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [hastane_otomasyon] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [hastane_otomasyon] SET ARITHABORT OFF 
GO
ALTER DATABASE [hastane_otomasyon] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [hastane_otomasyon] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [hastane_otomasyon] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [hastane_otomasyon] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [hastane_otomasyon] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [hastane_otomasyon] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [hastane_otomasyon] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [hastane_otomasyon] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [hastane_otomasyon] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [hastane_otomasyon] SET  ENABLE_BROKER 
GO
ALTER DATABASE [hastane_otomasyon] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [hastane_otomasyon] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [hastane_otomasyon] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [hastane_otomasyon] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [hastane_otomasyon] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [hastane_otomasyon] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [hastane_otomasyon] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [hastane_otomasyon] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [hastane_otomasyon] SET  MULTI_USER 
GO
ALTER DATABASE [hastane_otomasyon] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [hastane_otomasyon] SET DB_CHAINING OFF 
GO
ALTER DATABASE [hastane_otomasyon] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [hastane_otomasyon] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [hastane_otomasyon] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [hastane_otomasyon] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [hastane_otomasyon] SET QUERY_STORE = ON
GO
ALTER DATABASE [hastane_otomasyon] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [hastane_otomasyon]
GO
/****** Object:  Table [dbo].[doktorlar]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doktorlar](
	[doktorNo] [int] IDENTITY(1,1) NOT NULL,
	[dokAdSoyad] [varchar](50) NULL,
	[dokMaas] [money] NULL,
	[dokBolum] [varchar](50) NULL,
	[dokYas] [int] NULL,
	[polikilinikNo] [int] NOT NULL,
 CONSTRAINT [PK_doktorlar] PRIMARY KEY CLUSTERED 
(
	[doktorNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hastalar]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hastalar](
	[hastaNo] [int] IDENTITY(1,1) NOT NULL,
	[adSoyad] [varchar](50) NULL,
	[yas] [int] NULL,
	[boy] [decimal](18, 0) NULL,
	[kilo] [int] NULL,
 CONSTRAINT [PK_hastalar] PRIMARY KEY CLUSTERED 
(
	[hastaNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kullanıcılar]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kullanıcılar](
	[kullanıcıAdi] [varchar](50) NULL,
	[kullanıcıSifre] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[polikilinik]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[polikilinik](
	[polikilinikNo] [int] IDENTITY(1,1) NOT NULL,
	[polKapasite] [int] NULL,
	[polBasHemsire] [varchar](50) NULL,
	[polAdres] [varchar](50) NULL,
	[polCiro] [int] NULL,
 CONSTRAINT [PK_polikilinik] PRIMARY KEY CLUSTERED 
(
	[polikilinikNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[receteler]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[receteler](
	[receteNo] [int] IDENTITY(1,1) NOT NULL,
	[receteTarih] [datetime] NULL,
	[receteAdi] [varchar](50) NULL,
	[doktorNo] [int] NULL,
	[hastaNo] [int] NULL,
 CONSTRAINT [PK_receteler] PRIMARY KEY CLUSTERED 
(
	[receteNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[yoneticiler]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yoneticiler](
	[yoneticiAdi] [varchar](50) NULL,
	[yoneticiSifre] [varchar](50) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[doktorlar] ON 

INSERT [dbo].[doktorlar] ([doktorNo], [dokAdSoyad], [dokMaas], [dokBolum], [dokYas], [polikilinikNo]) VALUES (1, N'seyit', 30000.0000, N'gögüs has', 25, 1)
INSERT [dbo].[doktorlar] ([doktorNo], [dokAdSoyad], [dokMaas], [dokBolum], [dokYas], [polikilinikNo]) VALUES (3, N'anıl', 50000.0000, N'göz has', 24, 2)
INSERT [dbo].[doktorlar] ([doktorNo], [dokAdSoyad], [dokMaas], [dokBolum], [dokYas], [polikilinikNo]) VALUES (4, N'furkan', 250000000.0000, N'kulak has', 15, 3)
INSERT [dbo].[doktorlar] ([doktorNo], [dokAdSoyad], [dokMaas], [dokBolum], [dokYas], [polikilinikNo]) VALUES (6, N'faruk', 250000000.0000, N'kulak has', 15, 3)
SET IDENTITY_INSERT [dbo].[doktorlar] OFF
GO
SET IDENTITY_INSERT [dbo].[hastalar] ON 

INSERT [dbo].[hastalar] ([hastaNo], [adSoyad], [yas], [boy], [kilo]) VALUES (1, N'seyit', 24, CAST(170 AS Decimal(18, 0)), 70)
INSERT [dbo].[hastalar] ([hastaNo], [adSoyad], [yas], [boy], [kilo]) VALUES (2, N'anıl', 24, CAST(185 AS Decimal(18, 0)), 85)
INSERT [dbo].[hastalar] ([hastaNo], [adSoyad], [yas], [boy], [kilo]) VALUES (3, N'furkannnnnnn', 30, CAST(173 AS Decimal(18, 0)), 80)
INSERT [dbo].[hastalar] ([hastaNo], [adSoyad], [yas], [boy], [kilo]) VALUES (6, N'tuba', 24, CAST(165 AS Decimal(18, 0)), 70)
INSERT [dbo].[hastalar] ([hastaNo], [adSoyad], [yas], [boy], [kilo]) VALUES (8, N'John Doe', 30, CAST(2 AS Decimal(18, 0)), 75)
INSERT [dbo].[hastalar] ([hastaNo], [adSoyad], [yas], [boy], [kilo]) VALUES (9, N'Jane Doe', 25, CAST(2 AS Decimal(18, 0)), 65)
INSERT [dbo].[hastalar] ([hastaNo], [adSoyad], [yas], [boy], [kilo]) VALUES (10, N'Bob Smith', 40, CAST(2 AS Decimal(18, 0)), 90)
INSERT [dbo].[hastalar] ([hastaNo], [adSoyad], [yas], [boy], [kilo]) VALUES (11, N'Alice Smith', 35, CAST(2 AS Decimal(18, 0)), 70)
INSERT [dbo].[hastalar] ([hastaNo], [adSoyad], [yas], [boy], [kilo]) VALUES (12, N'Mike Johnson', 50, CAST(2 AS Decimal(18, 0)), 100)
INSERT [dbo].[hastalar] ([hastaNo], [adSoyad], [yas], [boy], [kilo]) VALUES (13, N'Sara Johnson', 45, CAST(2 AS Decimal(18, 0)), 60)
INSERT [dbo].[hastalar] ([hastaNo], [adSoyad], [yas], [boy], [kilo]) VALUES (14, N'David Lee', 28, CAST(2 AS Decimal(18, 0)), 80)
INSERT [dbo].[hastalar] ([hastaNo], [adSoyad], [yas], [boy], [kilo]) VALUES (15, N'Emily Lee', 26, CAST(2 AS Decimal(18, 0)), 55)
INSERT [dbo].[hastalar] ([hastaNo], [adSoyad], [yas], [boy], [kilo]) VALUES (16, N'Tom Brown', 33, CAST(2 AS Decimal(18, 0)), 85)
INSERT [dbo].[hastalar] ([hastaNo], [adSoyad], [yas], [boy], [kilo]) VALUES (17, N'Linda Brown', 30, CAST(2 AS Decimal(18, 0)), 70)
INSERT [dbo].[hastalar] ([hastaNo], [adSoyad], [yas], [boy], [kilo]) VALUES (18, N'John Doe', 30, CAST(2 AS Decimal(18, 0)), 75)
INSERT [dbo].[hastalar] ([hastaNo], [adSoyad], [yas], [boy], [kilo]) VALUES (19, N'Jane Doe', 25, CAST(2 AS Decimal(18, 0)), 65)
INSERT [dbo].[hastalar] ([hastaNo], [adSoyad], [yas], [boy], [kilo]) VALUES (20, N'Bob Smith', 40, CAST(2 AS Decimal(18, 0)), 90)
INSERT [dbo].[hastalar] ([hastaNo], [adSoyad], [yas], [boy], [kilo]) VALUES (21, N'Alice Smith', 35, CAST(2 AS Decimal(18, 0)), 70)
INSERT [dbo].[hastalar] ([hastaNo], [adSoyad], [yas], [boy], [kilo]) VALUES (22, N'Mike Johnson', 50, CAST(2 AS Decimal(18, 0)), 100)
INSERT [dbo].[hastalar] ([hastaNo], [adSoyad], [yas], [boy], [kilo]) VALUES (23, N'Sara Johnson', 45, CAST(2 AS Decimal(18, 0)), 60)
INSERT [dbo].[hastalar] ([hastaNo], [adSoyad], [yas], [boy], [kilo]) VALUES (24, N'David Lee', 28, CAST(2 AS Decimal(18, 0)), 80)
INSERT [dbo].[hastalar] ([hastaNo], [adSoyad], [yas], [boy], [kilo]) VALUES (25, N'Emily Lee', 26, CAST(2 AS Decimal(18, 0)), 55)
INSERT [dbo].[hastalar] ([hastaNo], [adSoyad], [yas], [boy], [kilo]) VALUES (26, N'Tom Brown', 33, CAST(2 AS Decimal(18, 0)), 85)
INSERT [dbo].[hastalar] ([hastaNo], [adSoyad], [yas], [boy], [kilo]) VALUES (27, N'Linda Brown', 30, CAST(2 AS Decimal(18, 0)), 70)
INSERT [dbo].[hastalar] ([hastaNo], [adSoyad], [yas], [boy], [kilo]) VALUES (28, N'John Doe', 30, CAST(2 AS Decimal(18, 0)), 75)
INSERT [dbo].[hastalar] ([hastaNo], [adSoyad], [yas], [boy], [kilo]) VALUES (29, N'Jane Doe', 25, CAST(2 AS Decimal(18, 0)), 65)
INSERT [dbo].[hastalar] ([hastaNo], [adSoyad], [yas], [boy], [kilo]) VALUES (30, N'Bob Smith', 40, CAST(2 AS Decimal(18, 0)), 90)
INSERT [dbo].[hastalar] ([hastaNo], [adSoyad], [yas], [boy], [kilo]) VALUES (31, N'Alice Smith', 35, CAST(2 AS Decimal(18, 0)), 70)
INSERT [dbo].[hastalar] ([hastaNo], [adSoyad], [yas], [boy], [kilo]) VALUES (32, N'Mike Johnson', 50, CAST(2 AS Decimal(18, 0)), 100)
INSERT [dbo].[hastalar] ([hastaNo], [adSoyad], [yas], [boy], [kilo]) VALUES (33, N'Sara Johnson', 45, CAST(2 AS Decimal(18, 0)), 60)
INSERT [dbo].[hastalar] ([hastaNo], [adSoyad], [yas], [boy], [kilo]) VALUES (34, N'David Lee', 28, CAST(2 AS Decimal(18, 0)), 80)
INSERT [dbo].[hastalar] ([hastaNo], [adSoyad], [yas], [boy], [kilo]) VALUES (35, N'Emily Lee', 26, CAST(2 AS Decimal(18, 0)), 55)
INSERT [dbo].[hastalar] ([hastaNo], [adSoyad], [yas], [boy], [kilo]) VALUES (36, N'Tom Brown', 33, CAST(2 AS Decimal(18, 0)), 85)
INSERT [dbo].[hastalar] ([hastaNo], [adSoyad], [yas], [boy], [kilo]) VALUES (37, N'Linda Brown', 30, CAST(2 AS Decimal(18, 0)), 70)
SET IDENTITY_INSERT [dbo].[hastalar] OFF
GO
INSERT [dbo].[kullanıcılar] ([kullanıcıAdi], [kullanıcıSifre]) VALUES (N'seyit Muhammet', N'0709')
INSERT [dbo].[kullanıcılar] ([kullanıcıAdi], [kullanıcıSifre]) VALUES (N'seyit', N'1998')
INSERT [dbo].[kullanıcılar] ([kullanıcıAdi], [kullanıcıSifre]) VALUES (N'seyitt', N'159')
INSERT [dbo].[kullanıcılar] ([kullanıcıAdi], [kullanıcıSifre]) VALUES (N'anıl', N'1953')
GO
SET IDENTITY_INSERT [dbo].[polikilinik] ON 

INSERT [dbo].[polikilinik] ([polikilinikNo], [polKapasite], [polBasHemsire], [polAdres], [polCiro]) VALUES (1, 300, N'seyit', N'beşiktaş', 300000)
INSERT [dbo].[polikilinik] ([polikilinikNo], [polKapasite], [polBasHemsire], [polAdres], [polCiro]) VALUES (2, 500, N'anıl', N'bahçelievler', 500000)
INSERT [dbo].[polikilinik] ([polikilinikNo], [polKapasite], [polBasHemsire], [polAdres], [polCiro]) VALUES (3, 200, N'furkan', N'zeytinburnu', 400000)
INSERT [dbo].[polikilinik] ([polikilinikNo], [polKapasite], [polBasHemsire], [polAdres], [polCiro]) VALUES (5, 50, N'Jane Doe', N'123 Main St', 1000)
INSERT [dbo].[polikilinik] ([polikilinikNo], [polKapasite], [polBasHemsire], [polAdres], [polCiro]) VALUES (6, 40, N'John Doe', N'456 Elm St', 2000)
INSERT [dbo].[polikilinik] ([polikilinikNo], [polKapasite], [polBasHemsire], [polAdres], [polCiro]) VALUES (7, 30, N'Bob Smith', N'789 Oak St', 3000)
INSERT [dbo].[polikilinik] ([polikilinikNo], [polKapasite], [polBasHemsire], [polAdres], [polCiro]) VALUES (8, 20, N'Alice Smith', N'101 Maple St', 4000)
INSERT [dbo].[polikilinik] ([polikilinikNo], [polKapasite], [polBasHemsire], [polAdres], [polCiro]) VALUES (9, 10, N'Mike Johnson', N'111 Pine St', 5000)
INSERT [dbo].[polikilinik] ([polikilinikNo], [polKapasite], [polBasHemsire], [polAdres], [polCiro]) VALUES (10, 60, N'Sara Johnson', N'222 Cedar St', 6000)
INSERT [dbo].[polikilinik] ([polikilinikNo], [polKapasite], [polBasHemsire], [polAdres], [polCiro]) VALUES (11, 70, N'David Lee', N'333 Birch St', 7000)
INSERT [dbo].[polikilinik] ([polikilinikNo], [polKapasite], [polBasHemsire], [polAdres], [polCiro]) VALUES (12, 80, N'Emily Lee', N'444 Walnut St', 8000)
INSERT [dbo].[polikilinik] ([polikilinikNo], [polKapasite], [polBasHemsire], [polAdres], [polCiro]) VALUES (13, 90, N'Tom Brown', N'555 Cherry St', 9000)
INSERT [dbo].[polikilinik] ([polikilinikNo], [polKapasite], [polBasHemsire], [polAdres], [polCiro]) VALUES (14, 100, N'Linda Brown', N'666 Peach St', 10000)
INSERT [dbo].[polikilinik] ([polikilinikNo], [polKapasite], [polBasHemsire], [polAdres], [polCiro]) VALUES (15, 50, N'Jane Doe', N'123 Main St', 1000)
INSERT [dbo].[polikilinik] ([polikilinikNo], [polKapasite], [polBasHemsire], [polAdres], [polCiro]) VALUES (16, 40, N'John Doe', N'456 Elm St', 2000)
INSERT [dbo].[polikilinik] ([polikilinikNo], [polKapasite], [polBasHemsire], [polAdres], [polCiro]) VALUES (17, 30, N'Bob Smith', N'789 Oak St', 3000)
INSERT [dbo].[polikilinik] ([polikilinikNo], [polKapasite], [polBasHemsire], [polAdres], [polCiro]) VALUES (18, 20, N'Alice Smith', N'101 Maple St', 4000)
INSERT [dbo].[polikilinik] ([polikilinikNo], [polKapasite], [polBasHemsire], [polAdres], [polCiro]) VALUES (19, 10, N'Mike Johnson', N'111 Pine St', 5000)
INSERT [dbo].[polikilinik] ([polikilinikNo], [polKapasite], [polBasHemsire], [polAdres], [polCiro]) VALUES (20, 60, N'Sara Johnson', N'222 Cedar St', 6000)
INSERT [dbo].[polikilinik] ([polikilinikNo], [polKapasite], [polBasHemsire], [polAdres], [polCiro]) VALUES (21, 70, N'David Lee', N'333 Birch St', 7000)
INSERT [dbo].[polikilinik] ([polikilinikNo], [polKapasite], [polBasHemsire], [polAdres], [polCiro]) VALUES (22, 80, N'Emily Lee', N'444 Walnut St', 8000)
INSERT [dbo].[polikilinik] ([polikilinikNo], [polKapasite], [polBasHemsire], [polAdres], [polCiro]) VALUES (23, 90, N'Tom Brown', N'555 Cherry St', 9000)
INSERT [dbo].[polikilinik] ([polikilinikNo], [polKapasite], [polBasHemsire], [polAdres], [polCiro]) VALUES (24, 100, N'Linda Brown', N'666 Peach St', 10000)
INSERT [dbo].[polikilinik] ([polikilinikNo], [polKapasite], [polBasHemsire], [polAdres], [polCiro]) VALUES (25, 50, N'Jane Doe', N'123 Main St', 1000)
INSERT [dbo].[polikilinik] ([polikilinikNo], [polKapasite], [polBasHemsire], [polAdres], [polCiro]) VALUES (26, 40, N'John Doe', N'456 Elm St', 2000)
INSERT [dbo].[polikilinik] ([polikilinikNo], [polKapasite], [polBasHemsire], [polAdres], [polCiro]) VALUES (27, 30, N'Bob Smith', N'789 Oak St', 3000)
INSERT [dbo].[polikilinik] ([polikilinikNo], [polKapasite], [polBasHemsire], [polAdres], [polCiro]) VALUES (28, 20, N'Alice Smith', N'101 Maple St', 4000)
INSERT [dbo].[polikilinik] ([polikilinikNo], [polKapasite], [polBasHemsire], [polAdres], [polCiro]) VALUES (29, 10, N'Mike Johnson', N'111 Pine St', 5000)
INSERT [dbo].[polikilinik] ([polikilinikNo], [polKapasite], [polBasHemsire], [polAdres], [polCiro]) VALUES (30, 60, N'Sara Johnson', N'222 Cedar St', 6000)
INSERT [dbo].[polikilinik] ([polikilinikNo], [polKapasite], [polBasHemsire], [polAdres], [polCiro]) VALUES (31, 70, N'David Lee', N'333 Birch St', 7000)
INSERT [dbo].[polikilinik] ([polikilinikNo], [polKapasite], [polBasHemsire], [polAdres], [polCiro]) VALUES (32, 80, N'Emily Lee', N'444 Walnut St', 8000)
INSERT [dbo].[polikilinik] ([polikilinikNo], [polKapasite], [polBasHemsire], [polAdres], [polCiro]) VALUES (33, 90, N'Tom Brown', N'555 Cherry St', 9000)
INSERT [dbo].[polikilinik] ([polikilinikNo], [polKapasite], [polBasHemsire], [polAdres], [polCiro]) VALUES (34, 100, N'Linda Brown', N'666 Peach St', 10000)
SET IDENTITY_INSERT [dbo].[polikilinik] OFF
GO
SET IDENTITY_INSERT [dbo].[receteler] ON 

INSERT [dbo].[receteler] ([receteNo], [receteTarih], [receteAdi], [doktorNo], [hastaNo]) VALUES (1, CAST(N'2020-10-10T00:00:00.000' AS DateTime), N'parol', 3, 2)
INSERT [dbo].[receteler] ([receteNo], [receteTarih], [receteAdi], [doktorNo], [hastaNo]) VALUES (21, CAST(N'2023-08-23T09:04:38.000' AS DateTime), N'Recete 1', 1, 1)
INSERT [dbo].[receteler] ([receteNo], [receteTarih], [receteAdi], [doktorNo], [hastaNo]) VALUES (22, CAST(N'2023-08-23T09:04:38.000' AS DateTime), N'Recete 2', 3, 2)
INSERT [dbo].[receteler] ([receteNo], [receteTarih], [receteAdi], [doktorNo], [hastaNo]) VALUES (23, CAST(N'2023-08-23T09:04:38.000' AS DateTime), N'Recete 3', 3, 3)
INSERT [dbo].[receteler] ([receteNo], [receteTarih], [receteAdi], [doktorNo], [hastaNo]) VALUES (24, CAST(N'2023-08-23T09:04:38.000' AS DateTime), N'Recete 4', 6, 11)
INSERT [dbo].[receteler] ([receteNo], [receteTarih], [receteAdi], [doktorNo], [hastaNo]) VALUES (25, CAST(N'2023-08-23T09:04:38.000' AS DateTime), N'Recete 5', 6, 17)
INSERT [dbo].[receteler] ([receteNo], [receteTarih], [receteAdi], [doktorNo], [hastaNo]) VALUES (26, CAST(N'2023-08-23T09:04:38.000' AS DateTime), N'Recete 6', 4, 6)
INSERT [dbo].[receteler] ([receteNo], [receteTarih], [receteAdi], [doktorNo], [hastaNo]) VALUES (27, CAST(N'2023-08-23T09:04:38.000' AS DateTime), N'Recete 7', 4, 15)
INSERT [dbo].[receteler] ([receteNo], [receteTarih], [receteAdi], [doktorNo], [hastaNo]) VALUES (28, CAST(N'2023-08-23T09:04:38.000' AS DateTime), N'Recete 8', 1, 8)
INSERT [dbo].[receteler] ([receteNo], [receteTarih], [receteAdi], [doktorNo], [hastaNo]) VALUES (29, CAST(N'2023-08-23T09:04:38.000' AS DateTime), N'Recete 9', 4, 9)
INSERT [dbo].[receteler] ([receteNo], [receteTarih], [receteAdi], [doktorNo], [hastaNo]) VALUES (30, CAST(N'2023-08-23T09:04:38.000' AS DateTime), N'Recete 10', 1, 10)
INSERT [dbo].[receteler] ([receteNo], [receteTarih], [receteAdi], [doktorNo], [hastaNo]) VALUES (31, CAST(N'2023-08-23T09:04:38.000' AS DateTime), N'Recete 1', 1, 1)
INSERT [dbo].[receteler] ([receteNo], [receteTarih], [receteAdi], [doktorNo], [hastaNo]) VALUES (32, CAST(N'2023-08-23T09:04:38.000' AS DateTime), N'Recete 2', 3, 2)
INSERT [dbo].[receteler] ([receteNo], [receteTarih], [receteAdi], [doktorNo], [hastaNo]) VALUES (33, CAST(N'2023-08-23T09:04:38.000' AS DateTime), N'Recete 3', 3, 3)
INSERT [dbo].[receteler] ([receteNo], [receteTarih], [receteAdi], [doktorNo], [hastaNo]) VALUES (34, CAST(N'2023-08-23T09:04:38.000' AS DateTime), N'Recete 4', 6, 11)
INSERT [dbo].[receteler] ([receteNo], [receteTarih], [receteAdi], [doktorNo], [hastaNo]) VALUES (35, CAST(N'2023-08-23T09:04:38.000' AS DateTime), N'Recete 5', 6, 17)
INSERT [dbo].[receteler] ([receteNo], [receteTarih], [receteAdi], [doktorNo], [hastaNo]) VALUES (36, CAST(N'2023-08-23T09:04:38.000' AS DateTime), N'Recete 6', 4, 6)
INSERT [dbo].[receteler] ([receteNo], [receteTarih], [receteAdi], [doktorNo], [hastaNo]) VALUES (37, CAST(N'2023-08-23T09:04:38.000' AS DateTime), N'Recete 7', 4, 15)
INSERT [dbo].[receteler] ([receteNo], [receteTarih], [receteAdi], [doktorNo], [hastaNo]) VALUES (38, CAST(N'2023-08-23T09:04:38.000' AS DateTime), N'Recete 8', 1, 8)
INSERT [dbo].[receteler] ([receteNo], [receteTarih], [receteAdi], [doktorNo], [hastaNo]) VALUES (39, CAST(N'2023-08-23T09:04:38.000' AS DateTime), N'Recete 9', 4, 9)
INSERT [dbo].[receteler] ([receteNo], [receteTarih], [receteAdi], [doktorNo], [hastaNo]) VALUES (40, CAST(N'2023-08-23T09:04:38.000' AS DateTime), N'Recete 10', 1, 10)
INSERT [dbo].[receteler] ([receteNo], [receteTarih], [receteAdi], [doktorNo], [hastaNo]) VALUES (41, CAST(N'2023-08-23T09:04:38.000' AS DateTime), N'Recete 1', 1, 1)
INSERT [dbo].[receteler] ([receteNo], [receteTarih], [receteAdi], [doktorNo], [hastaNo]) VALUES (42, CAST(N'2023-08-23T09:04:38.000' AS DateTime), N'Recete 2', 3, 2)
INSERT [dbo].[receteler] ([receteNo], [receteTarih], [receteAdi], [doktorNo], [hastaNo]) VALUES (43, CAST(N'2023-08-23T09:04:38.000' AS DateTime), N'Recete 3', 3, 3)
INSERT [dbo].[receteler] ([receteNo], [receteTarih], [receteAdi], [doktorNo], [hastaNo]) VALUES (44, CAST(N'2023-08-23T09:04:38.000' AS DateTime), N'Recete 4', 6, 11)
INSERT [dbo].[receteler] ([receteNo], [receteTarih], [receteAdi], [doktorNo], [hastaNo]) VALUES (45, CAST(N'2023-08-23T09:04:38.000' AS DateTime), N'Recete 5', 6, 17)
INSERT [dbo].[receteler] ([receteNo], [receteTarih], [receteAdi], [doktorNo], [hastaNo]) VALUES (46, CAST(N'2023-08-23T09:04:38.000' AS DateTime), N'Recete 6', 4, 6)
INSERT [dbo].[receteler] ([receteNo], [receteTarih], [receteAdi], [doktorNo], [hastaNo]) VALUES (47, CAST(N'2023-08-23T09:04:38.000' AS DateTime), N'Recete 7', 4, 15)
INSERT [dbo].[receteler] ([receteNo], [receteTarih], [receteAdi], [doktorNo], [hastaNo]) VALUES (48, CAST(N'2023-08-23T09:04:38.000' AS DateTime), N'Recete 8', 1, 8)
INSERT [dbo].[receteler] ([receteNo], [receteTarih], [receteAdi], [doktorNo], [hastaNo]) VALUES (49, CAST(N'2023-08-23T09:04:38.000' AS DateTime), N'Recete 9', 4, 9)
INSERT [dbo].[receteler] ([receteNo], [receteTarih], [receteAdi], [doktorNo], [hastaNo]) VALUES (50, CAST(N'2023-08-23T09:04:38.000' AS DateTime), N'Recete 10', 1, 10)
INSERT [dbo].[receteler] ([receteNo], [receteTarih], [receteAdi], [doktorNo], [hastaNo]) VALUES (53, CAST(N'2023-08-23T09:04:38.000' AS DateTime), N'agu', 3, 1)
INSERT [dbo].[receteler] ([receteNo], [receteTarih], [receteAdi], [doktorNo], [hastaNo]) VALUES (54, CAST(N'2023-08-23T09:04:38.000' AS DateTime), N'bugu', 4, 1)
SET IDENTITY_INSERT [dbo].[receteler] OFF
GO
INSERT [dbo].[yoneticiler] ([yoneticiAdi], [yoneticiSifre]) VALUES (N'admin', N'123')
INSERT [dbo].[yoneticiler] ([yoneticiAdi], [yoneticiSifre]) VALUES (N'admin', N'12345')
GO
ALTER TABLE [dbo].[doktorlar]  WITH CHECK ADD  CONSTRAINT [FK_doktorlar_polikilinik] FOREIGN KEY([polikilinikNo])
REFERENCES [dbo].[polikilinik] ([polikilinikNo])
GO
ALTER TABLE [dbo].[doktorlar] CHECK CONSTRAINT [FK_doktorlar_polikilinik]
GO
ALTER TABLE [dbo].[receteler]  WITH CHECK ADD  CONSTRAINT [FK_receteler_doktorlar] FOREIGN KEY([doktorNo])
REFERENCES [dbo].[doktorlar] ([doktorNo])
GO
ALTER TABLE [dbo].[receteler] CHECK CONSTRAINT [FK_receteler_doktorlar]
GO
ALTER TABLE [dbo].[receteler]  WITH CHECK ADD  CONSTRAINT [FK_receteler_hastalar] FOREIGN KEY([hastaNo])
REFERENCES [dbo].[hastalar] ([hastaNo])
GO
ALTER TABLE [dbo].[receteler] CHECK CONSTRAINT [FK_receteler_hastalar]
GO
/****** Object:  StoredProcedure [dbo].[aEkle]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[aEkle]
@kullanıcıAdi varchar(50),
@kullanıcıSifre varchar(50)
as begin 
insert into kullanıcılar (kullanıcıAdi,kullanıcıSifre) values (@kullanıcıAdi,@kullanıcıSifre)
end
GO
/****** Object:  StoredProcedure [dbo].[aGuncelle]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[aGuncelle]
@kullanıcıAdi varchar(50),
@kullanıcıSifre varchar(50)
as begin 
update kullanıcılar set kullanıcıSifre=@kullanıcıSifre where kullanıcıAdi=@kullanıcıAdi
end
GO
/****** Object:  StoredProcedure [dbo].[aListele]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[aListele]
as begin 
select * from kullanıcılar
end
GO
/****** Object:  StoredProcedure [dbo].[aLogin]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[aLogin]
@kullanıcıAdi varchar(50),
@kullanıcıSifre varchar(50)
as begin
select * from kullanıcılar where kullanıcıAdi=@kullanıcıAdi  and kullanıcıSifre=@kullanıcıSifre
end
GO
/****** Object:  StoredProcedure [dbo].[asayi]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[asayi]
as begin
select count(kullanıcıAdi) as 'Toplam Asistan Sayısı' from kullanıcılar
end
GO
/****** Object:  StoredProcedure [dbo].[aSil]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[aSil]
@kullanıcıAdi varchar(50)
as begin
delete from kullanıcılar where kullanıcıAdi=@kullanıcıAdi
end
GO
/****** Object:  StoredProcedure [dbo].[cokhastaDok]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[cokhastaDok]
as begin
select top 1 d1.dokAdSoyad,count(r1.hastaNo) from doktorlar d1 inner join receteler r1 on d1.doktorNo=r1.doktorNo inner join hastalar h1 on r1.hastaNo=h1.hastaNo  group by d1.dokAdSoyad,r1.doktorNo
end
GO
/****** Object:  StoredProcedure [dbo].[cokreceteHasta]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[cokreceteHasta]
as begin
select top 1 h1.adSoyad,count(r1.hastaNo) from receteler r1 inner join hastalar h1 on r1.hastaNo=h1.hastaNo  group by h1.adSoyad,r1.hastaNo
end
GO
/****** Object:  StoredProcedure [dbo].[cpol]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[cpol]
as begin 
select * from polikilinik where polCiro= (select max(polCiro) from polikilinik)
end
GO
/****** Object:  StoredProcedure [dbo].[dhasta]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[dhasta]
@doktorNo int
as begin
select d1.dokAdSoyad,d1.dokBolum,h1.hastaNo,h1.adSoyad,h1.yas from doktorlar d1 inner join receteler r1 on d1.doktorNo=r1.doktorNo inner join hastalar h1 on r1.hastaNo=h1.hastaNo where d1.doktorNo=@doktorNo
end
GO
/****** Object:  StoredProcedure [dbo].[dLogin]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[dLogin]
@yoneticiAdi varchar(50),
@yoneticiSifre varchar(50)
as begin
select * from yoneticiler where yoneticiAdi=@yoneticiAdi  and yoneticiSifre=@yoneticiSifre
end
GO
/****** Object:  StoredProcedure [dbo].[doktorAra]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[doktorAra]
@dokAdSoyad varchar(50)
as 
begin
select * from doktorlar where dokAdSoyad like'%'+@dokAdSoyad+'%'
end
GO
/****** Object:  StoredProcedure [dbo].[doktorEkle]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[doktorEkle]
(@dokAdSoyad varchar(50),
@dokMaas money,
@dokBolum varchar (50),
@dokYas int,
@polikilinikNo int)
as begin
insert into doktorlar([dokAdSoyad],[dokMaas],[dokBolum],[dokYas],[polikilinikNo]) values(@dokAdSoyad,@dokMaas,@dokBolum,@dokYas,@polikilinikNo)
end
GO
/****** Object:  StoredProcedure [dbo].[doktorGuncelle]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[doktorGuncelle]
(
@doktorNo int,
@dokAdSoyad varchar(50),
@dokMaas money,
@dokBolum varchar(50),
@dokYas int,
@polikilinikNo int
)
as 
begin
update doktorlar set dokAdSoyad=@dokAdSoyad,dokMaas=@dokMaas,dokBolum=@dokBolum,dokYas=@dokYas,polikilinikNo=@polikilinikNo where doktorNo=@doktorNo
end
GO
/****** Object:  StoredProcedure [dbo].[doktorListele]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[doktorListele]
as begin
select * from doktorlar
end
GO
/****** Object:  StoredProcedure [dbo].[DoktorSil]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DoktorSil]
(
@doktorNo int
)
as 
begin
delete doktorlar where doktorNo=@doktorNo
end
GO
/****** Object:  StoredProcedure [dbo].[drecete]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[drecete]
@doktorNo int
as begin
select d1.dokAdSoyad,d1.dokBolum,r1.receteNo,r1.receteAdi,r1.receteTarih,r1.hastaNo from doktorlar d1 inner join receteler r1 on d1.doktorNo=r1.doktorNo where d1.doktorNo=@doktorNo
end
GO
/****** Object:  StoredProcedure [dbo].[dsayi]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[dsayi]
as begin
select count(doktorNo) as 'Toplam Doktor Sayısı' from doktorlar
end
GO
/****** Object:  StoredProcedure [dbo].[engenc]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[engenc]
as begin
select top 1 * from hastalar where yas=(select min(yas) from hastalar)
end
GO
/****** Object:  StoredProcedure [dbo].[enkappol]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[enkappol]
as begin
select * from polikilinik where polKapasite= (select top 1 max(polKapasite) from polikilinik)
end
GO
/****** Object:  StoredProcedure [dbo].[enkilo]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[enkilo]
as begin
select top 1 * from hastalar where kilo=(select max(kilo) from hastalar)
end
GO
/****** Object:  StoredProcedure [dbo].[enyaslı]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[enyaslı]
as begin
select top 1 * from hastalar where yas=(select max(yas) from hastalar)
end
GO
/****** Object:  StoredProcedure [dbo].[hastaEkle]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[hastaEkle]
(@adSoyad varchar(50),
@yas int,
@boy decimal,
@kilo int)
as begin
insert into hastalar(adSoyad,yas,boy,kilo) values(@adSoyad,@yas,@boy,@kilo)
end
GO
/****** Object:  StoredProcedure [dbo].[hastaGuncelle]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[hastaGuncelle]
(
@hastaNo int,
@adSoyad varchar(50),
@yas int,
@boy decimal,
@kilo int
)
as 
begin
update hastalar set adSoyad=@adSoyad,yas=@yas,boy=@boy,kilo=@kilo where hastaNo=@hastaNo
end
GO
/****** Object:  StoredProcedure [dbo].[hastaKisiListele]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[hastaKisiListele]
@hastaNo int
as begin
select * from hastalar where hastaNo=@hastaNo
end
GO
/****** Object:  StoredProcedure [dbo].[hastaListele]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[hastaListele]
as begin
select * from hastalar
end
GO
/****** Object:  StoredProcedure [dbo].[hastAra]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[hastAra]
@adSoyad varchar(50)
as 
begin
select * from hastalar where adSoyad like '%'+@adSoyad+'%'
end
GO
/****** Object:  StoredProcedure [dbo].[hastaRecete]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[hastaRecete]
@hastaNo int
as begin
select adSoyad,r1.receteAdi,r1.doktorNo,receteTarih from hastalar h1 inner join receteler r1 on h1.hastaNo=r1.hastaNo where h1.hastaNo=@hastaNo
end
GO
/****** Object:  StoredProcedure [dbo].[hastaSil]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[hastaSil]
(
@hastaNo int
)
as 
begin
delete hastalar where hastaNo=@hastaNo
end
GO
/****** Object:  StoredProcedure [dbo].[hBoy]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[hBoy]
as begin
select avg(boy) as 'Hastaların Boy Ortalaması'  from hastalar 
end
GO
/****** Object:  StoredProcedure [dbo].[hKilo]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[hKilo]
as begin
select avg(kilo) as 'Hastaların Kilo Ortalaması'  from hastalar 
end
GO
/****** Object:  StoredProcedure [dbo].[hLogin]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[hLogin]
@adSoyad varchar(50)
as begin
select hastaNo from hastalar where adSoyad=@adSoyad
end
GO
/****** Object:  StoredProcedure [dbo].[hNoBilgi]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[hNoBilgi]
@hastaNo int
as begin
select h1.hastaNo,h1.adSoyad,h1.yas,r1.receteAdi,r1.receteNo,r1.doktorNo from hastalar h1 inner join receteler r1 on h1.hastaNo=r1.hastaNo where h1.hastaNo=@hastaNo
end
GO
/****** Object:  StoredProcedure [dbo].[hsayi]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[hsayi]
as begin
select count(hastaNo) as 'Toplam Hasta Sayısı' from hastalar
end
GO
/****** Object:  StoredProcedure [dbo].[hyas]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[hyas]
as begin
select avg(yas) as 'Hastaların Yaş Ortalaması' from hastalar 
end
GO
/****** Object:  StoredProcedure [dbo].[kullanıcıEkle]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[kullanıcıEkle]
(
@kullanıcıAdi varchar(50),
@kullanıcıSifre varchar(50)
)
as 
begin
insert into kullanıcılar(kullanıcıAdi,kullanıcıSifre) values(@kullanıcıAdi,@kullanıcıSifre)
end
GO
/****** Object:  StoredProcedure [dbo].[kullanıcıListele]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[kullanıcıListele]
as 
begin
select * from kullanıcılar
end
GO
/****** Object:  StoredProcedure [dbo].[polCiroToplam]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[polCiroToplam]
as begin
select sum(polCiro) as 'Polikliniklerin Toplam Cirosu' from polikilinik
end
GO
/****** Object:  StoredProcedure [dbo].[polEkle]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[polEkle]
(@polKapasite int,
@polBasHemsire varchar(50),
@polAdres varchar(50),
@polCiro int)

as begin
insert into polikilinik(polKapasite,polBasHemsire,polAdres,polCiro) values(@polKapasite,
@polBasHemsire,@polAdres,@polCiro)
end
GO
/****** Object:  StoredProcedure [dbo].[polGuncelle]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[polGuncelle]
(@polikilinikNo int,
@polKapasite int,
@polBasHemsire varchar(50),
@polAdres varchar(50),
@polCiro int)
as 
begin
update polikilinik set polKapasite=@polKapasite,polBasHemsire=@polBasHemsire,polAdres=@polAdres,polCiro=@polCiro where polikilinikNo=@polikilinikNo
end
GO
/****** Object:  StoredProcedure [dbo].[polListele]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[polListele]
as begin
select * from polikilinik
end
GO
/****** Object:  StoredProcedure [dbo].[polSil]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[polSil]
(
@polikilinikNo int
)
as 
begin
delete polikilinik where polikilinikNo=@polikilinikNo
end
GO
/****** Object:  StoredProcedure [dbo].[psayi]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[psayi]
as begin
select count(polikilinikNo) as 'Toplam Poliklinik Sayısı' from polikilinik
end
GO
/****** Object:  StoredProcedure [dbo].[receteAra]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[receteAra]
@receteAdi varchar(50)
as begin
select * from receteler where receteAdi like '%'+@receteAdi+'%'
end
GO
/****** Object:  StoredProcedure [dbo].[receteEkle]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[receteEkle]
@receteTarih datetime,
@receteAdi varchar(50),
@doktorNo int,
@hastaNo int
as begin 
insert into receteler (receteTarih,receteAdi,doktorNo,hastaNo) values (@receteTarih,@receteAdi,@doktorNo,@hastaNo)
end
GO
/****** Object:  StoredProcedure [dbo].[receteGuncelle]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[receteGuncelle]
@receteNo int,
@receteTarih datetime,
@receteAdi varchar(50),
@doktorNo int,
@hastaNo int
as begin
update receteler set receteAdi=@receteAdi,receteTarih=@receteTarih,doktorNo=@doktorNo,hastaNo=@hastaNo where receteNo=@receteNo
end
GO
/****** Object:  StoredProcedure [dbo].[receteListele]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[receteListele]
as begin 
select * from receteler
end
GO
/****** Object:  StoredProcedure [dbo].[receteSil]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[receteSil]
@receteNo int
as begin 
delete from receteler where receteNo=@receteNo
end
GO
/****** Object:  StoredProcedure [dbo].[rsayi]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[rsayi]
as begin
select count(receteNo) as 'Toplam Reçete Sayısı' from receteler
end
GO
/****** Object:  StoredProcedure [dbo].[SdokAd]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SdokAd]
as begin
select * from doktorlar order by dokAdSoyad desc
end
GO
/****** Object:  StoredProcedure [dbo].[Sdokmas]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Sdokmas]
as begin
select * from doktorlar order by dokMaas desc
end
GO
/****** Object:  StoredProcedure [dbo].[Sdokyas]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Sdokyas]
as begin
select * from doktorlar order by dokYas desc
end
GO
/****** Object:  StoredProcedure [dbo].[selectkullanıcılar]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[selectkullanıcılar]
(
@kullanıcıAdi varchar(50),
@kullanıcıSifre varchar(50)
)
as 
begin
select * from kullanıcılar where kullanıcıAdi=@kullanıcıAdi and kullanıcıSifre=@kullanıcıSifre
end
GO
/****** Object:  StoredProcedure [dbo].[selectyoneticiler]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[selectyoneticiler]
(
@yoneticiAdi varchar(50),
@yoneticiSifre varchar(50)
)
as 
begin
select * from yoneticiler where yoneticiAdi=@yoneticiAdi and yoneticiSifre=@yoneticiSifre
end
GO
/****** Object:  StoredProcedure [dbo].[Shasad]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Shasad]
as begin
select * from hastalar order by adSoyad desc
end
GO
/****** Object:  StoredProcedure [dbo].[Shasboy]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Shasboy]
as begin
select * from hastalar order by boy desc
end
GO
/****** Object:  StoredProcedure [dbo].[Shasyas]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Shasyas]
as begin
select * from hastalar order by yas desc
end
GO
/****** Object:  StoredProcedure [dbo].[SpolCiro]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SpolCiro]
as begin
select * from polikilinik order by polCiro desc
end
GO
/****** Object:  StoredProcedure [dbo].[SpolKap]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SpolKap]
as begin
select * from polikilinik order by polKapasite desc
end
GO
/****** Object:  StoredProcedure [dbo].[SreceteTar]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SreceteTar]
as begin
select * from receteler order by receteTarih desc
end
GO
/****** Object:  StoredProcedure [dbo].[yaslidok]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[yaslidok]
as begin
select top 1 * from doktorlar where dokYas=(select max(dokYas)from doktorlar)
end
GO
/****** Object:  StoredProcedure [dbo].[yoneticiEkle]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[yoneticiEkle]
(
@yoneticiAdi varchar(50),
@yoneticiSifre varchar(50)
)
as 
begin
insert into yoneticiler(yoneticiAdi,yoneticiSifre) values(@yoneticiAdi,@yoneticiSifre)
end
GO
/****** Object:  StoredProcedure [dbo].[yoneticiListele]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[yoneticiListele]
as 
begin
select * from yoneticiler
end
GO
/****** Object:  StoredProcedure [dbo].[zendok]    Script Date: 27.08.2023 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[zendok]
as begin
select top 1 * from doktorlar where dokMaas=(select max(dokMaas)from doktorlar)
end
GO
USE [master]
GO
ALTER DATABASE [hastane_otomasyon] SET  READ_WRITE 
GO
