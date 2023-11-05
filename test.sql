// customer table create query
CREATE TABLE `customers` (
    `customer_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `customer_name` varchar(255) NOT NULL,
    `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

// order table create query
CREATE TABLE `orders` (
    `order_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `customer_id` int(11) UNSIGNED NOT NULL,
    `order_date` date NOT NULL,
    `total_amount` decimal(10,2) NOT NULL,
    `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE RESTRICT ON UPDATE CASCADE
);

// product table create query

CREATE TABLE `products` (
    `product_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `catergory_id` int(11) UNSIGNED NOT NULL,
    FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
    `product_name` varchar(255) NOT NULL,
    `product_price` decimal(10, 2) NOT NULL,
    `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

// category table create query

CREATE TABLE `categories` (
    `category_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `category_name` varchar(255) NOT NULL,
    `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)

//Task 1 query

SELECT o.order_id, c.customer_name
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id;

//Task 2 query

SELECT p.product_id, p.product_name, c.category_name
FROM products p
LEFT JOIN categories c ON p.category_id = c.category_id;