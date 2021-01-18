CREATE DATABASE RentalSystem;

USE RentalSystem


/* Create table for each of them */


CREATE TABLE Branch
	(
		BranchID varchar(5) NOT NULL,
		BranchName Varchar(20) Not Null,
		TelNo Varchar(20) Not Null,
		Street Varchar(40) Not Null,
		City Varchar(40) Not null,
		Postcode INT not null
		CONSTRAINT PK_BranchID PRIMARY KEY (BranchID),
	);

CREATE TABLE Employee
	(
		EmployeeID varchar(5),
		FirstName Varchar(20) Not Null,
		LastName Varchar(20) Not Null,
		Position Varchar(20) Not Null,
		Salary Dec(6,2) Null,
		Street Varchar(40) Not Null,
		Postcode INT Not Null,
		City Varchar(50) Not Null,
		BranchID varchar(5) Not null,  --FK referencing to branch
		AssignedSupervisor varchar(5) Null,  --FK referencing to employee
		CONSTRAINT PK_EmployeeID PRIMARY KEY (EmployeeID),
	);


CREATE TABLE Property
(
	PropertyID varchar(5) NOT NULL,
	OwnerID varchar(5) NOT NULL,  --FK referencing to ownerInfo
	TypeOfHouse VARCHAR(25) NOT NULL,
	NoOfRooms TINYINT NOT NULL,
	MonthlyRent BIGINT NOT NULL,
	Street VARCHAR(100) NOT NULL,
	Poscode VARCHAR(5) NOT NULL,
	City VARCHAR(20) NOT NULL,
	CONSTRAINT PK_propertyID PRIMARY KEY (propertyID),
);


CREATE TABLE OwnerInfo
(
	OwnerID varchar(5) NOT NULL,
	PropertyID varchar(5) NOT NULL, --FK referencing to property
	S_PropertyID varchar(5) NULL, --FK referencing to property
	TypeOfOwner VARCHAR(10) NOT NULL,
	FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	Tel VARCHAR(15)  NOT NULL,
	Street VARCHAR(100) NOT NULL,
	Poscode VARCHAR(5) NOT NULL,
	City VARCHAR(20) NOT NULL,
	Email VARCHAR(30) NULL,
	Passcode VARCHAR(20) NOT NULL,
	CONSTRAINT PK_OwnerID PRIMARY KEY (OwnerID),
);


CREATE TABLE CompanyInfo
(	
	CompanyID varchar(5) NOT NULL,
	CompanyName VARCHAR(25) NOT NULL,
	TypeOfBusiness VARCHAR(25) NOT NULL,
	CONSTRAINT PK_CompanyID PRIMARY KEY (CompanyID),
);

CREATE TABLE Client
(
	ClientID varchar(5) Not Null,
	ClientName varchar(30) not null,
	EmployeeID varchar(5) Not Null,  --FK referencing to employee
	BranchID varchar(5) Not Null,  --FK referencing to branch
	Email Varchar(50) Null,
	Phone Varchar(20) Not Null,
	DesiredRent	BIGINT Not Null,
	PreferredType varchar(30) null,
	DateJoined date Not Null,
	CONSTRAINT PK_ClientID PRIMARY KEY (ClientID),
);

CREATE TABLE Lease
(
	LeaseID	varchar(5),
	ClientID varchar(5) not Null,  --FK referencing to client
	PropertyID varchar(5) Not null,  --FK referencing to property
	PaymentMethod Varchar(20) Null, 
	DepositStatus Varchar(10) Not null, 
	StartDate date null,	
	EndDate	date null,	
	LeaseDuration int Null,
	CONSTRAINT PK_LeaseID PRIMARY KEY (LeaseID),
);



/* Insert Values into it */


