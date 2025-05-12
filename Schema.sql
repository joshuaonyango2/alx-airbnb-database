-- Users table to store user information
CREATE TABLE Users (
    id UUID PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    is_host BOOLEAN DEFAULT FALSE,
    CONSTRAINT chk_email_format CHECK (email LIKE '%@%.%')
);

-- Locations table to store property locations
CREATE TABLE Locations (
    id UUID PRIMARY KEY,
    city VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL
);

-- Properties table to store property listings
CREATE TABLE Properties (
    id UUID PRIMARY KEY,
    user_id UUID,
    location_id UUID,
    title VARCHAR(100) NOT NULL,
    price_per_night DECIMAL(10, 2) NOT NULL CHECK (price_per_night > 0),
    FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE SET NULL,
    FOREIGN KEY (location_id) REFERENCES Locations(id) ON DELETE SET NULL
);

-- Bookings table to manage reservations
CREATE TABLE Bookings (
    id UUID PRIMARY KEY,
    user_id UUID,
    property_id UUID,
    check_in DATE NOT NULL,
    check_out DATE NOT NULL,
    CONSTRAINT chk_dates CHECK (check_out > check_in),
    FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE SET NULL,
    FOREIGN KEY (property_id) REFERENCES Properties(id) ON DELETE SET NULL
);

-- Reviews table to store user feedback
CREATE TABLE Reviews (
    id UUID PRIMARY KEY,
    user_id UUID,
    property_id UUID,
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE SET NULL,
    FOREIGN KEY (property_id) REFERENCES Properties(id) ON DELETE SET NULL
);

-- Payments table to handle transactions
CREATE TABLE Payments (
    id UUID PRIMARY KEY,
    booking_id UUID,
    amount DECIMAL(10, 2) NOT NULL CHECK (amount > 0),
    status VARCHAR(20) NOT NULL CHECK (status IN ('pending', 'completed', 'failed')),
    FOREIGN KEY (booking_id) REFERENCES Bookings(id) ON DELETE CASCADE
);

-- Indexes for performance optimization
CREATE INDEX idx_user_id ON Properties(user_id);
CREATE INDEX idx_location_id ON Properties(location_id);
CREATE INDEX idx_user_booking ON Bookings(user_id);
CREATE INDEX idx_property_booking ON Bookings(property_id);
CREATE INDEX idx_user_review ON Reviews(user_id);
CREATE INDEX idx_property_review ON Reviews(property_id);
CREATE INDEX idx_booking_payment ON Payments(booking_id);
