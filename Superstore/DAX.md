```
dCalendar = CALENDAR (MIN ('fSales_Data'[Order Date]), MAX ('fSales_Data'[Order Date]))
```
```
Day = dCalendar[Date].[Day]
```
```
Month = dCalendar[Date].[MonthNo]
```
```
Month_Name = dCalendar[Date].[Month]
```
```
MonthMMM = FORMAT(dCalendar[Date].[Date], "mmm")
```
```
Year = dCalendar[Date].[Year]
```
```
Profit = SUM(fSales_Data[Profit])
```
```
Profit Margin = DIVIDE([Profit],[Cost])
```
```
NCustomer = DISTINCTCOUNT(fSales_Data[Customer ID])
```
```
Cost = SUM(fSales_Data[Cost])
```
```
YearlyProfit = TOTALYTD([Profit],dCalendar[Date])
```
```
MonthlyProfit = TOTALMTD([Profit],dCalendar[Date])
```
```
LastYearProfit = CALCULATE([YearlyProfit],PREVIOUSYEAR(dCalendar[Date]))
```
```
LastMonthProfit = CALCULATE([MonthlyProfit],DATEADD(dCalendar[Date],-1,MONTH))
```
```
LastYearMonthProfit = CALCULATE([MonthlyProfit],DATEADD(dCalendar[Date],-12,MONTH))
```
```
%YoY Profit = 
IF (
    ISBLANK([YearlyProfit]) || ISBLANK([LastYearProfit]),
    0,
    DIVIDE([YearlyProfit] - [LastYearProfit], [LastYearProfit])
)
```
```
%MoM Profit = 
IF (
    ISBLANK([MonthlyProfit]) || ISBLANK([LastMonthProfit]),
    "No Data",
    DIVIDE([MonthlyProfit] - [LastMonthProfit], [LastMonthProfit])
)
```
```
%MoMoftheLastYearProfit = IF (
    ISBLANK([MonthlyProfit]) || ISBLANK([LastYearMonthProfit]),
    "No Data",
    DIVIDE([MonthlyProfit] - [LastYearMonthProfit], [LastYearMonthProfit])
)
```
```
TooltipStateTitle = SELECTEDVALUE(fSales_Data[State])
```