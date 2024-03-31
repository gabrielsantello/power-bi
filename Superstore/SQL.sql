SELECT DISTINCT
    -- Select all columns except "Customer Name" and "Country"
    -- Add new calculated columns "Days for Shipment" and "Cost"
    [Order ID],
    [Segment],
    [Ship Date],
    [Ship Mode],
    [State],
    [Product ID],
    [Category],
    [Sub-Category],
    [Product Name],
    [Sales],
    [Quantity],
    [Discount],
    [Profit],
    DATEDIFF(day, [Order Date], [Ship Date]) AS [Days for Shipment],
    [Sales] - [Profit] AS [Cost]
FROM
    sales_data
WHERE
    -- Only include rows where "Discount" is less than or equal to 1
    [Discount] <= 1

SELECT DISTINCT [Segment] FROM sales_data;
SELECT DISTINCT [Ship Mode] FROM sales_data;
SELECT DISTINCT [State] FROM sales_data;
SELECT DISTINCT [Category] FROM sales_data;
SELECT DISTINCT [Sub-Category] FROM sales_data;
SELECT DISTINCT [Product Name] FROM sales_data;