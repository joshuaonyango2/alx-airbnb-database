🧱 Database Design
Entities & Key Fields
Users

id (UUID)
name
email
password
is_host (Boolean)
Properties

id (UUID)
user_id (FK to Users)
title
location
price_per_night
Bookings

id (UUID)
user_id (FK to Users)
property_id (FK to Properties)
check_in
check_out
Reviews

id (UUID)
user_id (FK to Users)
property_id (FK to Properties)
rating
comment
Payments

id (UUID)
booking_id (FK to Bookings)
amount
status
Relationships
A user can have multiple properties.
A booking belongs to one user and one property.
A property can have multiple bookings and reviews.
A payment is linked to a booking.
image
![image](https://github.com/user-attachments/assets/bf22d5d0-86e6-4c4f-81a0-bd79a472e5fc)

