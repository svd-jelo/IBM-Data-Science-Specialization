-- Active: 1777208460017@@127.0.0.1@3306@Mysql_Learners
CREATE PROCEDURE RETRIEVE_ALL()
BEGIN
    SELECT * FROM PETSALE;
END;

CREATE PROCEDURE UPDATE_SALEPRICE(IN ANIMAL_ID INTEGER, IN ANIMAL_HEALTH VARCHAR(5))
BEGIN
    -- For animal with ID XX having BAD health condition, the sale price will be reduced further by 25%.
    IF ANIMAL_HEALTH = 'BAD' THEN
        UPDATE `PETSALE`
        SET `SALEPRICE` = `SALEPRICE` * 0.75
        WHERE ID = ANIMAL_ID;
    -- For animal with ID YY having WORSE health condition, the sale price will be reduced further by 50%.
    ELSEIF ANIMAL_HEALTH = 'WORSE' THEN
        UPDATE `PETSALE`
        SET `SALEPRICE` = `SALEPRICE` * 0.50
        WHERE ID = ANIMAL_ID;
    ELSE
        UPDATE `PETSALE`
        SET `SALEPRICE` = `SALEPRICE`
        WHERE ID = ANIMAL_ID;
    END IF;
END;