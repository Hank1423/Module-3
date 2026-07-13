CREATE DATABASE QuanLyBanHang;
USE QuanLyBanHang;

CREATE TABLE Customer (
    cID INT PRIMARY KEY,
    cName VARCHAR(50) NOT NULL,
    cAge INT
);

CREATE TABLE `Order` (
    oID INT PRIMARY KEY,
    cID INT,
    oDate DATETIME NOT NULL,
    oTotalPrice INT,
    FOREIGN KEY (cID) REFERENCES Customer(cID)
);

CREATE TABLE Product (
    pID INT PRIMARY KEY,
    pName VARCHAR(255) NOT NULL,
    pPrice INT NOT NULL
);

CREATE TABLE OrderDetail (
    oID INT,
    pID INT,
    odQTY INT NOT NULL,
    PRIMARY KEY (oID, pID),
    FOREIGN KEY (oID) REFERENCES `Order`(oID),
    FOREIGN KEY (pID) REFERENCES Product(pID)
);


SELECT * FROM `Order`;