INSERT INTO Branch
VALUES
('BR01','Selangor','0122389284','Bandar Baru','Sungai Buloh','47000'),
('BR02','Kuala Lumpur','0122778918','Taman cempaka','Ampang','56000'),
('BR03','Kelantan','0185673214','Taman Jati','Kulim','15000'),
('BR04','Perak','0122445638','Jalan Pasir Puteh','Ipoh','30020'),
('BR05','Pahang','0122389997','Jalan kiara','Bandar Baru Gambang','26100'),
('BR06','Penang','0142358909','Jalan pintal','Georgetown','10150'),
('BR07','Negeri Sembilan','0122389176','Bandar Spring Hill','Port Dickson','71010'),
('BR08','Johor','0126784354','Taman kota','Johor Bahru','79150'),
('BR09','Kedah','0122778982','Taman putra','Kulim','09000'),
('BR10','Terengganu','0122389726','Taman medan','Bukit Besar','21100'),
('BR11','Perlis','0122356789','Jalan Besar','Kuala Perlis','02000'),
('BR12','Melaka','0122368808','Jalan Ayer Limau','Masjid Tanah','78300'),
('BR13','Sabah','0122778937','1 Borneo','Kota Kinabalu','88450'),
('BR14','Sarawak','0125436078','Green Hill','Kuching','93100');


INSERT INTO Employee (EmployeeID,FirstName,LastName,Position,Salary,Street,Postcode,City,BranchID,AssignedSupervisor)
VALUES
('EM01' ,'Abu' , 'Kasim' ,  'Supervisor' , '4500' , 'Bandar Baru' , '47000' , 'Sungai Buloh' , 'BR01' , ''),
('EM02' ,'Denes', 'Kumar',  'Assistant' , '2800' , 'Taman cempaka' , '68000' , 'Ampang' , 'BR02' , 'EM01'),
('EM03','Jhangir', 'Singh',  'Supervisor' , '3500' , 'Taman Jati' , '09000' , 'Kulim' , 'BR03' , ''),
('EM04' , 'Mohd' , 'Shah' ,  'Supervisor' , '2800' , 'Jalan Pasir Puteh' , '31650' , 'Ipoh' , 'BR04' , ''),
( 'EM05' ,'Tamil' , 'Arasan' ,  'Assistant' , '4500' , 'Jalan kiara' , '50480','Mont kiara','BR05','EM03'),
('EM06' , 'Joseph' , 'Vijay' ,  'Supervisor' , '4500' , 'Jalan pintal' , '10100' , 'Georgetown' , 'BR06', ''),
( 'EM07' ,'Aman' , 'Ali' ,  'Assistant' , '1800' , 'Setia alam' , '53100' , 'Gombak' , 'BR07' , 'EM04'),
( 'EM08' ,'Mohd' , 'Shahrul' ,  'Supervisor' , '4500' , 'Taman kota' , '81700' , 'Johor Bahru' , 'BR08', ''),
('EM09' , 'Nur' , 'Aisyah' ,  'Assistant' , '2800' , 'Taman putra' , '09000' , 'Kulim' , 'BR09' , 'EM06'),
( 'EM10' ,'Alia' , 'Bhatt' ,  'Supervisor' , '5500' , 'Taman medan' , '81700' , 'Pasir gudang' , 'BR10' , ''),
('EM11' , 'Surya' , 'Kumar' ,  'Assistant' , '4500' , 'Jinjang' , '53100' , 'Kepong' , 'BR11' , 'EM08'),
('EM12' , 'Komala' , 'Vani' ,  'Supervisor' , '6000' , 'Taman sri mas' , '47000' , 'Sungai Buloh' , 'BR12' , ''),
('EM13' , 'Sara', 'Vanan' ,  'Assistant' , '4500' , 'Jalan antoi' , '10100' , 'Georgetown' , 'BR13' , 'EM10'),
('EM14' , 'Hisham' , 'Abdullah' ,  'Supervisor' , '3500' , 'Taman mulia' , '32000' , 'Sitiawan' , 'BR14' , ''),
('EM15' , 'Anbu' , 'Selvan' ,  'Assistant' , '2800' , 'Air Keroh' , '75450' , 'Melaka' , 'BR03' , 'EM12'),
('EM16' , 'Puteri' , 'Aliza' ,  'Supervisor' , '4500' , 'Selandar' , '77500' , 'Melaka' , 'BR10' , ''),
( 'EM17' ,'Mohd' , 'Azman' ,  'Assistant' , '1800' , 'Kangar' , '01007' , 'Perlis' , 'BR04' , 'EM14'),
( 'EM18' ,'Sethu' , 'Selvan' ,  'Supervisor' , '7800' , 'Arau' , '02600' , 'Perlis' , 'BR13' , ''),
( 'EM19' ,'Arun	' , 'Vijay' ,  'Assistant' , '4500' , 'Kuala Perlis' , '02000' , 'Perlis	' , 'BR12' , 'EM16'),
('EM20' , 'Disha' , 'Patani' ,  'Supervisor' , '4000' , 'Bahau' , '72100' , 'Negeri Sembilan' , 'BR14' , ''),
('EM21' , 'Nurul' , 'Aisyah' ,  'Assistant' , '4500' , 'Bachok' , '16020' , 'Kelantan' , 'BR09' , 'EM18'),
('EM22' , 'Mohd' , 'Arsyad' ,  'Supervisor' , '7800' , 'Gombak' , '53100' , 'Johor Bahru' , 'BR08' , ''),
('EM23','Adi','Putera','Assistant','1800','Kapar','42200','Selangor','BR11','EM20'),
('EM24' , 'Hakim' , 'Rosli' ,  'Supervisor' , '4500' , 'Kuala Selangor' , '45000' , 'Selangor' , 'BR02' , ''),
('EM25' , 'Mohd' , 'Nabil' ,  'Assistant' , '2800' , 'Petaling Jaya' , '46000' , 'Selangor' , 'BR01' , 'EM22'),
('EM26','Jeff','Johnson','Assistant','3000'	,'Bukit bintang','57000','Kuala Lumpur','BR02','EM24'),
('EM27' , 'Ah' , 'Long' ,  'Assistant' , '4500' , 'Rawang' , '48000' , 'Selangor' , 'BR05' , 'EM28'),
( 'EM28' , 'Dolah' , 'Saleh' , 'Supervisor' , '3800' , 'Petaling Jaya' , '46000' , 'Selangor' , 'BR07' , ''),
('EM29' , 'Indah' , 'Izzati' ,  'Assistant' , '4500' , 'Rawang' , '48000' , 'Selangor' , 'BR13' , 'EM30'),
( 'EM30' , 'Chen' , 'Lock' , 'Supervisor' , '5800' , 'Petaling Jaya' , '46000' , 'Selangor' , 'BR07' , '');



