USE QuanLySinhVien;

SELECT * FROM Student
WHERE StudentName LIKE 'h%';

SELECT * FROM Class
WHERE MONTH(StartDate) = 12;

SELECT * FROM Subject
WHERE Credit BETWEEN 3 AND 5;

UPDATE Student
SET ClassID = 2
WHERE StudentName = 'Hung';

SELECT s.StudentName, sub.SubName, m.Mark
FROM Mark m
INNER JOIN Student s ON m.StudentID = s.StudentID
INNER JOIN Subject sub ON m.SubID = sub.SubID
ORDER BY m.Mark DESC, s.StudentName ASC;