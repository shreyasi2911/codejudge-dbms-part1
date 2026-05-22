# codejudge-dbms-part1
## Overview

This repository contains the relational database design for the CodeJudge platform dataset.

The project includes:

- relational schema design
- key and constraint analysis
- normalization reasoning
- SQL DDL statements
- ERD relationship design
- assumptions and design decisions

Database Used:
- SQLite

## Files Included

| File | Purpose |
|------|---------|
| schema.sql | SQL CREATE TABLE statements |
| schema_explanation.md | Explanation of entities and tables |
| keys_and_relationships.md | PK, FK, candidate key and constraints reasoning |
| normalization_notes.md | Normalization analysis |
| assumptions.md | Assumptions made during schema design |
| erd.md | Text ERD relationship diagram |

## Main Entities

- batches
- students
- courses
- enrollments
- problems
- test_cases
- contests
- contest_problems
- submissions
- test_results
- sessions
- attendance
- regrade_requests
- plagiarism_flags
- operation_requests

## Database Design Goals

- reduce redundancy
- maintain referential integrity
- support scalable query design
- follow 1NF, 2NF, and 3NF principles
