USE SaraviaPen
GO

/*1. Display CustomerId, CustomerName, SalesTransactionDate, and Sales Transaction Quantity 
(obtained from the sum of quantity) for every sales transaction which the transaction happened 
on the 25th day and the id of the pen is ‘PEN009’ */

SELECT
	ct.CustomerID,
	CustomerName,
	[SalesTransactionDate] = TransactionDate,
	[Sales Transaction Quantity] = SUM(QuantityOfPen)
FROM Customer ct JOIN SalesTransaction st
ON ct.CustomerID = st.CustomerID
JOIN SalesTransactionDetail std
ON st.SalesTransactionID = std.SalesTransactionID
WHERE DAY(TransactionDate) = 25 
AND PenID = 'PEN009'
GROUP BY ct.CustomerID, CustomerName, TransactionDate

/*2. Display PenId, PenName, and Total of Pen Material (obtained from the count of pen material purchased) 
for every pen which has name starts with ‘Milky’ and the Total of Pen Material is more than 6. */

SELECT 
	PenID,
	PenName,
	[Total of Pen Material] = COUNT(PurchaseTransaction.PurchaseTransactionID)
FROM PurchaseTransaction JOIN PurchaseTransactionDetail 
ON PurchaseTransaction.PurchaseTransactionID = PurchaseTransaction.PurchaseTransactionID
JOIN PenMaterial ON PurchaseTransactionDetail.PenMaterialID = PurchaseTransactionDetail.PenMaterialID
JOIN Pen ON PenMaterial.PenMaterialID = Pen.PenMaterialID
GROUP BY PenID, PenName
HAVING PenName LIKE 'Milky %' AND 
COUNT(PurchaseTransaction.PurchaseTransactionID) > 6


/*3. Display CustomerName, Sales Transaction Date (obtained from sales transaction date in ‘yyyy.mm.dd’), 
Total Pen Type (obtained from the count of pen purchased), and Total Quantity (obtained from the sum of quantity) 
for every sales transaction which the transaction happened on the 9th month and the Total Quantity is more than 10. */

SELECT
	CustomerName,
	[Sales Transaction Date] = CONVERT(VARCHAR, TransactionDate, 102),
	[Total Pen Type] = COUNT(SalesTransaction.SalesTransactionID),
	[Total Quantity] = SUM(QuantityOfPen)
FROM Customer JOIN SalesTransaction
ON Customer.CustomerID = SalesTransaction.CustomerID
JOIN SalesTransactionDetail ON SalesTransaction.SalesTransactionID = SalesTransactionDetail.SalesTransactionID
GROUP BY CustomerName, TransactionDate
HAVING MONTH(TransactionDate) = 9
AND SUM(QuantityOfPen) > 10

/*4. Display StaffName, Staff Gender (obtained from the first letter of staff’s gender), CustomerName, 
and Total Sales Transaction (obtained from the count of the sales transaction) for every sales transaction 
that happened on an even day and the sum of quantity is lower or equal to 10. */

SELECT 
	StaffName, 
	StaffGender = LEFT (StaffGender, 1), 
	CustomerName, 
	[Total Sales Transaction] = COUNT (SalesTransaction.SalesTransactionID)
FROM salestransaction JOIN staff 
ON staff.StaffID = salestransaction.StaffID
JOIN customer ON customer.CustomerID = salestransaction.CustomerID
JOIN SalesTransactionDetail ON SalesTransaction.SalesTransactionID = SalesTransactionDetail.SalesTransactionID
WHERE DAY(salestransaction.TransactionDate) % 2 = 0 
GROUP BY StaffName, StaffGender, CustomerName
HAVING SUM(SalesTransactionDetail.QuantityOfPen) <= 10


/*5. Display CustomerName (obtained from customer name in uppercase format), CustomerGender, and 
SalesTransactionId for every sales transaction that happened on the 22th and the quantity is greater than 
the average quantity of all sales transaction. The result query doesn’t have duplicate rows.
(alias subquery)*/

SELECT DISTINCT
	[Customer Name] = UPPER(CustomerName),
	CustomerGender,
	SalesTransaction.SalesTransactionID
FROM SalesTransaction JOIN Customer
ON Customer.CustomerID = SalesTransaction.CustomerID
JOIN SalesTransactionDetail ON SalesTransaction.SalesTransactionID = SalesTransactionDetail.SalesTransactionID,
	(
		SELECT AVERAGE = AVG(QuantityOfPen) 
		FROM SalesTransactionDetail
	) as ALIAS
WHERE QuantityOfPen > ALIAS.AVERAGE 
AND DAY(TransactionDate) = '22' 

/*6. Display VendorName, PurchaseDate (obtained from purchases date in ‘Mon dd, yyyy’ format), and MaterialName 
(obtained from the material of pen name in lowercase format) for every purchase transaction with a pen material 
price is greater than the average price of all materials and the vendor’s name ends with ‘ Industry’.
(alias subquery)*/

SELECT 
	VendorName,
	[PurchaseDate] = CONVERT (VARCHAR, PurchaseTransaction.TransactionDate, 101),
	[MaterialName] = LOWER (PenMaterialName)
FROM PurchaseTransaction JOIN Vendor
ON PurchaseTransaction.VendorID = Vendor.VendorID
JOIN PurchaseTransactionDetail ON PurchaseTransactionDetail.PurchaseTransactionID = PurchaseTransaction.PurchaseTransactionID
JOIN PenMaterial ON PenMaterial.PenMaterialID = PurchaseTransactionDetail.PenMaterialID,
	(
		SELECT AVERAGE = AVG(PenMaterialPrice)
		FROM PenMaterial
	) AS ALIAS 
