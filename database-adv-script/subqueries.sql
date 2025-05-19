**Task 1: Non-correlated subquery to find properties with average rating > 4.0**

SELECT 
    
    property_id,
    
    name
    
FROM 
    
    properties 
    
WHERE 
    
    property_id IN (
    
        SELECT 
    
            property_id
    
        FROM 
    
            reviews 
    
        GROUP BY 
    
            property_id
    
        HAVING 
    
            AVG(rating) > 4.0
    );


**Task 2: Correlated subquery to find users with more than 3 bookings**
    

SELECT 
    
    user_id,
    
    name
    
FROM 
    
    users 
    
WHERE (
    
    SELECT
    
        COUNT(*)
    
    FROM 
    
        bookings 
    
    WHERE 
    
        user_id = user_id
) > 3;