INSERT INTO OwnerInfo
VALUES 
	('PO001', 'PRO03', '', 'Private', 'Oliver', 'Smith', '0178985654', '5 Wisma Kelana Mas 19 Lorong Dungun Bukit Damansara Mala', '50490', 'Kuala Lumpur', 'olivers@gmail.com', 'oliver123'),
	('PO002', 'PRO09', '', 'Private', 'Jack', 'Connor', '0168986545', '6 Jalan Nilam 1/7 Taman Teknologi Tinggi Subang Shah Alam', '40000', 'Shah Alam', 'connorJ@yahoo.com', 'jackc1'),
	('PO003', 'PRO16', '', 'Private', 'Noah', 'James', '0124568789', 'No. 115 Jalan Aminuddin Baki Taman Tun Dr Ismail', '60000', 'Kuala Lumpur', 'noahames@gmail.com', 'Jamesah13 '),
	('PO004', 'PRO27', '', 'Private','Liam', 'Jones', '0172207812', '3 Yow Chuan Plaza Jalan Tun Razak', '50400', 'Kuala Lumpur', 'iamjones@yahoo.com', 'Joneam45'),
	('PO005', 'PRO30', '', 'Private', 'Harry', 'Jacob', '0178027382', '18/F Menara Boustead Jalan Raja Chulan', '50200', 'Kuala Lumpur', 'jacobhry@hotmail.com', 'Jacobs64'),
	('PO006', 'PRO21', '', 'Private', 'Jacob', 'Michael', '0145789652', '73-2, Medan Bonus, Jalan Masjid India', '50100', 'Kuala Lumpur', 'michealj@gmail.com', 'Micheal123'),
	('PO007', 'PRO07', '', 'Private', 'Charlie', 'Kyle', '0132568756', 'Taman Mutiara, Jalan Sungai Abong', '84000', 'Muar', 'kylec@yahoo.com', 'kyleC9ui'),
	('PO008', 'PRO13', '', 'Private', 'Thomas', 'Brown', '0121235623', 'No. 124 B Jalan Sri Pelangi Taman Pelangi', '80400', 'Johor Bahru', 'brownt@gmail.com', 'brownT45'),
	('PO009', 'PRO11', '', 'Private', 'George', 'Reece', '0135864567', '29 Jalan Selat Selatan 4 Pnadamaran Port', '42000', 'Selangor', 'reeceg@yahoo.com', 'reeceG2sd'),
	('PO010', 'PRO14', '', 'Private', 'Michael', 'Richard', '0191237546', '42 Susur 1 Jalan Tun Razak', '80000', 'Johor Bahru', 'richardmicheal1@gmail.com', 'Richardeal2'),
	('PO011', 'PRO28', '', 'Private', 'Oscar', 'Evans', '0187561237', '2-2A Dataran Sunway Jalan PJU 5/15 Kota Damansara', '47000', 'Petaling Jaya', 'evanso@hotmail.com', 'evansOM'),
	('PO012', 'PRO04', '', 'Private', 'Alexander', 'Joseph', '0167539856', 'Jalan Kuari Kampung Cheras Baru 56100', '44498', 'Kuala Lumpur', 'josepha@gmail.com', 'josehphal1'),
	('BO001', 'PRO08', 'PRO17', 'Business', 'Adam', 'Wong', '097443049', '2&3, Jalan Tengku Besar', '15000', 'Kota Bahru', 'Cafe.ly@gmail.com', 'Cafely67'),
	('BO002', 'PRO18', '', 'Business', 'Emma', 'Wilson', '0391324692', 'B 10 Jalan Mutiara Raya Taman Mutiara', '56000', 'Kuala Lumpur', 'nyghtCl@yahoo.com', 'Nyght12'),
	('BO003', 'PRO05', '', 'Business', 'Taylor','Lewis', '0391324692', 'B 10 Jalan Mutiara Raya Taman Mutiara', '52200', 'Kuala Lumpur', 'pluggabl@gmail.com', 'Ggabl123'),
	('BO004', 'PRO12', '', 'Business', 'Northcliff', 'Jackson', '0322731822', '21ST Floor Plaza Sentral Block C Jalan Tun Sambanthan', '50470', 'Kuala Lumpur', 'Devices.co@gmail.com', 'Destackco'),
	('BO005', 'PRO23', '', 'Business', 'Dusty', 'Martinez', '055496000', '6 Jalan Canning Estate', '31400', 'Ipoh', 'elecly@yahoo.com', 'Elect78'),
	('BO006', 'PRO22', 'PRO29', 'Business', 'Lindsey', 'Martin', '073512499', 'Jalan Harmoni 3/6 Taman Desa Harmoni', '81100', 'Johor Bahru', 'Botgadget@gmail.com', '21alskd'),
	('BO007', 'PRO19', 'PRO20', 'Business', 'Quintavius', 'Flores', '082256782', '498 2 Lorong 11A Off Jalan Ang Cheng Ho Kuching', '93100', 'Kuching', 'CybineCO@yahoo.com', '7qU_&GWm'),
	('BO008', 'PRO15', '', 'Business', 'Lewin', 'Gonzales', '082233380', '211 G Jalan Haji Taha Kuching', '93400', 'Kuching', 'sopier@gmail.com', 'K-wxNU6nx}'),
	('BO009', 'PRO06', '', 'Business', 'Sandy', 'Anderson', '082455903', '121 Lorong 1 Off Jalan Penrissen Batu 3 1/2', '93250', 'Kuching', 'marlin@yahoo.com', 'qr_4b++SP9'),
	('BO010', 'PRO24', 'PRO25', 'Business', 'Treasigh', 'Sullivan', '0361841786', '211-12-7 Taman Sentul Utama Jalan Dato Senu 26', '51000', 'Kuala Lumpur', 'Compu@hotmail.com', 'ev5P9b"pH6'),
	('BO011', 'PRO10', '', 'Business', 'Cloten', 'Lewis', '088389411', 'Lorong Buah Kurma 1 Likas Industrial Centre', '88450', 'Kota Kinabalu', 'RstaurntC@yahoo.com', 'B!f6uxsF5^'),
	('BO012', 'PRO02', '', 'Business', 'Merit', 'Scoot', '082419786', '140 1 Jalan Datuk Ajibah Abol Kuching', '93400', 'Kuching', 'Ly@gmail.com', ';Sm)9@#cKS'),
	('BO013', 'PRO01', 'PRO26', 'Business', 'Gawen', 'Wood', '0340238230', '423A 1ST Floor Jalan Pahang Setapak Kuala Lumpur', '53000', 'Kuala Lumpur', 'kruncher@yahoo.com', 'kfED~f-f79')


