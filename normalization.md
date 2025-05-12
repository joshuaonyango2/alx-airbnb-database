Normalization Process
Initial Design

Users: id (UUID, PK), name, email, password, is_host (Boolean)
Properties: id (UUID, PK), user_id (FK to Users), title, location, price_per_night
Bookings: id (UUID, PK), user_id (FK to Users), property_id (FK to Properties), check_in, check_out
Reviews: id (UUID, PK), user_id (FK to Users), property_id (FK to Properties), rating, comment
Payments: id (UUID, PK), booking_id (FK to Bookings), amount, status

Normalization Steps

1NF (First Normal Form):
Split Users.name into first_name and last_name to ensure atomicity.
Created a new Locations table (id, city, country) to handle Properties.location (e.g., "Nairobi, Kenya") atomically.
Updated Properties to include location_id (FK to Locations).


2NF (Second Normal Form):
All tables have single-column primary keys (UUIDs), so no partial dependencies exist.
No adjustments needed.


3NF (Third Normal Form):
Identified potential transitive dependency in Properties.location (e.g., country depends on city).
Resolved by creating the Locations table in 1NF step.
No other transitive dependencies found.



Final Normalized Schema

Users: id (UUID, PK), first_name, last_name, email, password, is_host (Boolean)
Locations: id (UUID, PK), city, country
Properties: id (UUID, PK), user_id (FK to Users), location_id (FK to Locations), title, price_per_night
Bookings: id (UUID, PK), user_id (FK to Users), property_id (FK to Properties), check_in, check_out
Reviews: id (UUID, PK), user_id (FK to Users), property_id (FK to Properties), rating, comment
Payments: id (UUID, PK), booking_id (FK to Bookings), amount, status

Relationships

Users (1:N) Properties
Locations (1:N) Properties
Users (1:N) Bookings
Properties (1:N) Bookings
Properties (1:N) Reviews
Bookings (1:1) Payments

