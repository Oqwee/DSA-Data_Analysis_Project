# DSA-Data_Analysis_Project
### This is my final project on my Data Analysis training with the Incubator Hub
This project aims to analyze the sales performance of a company's products and to present key insights to the management team, for an informed decision
## SCENARIO 1 
### KULTRA MEGA STORES INVEVENTORY
COMPANY OVERVIEW

Kultra Mega Stores (KMS), headquartered in Lagos, specialises in office supplies and 
furniture. Its customer base includes individual consumers, small businesses (retail), and 
large corporate clients (wholesale) across Lagos, Nigeria. 

#### DATA SET FOR ANALYSIS

[KMS Sql Case Study.csv](https://github.com/user-attachments/files/21130675/KMS.Sql.Case.Study.csv)

#### TOOLS USED

- MICROSOFT EXCEL [Download Here](https://www.microsoft.com/en-us/microsoft-365/excel)
	- For Data Cleaning
   	- For Data Wrangling
   	- For Data Manipulation
- SQL Server (SSMS) [Download here](https://www.microsoft.com/sql-server/sql-server-downloads)
	- For Querying
   	- For Analysis

#### EXPLORATORY DATA ANALYSIS
The data presented is clean and so did not need to be cleaned

EDA involved the exploring of the Data to answer the following questions1:
1. The product category with the highest sales 
2. The Top 3 and Bottom 3 regions in terms of sales 
3. The total sales of appliances in Ontario?

#### DATA ANALYSIS
[SQL Project 2.txt](https://github.com/user-attachments/files/21130766/SQL.Project.2.txt)

PRODUCT CATEGORY WITH THE HIGHEST SALES
``` SQL
Select * from KMS

Select top 1 * from (
		Select Product_Category, Sales, Region
				from KMS) AS Highest_Sales
Order by Sales desc
```

TOP 3 SALES REGION
``` SQL
Select top 3 * from (
		Select Product_Category,Product_Sub_Category, Sales, Order_Quantity, Region
				from KMS) AS Top_Sales_Region
Order by Sales desc
```

BOTTOM 3 SALES REGION
```SQL
Select top 3 * from (
		Select Product_Category,Product_Sub_Category, Sales, Order_Quantity, Region
				from KMS) AS Bottom_Sales_Region
Order by Sales asc
```

TOTAL SALES OF APPLIANCES IN ONTARIO
```SQL
Select  Sum(Sales) AS TotalSales, Count(distinct Order_Quantity) as Purchase_Amount, Product_Sub_Category
	from KMS
	where Region = 'Ontario' And Product_sub_Category = 'Appliances'
Group by Product_Sub_Category 
```

BOTTOM 10 CUSTOMER
``` SQL
Select top 10 
		 Customer_Name, count(distinct Order_ID) as Order_Shipment, Sum(Sales) as Total_Purchase
				from KMS
Group by Customer_Name
Order by Sum(Sales) asc
```

HIGHEST SHIPPING COST
```SQL
Select top 3
	Ship_Mode, count(distinct Order_ID) as Order_Shipment, Sum(Shipping_Cost) as Total_Cost
from KMS
Group by Ship_Mode
```

5 MOST VALUABLE CUSTOMER
``` SQL
Select top 5
	Customer_Name, count(distinct Order_ID) as No_of_Purchase, Sum(Sales) as Total_Purchase
From KMS
Group by Customer_Name
Order by Total_Purchase Desc

```

PRODUCTS MOST VALUABLE CUSTOMERS PURCHASE
``` SQL
Select top 5
	  count(distinct Order_ID) as No_of_Purchase, Sum(Sales) as Total_Purchase, Product_Sub_Category
From KMS
Group by Product_Sub_Category
Order by Total_Purchase Desc
```

HIGHEST SALES BY SMALL BUSINESS
``` SQL
Select top 1
		Customer_Name, Sum(Sales) as Total_Sales
From KMS
	Where Customer_Segment = 'Small Business'
Group by Customer_Name
Order by Total_Sales desc
```

OBSERVATION AND RECOMMENDATIONS BASED ON THE RESULT OF ANALYSIS
1. KMS should understand the specific needs of bottom customers and ensure they are always available
2. More shipping cost was incurred through Delivery trucks. KMS should spend more shipping cost on Express Air for high priority order, since it is faster.
