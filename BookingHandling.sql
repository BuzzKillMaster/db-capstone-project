-- First Task

DROP PROCEDURE IF EXISTS AddBooking;

DELIMITER //

CREATE PROCEDURE
AddBooking(IN bookingID INT,
	IN customerID INT,
	IN bookingDate DATE,
	IN tableNumber INT
)
BEGIN
INSERT INTO Bookings(id, booking_date, booking_time, table_number, customer)
VALUES (bookingID, bookingDate, '12:00', tableNumber, customerID);
SELECT 'New booking added' AS 'Confirmation';
END //

DELIMITER ;


CALL AddBooking(139, 3, '2022-12-30', 4);


-- Second Task

DROP PROCEDURE IF EXISTS UpdateBooking;

DELIMITER //

CREATE PROCEDURE UpdateBooking(IN bookingID INT, IN bookingDate DATE)
BEGIN
UPDATE Bookings
SET booking_date = bookingDate
WHERE id = bookingID;

SELECT CONCAT('Booking ', bookingID, ' updated') AS 'Confirmation';
END //

DELIMITER ;

CALL UpdateBooking(9, '2022-12-27');


-- Third Task


DROP PROCEDURE IF EXISTS CancelBooking;

DELIMITER //

CREATE PROCEDURE CancelBooking(IN bookingID INT)
BEGIN
DELETE FROM Bookings
WHERE id = bookingID;

SELECT CONCAT('Booking ', bookingID, ' cancelled') AS 'Confirmation';
END //

DELIMITER ;

CALL CancelBooking(9);




