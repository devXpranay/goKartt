CREATE TABLE IF NOT EXISTS order_items (
    `id` INT AUTO_INCREMENT,
    `order_id` INT NOT NULL,
    `product_id` INT UNSIGNED NOT NULL,
    `quantity` INT NOT NULL,
    `price` DECIMAL(10, 2) NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);