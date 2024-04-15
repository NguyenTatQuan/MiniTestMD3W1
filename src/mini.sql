create database mini;
use mini;
create table City
(
    ID       int primary key,
    CityName nvarchar(255)
);

create table CategoryTour
(
    ID           int primary key,
    CategoryCode nvarchar(255),
    CategoryName nvarchar(255)
);
create table Clients
(
    ID          int primary key,
    NameClients nvarchar(255),
    IDNumber    nvarchar(255),
    DateBirth   date,
    CityID      int,
    foreign key (CityID) references City (ID)
);

create table Destination
(
    ID              int primary key,
    DestinationName nvarchar(100),
    Describes       varchar(100),
    Cost            int,
    CityID          int,
    FOREIGN KEY (CityID) references City (ID)
);

create table Tour
(
    ID            int primary key,
    TourCode      nvarchar(255),
    CategoryID    int,
    DestinationID int,
    DateStart     date,
    DateEnd       date,
    foreign key (CategoryID) references CategoryTour (ID),
    foreign key (DestinationID) references Destination (ID)
);

create table OrderTour
(
    ID       int primary key,
    TourID   int,
    ClientID int,
    Status   nvarchar(255),
    foreign key (TourID) references Tour (ID),
    foreign key (ClientID) references Clients (ID)
);


insert into City(ID, CityName)
VALUES (1, 'Hà Nội'),
       (2, 'Băc Ninh'),
       (3, 'Quảng Ninh'),
       (4, 'Hà Nội'),
       (5, 'Thanh Hóa');

insert into CategoryTour(ID, CategoryCode, CategoryName)
VALUES (1, 'PL01', 'bãi biển'),
       (2, 'PL02', 'đất liền');

insert into Clients (ID, NameClients, IDNumber, DateBirth, CityID)
values (1, 'Nguyễn Tất Quân', '0999999999', '2001-11-11', 1),
       (2, 'Trinh Lưu Khoa', '0888888888', '1999-05-25', 2),
       (3, 'Dương Minh Hiéu', '077777777', '2002-07-22', 3),
       (4, 'Phan Thanh Thảo', '066666666', '2003-01-18', 4),
       (5, 'Nguyễn Tất Quất', '055555555', '1998-02-09', 5),
       (6, 'Nguyễn Koa Pub', '044444444', '2005-03-15', 1),
       (7, 'Hiếu Hơ Hớ', '0333333333', '2004-03-21', 2),
       (8, 'Nguyễn Văn A', '0222222222', '2001-04-12', 3),
       (9, 'Nguyễn Văn B', '01111111111', '2000-05-13', 4),
       (10, 'Nguyễn Văn C', '0123456789', '2006-06-19', 5);

insert into Destination(ID, DestinationName, Describes, Cost, CityID)
VALUES (1, 'Phố đi bộ', 'Có nhiều khu vui choi', 50, 1),
       (2, 'Đền Đô', 'Nơi thờ 18 vị Vua nhà lý', 100, 2),
       (3, 'Hạ Long', 'Biển đẹp', 500, 3),
       (4, 'Phố cổ', 'Đẹp ', 199, 4),
       (5, 'Sầm sơn', 'bãi biển đẹp', 300, 5);

insert into Tour(ID, TourCode, CategoryID, DestinationID, DateStart, DateEnd)
VALUES (1, 'P01', 1, 1, '2024-03-11', '2024-02-12'),
       (2, 'P02', 1, 2, '2024-03-12', '2024-03-13'),
       (3, 'P03', 1, 3, '2024-03-13', '2024-04-14'),
       (4, 'P04', 1, 4, '2024-04-14', '2024-05-15'),
       (5, 'P05', 1, 5, '2024-04-15', '2024-06-16'),
       (6, 'P06', 1, 1, '2024-03-11', '2024-02-12'),
       (7, 'P07', 1, 2, '2024-03-12', '2024-03-13'),
       (8, 'P08', 1, 3, '2024-03-13', '2024-04-14'),
       (9, 'P09', 1, 4, '2024-04-14', '2024-05-15'),
       (10, 'P010', 1, 5, '2024-03-15', '2024-06-16'),
       (11, 'P011', 1, 1, '2024-03-11', '2024-02-12'),
       (12, 'P012', 1, 2, '2024-03-12', '2024-03-13'),
       (13, 'P013', 1, 3, '2024-04-13', '2024-04-14'),
       (14, 'P014', 1, 4, '2024-04-14', '2024-05-15'),
       (15, 'P015', 1, 5, '2024-04-15', '2024-06-16');


insert into OrderTour(ID, TourID, ClientID, Status)
VALUES (1, 1, 1, 'Đang chờ'),
       (2, 2, 2, 'Xác nhận'),
       (3, 3, 3, 'Đang chờ'),
       (4, 4, 4, 'xác nhận'),
       (5, 5, 5, 'xác nhận'),
       (6, 6, 6, 'Đang chờ'),
       (7, 7, 7, 'Đang chờ'),
       (8, 8, 8, 'Đang chờ'),
       (9, 9, 9, 'Đang chờ'),
       (10, 10, 10, 'xác nhận');


select *
from City;
select *
from CategoryTour;
select *
from Clients;
select *
from Destination;
select *
from Tour;
select *
from OrderTour;



SELECT City.CityName, COUNT(Tour.ID) AS TourCount
FROM Tour
         JOIN Destination ON Tour.DestinationID = Destination.ID
         JOIN City ON Destination.CityID = City.ID
GROUP BY City.CityName;

SELECT COUNT(ID) AS TourCount
FROM Tour
WHERE DateStart BETWEEN '2024-03-01' AND '2024-03-30';

SELECT COUNT(ID) AS TourCount
FROM Tour
WHERE DateEnd BETWEEN '2024-04-01' AND '2024-04-30';



