# Keys and Relationships
# Alternate Keys

| Table | Alternate Key |
|---|---|
| students | email |
| batches | batch_name |

---

# Composite Keys

| Table | Composite Key |
|---|---|
| enrollments | (student_id, course_id) |
| attendance | (student_id, session_id) |
| contest_problems | (contest_id, problem_id) |

---

# Foreign Keys

| Table | Foreign Key | References |
|---|---|---|
| students | batch_id | batches(batch_id) |
| enrollments | student_id | students(student_id) |
| enrollments | course_id | courses(course_id) |
| problems | course_id | courses(course_id) |
| submissions | student_id | students(student_id) |
| submissions | problem_id | problems(problem_id) |
| test_results | submission_id | submissions(submission_id) |
| attendance | session_id | sessions(session_id) |

---

# NOT NULL Constraints

| Table | Column | Reason |
|---|---|---|
| students | first_name | student name required |
| students | email | essential identifier |
| enrollments | student_id | relationship required |
| submissions | language | submission language required |

---

# UNIQUE Constraints

| Table | Column |
|---|---|
| students | email |
| students | phone |
| batches | batch_name |
| courses | course_name |

---

# CHECK Constraints

| Table | Constraint |
|---|---|
| problems | difficulty must be Easy/Medium/Hard |
| submissions | score >= 0 |
| attendance | valid attendance values only |
| plagiarism_flags | similarity percentage between 0 and 100 |
