CREATE DATABASE Sale_Info;
USE Sale_Info;

CREATE TABLE Employees
(
Id int primary key identity,
Fullname nvarchar (60),
PositionId int references Positions(Id),
Salary decimal (18,2)
);

CREATE TABLE Positions
(
Id int primary key identity,
PostionName nvarchar(40)
);

CREATE TABLE Branchs
(
Id int primary key identity,
BranchName nvarchar (50)
);

CREATE TABLE Products
(
Id int primary key identity,
ProductName nvarchar (60),
BuyPrice decimal (18,2),
SellPrice decimal (18,2)
);

CREATE TABLE Sales
(
Id int primary key identity,
SoldDate date,
BranchId int references Branchs(Id)
);

CREATE TABLE EmployeeSales
(
Id int primary key identity,
EmployeeId int references Employees(Id),
SaleId int references Sales(Id)
);

CREATE TABLE ProductSales
(
Id int primary key identity,
ProductId int references Products(Id),
SaleId int references Sales(Id)
);

INSERT INTO Positions
VALUES
('Director'),
('Manager'),
('Cashier'),
('Assistant');

INSERT INTO Employees (Fullname,PositionId,Salary)
VALUES
('Ismixan Xudiyev',1,1000),
('Fezail Abdullayev',2,800),
('Emil Quliyev',3,400),
('Seyrulla Abdulayev',3,400),
('Ismayil Novruzlu',3,400),
('Islam Shireliyev',4,300),
('Rovshen Rustemov',4,300);

INSERT INTO Branchs
VALUES
('Yasamal'),
('Nizami'),
('Sebail'),
('Bineqedi'),
('Nesimi');

INSERT INTO Products(ProductName,BuyPrice,SellPrice)
VALUES
('bread',0.5,0.65),
('salt',0.4,0.5),
('sugar',1.75,1.95),
('tea',3.55,4.1),
('meat',9.5,11),
('milk',1.9,2.3),
('cola',1.65,1.9);

INSERT INTO Sales(SoldDate,BranchId)
VALUES
('2022-06-20',1),
('2022-06-21',2),
('2022-06-21',3),
('2022-06-22',4),
('2022-06-23',5);

INSERT INTO EmployeeSales(EmployeeId,SaleId)
VALUES
(3,1),
(4,2),
(5,3),
(6,4),
(7,5);


INSERT INTO ProductSales (ProductId,SaleId)
VALUES
(1,1),
(2,1),
(3,2),
(4,3),
(5,4),
(6,5),
(7,5);

SELECT Fullname, ProductName, BranchName, BuyPrice, SellPrice FROM Employees
INNER JOIN EmployeeSales
ON EmployeeSales.EmployeeId = Employees.Id
INNER JOIN Sales
ON EmployeeSales.SaleId = Sales.Id
INNER JOIN ProductSales
ON ProductSales.SaleId = Sales.Id
INNER JOIN Products
ON Products.Id = ProductSales.ProductId
INNER JOIN Branchs
ON Sales.BranchId = Branchs.Id

