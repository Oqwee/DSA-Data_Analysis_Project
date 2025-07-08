Select * from KMS

-------Product Category With Highest Sales----------
Select top 1 * from (
		Select Product_Category, Sales, Region
				from KMS) AS Highest_Sales
Order by Sales desc


--------Top 3 Sales Region------
Select top 3 * from (
		Select Product_Category,Product_Sub_Category, Sales, Order_Quantity, Region
				from KMS) AS Top_Sales_Region
Order by Sales desc


------Bottom 3 Sales Region-------
Select top 3 * from (
		Select Product_Category,Product_Sub_Category, Sales, Order_Quantity, Region
				from KMS) AS Bottom_Sales_Region
Order by Sales asc

Select * from KMS


--------Total Sales of Appliances in Ontario--------
Select  Sum(Sales) AS TotalSales, Count(distinct Order_Quantity) as Purchase_Amount, Product_Sub_Category
	from KMS
	where Region = 'Ontario' And Product_sub_Category = 'Appliances'
Group by Product_Sub_Category 



------Increase Revenue By Bottom 10 Customers------
Select top 10 
		 Customer_Name, count(distinct Order_ID) as Order_Shipment, Sum(Sales) as Total_Purchase
				from KMS
Group by Customer_Name
Order by Sum(Sales) asc ------KMS should understand the specific needs of these customers and provide them--------

Select * from KMS



------The Highest Shipping Cost-------
Select top 3
	Ship_Mode, count(distinct Order_ID) as Order_Shipment, Sum(Shipping_Cost) as Total_Cost
from KMS
Group by Ship_Mode -------KMS incurred the most shipping cost through EXPRESS AIR--------



-------Most Valuable Customers----------
Select top 5
	Customer_Name, count(distinct Order_ID) as No_of_Purchase, Sum(Sales) as Total_Purchase
From KMS
Group by Customer_Name
Order by Total_Purchase Desc

-------Products Most Valuable Customers Purchase------
Select top 5
	  count(distinct Order_ID) as No_of_Purchase, Sum(Sales) as Total_Purchase, Product_Sub_Category
From KMS
Group by Product_Sub_Category
Order by Total_Purchase Desc



--------Highest Sales by Small Biz Customer-----
Select top 1
		Customer_Name, Sum(Sales) as Total_Sales
From KMS
	Where Customer_Segment = 'Small Business'
Group by Customer_Name
Order by Total_Sales desc

Select * from KMS



-------
Order by Total_Sales