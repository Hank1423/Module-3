USE QuanLyBanHang;

SELECT oID, oDate, oTotalPrice
FROM `Order`;

SELECT c.cName AS CustomerName, p.pName AS ProductName
FROM customer c	
INNER JOIN `Order` o ON c.cID = o.cID
INNER JOIN OrderDetail od ON o.oID = od.oID
INNER JOIN Product p ON od.pID = p.pID;

SELECT c.cName AS CustomerName
FROM customer c
LEFT JOIN `Order` o ON c.cID = o.cID
WHERE o.oID IS NULL;

SELECT o.oID, o.oDate, SUM(od.odQTY * p.pPrice) AS TotalPrice
FROM `Order` o
INNER JOIN orderdetail od ON o.oID = od.oID
INNER JOIN product p ON od.pID = p.pID
GROUP BY o.oID, o.oDate;

