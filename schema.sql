PRAGMA foreign_keys = ON;
        attendance_status IN ('Present','Absent','Late')
    ),

    FOREIGN KEY(student_id)
    REFERENCES students(student_id),

    FOREIGN KEY(session_id)
    REFERENCES sessions(session_id),

    UNIQUE(student_id, session_id)
);

CREATE TABLE regrade_requests (
    request_id INTEGER PRIMARY KEY,

    submission_id INTEGER NOT NULL,
    student_id INTEGER NOT NULL,

    reason TEXT,
    request_status TEXT CHECK(
        request_status IN ('Pending','Approved','Rejected')
    ),

    FOREIGN KEY(submission_id)
    REFERENCES submissions(submission_id),

    FOREIGN KEY(student_id)
    REFERENCES students(student_id)
);

CREATE TABLE plagiarism_flags (
    flag_id INTEGER PRIMARY KEY,

    submission_id INTEGER NOT NULL,
    similarity_percentage REAL CHECK(
        similarity_percentage >= 0
        AND similarity_percentage <= 100
    ),

    flagged_by TEXT,

    FOREIGN KEY(submission_id)
    REFERENCES submissions(submission_id)
);

CREATE TABLE operation_requests (
    operation_id INTEGER PRIMARY KEY,

    requested_by INTEGER,
    operation_type TEXT,
    request_time DATETIME,
    status TEXT CHECK(
        status IN ('Pending','Completed','Failed')
    ),

    FOREIGN KEY(requested_by)
    REFERENCES students(student_id)
);