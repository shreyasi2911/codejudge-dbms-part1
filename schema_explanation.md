# Schema Explanation

## batches
Acts as a bridge table between students and courses.

### Why Needed

A student can enroll in multiple courses and a course can contain multiple students.

This creates a many-to-many relationship.

---

## problems

Stores coding problems available on the platform.

### Relationships

- one course can contain many problems
- one problem can contain many test cases
- one problem can appear in many contests

---

## submissions

Stores student code submissions.

### Relationships

- one student can create many submissions
- one problem can receive many submissions
- one submission can have many test results

---

## test_results

Stores execution result of each test case.

### Purpose

Helps evaluate submission correctness.

---

## contests

Stores contest details.

---

## contest_problems

Bridge table between contests and problems.

Used because:

- one contest can contain many problems
- one problem may appear in many contests

---

## attendance

Stores attendance status for each session.

---

## plagiarism_flags

Stores plagiarism analysis results for suspicious submissions.
