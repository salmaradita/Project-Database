USE SaraviaPen
GO

INSERT INTO Customer VALUES 
('CTR001', 'Syauqy Ahmad', 'Male', '2001-08-10', '081214151617', 'Jalan Kesehatan, Jakarta Barat', 'Syauqy.Ahmad@gmail.com'),
('CTR002', 'Jessica Nadia', 'Female', '2002-11-29', '081256589532', 'Jalan Manggis, Jakarta Barat', 'Jessica.Nadiao@gmail.com'),
('CTR003', 'Salsabila Adrian', 'Female', '2001-09-13', '081214171819', 'Jalan Bunga, Jakarta Barat', 'Salsabila.Adrian@gmail.com'),
('CTR004', 'Irshandy Yudha', 'Male', '2000-03-17', '081219181713', 'Jalan Mawar, Jakarta Barat', 'Irshandy.Yudha@gmail.com'),
('CTR005', 'Ricky Doni', 'Male', '2001-02-02', '081214161913', 'Jalan Kelapa Muda, Jakarta Barat', 'Ricky.Doni@gmail.com'),
('CTR006', 'Salma Maradita', 'Female', '2001-01-27', '081214161310', 'Jalan Maju Suka, Jakarta Barat', 'Salma.Maradita@gmail.com'),
('CTR007', 'Docdi Wijaya', 'Male', '2001-12-17', '081219181317', 'Jalan Rambutan, Jakarta Barat', 'Docdi.Wijaya@gmail.com'),
('CTR008', 'Maccha Dita', 'Female', '2002-09-20', '081232363834', 'Jalan Satria, Jakarta Barat', 'Maccha.Dita@gmail.com'),
('CTR009', 'Salino Tengko', 'Male', '2000-06-18', ' 081212131415', 'Jalan Kebugaran, Jakarta Barat', 'Salino.tengko@gmail.com'),
('CTR010', 'Sancha Perdana', 'Male', '2000-05-28', '081216181713', 'Jalan Maro, Jakarta Barat', 'Sancha.Perdana@gmail.com');


INSERT INTO Staff VALUES
('STF001', 'Joko Setianto', 'Male', '1990-08-08', '081232654748', 'Jalan Nasional, Jakarta Barat', '8000000', 'Joko.Setianto@gmail.com'), 
('STF002', 'Sandro Jaya', 'Male', '1990-03-08', '081213156432', 'Jalan Makam, Jakarta Barat', '8100000', 'Sandro.Jaya@gmail.com' ),
('STF003', 'Reni Farah', 'Female', '1990-03-09', '081269579846', 'Jalan Kesehatan 7, Jakarta Barat', '8500000', 'Reni.Farah@gmail.com' ),
('STF004', 'Adelio Arsenio', 'Female', '1991-12-18', '081236544975', 'Jalan Mangga, Jakarta Barat', '8550000', 'Adelio.Arsenio@gmail.com' ),
('STF005', 'Bagas Buana', 'Male', '1992-05-15', '081236544789', 'Jalan Mangga 2, Jakarta Barat', '8600000', 'Bagas.Buana@gmail.com' ),
('STF006', 'Bagus Buana', 'Male', '1991-06-15', '081265497862', 'Jalan Kesehatan 5, Jakarta Barat', '8700000', 'Bagus.Buana@gmail.com' ),
('STF007', 'Brandon Sukajaya', 'Male', '1991-01-01', '081236547456' ,'Jalan Deno, Jakarta Barat', '8100000', 'Brandon.Sukajaya@gmail.com' ),
('STF008', 'Dinda Marana', 'Female', '1992-02-02', '081236544897', 'Jalan Bemo, Jakarta Barat', '8200000', 'Dinda.Maran@gmail.com' ),
('STF009', 'Tuti Marina', 'Female', '1993-03-03', '081236544230', 'Jalan Merdeka, Jakarta Barat', '8300000', 'Tuti.Marina@gmail.com' ),
('STF010', 'Evan Wiliam', 'Male', '1990-04-04', '081236477415', 'Jalan Raya, Jakarta Barat', '8400000', 'Evan.Wiliam@gmail.com' );

