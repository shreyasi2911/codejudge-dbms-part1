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
