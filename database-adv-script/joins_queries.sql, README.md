**Query using INNER JOIN to retrieve all bookings and the respective users**
SELECT 
    booking_id,
    user_id,
    name AS user_name,
    property_id,
    booking_date
FROM 
    bookings 
INNER JOIN 
    users  ON user_id = user_id;

  **Query using LEFT JOIN to retrieve all properties and their reviews**
  SELECT 
    property_id,
    name AS property_name,
    review_id,
    rating,
   user_id
FROM 
    properties 
LEFT JOIN 
    reviews  ON property_id = property_id;

    **Query using FULL OUTER JOIN to retrieve all users and all bookings**
    SELECT 
    user_id,
    name AS user_name,
    booking_id,
    property_id,
    booking_date
FROM 
    users 
FULL OUTER JOIN 
    bookings  ON user_id = user_id;
