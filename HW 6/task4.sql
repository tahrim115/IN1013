-- 1

SELECT SUM(bill_total) AS Income
FROM restBill

-- 2

SELECT SUM(bill_total)
FROM restBill
WHERE bill_date LIKE "1602__";

-- 3

SELECT AVG(bill_total)
FROM restBill
WHERE table_no = "2";

-- 4

SELECT MIN(no_of_seats), MAX(no_of_seats), AVG(no_of_seats)
FROM restRest_table
WHERE room_name = "Blue";

-- 5

SELECT DISTINCT table_no
FROM restBill
WHERE waiter_no IN (002, 004);
