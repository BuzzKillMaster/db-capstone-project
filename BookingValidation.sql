-- First Task

INSERT INTO
Bookings (id, booking_date, booking_time, table_number, customer) 
VALUES
(1, '2022-10-10', '12:00', 5, 1),
(2, '2022-11-12', '12:00', 3, 3),
(3, '2022-10-11', '12:00', 2, 2),
(4, '2022-10-13', '12:00', 2, 1);


-- Second Task

DROP PROCEDURE IF EXISTS CheckBooking;

CREATE PROCEDURE CheckBooking(IN bookingDate DATE, IN tableNumber INT)
SELECT
CONCAT('Table ', table_number, ' is already booked') AS 'Booking Status'
FROM Bookings
WHERE table_number = tableNumber AND booking_date = bookingDate;

CALL CheckBooking('2022-11-12', 3);


-- Third Task

SELECT * FROM Bookings;

DELETE FROM Bookings WHERE id > 4;

DROP PROCEDURE IF EXISTS AddValidBooking;

DELIMITER //

CREATE PROCEDURE AddValidBooking(IN bookingDate DATE, IN tableNumber INT)
BEGIN
DECLARE bookingStatus INT;

START TRANSACTION;

SELECT id INTO bookingStatus FROM Bookings WHERE table_number = tableNumber AND booking_date = bookingDate;

IF NOT bookingStatus
THEN
	INSERT INTO Bookings (id, booking_date, booking_time, table_number, customer) 
	VALUES (5, bookingDate, '12:00', tableNumber, 1);
    
	COMMIT;
ELSE
	SELECT
	CONCAT('Table ', table_number, ' is already booked - BOOKING CANCELLED') AS 'Booking Status'
	FROM Bookings
	WHERE table_number = tableNumber AND booking_date = bookingDate;
    
	ROLLBACK;
END IF;

END //

DELIMITER ;

CALL AddValidBooking('2022-10-17', 2);