CREATE DATABASE SaraviaPen
GO 

USE SaraviaPen
GO 


CREATE TABLE [Customer] (
	CustomerID CHAR(6) PRIMARY KEY CHECK (CustomerID LIKE 'CTR[0-9][0-9][0-9]'),
	CustomerName VARCHAR(255) NOT NULL,
	CustomerGender VARCHAR(255) CHECK (CustomerGender IN ('Male', 'Female')) NOT NULL,
	CustomerDOB DATE NOT NULL,
	CustomerPhoneNumber VARCHAR(255) CHECK (LEN(CustomerPhoneNumber) >= 10) NOT NULL,
	CustomerAddress VARCHAR(255) NOT NULL,
	CustomerEmail VARCHAR(255) CHECK(CustomerEmail LIKE '%@%.%') NOT NULL
);


CREATE TABLE [Staff] (
	StaffID CHAR(6) PRIMARY KEY CHECK (StaffID LIKE 'STF[0-9][0-9][0-9]'),
	StaffName VARCHAR(255) CHECK (LEN(StaffName) > 3) NOT NULL,
	StaffGender VARCHAR(255) CHECK (StaffGender IN ('Male', 'Female')) NOT NULL,
	StaffDOB DATE NOT NULL,
	StaffPhoneNumber VARCHAR(255) NOT NULL,
	StaffAddress VARCHAR(255) NOT NULL,
	StaffSalary INT NOT NULL,
	StaffEmail VARCHAR(255) CHECK(StaffEmail LIKE '%@%.%') NOT NULL
);


CREATE TABLE [Vendor] (
	VendorID CHAR(6) PRIMARY KEY CHECK (VendorID LIKE 'VDR[0-9][0-9][0-9]'),
	VendorName VARCHAR(255) NOT NULL,
	VendorAddress VARCHAR(255) NOT NULL,
	VendorPhoneNumber VARCHAR(255) NOT NULL,
	VendorEmail VARCHAR(255) CHECK(VendorEmail LIKE '%@%.%') NOT NULL
);


CREATE TABLE [PenMaterial] (
	PenMaterialID CHAR(6) PRIMARY KEY CHECK (PenMaterialID LIKE 'PML[0-9][0-9][0-9]'),
	PenMaterialName VARCHAR(255) NOT NULL,
	PenMaterialPrice INT NOT NULL,
	PenMaterialStock INT CHECK (PenMaterialStock >= 100) NOT NULL
);


CREATE TABLE [Pen] (
	PenID CHAR(6) PRIMARY KEY CHECK (PenID LIKE 'PEN[0-9][0-9][0-9]'),
	PenMaterialID CHAR(6) FOREIGN KEY REFERENCES [PenMaterial](PenMaterialID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	PenName VARCHAR(255) CHECK(PenName LIKE '%Pen') NOT NULL,
	PenPrice INT CHECK (PenPrice BETWEEN 10000 AND 50000) NOT NULL,
	PenStock INT NOT NULL
);


CREATE TABLE [SalesTransaction] (
	SalesTransactionID CHAR(6) PRIMARY KEY CHECK (SalesTransactionID LIKE 'SLT[0-9][0-9][0-9]'),
	TransactionDate DATE NOT NULL, 
	PaymentType VARCHAR (255) CHECK (PaymentType IN ('Debit', 'Kredit', 'Cash', 'E-Money')) NOT NULL, 
	CustomerID CHAR(6) FOREIGN KEY REFERENCES [Customer](CustomerID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	StaffID CHAR(6) FOREIGN KEY REFERENCES [Staff](StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL
);


CREATE TABLE [SalesTransactionDetail] (
	SalesTransactionID CHAR(6) FOREIGN KEY REFERENCES [SalesTransaction](SalesTransactionID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	PenPurchased INT NOT NULL, 
	QuantityOfPen INT CHECK (QuantityOfPen > 0) NOT NULL, 
	PenID CHAR(6) FOREIGN KEY REFERENCES [Pen](PenID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	PRIMARY KEY(SalesTransactionID, PenID)
);


CREATE TABLE [PurchaseTransaction] (
	PurchaseTransactionID CHAR(6) PRIMARY KEY CHECK (PurchaseTransactionID LIKE 'PCT[0-9][0-9][0-9]'),
	TransactionDate DATE NOT NULL, 
	PaymentType VARCHAR (255) CHECK (PaymentType IN ('Debit', 'Kredit', 'Cash', 'E-Money')) NOT NULL,  
	VendorID CHAR(6) FOREIGN KEY REFERENCES [Vendor](VendorID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	StaffID CHAR(6) FOREIGN KEY REFERENCES [Staff](StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL
);


CREATE TABLE [PurchaseTransactionDetail] (
	PurchaseTransactionID CHAR(6) FOREIGN KEY REFERENCES [PurchaseTransaction](PurchaseTransactionID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	PenMaterialPurchase INT NOT NULL, 
	QuantityOfPenMaterial INT CHECK (QuantityOfPenMaterial > 0) NOT NULL, 
	PenMaterialID CHAR(6) FOREIGN KEY REFERENCES [PenMaterial](PenMaterialID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	PRIMARY KEY(PurchaseTransactionID, PenMaterialID)
);