INSERT INTO CompanyInfo
VALUES
	('BO001','Cafe.Ly', 'Sole Proprietorship'),
	('BO002','NyghtClub', 'Partnership'),
	('BO003','Pluggabl', 'Partnership'),
	('BO004','Device Stack Co.', 'Corporation'),
	('BO005','Electronic.ly', 'Sole Proprietorship'),
	('BO006','Botgadget', 'Partnership'),
	('BO007','Cybine Co.', 'Corporation'),
	('BO008','Sopier', 'Partnership'),
	('BO009','MARLIN', 'Partnership'),
	('BO010','Computezo', 'Partnership'),
	('BO011','Restaurant Chef', 'Partnership'),
	('BO012','Dining.ly', 'Partnership'),
	('BO013','Kruncher', 'Partnership')

INSERT INTO Property
VALUES
	('PRO01', 'BO013', 'Condominium', 3, 300, '19 Jalan Usj 7/3B Taman Seafield Jaya Petaling Jaya', '47610', 'Petaling Jaya'),
	('PRO02', 'BO012', 'Condominium', 3, 300, '3 1 Jalan Semarak', '54100', 'Kuala Lumpur'),
	('PRO03', 'PO001', 'Condominium', 4, 350, '546 Ground Floor Mukim Damansara', '47500', 'Petaling Jaya'),
	('PRO04', 'PO012', 'Condominium', 4, 350, 'Jalan Telaga Papan 2 Kampung Telaga Papan', '24300', 'Kerteh'),
	('PRO05', 'BO003', 'Condominium', 4, 350, '1 Jalan 4/91 Taman Shamelin', '56100', 'Kuala Lumpur'),
	('PRO06', 'BO009', 'Apartment', 3, 450, 'Ct 6 21 Subang Square Jalan SS 15/4G', '47610', 'Petaling Jaya'),
	('PRO07', 'PO007', 'Apartment', 4, 450, 'Wisma Persekutuan Jalan Dato’ Abdul Kadir', '70000', 'Negeri Sembilan'),
	('PRO08', 'BO001', 'Apartment', 4, 550, 'No. 20 Jalan SS 26/11 Petaling Jaya', '47301', 'Petaling Jaya'),
	('PRO09', 'PO002', 'Apartment', 4, 550, 'Blok 7 Lorong Bandar Indah 2 Sandakan', '90000', 'Sandakan'),
	('PRO10', 'BO011', 'Apartment', 4, 600, 'Jalan Jejaka 2 Taman Maluri Cheras', '55100', 'Kuala Lumpur'),
	('PRO11', 'PO009', 'Bungalow', 5, 850, '3 Persiaran Medan Bercham 3 Pusat Baru Bercham', '31400', 'Ipoh'),
	('PRO12', 'BO004', 'Bungalow', 5, 850, '17A Jalan 23 Kampung Cheras Baru', '56100', 'Kuala Lumpur'),
	('PRO13', 'PO008', 'Bungalow', 6, 1500, 'No. 33-2 Jalan Wangsa Delima 12 D’wangsa', '53300', 'Wangsa Maju'),
	('PRO14', 'PO010', 'Bungalow', 6, 1500, '31G Jalan Usj 10/1S', '47620', 'Petaling Jaya'),
	('PRO15', 'BO008', 'Ranch-Style Home', 5, 1800, 'Lg Sri Wangsaria Jalan Ara Bukit Bandaraya', '59100', 'Kuala Lumpur'),
	('PRO16', 'PO003', 'Ranch-Style Home', 5, 1800, '10/F Grand Seasons Avenue Hotel Jalan Pahang', '53000', 'Kuala Lumpur'),
	('PRO17', 'BO001', 'Ranch-Style Home', 5, 1800, '4021 Jalan Limau Kampung Pasir', '81200', 'Johor Bahru'),
	('PRO18', 'BO002', 'Ranch-Style Home', 6, 2200, 'Jalan 13/48A Sentual Raya Boulevard', '51000', 'Kuala Lumpur'),
	('PRO19', 'BO007', 'Ranch-Style Home', 6, 2200, '6 Jalan 51/215 Seksyen 51 Petaling Jayaa', '46050', 'Petaling Jaya'),
	('PRO20', 'BO007', 'Coach House', 4, 2500, '10 Jalan Nyior 7 Taman Nyior', '70100', 'Seremban'),
	('PRO21', 'PO006', 'Coach House', 4, 2500, '75 3 Medan Setia 1 Bukit Damansara', '50490', 'Kuala Lumpur'),
	('PRO22', 'BO006', 'Coach House', 4, 2500, 'Kilang Permint Kawasan Perindustrian Jakar Iii 24000', '15683', 'Cukai'),
	('PRO23', 'BO005', 'Coach House', 5, 3000, '14 Jalan Goh Hock Huat Kaw 18', '41400', 'Klang'),
	('PRO24', 'BO010', 'Coach House', 5, 3000, '15 Jalan Pasai 6 Taman Seri Petaling', '57000', 'Kuala Lumpur'),
	('PRO25', 'BO010', 'Historic Mansion', 10, 5000, 'No. 13 Lorong Padang Jawa Taman Bukit Seputih', '58000', 'Kuala Lumpur'),
	('PRO26', 'BO013', 'Historic Mansion', 10, 5000, '137 Jalan Gasing Seksyen 5 Petaling Jaya', '46000', 'Petaling Jaya'),
	('PRO27', 'PO004', 'Historic Mansion', 10, 5000, '55 Jalan Sultan Ahmad Shah', '10050', 'Georgetown'),
	('PRO28', 'PO011', 'Historic Mansion', 11, 6000, '102 Taman Hijau	43000	Kajang', '43000', 'Kajang'),
	('PRO29', 'BO006', 'Historic Mansion', 11, 6000, 'No. 135 2ND Floor Jalan Tuanku Antah', '70100', 'Seremban'),
	('PRO30', 'PO005', 'Historic Mansion', 11, 6000, '29C Jalan Petaling Utama 7 Taman Petaling Utama Petaling Jaya', '46000', 'Petaling Jaya')

