-- Group the orders by date and calculate the average number of pizzas ordered per day.

SELECT 
    ROUND(AVG(qty), 0) AS avg
FROM
    (SELECT 
        orders.order_date, SUM(order_details.quantity) AS qty
    FROM
        order_details
    JOIN orders ON orders.order_id = order_details.order_id
    GROUP BY orders.order_date) AS order_qty;