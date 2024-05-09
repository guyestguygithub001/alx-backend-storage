-- This stored procedure, named 'AddBonus', is designed to record a bonus score for a student.
-- It checks if the project exists and adds a new entry if it doesn't, then records the bonus.
DROP PROCEDURE IF EXISTS AddBonus;
DELIMITER $$
CREATE PROCEDURE AddBonus (user_id INT, project_name VARCHAR(255), score FLOAT)
BEGIN
    -- Initialize a counter for the number of projects with the given name.
    DECLARE project_count INT DEFAULT 0;
    -- Initialize a variable to store the project's ID.
    DECLARE project_id INT DEFAULT 0;

    -- Count the number of projects with the specified name.
    SELECT COUNT(id)
        INTO project_count
        FROM projects
        WHERE name = project_name;
    -- If no such project exists, create a new project record.
    IF project_count = 0 THEN
        INSERT INTO projects(name)
            VALUES(project_name);
    END IF;
    -- Retrieve the ID of the project (existing or newly created).
    SELECT id
        INTO project_id
        FROM projects
        WHERE name = project_name;
    -- Insert the bonus score for the student in the 'corrections' table.
    INSERT INTO corrections(user_id, project_id, score)
        VALUES (user_id, project_id, score);
END $$
DELIMITER ;
