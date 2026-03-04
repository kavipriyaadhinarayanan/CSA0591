use drone;
DELIMITER //
CREATE PROCEDURE drone_cursor_pro()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE d_id INT;
    DECLARE d_model VARCHAR(20);
    DECLARE drone_cursor CURSOR FOR
        SELECT drone_id, model FROM drone;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN drone_cursor;

    read_loop: LOOP
        FETCH drone_cursor INTO d_id, d_model;

        IF done = 1 THEN
            LEAVE read_loop;
        END IF;

        SELECT d_id AS Drone_ID, d_model AS Drone_Model;

    END LOOP;

    CLOSE drone_cursor;

END //

DELIMITER ;
CALL drone_cursor_pro();