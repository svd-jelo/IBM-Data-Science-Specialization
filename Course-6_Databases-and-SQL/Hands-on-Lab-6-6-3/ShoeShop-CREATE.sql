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
