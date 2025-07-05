select
    sale_id,
    order_id,
    product_id,
    quantity,
    total_amount,
    sale_date,
    customer_id,
    order_date,
    ship_date,
    order_status,
    payment_method,
    datediff(day, order_date, ship_date) as days_to_ship,
    case
        when total_amount > 1000 then true
        else false
    end as high_value_order,
    case
        when order_status in ('complete', 'shipped') then 'closed'
        when order_status in ('pending', 'processing') then 'open'
        else 'other'
    end as simplified_order_status,
    extract(year from sale_date) as sale_year
from {{ ref('sales_order') }}