INSERT INTO Client
VALUES
	('C01','John Smith'	,'EM07'	,'BR07'	,'jsmith@gmail.com'	,'010-321-987',930,'Coach House','1-23-2013'),
	('C02','Sarah Robert','EM03','BR03','srobert@gmail.com','010-321-988',920,'Historic Mansion','1-25-2015'),
	('C03','Mark Henry','EM16',	'BR10',	'mhenry@gmail.com',	'010-321-989',940,'Historic Mansion','12-4-2012'),
	('C04','Selena Gomez','EM12','BR12','sgomez@gmail.com','010-321-990',400, 'Condominium','1-31-2014'),
	('C05','Robertson' ,'EM17',	'BR04',	'Robert721@gmail.com','010-321-991'	,222, 'Condominium','1-2-2015'),
	('C06','Safina Zakhir','EM22','BR08','sazakhir@gmail.com','010-321-992',333,'Ranch-Style Home','6-2-2017'),
	('C07','Shaanaav Richardson','EM26'	,'BR02'	,'sharich@gmail.com','010-321-993',125,'Coach House','12-2-2016'),
	('C08','Hanifa Hussain'	,'EM18'	,'BR13'	,'hanihus@gmail.com','010-321-981',931,'Historic Mansion','9-2-2012'),
	('C09','Arya Malek','EM09',	'BR09','armalek@gmail.com','010-321-982',320, 'Condominium','9-2-2013'),
	('C10','Arthus Lizard','EM05','BR05','arthlizard@gmail.com','010-321-983',700,'Bungalow','3-2-2015'),
	('C11','Damian','EM25','BR01','Damian05@gmail.com',	'010-321-984',700,'Coach House','4-2-2020'),
	('C12','Sebastian' ,'EM14',	'BR14','Sebastian321@gmail.com','010-321-985',456,'Apartment','5-2-2018'),
	('C13','Stich bin Lilo','EM11',	'BR11',	'Stich12@gmail.com'	,'010-321-986',	246, 'Condominium',	'6-2-2016'),
	('C14','Rebecca Joshua','EM08',	'BR08',	'rejoshua@gmail.com','010-321-972',	345,'Ranch-Style Home',	'7-2-2016'),
	('C15','Jonathan Price','EM29',	'BR13',	'price@gmail.com','010-321-973',799, 'Coach House',	'8-2-2018'),
	('C16','Kameleon','EM13','BR13','Kameel101@gmail.com','010-321-974',402,'Bungalow','11-2-2020'),
	('C17','Aziz bin Azizzi','EM27','BR05',	'aziz@gmail.com','010-321-975',995,'Historic Mansion','1-2-2019'),
	('C18','Nur Alisya binti Khalid','EM02','BR02',	'khalid@gmail.com',	'010-321-976',306, 'Condominium','10-2-2020'),
	('C19','Tchalla bin Tchaka','EM26','BR02','w.forever@gmail.com','010-321-977',700,'Apartment','12-2-2014'),
	('C20','Samantha','EM10','BR10','s.katy@gmail.com','010-321-978',326,'Ranch-Style Home','11-2-2015')


