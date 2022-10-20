USE SaraviaPen
GO

/* simulate how the data inserted to the database if there is a 
new transaction with more than one product for sales transaction */

INSERT INTO SalesTransaction VALUES
('SLT016',	'2020-04-01', 'Debit',	'CTR002',	'STF003'),
('SLT017',	'2020-11-02', 'Cash',	'CTR003',	'STF005'),
('SLT018',	'2020-12-02', 'Debit',	'CTR007',	'STF001');


INSERT INTO SalesTransactionDetail VALUES
('SLT017', '72000', '7', 'PEN003'),
('SLT016', '12800', '3', 'PEN002'),
('SLT018', '44000', '8', 'PEN006');


/* new transaction with more than one material for purchase transaction */

INSERT INTO PurchaseTransaction VALUES
('PCT016',	'2019-11-15',	'Debit',	'VDR003',	'STF003'),
('PCT018',	'2019-11-16',	'Kredit',	'VDR007',	'STF004'),
('PCT017',	'2019-12-27',	'Cash',		'VDR002',	'STF007');


INSERT INTO PurchaseTransactionDetail VALUES
('PCT017',	'965000',	'7',	'PML003'),
('PCT018',	'524000',	'1',	'PML005'),
('PCT016',	'892000',	'8',	'PML001');
