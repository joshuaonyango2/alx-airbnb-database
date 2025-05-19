**Task 1: Aggregate query to find the total number of bookings per user**
  
SELECT 
  
    user_id,
  
    name AS user_name,
  
    COUNT(b.booking_id) AS total_bookings
  
FROM 
  
    users
  
LEFT JOIN 
  
    bookings  ON user_id = b.user_id
  
GROUP BY 
  
    user_id, u.name
  
ORDER BY 
  
    total_bookings DESC;


**Task 2: Window function to rank properties by total bookings**
  
SELECT 
  
    property_id,
  
    name AS property_name,
  
    COUNT(booking_id) AS total_bookings,
  
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
  
FROM 
  
    properties 
  
LEFT JOIN 
  
    bookings ON property_id = property_id
  
GROUP BY 
  
    property_id, name
  
ORDER BY 
  
    booking_rank, p.property_id;
