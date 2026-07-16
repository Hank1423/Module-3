USE QuanLySinhVien;

SELECT * FROM Student;

SELECT * FROM Mark;

SELECT * FROM Subject
WHERE credit = (SELECT MAX(credit) FROM Subject);

SELECT DISTINCT s.SubId, s.SubName, s.credit 
FROM Subject s
JOIN Mark m ON s.SubID = m.SubId
WHERE m.Mark = (SELECT MAX(Mark) FROM Mark);  

SELECT st.StudentId, st.StudentName, AVG(m.Mark) AS DiemTrungBinh
FROM Student st
LEFT JOIN Mark m ON st.StudentId = m.StudentId
GROUP BY st.StudentId, st.StudentName
ORDER BY DiemTrungBinh DESC;
