-- 1

SELECT rs.first_name, rs.surname, rb.bill_date, COUNT(rb.bill_no) AS num_bills
FROM restBill rb
JOIN restStaff rs ON rb.waiter_no = rs.staff_no
GROUP BY rs.staff_no, rb.bill_date
HAVING COUNT(rb.bill_no) >= 2;

-- 2

SELECT rm.room_name, COUNT(rt.table_no) AS num_large_tables
FROM restRest_table rt
JOIN restRoom_management rm ON rt.room_name = rm.room_name
WHERE rt.no_of_seats > 6
GROUP BY rm.room_name;

-- 3

SELECT rm.room_name, SUM(rb.bill_total) AS total_bills
FROM restBill rb
JOIN restRest_table rt ON rb.table_no = rt.table_no
JOIN restRoom_management rm ON rt.room_name = rm.room_name
GROUP BY rm.room_name;

-- 4

SELECT rs.first_name AS headwaiter_first_name, rs.surname AS headwaiter_surname, SUM(rb.bill_total) AS total_bill_amount
FROM restRoom_management rm
JOIN restStaff rs ON rm.headwaiter = rs.staff_no
JOIN restRest_table rt ON rm.room_name = rt.room_name
JOIN restBill rb ON rt.table_no = rb.table_no
GROUP BY rs.staff_no
ORDER BY total_bill_amount DESC;

-- 5

SELECT b.cust_name, AVG(b.bill_total) AS avg_spent
FROM restBill b
GROUP BY b.cust_name
HAVING AVG(b.bill_total) > 400;

-- 6

SELECT rs.first_name, rs.surname, COUNT(rb.bill_no) AS num_bills
FROM restBill rb
JOIN restStaff rs ON rb.waiter_no = rs.staff_no
GROUP BY rs.staff_no, rb.bill_date
HAVING COUNT(rb.bill_no) >= 3;