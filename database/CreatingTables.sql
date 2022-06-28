USE WasteManagementDB;

CREATE TABLE tblTransactions (
TransactionID int NOT NULL PRIMARY KEY,
GoodsPurchased VARCHAR(max) NOT NULL,
NewCreditBalance int NOT NULL
);

CREATE TABLE tblRecyclables(
RecyclableItemID int NOT NULL PRIMARY KEY,
ValuePlasticPerWeight int NOT NULL,
ValuePaperPerWeight int NOT NULL,
ValueGlassPerWeight int NOT NULL,
ValueTinPerWeight int NOT NULL,
RecyclableTotalWeight int NOT NULL
);

CREATE TABLE tblRecyclingPlantDetails(
PlantNumber int NOT NULL PRIMARY KEY,
PlantName VARCHAR(40) NOT NULL,
PlantAddress VARCHAR(40) NOT NULL,
OperationalStatus VARCHAR(40) NOT NULL,
RecyclableItemID int NOT NULL FOREIGN KEY REFERENCES tblRecyclables(RecyclableItemID)

);

CREATE TABLE tblBagDetails(
RecyclingBagID int NOT NULL PRIMARY KEY,
PlantNumber int NOT NULL FOREIGN KEY REFERENCES tblRecyclingPlantDetails(PlantNumber)
);

CREATE TABLE tblAccountDetails (
AccountNumber int NOT NULL PRIMARY KEY,
CreditBalance int NOT NULL,
RegistrationLocation VARCHAR(40) NOT NULL,
RecyclingBagID int NOT NULL FOREIGN KEY REFERENCES tblBagDetails(RecyclingBagID),
TransactionID int NOT NULL FOREIGN KEY REFERENCES tblTransactions(TransactionID),
);

CREATE TABLE tblCustomerDetails (
CustomerID int NOT NULL PRIMARY KEY,
FirstName VARCHAR(40) NOT NULL,
EmailAddress VARCHAR(40) NOT NULL,
Phone int NOT NULL,
LastName VARCHAR(40) NOT NULL,
PhysicalAddress VARCHAR(40) NOT NULL,
AccountNumber int NOT NULL FOREIGN KEY REFERENCES tblAccountDetails(AccountNumber)
);

CREATE TABLE tblStoreDetails(
StoreID int NOT NULL PRIMARY KEY,
RecyclingBagID int NOT NULL FOREIGN KEY REFERENCES tblBagDetails(RecyclingBagID),
StoreAddress VARCHAR(40) NOT NULL,
StoreName VARCHAR(40) NOT NULL
);