INSERT INTO Lease
VALUES
	('L01',	'C18'	,'PRO01','Cash','Paid' ,	'5-5-2020','8-5-2020',3),
	('L02',	'C19',	'PRO07','Bank transfer','Not paid','11-6-2020',	'5-6-2021',	6),
	('L03',	'C11',	'PRO15','Credit card',	'Paid'	,'9-17-2020','11-17-2020',	2),
	('L04','C20',	'PRO22',	'Debit card' ,'Paid','3-10-2020','3-10-2021',12),
	('L05','C10','PRO02',	'Cash',	'Paid'	,'11-29-2020','8-29-2021',9),
	('L06','C02',	'PRO19',	'Credit card',	'Not paid',	'8-21-2020','4-21-2021',	8),
	('L07','C06',	'PRO26',	'Bank transfer'	,'Paid'	,'10-22-2020',	'10-22-2021',12),
	('L08','C17',	'PRO11',	'Credit card','Paid','3-2-2020','8-2-2020',	5),
	('L09',	'C10',	'PRO03','Cash'	,'Paid',	'6-14-2020',	'9-14-2020'	,3),
	('L10','C15',	'PRO08',	'Credit card','Not paid','4-7-2020','4-7-2021',	12),
	('L11','C09',	'PRO12',	'Debit card','Paid',	'12-28-2020','7-28-2021',	7),
	('L12','C02',	'PRO10',	'Credit card','Paid','7-5-2020'	,'1-5-2021',6),
	('L13','C03',	'PRO23',	'Debit card','Not paid'	,'8-18-2020','4-18-2021',	8),
	('L14','C12',	'PRO16',	'Bank transfer',	'Paid',	'3-25-2020',	'11-25-2020',	8),
	('L15','C13'	,'PRO25',	'Credit card','Not paid','10-2-2020',	'12-2-2021',	14),
	('L16','C04',	'PRO04',	'Cash'	,'Paid',	'2-16-2020'	,'6-16-2021',	16),
	('L17','C16'	,'PRO28',	'Debit card','Paid',	'9-7-2020',	'8-7-2021',	11),
	('L18','C19'	,'PRO24',	'Credit card',	'Paid',	'8-10-2020'	,'4-10-2021',	8),
	('L19','C08',	'PRO27',	'Bank transfer','Paid'	,'12-4-2020',	'5-4-2021',	5),
	('L20',	'C14',	'PRO09','Debit card',	'Not paid',	'4-27-2020',	'7-27-2021'	,15),
	('L21',	'C10',	'PRO30','Credit card',	'Paid' ,	'7-28-2020'	,'8-28-2021'	,13),
	('L22','C11',	'PRO05',	'Cash',	'Paid'	,'2-8-2020',	'11-8-2020'	,9),
	('L23','C18'	,'PRO20',	'Debit card',	'Not paid'	,'4-22-2020'	,'3-22-2021'	,11),
	('L24','C07','PRO14',	'Debit card','Not paid'	,'6-4-2020'	,'4-4-2021'	,10),
	('L25','C01',	'PRO29',	'Bank transfer'	,'Paid'	,'1-17-2020',	'8-17-2020'	,7),
	('L26',	'C20',	'PRO17','Credit card',	'Paid'	,'12-23-2020'	,'4-23-2021',	4),
	('L27',	'C05'	,'PRO06','Cash','Not paid',	'5-24-2020'	,'3-24-2021',	10),
	('L28','C04',	'PRO13',	'Debit card','Paid','2-2-2020',	'8-2-2020',	6),
	('L29','C11',	'PRO21',	'Credit card','Paid','7-13-2020','4-13-2021',	9),
	('L30','C13',	'PRO18',	'Bank transfer'	,'Paid'	,'3-8-2020','2-8-2021',11);


