# Amazon Sales Analysis

##  Project Overview

Amazon Sales Analysis is a data analytics project that analyzes Amazon India e-commerce apparel sales using Excel, SQL, and Python. The project analyzes ~1.29 lakh real Amazon orders from March 2022 to June 2022 to identify sales trends, revenue drivers, geographic concentration, fulfilment performance, and cancellation patterns to help the business make better inventory and operations decisions.

---

##  Problem Statement

Online apparel sellers lose significant revenue to cancellations, seasonal demand drops, and misallocated inventory.

This project answers important business questions such as:

- Which product categories generate the highest revenue and order volume?
- How is revenue trending month over month?
- Which states and cities are the biggest markets?
- What is the order cancellation rate, and which fulfilment type cancels more?
- Which product sizes are most in demand?
- Do B2B customers spend more than retail customers?
- How do order volumes vary by day of the week?

---

##  Dataset Overview

**Dataset Name:** Amazon Sale Report (Amazon India Apparel Sales, Mar-Jun 2022)

### Dataset Summary

- **Total Records:** 128,976 raw rows (128,017 after cleaning)
- **Variables:** 21
- **Unique Orders:** 120,229
- **Total Revenue:** ₹7.82 Crore
- **Average Order Value:** ₹611
- **Date Range:** 31-Mar-2022 to 29-Jun-2022
- **Categories:** 9 (T-shirt, Shirt, Blazer, Trousers, Perfume, Wallet, Socks, Shoes, Watch)
- **States Covered:** 40+ (Pan-India)
- **Fulfilment Types:** 2 (Amazon, Merchant)
- **Cancellation Rate:** 14.1%
- **Missing Values:** Amount/Currency (7,800), Ship location (35), plus 2 fully-empty columns

---

##  Tools & Technologies

- Microsoft Excel
- PostgreSQL (SQL)
- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Jupyter Notebook
- Git & GitHub

---

##  Project Workflow

1. Data Collection (Amazon Sale Report CSV)
2. Data Inspection & Cleaning (Python - duplicates, mixed-format dates, missing values)
3. Data Import into PostgreSQL
4. SQL Data Validation & Analysis
5. Exploratory Data Analysis (Python)
6. Data Visualization (14 charts - Matplotlib & Seaborn)
7. Business Insights & Recommendations

---

##  Exploratory Data Analysis

The following analyses were performed:

- Category-wise Order Volume & Revenue Analysis
- Order Status & Cancellation Analysis
- Monthly Revenue Trend Analysis
- Top States by Revenue
- Top Cities by Revenue
- Size-wise Demand Analysis
- Fulfilment Type Performance (Revenue vs Cancellation Rate)
- Order Amount Distribution
- B2B vs B2C Customer Analysis
- Monthly x Category Revenue Heatmap
- Day-of-Week Order Pattern
- Cancellation Rate by Category

---

##  Data Cleaning Performed

- Dropped 3 empty/redundant columns (index, New, PendingS)
- Parsed ~55,000 mixed-format date strings (04-30-22 and 05-03-2022) into datetime
- Removed 959 duplicate records
- Filled 7,800 missing Amount values with 0 (mostly cancelled orders)
- Standardised category spelling (Blazzer -> Blazer)
- Created 6 new features: Month, Month Name, Day of Week, Revenue, Order Outcome, Customer Type

---

##  Key Insights

- T-shirts and Shirts drive ~78% of all orders and the majority of revenue.
- Revenue declined ~18% from April (₹2.86 Cr) to June (₹2.33 Cr) - a clear seasonal downtrend.
- 14.1% of all orders end up cancelled - a significant revenue leak.
- Merchant fulfilment cancels 17.4% of orders vs 12.6% for Amazon fulfilment.
- Maharashtra and Karnataka are the top two states; Bengaluru is the top city.
- M, L and XL are the best-selling sizes; extended sizes (4XL-6XL) have minimal demand.
- B2B customers order at a ~11% higher average value than retail customers.
- Average order value is ₹611 with most orders between ₹400 and ₹1,000.

---

##  Business Recommendations

- Shift more high-volume SKUs from Merchant fulfilment to Amazon fulfilment (FBA) to reduce the 17.4% cancellation rate.
- Investigate causes of the 14.1% cancellation rate - improve size charts, fabric information and delivery estimates.
- Plan summer-season inventory ahead of April, since revenue declines steadily into June.
- Weight inventory towards M / L / XL sizes, which cover the bulk of demand.
- Focus marketing spend on the top 5 states and metro cities where revenue is concentrated.
- Grow the B2B segment with bulk-pricing offers, since B2B orders have a higher average value.
- Bundle low-volume accessories (Perfume, Wallet, Socks) with T-shirts and Shirts to raise average order value.

---

##  Repository Structure

```text
Amazon-Sales-Analysis
│
├── amazon sales analysis.ipynb
├── amazon sales sql.sql
├── Amazon Sale Report.csv   (in Releases - 19 MB)
└── README.md
```

**Note:** The full 19 MB dataset, the executed notebook with all 14 chart outputs, and the
capstone project report (Word) are attached to the **Releases** section of this repository
to keep the repo lightweight.

**To run the notebook:** download `Amazon-Sale-Report.csv` from the
[Releases](https://github.com/htharun034-cell/Amazon-Sales-Analysis/releases/tag/v1.0)
page, rename it to `Amazon Sale Report.csv`, and place it in the repository root.
`amazon.sales.analysis.executed.ipynb` (also in Releases) contains the fully executed
notebook with all outputs for viewing without running any code.

---

##  Skills Demonstrated

- Data Cleaning
- SQL Query Writing
- Data Analysis
- Exploratory Data Analysis (EDA)
- Data Visualization
- Feature Engineering
- Business Intelligence
- Data Storytelling
- GitHub Version Control

---

##  Author

**Tharun H**

 Apponix Academy

---
