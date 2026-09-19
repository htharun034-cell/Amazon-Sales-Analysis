-- ============================================================
-- AMAZON SALES ANALYSIS - SQL QUERIES
-- Dataset: Amazon Sale Report (Amazon India Apparel Sales)
-- Database: PostgreSQL
-- Table assumed: amazon_sales
-- ============================================================

-- ------------------------------------------------------------
-- 1. TABLE STRUCTURE REFERENCE
-- ------------------------------------------------------------
-- CREATE TABLE amazon_sales (
--     order_id          VARCHAR(50),
--     date              DATE,
--     status            VARCHAR(50),
--     fulfilment        VARCHAR(20),
--     sales_channel     VARCHAR(30),
--     ship_service_level VARCHAR(20),
--     category          VARCHAR(30),
--     size              VARCHAR(10),
--     courier_status    VARCHAR(30),
--     qty               INT,
--     currency          VARCHAR(5),
--     amount            NUMERIC(10,2),
--     ship_city         VARCHAR(60),
--     ship_state        VARCHAR(60),
--     ship_postal_code  VARCHAR(15),
--     ship_country      VARCHAR(10),
--     b2b               BOOLEAN
-- );

-- ------------------------------------------------------------
-- 2. TOTAL REVENUE, ORDERS AND AVERAGE ORDER VALUE (KPIs)
-- ------------------------------------------------------------
SELECT
    COUNT(*)                                   AS total_records,
    COUNT(DISTINCT order_id)                   AS unique_orders,
    ROUND(SUM(amount), 2)                      AS total_revenue,
    ROUND(AVG(amount), 2)                      AS average_order_value
FROM amazon_sales
WHERE amount IS NOT NULL;

-- ------------------------------------------------------------
-- 3. MONTHLY REVENUE TREND
-- ------------------------------------------------------------
SELECT
    TO_CHAR(date, 'YYYY-MM')          AS month,
    COUNT(*)                          AS orders,
    ROUND(SUM(amount) / 10000000.0, 2) AS revenue_in_crore
FROM amazon_sales
WHERE amount IS NOT NULL
GROUP BY 1
ORDER BY 1;

-- ------------------------------------------------------------
-- 4. TOP 10 STATES BY REVENUE
-- ------------------------------------------------------------
SELECT
    ship_state,
    COUNT(*)                            AS orders,
    ROUND(SUM(amount) / 10000000.0, 2)  AS revenue_in_crore
FROM amazon_sales
WHERE amount IS NOT NULL
GROUP BY ship_state
ORDER BY SUM(amount) DESC
LIMIT 10;

-- ------------------------------------------------------------
-- 5. TOP 10 CITIES BY REVENUE
-- ------------------------------------------------------------
SELECT
    ship_city,
    COUNT(*)                            AS orders,
    ROUND(SUM(amount) / 100000.0, 2)   AS revenue_in_lakh
FROM amazon_sales
WHERE amount IS NOT NULL
GROUP BY ship_city
ORDER BY SUM(amount) DESC
LIMIT 10;

-- ------------------------------------------------------------
-- 6. CATEGORY-WISE SALES PERFORMANCE
-- ------------------------------------------------------------
SELECT
    category,
    COUNT(*)                            AS orders,
    ROUND(SUM(amount) / 10000000.0, 2)  AS revenue_in_crore,
    ROUND(AVG(amount), 2)               AS avg_order_value
FROM amazon_sales
WHERE amount IS NOT NULL
GROUP BY category
ORDER BY SUM(amount) DESC;

-- ------------------------------------------------------------
-- 7. ORDER STATUS DISTRIBUTION
-- ------------------------------------------------------------
SELECT
    status,
    COUNT(*)                                          AS orders,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER(), 2) AS pct_share
FROM amazon_sales
GROUP BY status
ORDER BY orders DESC;

-- ------------------------------------------------------------
-- 8. CANCELLATION RATE BY FULFILMENT TYPE
-- ------------------------------------------------------------
SELECT
    fulfilment,
    COUNT(*)                                                    AS total_orders,
    SUM(CASE WHEN status = 'Cancelled' THEN 1 ELSE 0 END)       AS cancelled_orders,
    ROUND(100.0 * SUM(CASE WHEN status = 'Cancelled' THEN 1 ELSE 0 END)
               / COUNT(*), 2)                                   AS cancellation_rate_pct
FROM amazon_sales
GROUP BY fulfilment;

-- ------------------------------------------------------------
-- 9. SIZE-WISE ORDER DISTRIBUTION
-- ------------------------------------------------------------
SELECT
    size,
    COUNT(*)                            AS orders,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER(), 2) AS pct_share
FROM amazon_sales
GROUP BY size
ORDER BY orders DESC;

-- ------------------------------------------------------------
-- 10. B2B VS B2C CUSTOMER ANALYSIS
-- ------------------------------------------------------------
SELECT
    CASE WHEN b2b THEN 'Business (B2B)' ELSE 'Retail (B2C)' END AS customer_type,
    COUNT(*)                            AS orders,
    ROUND(SUM(amount) / 10000000.0, 2)  AS revenue_in_crore,
    ROUND(AVG(amount), 2)               AS avg_order_value
FROM amazon_sales
WHERE amount IS NOT NULL
GROUP BY 1;

-- ------------------------------------------------------------
-- 11. MONTH x CATEGORY REVENUE PIVOT
-- ------------------------------------------------------------
SELECT
    category,
    ROUND(SUM(CASE WHEN EXTRACT(MONTH FROM date) = 4 THEN amount ELSE 0 END) / 1000000.0, 1) AS apr_lakh,
    ROUND(SUM(CASE WHEN EXTRACT(MONTH FROM date) = 5 THEN amount ELSE 0 END) / 1000000.0, 1) AS may_lakh,
    ROUND(SUM(CASE WHEN EXTRACT(MONTH FROM date) = 6 THEN amount ELSE 0 END) / 1000000.0, 1) AS jun_lakh
FROM amazon_sales
WHERE amount IS NOT NULL
GROUP BY category
ORDER BY apr_lakh DESC;

-- ------------------------------------------------------------
-- 12. DAY-OF-WEEK ORDER PATTERN
-- ------------------------------------------------------------
SELECT
    TO_CHAR(date, 'Day')                AS day_of_week,
    COUNT(*)                            AS orders,
    ROUND(SUM(amount) / 100000.0, 2)   AS revenue_in_lakh
FROM amazon_sales
WHERE amount IS NOT NULL
GROUP BY 1, EXTRACT(ISODOW FROM date)
ORDER BY EXTRACT(ISODOW FROM date);

-- ------------------------------------------------------------
-- 13. HIGH-VALUE ORDERS (ABOVE Rs 1500)
-- ------------------------------------------------------------
SELECT
    order_id,
    date,
    category,
    size,
    amount,
    ship_state
FROM amazon_sales
WHERE amount > 1500
ORDER BY amount DESC
LIMIT 20;

-- ------------------------------------------------------------
-- 14. COURIER STATUS ANALYSIS FOR CANCELLED ORDERS
-- ------------------------------------------------------------
SELECT
    courier_status,
    COUNT(*) AS cancelled_orders
FROM amazon_sales
WHERE status = 'Cancelled'
GROUP BY courier_status
ORDER BY cancelled_orders DESC;
