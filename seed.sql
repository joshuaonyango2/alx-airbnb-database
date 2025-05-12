-- Insert sample data into Users
INSERT INTO Users (id, first_name, last_name, email, password, is_host)
VALUES 
    ('550e8400-e29b-41d4-a716-446655440000', 'John', 'Doe', 'john.doe@email.com', 'hashedpass1', TRUE),
    ('550e8400-e29b-41d4-a716-446655440001', 'Jane', 'Smith', 'jane.smith@email.com', 'hashedpass2', FALSE),
    ('550e8400-e29b-41d4-a716-446655440002', 'Alice', 'Johnson', 'alice.j@email.com', 'hashedpass3', TRUE);

-- Insert sample data into Locations
INSERT INTO Locations (id, city, country)
VALUES 
    ('550e8400-e29b-41d4-a716-446655440003', 'Nairobi', 'Kenya'),
    ('550e8400-e29b-41d4-a716-446655440004', 'Mombasa', 'Kenya'),
    ('550e8400-e29b-41d4-a716-446655440005', 'Kisumu', 'Kenya');

-- Insert sample data into Properties
INSERT INTO Properties (id, user_id, location_id, title, price_per_night)
VALUES 
    ('550e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440000', '550e8400-e29b-41d4-a716-446655440003', 'Cozy Nairobi Apartment', 50.00),
    ('550e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440004', 'Beachfront Mombasa Villa', 75.00),
    ('550e8400-e29b-41d4-a716-446655440008', '550e8400-e29b-41d4-a716-446655440000', '550e8400-e29b-41d4-a716-446655440005', 'Kisumu Lakeside Home', 60.00);

-- Insert sample data into Bookings
INSERT INTO Bookings (id, user_id, property_id, check_in, check_out)
VALUES 
    ('550e8400-e29b-41d4-a716-446655440009', '550e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440006', '2025-06-01', '2025-06-05'),
    ('550e8400-e29b-41d4-a716-446655440010', '550e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440007', '2025-07-10', '2025-07-15');

-- Insert sample data into Reviews
INSERT INTO Reviews (id, user_id, property_id, rating, comment)
VALUES 
    ('550e8400-e29b-41d4-a716-446655440011', '550e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440006', 4, 'Great stay, very clean!'),
    ('550e8400-e29b-41d4-a716-446655440012', '550e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440007', 5, 'Amazing view, highly recommend!');

-- Insert sample data into Payments
INSERT INTO Payments (id, booking_id, amount, status)
VALUES 
    ('550e8400-e29b-41d4-a716-446655440013', '550e8400-e29b-41d4-a716-446655440009', 200.00, 'completed'),
    ('550e8400-e29b-41d4-a716-446655440014', '550e8400-e29b-41d4-a716-446655440010', 375.00, 'completed');
