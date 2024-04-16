SELECT
    marg.orders_id
    , date_date
    , ROUND((revenue + shipping_fee) - (logcost + ship_cost),2) AS operational_margin
    , revenue
    , quantity
    , purchase_cost
    , margin
    , shipping_fee
    , logcost
    , ship_cost
FROM
    {{ref("int_orders_margin")}} AS marg
JOIN
    {{ref("stg_raw__ship")}} AS ship
ON marg.orders_id = ship.orders_id
ORDER BY
    orders_id DESC