/* Do the Foreign Key setting */

ALTER TABLE Employee WITH NOCHECK ADD CONSTRAINT FK_AssignedSupervisor FOREIGN KEY (AssignedSupervisor) 
REFERENCES Employee(EmployeeID)
GO
ALTER TABLE Employee CHECK CONSTRAINT FK_AssignedSupervisor
GO


ALTER TABLE Lease WITH CHECK ADD CONSTRAINT FK_PropertyL FOREIGN KEY (PropertyID) 
REFERENCES Property(PropertyID)
GO
ALTER TABLE Lease CHECK CONSTRAINT FK_PropertyL
GO


ALTER TABLE Employee WITH CHECK ADD CONSTRAINT FK_BranchID FOREIGN KEY (BranchID)
REFERENCES Branch(BranchID);
GO
ALTER TABLE Employee CHECK CONSTRAINT FK_BranchID
GO


ALTER TABLE Property WITH CHECK ADD CONSTRAINT FK_OwnerID FOREIGN KEY (OwnerID) 
REFERENCES OwnerInfo(OwnerID)
GO
ALTER TABLE Property CHECK CONSTRAINT FK_OwnerID
GO


ALTER TABLE Client WITH CHECK ADD CONSTRAINT FK_EmployeeID FOREIGN KEY (EmployeeID) 
REFERENCES Employee(EmployeeID)
GO
ALTER TABLE Client CHECK CONSTRAINT FK_EmployeeID
GO


