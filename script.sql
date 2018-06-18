DROP TABLE IF EXISTS userAccess
DROP TABLE IF EXISTS vendors // vendor setup
DROP TABLE IF EXISTS purchaseOrders //PR/PO creation
DROP TABLE IF EXISTS payments // payment details maintenance
DROP TABLE IF EXISTS vendorInvCapture

	CREATE TABLE userAccess (
	id VARCHAR(15) NOT NULL,
	pw VARCHAR(50) NOT NULL,
	access VARCHAR(50) NOT NULL,
	PRIMARY KEY (id)
);s

INSERT INTO userAccess (id, pw, access) VALUES ("tgonzales", "servlet143", "superuser");
INSERT INTO userAccess (id, pw, access) VALUES ("arlyn", "queen143", "purchasing");
INSERT INTO userAccess (id, pw, access) VALUES ("seven", "eleven143", "accountspayable");
INSERT INTO userAccess (id, pw, access) VALUES ("bowwi", "youngprince143", "vendorinvcapture");

CREATE TABLE vendors (
	vendorId INTEGER AUTO_INCREMENT,
	subsidiary VARCHAR(50) NOT NULL,
	vendorName VARCHAR(50) NOT NULL,
	vendorAddress VARCHAR(50) NOT NULL,
	billTo VARCHAR(50) NOT NULL,
	shipTo VARCHAR(50) NOT NULL,
	PRIMARY KEY(vendorid),
);

INSERT INTO vendors ("subsidiary", "vendorName", "vendorAddress", "billTo", "shipTo") VALUES ("US", "atlassians", "Ohio, US", "Netsuite Inc.", "United State");

CREATE TABLE purchaseorders (
	vendorId INTEGER AUTO_INCREMENT,
	poNumber INTEGER AUTO_INCREMENT,
	account VARCHAR(50) NOT NULL,
	Requestor VARCHAR(50) NOT NULL,
	poAmount INTEGER NOT NULL,
	PRIMARY KEY(vendorid),
);

INSERT INTO purchaseOrders ("account", "Requestor", "poAmount") VALUES ("payable", "Imee M.", 100000);
INSERT INTO purchaseOrders ("account", "Requestor", "poAmount") VALUES ("payable", "Toni G.", 500000);

CREATE TABLE payments (
	vendorId INTEGER AUTO_INCREMENT,
	paymentReference INTEGER AUTO_INCREMENT,
	paymentStatus VARCHAR(25) NOT NULL,
	beneficiary VARCHAR(50) NOT NULL,
	bankName VARCHAR(50) NOT NULL,
	accountNumber INTEGER NOT NULL,
	iban VARCHAR(50) NOT NULL,
	accountType VARCHAR(25) NOT NULL,
	swiftCode VARCHAR(50) NOT NULL,
	bankAddressNumber INTEGER NOT NULL,
	PRIMARY KEY(paymentReference),
);

INSERT INTO payments ("paymentStatus", "beneficiary", "bankName", "accountNumber", "iban", "accountType", "swiftCode", "bankAddressNumber") VALUES ("paid", "atlassians", "bank of america", 000123456789, null, "savings", "BOFAUS3N", 123456789);

CREATE TABLE vendorInvCapture (
	invoiceNumber INTEGER AUTO_INCREMENT,
	poNumber INTEGER AUTO_INCREMENT,
	vendorId INTEGER AUTO_INCREMENT,
	invoiceDate VARCHAR(25) NOT NULL,
	description VARCHAR(25) NOT NULL,
	currency VARCHAR(25) NOT NULL,
	invAmount INTEGER NOT NULL,
	tax INTEGER NOT NULL,
	vat INTEGER NOT NULL,

	PRIMARY KEY(invoiceNumber),
	FOREIGN KEY(poNumber) REFERENCES purchaseorders(vendorId),
	FOREIGN KEY(vendorId) REFERENCES purchaseorders(vendorId),
	FOREIGN KEY(paymentStatus) REFERENCES payments(paymentReference),

);

