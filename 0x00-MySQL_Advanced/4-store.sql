-- This trigger is designed to reduce the quantity of an item after a new order is added.
-- It operates as follows:
-- 1. When a new row is inserted into the 'orders' table, the trigger activates.
-- 2. It identifies the corresponding item name and the quantity ordered (stored in the 'NEW' row).
-- 3. The trigger updates the 'items' table by subtracting the ordered quantity from the existing quantity for the specified item.
-- Note: The 'DELIMITER' statements are used to define the trigger body.
DROP TRIGGER IF EXISTS reduce_quantity;
DELIMITER $$
CREATE TRIGGER reduce_quantity
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    UPDATE items
        SET quantity = quantity - NEW.number
        WHERE name = NEW.item_name;
END $$
DELIMITER ;
