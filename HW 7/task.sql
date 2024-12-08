-- 1

SELECT DISTINCT rS.first_name, rS.surname
FROM restStaff rS
JOIN restBill rB ON rS.staff_no = rB.waiter_no
WHERE rB.cust_name = 'Tanya Singh';

-- 2

SELECT rM.room_date
FROM restRoom_management rM
JOIN restStaff rS ON rM.headwaiter = rS.staff_no
WHERE rS.first_name = 'Charles' AND rM.room_name = 'Green' 
AND rM.room_date BETWEEN 160201 AND 160229;

-- 3

SELECT DISTINCT rs.first_name, rs.surname
FROM restStaff rs
WHERE rs.headwaiter = (
    SELECT headwaiter
    FROM restStaff
    WHERE first_name = 'Zoe' AND surname = 'Ball'
);

-- 4

SELECT rb.cust_name, rb.bill_total, rs.first_name, rs.surname
FROM restBill rb
JOIN restStaff rs ON rb.waiter_no = rs.staff_no
ORDER BY rb.bill_total DESC;

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

SELECT DISTINCT rs.first_name, rs.surname
FROM restStaff rs
WHERE rs.staff_no IN (
    SELECT rb.waiter_no
    FROM restBill rb
    JOIN restRest_table rt ON rb.table_no = rt.table_no
    WHERE rt.room_name = 'Blue' AND rb.bill_date = 160312
)
OR rs.staff_no = (
    SELECT headwaiter
    FROM restRoom_management
    WHERE room_name = 'Blue' AND room_date = 160312
);