INSERT INTO Vendor VALUES 
('VDR001', 'Jaya Makmur Industry', 'Jalan Kejayaan, Jakarta Barat', '081232126545', 'Jaya.Makmur@gmail.com'),
('VDR002', 'Sinar Abadi', 'Jalan Kehokian, Jakarta Barat', '081279564832', 'Sinar.Abadi@gmail.com'),
('VDR003', 'Sukamaju Sentosa Industry', 'Jalan Hangat, Jakarta Barat', '081233665599', 'Sukamaju.Sentosa@gmail.com'), 
('VDR004', 'Barokah Jaya', 'Jalan Dingin, Jakarta Barat', '081244669977', 'Barokah.Jaya@gmail.com'),
('VDR005', 'Berkah Sentosa Industry', 'Jalan Matahari, Jakarta Barat', '081265329466', 'Berkah.Sentosa@gmail.com'),
('VDR006', 'Berkah Jual Industry', 'Jalan Bulan, Jakarta Barat', '081233001152', 'Berkah.Jual@gmail.com'),
('VDR007', 'Kasih Murah', 'Jalan Bintang, Jakarta Barat', '081298653213', 'Kasih.Murah@gmail.com'),
('VDR008', 'Sinar Mas', 'Jalan Durian, Jakarta Barat', '081288003203', 'Sinar.Mas@gmail.com'),
('VDR009', 'Jaya Abadi Industry', 'Jalan Ambarawa, Jakarta Barat', '081236544774', 'Jaya.Abadim@gmail.com'),
('VDR010', 'Sari Abadi Industry', 'Jalan Pringombo, Jakarta Barat', '081236655555', 'Sari.Abadi@gmail.com');


INSERT INTO PenMaterial VALUES 
('PML001', 'Stainless Steel', '252000', '100' ),
('PML002', 'Plastik', '134000', '134'),
('PML003', 'Aluminium', '189000', '237' ),
('PML004', 'Bahan Daur Ulang', '87000', '278'),
('PML005', 'Plastik', '144000', '987'),
('PML006', 'Aluminium', '191000', '156'),
('PML007', 'Stainless Steel', '260000', '189'),
('PML008', 'Plastik', '121000', '567'),
('PML009', 'Plastik', '137000', '325'),
('PML010', 'Stainless Steel', '250000', '243');

INSERT INTO Pen VALUES
('PEN001', 'PML010', 'Joyko Pen', '12000', '1123'),
('PEN002', 'PML009',  'Standart Pen', '15000', '1456'),
('PEN003', 'PML008',  'Pilot Pen', '11000', '1209'),
('PEN004', 'PML007',  'Frexion Pen', '45000', '1092' ),
('PEN005', 'PML006',  'Pipo Pen', '18000', '2356' ),
('PEN006', 'PML005',  'Faster Pen', '22000', '1278' ),
('PEN007', 'PML004',  'Snowman Pen', '16000', '2134' ),
('PEN008', 'PML003',  'Boxy Pen', '13000', '1987' ),
('PEN009', 'PML002',  'Faber Pen', '29000', '2654') ,
('PEN010', 'PML001',  'Milky Pen', '32000', '1567' );


INSERT INTO SalesTransaction VALUES
('SLT001',	'2020-01-09', 'Cash',	'CTR001',	'STF001'),
('SLT002',	'2020-09-22', 'Debit',	'CTR002',	'STF002'),
('SLT003',	'2020-02-02', 'Debit',	'CTR002',	'STF001'),
('SLT004',	'2020-02-09', 'E-Money','CTR003',	'STF003'),
('SLT005',	'2020-03-22', 'Cash',	'CTR003',	'STF009'),
('SLT006',	'2020-09-09', 'Kredit',	'CTR004',	'STF008'),
('SLT007',	'2020-04-22', 'Debit',	'CTR005',	'STF005'),
('SLT008',	'2020-05-25', 'Debit',	'CTR006',	'STF006'),
('SLT009',	'2020-06-22', 'Kredit',	'CTR007',	'STF003'),
('SLT010',	'2020-07-09', 'Cash',	'CTR007',	'STF007'),
('SLT011',	'2020-08-09', 'E-Money','CTR008',	'STF008'),
('SLT012',	'2020-09-22', 'E-Money','CTR009',	'STF005'),
('SLT013',	'2020-10-09', 'Kredit',	'CTR009',	'STF009'),
('SLT014',	'2020-09-11', 'E-Money','CTR010',	'STF004'),
('SLT015',	'2020-09-22', 'Debit',	'CTR010',	'STF010');


