-- Active: 1777208460017@@127.0.0.1@3306@Mysql_Learners


DROP TABLE IF EXISTS BankAccounts;


CREATE TABLE BankAccounts (
    AccountNumber VARCHAR(5) NOT NULL,
    AccountName VARCHAR(25) NOT NULL,
    Balance DECIMAL(8,2) NOT NULL,
    PRIMARY KEY (AccountNumber)
    );
INSERT INTO BankAccounts VALUES
('B001','Rose',300),
('B002','James',1345),
('B003','Shoe Shop',124200),
('B004','Corner Shop',76000);
-- Retrieve all records from the table
SELECT * FROM BankAccounts;
-- Add non-negative balance constraint
ALTER TABLE `BankAccounts`
ADD CONSTRAINT NONNEGATIVE_BALANCE
CHECK (Balance >= 0);


-- Active: 1777208460017@@127.0.0.1@3306@Mysql_Learners
DROP TABLE IF EXISTS ShoeShop;


CREATE TABLE ShoeShop (
    Product VARCHAR(25) NOT NULL,
    Stock INTEGER NOT NULL,
    Price DECIMAL(8,2) NOT NULL,
    PRIMARY KEY (Product)
    );
INSERT INTO ShoeShop VALUES
('Boots',11,200),
('High heels',8,600),
('Brogues',10,150),
('Trainers',14,300);
SELECT * FROM ShoeShop;
ALTER TABLE `ShoeShop`
ADD CONSTRAINT NONNEGATIVE_PRICE
CHECK(Price >= 0);



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