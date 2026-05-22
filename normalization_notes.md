# Normalization Reasoning

## Introduction

The raw CodeJudge dataset is collected from multiple operational activities of the coding platform such as student management, coding submissions, contests, attendance, and plagiarism tracking.

Since the raw CSV files are independent exports, they may contain repeated information, duplicate values, missing constraints, and relationship inconsistencies.

The relational schema was redesigned to reduce redundancy, improve consistency, and maintain data integrity using normalization principles.

---

# Examples of Repeated or Redundant Data

## Example 1 — Student Information Repetition

Student details such as:

- student_name
- email
- batch_name

may appear repeatedly in:

- submissions
- attendance
- enrollments
- regrade_requests

### Problem

If student email or name changes, it must be updated in many places, causing update anomalies.

### Solution

Store student information only once in the `students` table and reference it using `student_id`.

---

## Example 2 — Problem Information Repetition

Problem title and difficulty may repeat in:

- submissions
- contest_problems
- test_cases

### Problem

Repeated problem data increases storage redundancy and inconsistency risk.

### Solution

Create a separate `problems` table and reference it through `problem_id`.

---

## Example 3 — Contest and Problem Redundancy

A contest may contain multiple problems and one problem may appear in multiple contests.

### Problem

Storing contest and problem details together repeatedly creates duplicate rows.

### Solution

Use a mapping table:

```text
contest_problems

---

**# Examples Where Separating Tables Improves Design**

**## Example 1- Test Results Separation**

Initially, test case execution results could have been stored directly inside submissions.

**### Problem**

One submission may contain multiple test case outputs, leading to repeating groups.

**### Solution**

A separate test_results table was created.

Benefits:

supports multiple test cases per submission
avoids repeating columns
improves scalability

---

**## Example 2- Attendance Separation**

Attendance data could have been merged into sessions or students.

**### Problem**

A session contains attendance for many students.

**### Solution**

Separate attendance table created with:

student_id
session_id
attendance_status

Benefits:

handles many-to-many relationship properly
avoids NULL-heavy structures
improves reporting flexibility

---

**# Functional Dependency Examples**

**## Functional Dependency 1**

A student_id uniquely determines student information.

```text
student_id → first_name, last_name, email, batch_id

---

**## Functional Dependancy 2**

Each problem_id uniquely identifies its associated problem details.

```text
problem_id → title, difficulty, course_id

---

**# First Normal Form (1NF)**

The final schema satisfies 1NF because:

all columns contain atomic values
no repeating groups exist
each row is uniquely identifiable
each table has a primary key

**## Example:**

Instead of storing multiple test results in one column, each result is stored as a separate row.

---

**# Second Normal Form (2NF)**

The schema satisfies 2NF because:

all non-key attributes fully depend on the primary key
many-to-many relationships are separated using bridge tables
partial dependencies are removed

**## Example:**

In contest_problems, contest and problem relationships are isolated into a dedicated table.

---

**# Third Normal Form (3NF)**

The schema approximately satisfies 3NF because:

transitive dependencies are minimized
non-key attributes depend only on the primary key
entity-specific information is isolated into separate tables

**## Example:**

Batch information is stored only in batches instead of repeatedly inside students.

---


**# Trade-offs in the Design**

**## Advantage — Reduced Redundancy**

Normalization minimizes duplicate data and improves consistency.

---

**## Advantage — Better Data Integrity**

Foreign keys and constraints help prevent invalid relationships.

---

**## Trade-off — Increased Number of Tables**

More normalized tables require additional JOIN operations during querying.

This can slightly increase query complexity.

---

**## Trade-off — Slightly Higher Query Complexity**

Reports combining:

students
submissions
problems
contests

may require multiple joins.
