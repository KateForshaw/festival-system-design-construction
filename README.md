# Sunbeat Music Festival – Database Design & Construction (MySQL)

## Tools & Skills
- **Database:** MySQL
- **Design:** Entity relationship diagrams (crow's foot notation), normalisation to third normal form (3NF), data dictionaries
- **Build:** Primary/foreign keys, AUTO_INCREMENT, ENUM types, cascading deletes and SET NULL constraints
- **SQL queries:** INSERT, UPDATE, DELETE, multi-table JOINs, aggregate functions (COUNT, SUM, GROUP BY), subqueries and CASE expressions

## What I Did
This project was the second assignment for the Databases module of my Data Analytics MSc. I designed and built an event management system for a fictional 3-day music festival with 42 artists, 5 stages and a range of ticket, VIP and camping options.

- **Design:** I identified ambiguities and assumptions in the brief, drafted an ERD, normalised every entity to 3NF and produced a final ERD with 9 entities. I wrote a full data dictionary setting out each attribute's description, data type, field size and whether it is required.
- **Construction:** After tutor feedback and my own reflection, I built the database in MySQL. I added a 10th entity (Event Agenda) and refined data types, e.g. switching IDs from CHAR to INT so they could auto-increment, and using ENUM for ticket days and VIP pass types. I populated the tables with over 330 rows, including 40 attendees, 51 performances and 60 non-music events.
- **Queries:** I wrote queries that reflect real organiser and attendee tasks: removing artists, events and attendees; rescheduling performances; viewing the line-up and personal schedules; analysing ticket sales; and tracking daily attendance.

## Key Findings
- The key constraints protected data integrity. Deleting an artist automatically removed their performances and attendees' schedule entries, while deleting an event set related schedule entries to NULL instead of losing the whole schedule.
- Update queries resolved three timetable clashes on the Friday and filled gaps left by dropped artists.
- Sales analysis with COUNT, SUM and GROUP BY showed the full-weekend ticket with premium camping and a Day VIP pass was both the most popular and highest earning combination (£1,010). Single-day tickets with no extras earned the least (£100).
- A subquery with a CASE expression reported daily attendance and camping numbers (e.g. 10 attendees camping on the Friday) to support staffing, security and crowd-flow planning.

## Files
| File | Description |
|------|-------------|
| `CIS4503 assignment 2.1.docx` | Design report: ambiguities, assumptions, ERDs, normalisation and data dictionary |
| `CIS4503 assignment 2.2.docx` | Construction report: query explanations, outputs and a discussion of design changes |
| `CIS4503 coursework 2.2.sql` | MySQL script to create, populate and query the database |
