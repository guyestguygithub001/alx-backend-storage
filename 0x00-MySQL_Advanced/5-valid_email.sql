-- This trigger is designed to update the 'valid_email' attribute.
-- It activates before a row in the 'users' table is updated.
-- The 'valid_email' attribute is reset to 0 if the 'email' attribute has been modified.
DROP TRIGGER IF EXISTS validate_email;
DELIMITER $$
CREATE TRIGGER validate_email
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    -- Check if the 'email' attribute has been changed.
    IF OLD.email != NEW.email THEN
        -- Reset 'valid_email' to 0 to indicate the email is no longer validated.
        SET NEW.valid_email = 0;
    ELSE
        -- Keep the current state of 'valid_email' if the email remains unchanged.
        SET NEW.valid_email = NEW.valid_email;
    END IF;
END $$
DELIMITER ;
