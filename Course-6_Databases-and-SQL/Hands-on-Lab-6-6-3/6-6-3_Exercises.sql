-- Active: 1777208460017@@127.0.0.1@3306@Mysql_Learners

-- EXERCISE 1: TRANSACTION ROSE
DELIMITER //

CREATE PROCEDURE TRANSACTION_ROSE()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    START TRANSACTION;
    UPDATE BankAccounts
    SET Balance = Balance-200
    WHERE AccountName = 'Rose';

    UPDATE BankAccounts
    SET Balance = Balance+200
    WHERE AccountName = 'Shoe Shop';

    UPDATE ShoeShop
    SET Stock = Stock-1
    WHERE Product = 'Boots';

    UPDATE BankAccounts
    SET Balance = Balance-300
    WHERE AccountName = 'Rose';

    COMMIT;
END //

DELIMITER ;

CALL TRANSACTION_ROSE;
SELECT * FROM `BankAccounts`;
SELECT * FROM `ShoeShop`;

/* EXERCISE 2: TRANSACTION JAMES
Create a stored procedure TRANSACTION_JAMES to execute a transaction based on the following scenario: First buy James 4 pairs of Trainers from ShoeShop.
Update his balance as well as the balance of ShoeShop. Also, update the stock of Trainers at ShoeShop. Then attempt to buy James a pair of Brogues from ShoeShop.
If any of the UPDATE statements fail, the whole transaction fails. You will roll back the transaction. Commit the transaction only if the whole transaction is successful.
*/
CREATE PROCEDURE TRANSACTION_JAMES()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    START TRANSACTION;
    UPDATE `BankAccounts`
    SET `Balance` = `Balance` - 4 * 300
    WHERE `AccountName` = 'James';

    UPDATE `BankAccounts`
    SET `Balance` = `Balance` + 4 * 300
    WHERE `AccountName` = 'Shoe Shop';

    UPDATE `ShoeShop`
    SET `Stock` = `Stock` - 4
    WHERE `Product` = 'Trainers';

    UPDATE `BankAccounts`
    SET `Balance` = `Balance` - 150
    WHERE `AccountName` = 'James';

    COMMIT;
END

CALL `TRANSACTION_JAMES`;
SELECT * FROM `BankAccounts`;
SELECT * FROM `ShoeShop`;