WHERE PenMaterialPrice > ALIAS.AVERAGE
AND VendorName LIKE '% Industry'

/*7. Display Total Purchase Transaction (obtained from count of purchase transactions and ended with ‘ Transaction(s)’), 
VendorName, Staff Name (obtained from staff’s name from the first character until a character before space), 
and PurchaseTransactionDate for every purchase transaction with the quantity is lower than the average quantity of 
all purchase transaction and the purchase transaction happened on Sunday.
(alias subquery)*/

SELECT
	[Total Purchase Transaction] = CONCAT (COUNT(PurchaseTransaction.PurchaseTransactionID), ' Transaction(s)'),
	VendorName,
	[Staff Name] = SUBSTRING (StaffName, 1, CHARINDEX(' ', StaffName)),
	TransactionDate
FROM PurchaseTransaction JOIN Vendor 
ON PurchaseTransaction.VendorID = Vendor.VendorID
JOIN Staff ON PurchaseTransaction.StaffID = Staff.StaffID
JOIN PurchaseTransactionDetail ON PurchaseTransaction.PurchaseTransactionID = PurchaseTransactionDetail.PurchaseTransactionID,
	(
		SELECT AVERAGE = AVG(QuantityOfPenMaterial) 
		FROM PurchaseTransactionDetail
	) AS ALIAS
WHERE QuantityOfPenMaterial < ALIAS.AVERAGE
AND DATENAME(WEEKDAY, TransactionDate) = 'Sunday'
GROUP BY VendorName, StaffName, TransactionDate

/*8. Display VendorName, Transaction Date (obtained from purchases date in ‘dd mon yyyy’ format), PenMaterialName, and 
Material Number (obtained from PenMaterialId by replacing the first three characters with ‘PM’) for every purchase 
transaction with the pen material stock is greater than the average of all pen material stock and the total price 
(obtained from the sum of transaction quantity multiplied with pen material price) is greater than 500000. Sort the result by vendor name in descending order.
(alias subquery)*/

SELECT 
	VendorName,
	[Transaction Date] = CONVERT (VARCHAR, PurchaseTransaction.TransactionDate, 103),
	PenMaterialName,
	[Material Number] = STUFF(PenMaterial.PenMaterialID, 1, 3, 'PM')
FROM PurchaseTransaction JOIN Vendor
ON PurchaseTransaction.VendorID = Vendor.VendorID
JOIN PurchaseTransactionDetail ON PurchaseTransaction.PurchaseTransactionID = PurchaseTransactionDetail.PurchaseTransactionID
JOIN PenMaterial ON PenMaterial.PenMaterialID = PurchaseTransactionDetail.PenMaterialID,
	(
		SELECT AVERAGE = AVG(PenMaterialStock)
		FROM PenMaterial
	)AS ALIAS 
WHERE PenMaterialStock > ALIAS.AVERAGE 
GROUP BY VendorName, PenMaterialName, PenMaterialPrice, TransactionDate, PenMaterial.PenMaterialID
HAVING (SUM(PurchaseTransactionDetail.QuantityOfPenMaterial) * PenMaterialPrice) > 500000
ORDER BY VendorName DESC

/*9. Create a view named ‘ViewSalesTransaction’ to display StaffName, CustomerName, Total Sales Transaction 
(obtained from the count of sales transaction), and Maximum Sales (obtained from the maximum of quantity) 
for every sales transaction made by a customer whose name contains ‘c’ and the Total Sales Transaction is 
greater than 2. */

CREATE VIEW ViewSalesTransaction AS 
SELECT 
	StaffName,
	CustomerName,
	[Total Sales Transaction] = COUNT (SalesTransaction.SalesTransactionID), 
	[Maximum Sales] = MAX (QuantityOfPen)
FROM SalesTransaction JOIN Customer
ON SalesTransaction.CustomerID = Customer.CustomerID
JOIN Staff ON SalesTransaction.StaffID = Staff.StaffID
JOIN SalesTransactionDetail ON SalesTransaction.SalesTransactionID = SalesTransactionDetail.SalesTransactionID 
GROUP BY StaffName, CustomerName
HAVING CustomerName LIKE '%c%' AND 
COUNT (SalesTransaction.SalesTransactionID) > 2

SELECT * FROM ViewSalesTransaction

/*10. Create a view named ‘ViewPurchaseDetail’ to display VendorName, Total Purchase Quantity 
(obtained from the sum of quantity), and Total Purchase Transaction (obtained from the count of purchase transaction) 
for every staff whose gender is male, and the Total Purchase Transaction is greater than 1. */

CREATE VIEW ViewPurchaseDetail AS
SELECT 
	VendorName,
	[Total Purchase Quantity] = SUM (QuantityOfPenMaterial) , 
	[Total Purchase Transaction] = COUNT (PurchaseTransaction.PurchaseTransactionID)
FROM PurchaseTransaction JOIN Vendor
ON PurchaseTransaction.VendorID = Vendor.VendorID
JOIN PurchaseTransactionDetail ON PurchaseTransaction.PurchaseTransactionID = PurchaseTransactionDetail.PurchaseTransactionID
JOIN Staff ON PurchaseTransaction.StaffID = Staff.StaffID
GROUP BY VendorName, StaffGender
HAVING StaffGender = 'Male' AND 
COUNT (PurchaseTransaction.PurchaseTransactionID) > 1

SELECT * FROM ViewPurchaseDetail

