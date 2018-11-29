DELIMITER //
DROP PROCEDURE IF EXISTS quarterly_sales_report //
CREATE PROCEDURE quarterly_sales_report(year VARCHAR(4))
BEGIN
	SELECT * FROM sales_report WHERE YEAR(_date)=year AND MONTH(_date)<=3;
	SELECT * FROM sales_report WHERE YEAR(_date)=year AND MONTH(_date)<=6 AND MONTH(_date)>3;
	SELECT * FROM sales_report WHERE YEAR(_date)=year AND MONTH(_date)<=9 AND MONTH(_date)>6;
	SELECT * FROM sales_report WHERE YEAR(_date)=year AND MONTH(_date)<=12 AND MONTH(_date)>9;
END //
DELIMITER;