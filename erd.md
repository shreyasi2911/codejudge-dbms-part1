# CodeJudge ERD / Relationship Diagram

## Tables and Relationships

```text
+------------------+
| batches          |
+------------------+
| PK batch_id      |
| batch_name       |
| start_date       |
| end_date         |
+------------------+
         |
         | 1-to-Many
         |
         v

+------------------+
| students         |
+------------------+
| PK student_id    |
| first_name       |
| last_name        |
| email            |
| FK batch_id      |
+------------------+
         |
         | 1-to-Many
         |
         v

+----------------------+
| enrollments          |
+----------------------+
| PK enrollment_id     |
| FK student_id        |
| FK course_id         |
| enrollment_date      |
+----------------------+
         ^
         |
         | Many-to-1
         |
+------------------+
| courses          |
+------------------+
| PK course_id     |
| course_name      |
| duration_weeks   |
+------------------+
         |
         | 1-to-Many
         |
         v

+------------------+
| problems         |
+------------------+
| PK problem_id    |
| title            |
| difficulty       |
| FK course_id     |
+------------------+
         |
         | 1-to-Many
         |
         +----------------------+
         |                      |
         v                      v

+-------------------+     +----------------------+
| test_cases        |     | submissions          |
+-------------------+     +----------------------+
| PK test_case_id   |     | PK submission_id     |
| FK problem_id     |     | FK student_id        |
| input_data        |     | FK problem_id        |
| expected_output   |     | language             |
+-------------------+     | score                |
                          +----------------------+
                                     |
                                     | 1-to-Many
                                     |
                                     v

                          +----------------------+
                          | test_results         |
                          +----------------------+
                          | PK result_id         |
                          | FK submission_id     |
                          | FK test_case_id      |
                          | status               |
                          +----------------------+

+------------------+
| contests         |
+------------------+
| PK contest_id    |
| contest_name     |
| start_time       |
| end_time         |
+------------------+
         |
         | Many-to-Many
         |
         v

+--------------------------+
| contest_problems         |
+--------------------------+
| PK contest_problem_id    |
| FK contest_id            |
| FK problem_id            |
+--------------------------+

+------------------+
| sessions         |
+------------------+
| PK session_id    |
| FK course_id     |
| session_date     |
| topic            |
+------------------+
         |
         | 1-to-Many
         |
         v

+----------------------+
| attendance           |
+----------------------+
| PK attendance_id     |
| FK student_id        |
| FK session_id        |
| attendance_status    |
+----------------------+

+---------------------------+
| regrade_requests          |
+---------------------------+
| PK request_id             |
| FK submission_id          |
| FK student_id             |
| reason                    |
| request_status            |
+---------------------------+

+---------------------------+
| plagiarism_flags          |
+---------------------------+
| PK flag_id                |
| FK submission_id          |
| similarity_percentage     |
+---------------------------+

+---------------------------+
| operation_requests        |
+---------------------------+
| PK operation_id           |
| FK requested_by           |
| operation_type            |
| status                    |
+---------------------------+
