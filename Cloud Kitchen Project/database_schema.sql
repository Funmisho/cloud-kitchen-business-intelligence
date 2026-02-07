-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/s1iwzg
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE `customers` (
    `customer_id` int  NOT NULL ,
    `first_name` varchar  NOT NULL ,
    `last_name` varchar  NOT NULL ,
    `phone` varchar  NOT NULL ,
    `email` varchar  NOT NULL ,
    PRIMARY KEY (
        `customer_id`
    )
);

CREATE TABLE `items` (
    `item_id` int  NOT NULL ,
    `sku` varchar  NOT NULL ,
    `item_name` varchar  NOT NULL ,
    `category` varchar  NOT NULL ,
    `size` varchar  NOT NULL ,
    `current_price` decimal  NOT NULL ,
    PRIMARY KEY (
        `item_id`
    ),
    CONSTRAINT `uc_items_sku` UNIQUE (
        `sku`
    )
);

CREATE TABLE `orders` (
    `order_id` int  NOT NULL ,
    `order_datetime` datetime  NOT NULL ,
    `customer_id` int  NOT NULL ,
    `order_status` varchar  NOT NULL ,
    `delivery_address1` varchar  NOT NULL ,
    `delivery_address2` varchar  NULL ,
    `delivery_city` varchar  NOT NULL ,
    `delivery_zip` varchar  NOT NULL ,
    `delivery_fee` decimal  NOT NULL ,
    `payment_method` varchar  NOT NULL ,
    PRIMARY KEY (
        `order_id`
    )
);

CREATE TABLE `order_items` (
    `order_item_id` int  NOT NULL ,
    `order_id` int  NOT NULL ,
    `item_id` int  NOT NULL ,
    `quantity` int  NOT NULL ,
    `unit_price_at_time` decimal  NOT NULL ,
    PRIMARY KEY (
        `order_item_id`
    )
);

CREATE TABLE `ingredients` (
    `ingredient_id` int  NOT NULL ,
    `ingredient_name` varchar  NOT NULL ,
    `purchase_unit` varchar  NOT NULL ,
    `unit_cost` decimal  NOT NULL ,
    `supplier_lead_time_days` int  NOT NULL ,
    PRIMARY KEY (
        `ingredient_id`
    )
);

CREATE TABLE `recipes` (
    `recipe_line_id` int  NOT NULL ,
    `item_id` int  NOT NULL ,
    `ingredient_id` int  NOT NULL ,
    `qty_required_per_item` decimal  NOT NULL ,
    PRIMARY KEY (
        `recipe_line_id`
    )
);

CREATE TABLE `inventory` (
    `ingredient_id` int  NOT NULL ,
    `qty_on_hand` decimal  NOT NULL ,
    `reorder_level` decimal  NOT NULL ,
    `last_updated` datetime  NOT NULL ,
    PRIMARY KEY (
        `ingredient_id`
    )
);

CREATE TABLE `staff` (
    `staff_id` int  NOT NULL ,
    `first_name` varchar  NOT NULL ,
    `last_name` varchar  NOT NULL ,
    `role` varchar  NOT NULL ,
    `hourly_rate` decimal  NOT NULL ,
    PRIMARY KEY (
        `staff_id`
    )
);

CREATE TABLE `shifts` (
    `shift_id` int  NOT NULL ,
    `shift_name` varchar  NOT NULL ,
    `start_time` time  NOT NULL ,
    `end_time` time  NOT NULL ,
    PRIMARY KEY (
        `shift_id`
    )
);

CREATE TABLE `rota` (
    `rota_id` int  NOT NULL ,
    `staff_id` int  NOT NULL ,
    `shift_id` int  NOT NULL ,
    `shift_date` date  NOT NULL ,
    PRIMARY KEY (
        `rota_id`
    )
);

ALTER TABLE `orders` ADD CONSTRAINT `fk_orders_customer_id` FOREIGN KEY(`customer_id`)
REFERENCES `customers` (`customer_id`);

ALTER TABLE `order_items` ADD CONSTRAINT `fk_order_items_order_id` FOREIGN KEY(`order_id`)
REFERENCES `orders` (`order_id`);

ALTER TABLE `order_items` ADD CONSTRAINT `fk_order_items_item_id` FOREIGN KEY(`item_id`)
REFERENCES `items` (`item_id`);

ALTER TABLE `recipes` ADD CONSTRAINT `fk_recipes_item_id` FOREIGN KEY(`item_id`)
REFERENCES `items` (`item_id`);

ALTER TABLE `recipes` ADD CONSTRAINT `fk_recipes_ingredient_id` FOREIGN KEY(`ingredient_id`)
REFERENCES `ingredients` (`ingredient_id`);

ALTER TABLE `inventory` ADD CONSTRAINT `fk_inventory_ingredient_id` FOREIGN KEY(`ingredient_id`)
REFERENCES `ingredients` (`ingredient_id`);

ALTER TABLE `rota` ADD CONSTRAINT `fk_rota_staff_id` FOREIGN KEY(`staff_id`)
REFERENCES `staff` (`staff_id`);

ALTER TABLE `rota` ADD CONSTRAINT `fk_rota_shift_id` FOREIGN KEY(`shift_id`)
REFERENCES `shifts` (`shift_id`);