ALTER TABLE Client WITH CHECK ADD CONSTRAINT FK_BranchEmp FOREIGN KEY (BranchID) 
REFERENCES Branch(BranchID)
GO
ALTER TABLE Client CHECK CONSTRAINT FK_BranchEmp
GO


ALTER TABLE Lease WITH NOCHECK ADD CONSTRAINT FK_ClientL FOREIGN KEY (ClientID) 
REFERENCES Client(ClientID)
GO
ALTER TABLE Lease CHECK CONSTRAINT FK_ClientL
GO


ALTER TABLE CompanyInfo WITH CHECK ADD CONSTRAINT FK_CompanyID FOREIGN KEY (CompanyID)
REFERENCES OwnerInfo(OwnerID)
GO
ALTER TABLE CompanyInfo CHECK CONSTRAINT FK_CompanyID
GO


ALTER TABLE OwnerInfo WITH CHECK ADD CONSTRAINT FK_PropertyID FOREIGN KEY (PropertyID) 
REFERENCES Property(PropertyID)
GO
ALTER TABLE OwnerInfo CHECK CONSTRAINT FK_PropertyID
GO


ALTER TABLE OwnerInfo WITH NOCHECK ADD CONSTRAINT FK_S_Property_ID FOREIGN KEY (S_PropertyID)
REFERENCES Property(PropertyID)
GO
ALTER TABLE OwnerInfo CHECK CONSTRAINT FK_S_Property_ID
GO


/* to check results */

select * from Employee;
select * from Branch;
select * from Property;
select * from OwnerInfo;
select * from CompanyInfo;
select * from Client;
select * from Lease;


/* to delete RentalSystem database */

Use master;
DROP DATABASE RentalSystem;

SELECT ClientName,phone,branchID
FROM client 