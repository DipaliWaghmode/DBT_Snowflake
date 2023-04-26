{{
    config(
        materialized='table'
    )
}}

WITH Fact_Order AS
(
    SELECT * FROM {{ ref('Fact_Order') }}
),
Fact_Order_Summary as(
SELECT ACCOUNT_KEY,USER_KEY,SUM(TOTAL_AMOUNT) AS TOTAL_AMOUNT
FROM Fact_Order
WHERE TOTAL_AMOUNT>0
GROUP BY ACCOUNT_KEY,USER_KEY

)
 select * from Fact_Order_Summary


