select *from [dbo].[Customer Data SQL]

------RETRIEVE THE TOTAL NUMBER OF CUSTOMERS FOR EACH REGION----

SELECT [Region], COUNT([CustomerID]) AS
Total_Customers
FROM [dbo].[Customer Data SQL]
GROUP BY [Region]

------FIND THE MOST POPULAR SUBSCRIPTION TYPE BY THE NUMBER OF CUSTOMERS

SELECT [SubscriptionType], COUNT([CustomerID]) AS
MOST_POPULAR_SUBSCRIPTION_TYPE
FROM [dbo].[Customer Data SQL]
GROUP BY [SubscriptionType]
ORDER BY MOST_POPULAR_SUBSCRIPTION_TYPE DESC;

SELECT TOP (1)[SubscriptionType],
 COUNT([CustomerID]) AS MOST_POPULAR_SUBSCRIPTION_TYPE
FROM [dbo].[Customer Data SQL]
GROUP BY [SubscriptionType]
ORDER BY MOST_POPULAR_SUBSCRIPTION_TYPE DESC

------FIND CUSTOMERS WHO CANCELED THEIR SUBSCRIPTION WITHIN 6 MONTHS-----

SELECT [CustomerName],[SubscriptionStart],
[SubscriptionEnd]
FROM [dbo].[Customer Data SQL]
WHERE Canceled= 'TRUE';

-------CALCULATE THE AVERAGE SUBSCRIPTION DURATION FOR ALL CUSTOMERS-----

SELECT 
AVG(DATEDIFF(MONTH,[SubscriptionStart],[SubscriptionEnd]))
  AS AVERAGEDURATION
  FROM [dbo].[Customer Data SQL]

--------FIND CUSTOMERS WITH SUBSCRIPTIONS LONGER THAN 12 MONTHS-----

SELECT*FROM [dbo].[Customer Data SQL]

SELECT [CustomerID],[SubscriptionType],[SubscriptionStart],[SubscriptionEnd]
FROM [dbo].[Customer Data SQL]
WHERE DATEDIFF(MONTH,SubscriptionStart,SubscriptionEnd)
> 12;

-------CALCULATE TOTAL REVENUE BY SUBSCRIPTION TYPE------

SELECT 
[SubscriptionType], SUM([Revenue]) AS
TOTAL_REVENUE
FROM [dbo].[Customer Data SQL]
GROUP BY SubscriptionType
ORDER BY TOTAL_REVENUE desc

------FIND THE TOP 3 REGIONS BY SUBSCRIPTION CANCELLATIONS.

SELECT TOP (3) [Region], COUNT ([CustomerID])AS CANCELLATIONS
FROM  [dbo].[Customer Data SQL] WHERE Canceled ='TRUE'
GROUP BY [Region]
ORDER BY CANCELLATIONS DESC;

----------FIND THE TOTAL NUMBER OF ACTIVE AND CANCELLED SUBSCRIPTIONS----

SELECT
SUM(CASE WHEN Canceled ='TRUE' THEN 1 ELSE 0 END) AS TOTAL_CANCELLED,
SUM(CASE WHEN Canceled ='FALSE' THEN 1 ELSE 0 END) AS TOTAL_ACTIVE
FROM [dbo].[Customer Data SQL]
