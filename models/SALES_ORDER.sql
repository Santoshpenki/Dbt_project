WITH sales_data AS (
    SELECT
        s.sale_id,
        s.order_id,
        s.product_id,
        s.quantity,
        s.total_amount,
        s.sale_date,
        o.customer_id,
        o.order_date,
        o.ship_date,
        o.order_status,
        o.payment_method
    FROM {{ source('sales_source', 'sales') }} AS s
    LEFT JOIN {{ source('sales_source', 'orders') }} AS o
        ON s.order_id = o.order_id
)
SELECT *
FROM sales_data
