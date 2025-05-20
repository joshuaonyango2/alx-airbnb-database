**Database Indexing for Query Performance**

Tables:

users: user_id (primary key), name

bookings: booking_id (primary key), user_id (foreign key), property_id (foreign key), booking_date

properties: property_id (primary key), name



**High-Usage Columns**
Columns frequently used in WHERE, JOIN, GROUP BY, or ORDER BY clauses:

bookings.user_id: JOINs with users, WHERE in subqueries.

bookings.property_id: JOINs with properties, WHERE filters.

bookings.booking_date: Date range filters.

users.user_id and properties.property_id: Already indexed as primary keys.

**Indexes Created**

idx_bookings_user_id: Optimizes JOINs and WHERE clauses on user_id.

idx_bookings_property_id: Optimizes JOINs and WHERE clauses on property_id.

idx_bookings_booking_date: Optimizes date range queries.

**Measuring Performance**

Test a query like:

EXPLAIN SELECT u.user_id, u.name

FROM users 

WHERE (SELECT COUNT(*) FROM bookings  WHERE user_id = user_id) > 3;


Before Indexing: Run EXPLAIN. Expect Seq Scan (PostgreSQL) or type: ALL (MySQL) on bookings.


Usage

Run database_index.sql in a SQL client (e.g., MySQL, PostgreSQL).

Test query performance with EXPLAIN or EXPLAIN ANALYZE.

Monitor write performance (INSERT, UPDATE, DELETE) for overhead.