INSERT INTO SalesTransactionDetail VALUES
('SLT001', '36000', '2', 'PEN005'),
('SLT002', '64000', '4', 'PEN007'),
('SLT003', '22000', '1', 'PEN006'),
('SLT004', '96000', '3', 'PEN010'),
('SLT005', '84000', '7', 'PEN001'),
('SLT006', '66000', '6', 'PEN003'),
('SLT007', '135000', '9','PEN002'),
('SLT008', '87000', '3', 'PEN009'),
('SLT009', '78000', '6', 'PEN008'),
('SLT001', '180000', '4','PEN004'),
('SLT011', '126000', '7','PEN005'),
('SLT012', '80000', '5', 'PEN007'),
('SLT013', '44000', '2', 'PEN006'),
('SLT014', '174000', '6','PEN009'),
('SLT015', '52000', '4', 'PEN008'),
('SLT010', '315000', '7','PEN004'),
('SLT015', '256000', '8','PEN010'),
('SLT013', '108000', '9','PEN001'),
('SLT007', '22000', '2', 'PEN003'),
('SLT005', '75000', '5', 'PEN002'),
('SLT002', '45000', '1', 'PEN004'),
('SLT010', '18000', '1', 'PEN005'),
('SLT014', '48000', '3', 'PEN007'),
('SLT002', '44000', '2', 'PEN006'),
('SLT010', '87000', '3', 'PEN009');


INSERT INTO PurchaseTransaction VALUES
('PCT001',	'2019-12-25',	'Debit',	'VDR001',	'STF001'),
('PCT002',	'2019-12-26',	'Kredit',	'VDR002',	'STF002'),
('PCT003',	'2020-01-02',	'Cash',		'VDR002',	'STF001'),
('PCT004',	'2020-01-09',	'Kredit',	'VDR003',	'STF003'),
('PCT005',	'2020-02-03',	'Debit',	'VDR003',	'STF009'),
('PCT006',	'2020-02-09',	'Kredit',	'VDR004',	'STF008'),
('PCT007',	'2020-03-04',	'Cash',		'VDR005',	'STF005'),
('PCT008',	'2020-04-05',	'Debit',	'VDR006',	'STF006'),
('PCT009',	'2020-05-06',	'E-Money',	'VDR007',	'STF003'),
('PCT010',	'2020-06-07',	'Kredit',	'VDR007',	'STF007'),
('PCT011',	'2020-07-08',	'E-Money',	'VDR008',	'STF008'),
('PCT012',	'2020-08-09',	'E-Money',	'VDR009',	'STF005'),
('PCT013',	'2020-09-10',	'Debit',	'VDR009',	'STF009'),
('PCT014',	'2020-10-11',	'E-Money',	'VDR010',	'STF004'),
('PCT015',	'2020-11-12',	'Kredit',	'VDR010',	'STF010');


INSERT INTO PurchaseTransactionDetail VALUES
('PCT001',	'864000',	'6',	'PML005'),
('PCT002',	'520000',	'2',	'PML007'),
('PCT003',	'764000',	'4',	'PML006'),
('PCT004',	'250000',	'1',	'PML010'),
('PCT005',	'1764000',	'7',	'PML001'),
('PCT006',	'1512000',	'8',	'PML003'),
('PCT007',	'536000',	'4',	'PML002'),
('PCT008',	'822000',	'6',	'PML009'),
('PCT009',	'363000',	'3',	'PML008'),
('PCT010',	'435000',	'5',	'PML004'),
('PCT003',	'1296000',	'9',	'PML005'),
('PCT012',	'1040000',	'4',	'PML007'),
('PCT013',	'382000',	'2',	'PML006'),
('PCT014',	'959000',	'7',	'PML009'),
('PCT015',	'605000',	'5',	'PML008'),
('PCT002',	'348000',	'4',	'PML004'),
('PCT005',	'1250000',	'5',	'PML010'),
('PCT007',	'756000',	'3',	'PML001'),
('PCT001',	'1512000',	'8',	'PML003'),
('PCT011',	'1206000',	'9',	'PML002'),
('PCT013',	'522000',	'6',	'PML004'),
('PCT006',	'576000',	'4',	'PML005'),
('PCT005',	'780000',	'3',	'PML007'),
('PCT015',	'1337000',	'7',	'PML006'),
('PCT003',	'685000',	'5',	'PML009');

