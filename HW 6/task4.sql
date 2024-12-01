-- 1

SELECT DISTINCT rb.cust_name
FROM restBill rb
WHERE rb.bill_total > 450.00
  AND rb.waiter_no IN (
    SELECT rs.staff_no
    FROM restStaff rs
    WHERE rs.headwaiter = (
        SELECT staff_no
        FROM restStaff
        WHERE first_name = 'Charles'
    )
);

-- 2

SELECT DISTINCT rS.first_name, rS.surname
FROM restRoom_management rM
JOIN restStaff rS ON rM.headwaiter = rS.staff_no
WHERE rM.room_name = (
    SELECT rT.room_name
    FROM restRest_table rT
    JOIN restBill rB ON rT.table_no = rB.table_no
    WHERE rB.cust_name = 'Nerida Smith' AND rB.bill_date = 160111
);

-- 3

SELECT cust_name
FROM restBill
WHERE bill_total = (
    SELECT MIN(bill_total)
    FROM restBill
);

-- 4

SELECT first_name, surname
FROM restStaff
WHERE staff_no NOT IN (
    SELECT DISTINCT waiter_no
    FROM restBill
);

-- 5

SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
JOIN restBill b ON s.staff_no = b.waiter_no
WHERE b.table_no IN (
SELECT DISTINCT table_no
FROM restBill
WHERE bill_no IN (00014, 00017)
);

-- 6

SELECT rb.cust_name, rs.first_name AS headwaiter_first_name, rs.surname AS headwaiter_surname, rt.room_name
FROM restBill rb
JOIN restRest_table rt ON rb.table_no = rt.table_no
JOIN restRoom_management rm ON rt.room_name = rm.room_name AND rb.bill_date = rm.room_date
JOIN restStaff rs ON rm.headwaiter = rs.staff_no
WHERE rb.bill_total = (
    SELECT MAX(bill_total)
    FROM restBill
);