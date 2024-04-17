SELECT
    operational.orders_id
    , operational.date_date
    , ROUND((operational.margin + ship.shipping_fee) - (ship.logcost + ship.ship_cost),2) AS operational_margin
    , operational.revenue
    , operational.quantity
    , operational.purchase_cost
    , operational.margin
    , ship.shipping_fee
    , ship.logcost
    , ship.ship_cost
FROM
    {{ref("int_orders_margin")}} AS operational
JOIN
    {{ref("stg_raw__ship")}} AS ship
ON operational.orders_id = ship.orders_id
ORDER BY
    orders_id DESC
