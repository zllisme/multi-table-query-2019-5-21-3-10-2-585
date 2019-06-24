# 1.查询同时存在1课程和2课程的情况
# ？题意不明

# 2.查询同时存在1课程和2课程的情况

# 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩
select student.id, student.name, cast(AVG(student_course.score) as DECIMAL(18,2)) avg_score 
from student, student_course where student.id = student_course.studentId 
group by student.id,student.name having AVG(student_course.score) >= 60;

# 4.查询在student_course表中不存在成绩的学生信息的SQL语句
select student.id, student.name, student.age, student.sex from student left join student_course 
on student.id = student_course.studentId where courseId is null;

# 5.查询所有有成绩的SQL
select s.id, s.name, count(sc.courseId) course_count from student s, student_course sc 
where s.id = sc.studentId group by s.id, s.name;

# 6.查询学过编号为1并且也学过编号为2的课程的同学的信息
select s.* from student s, student_course sc, student_course sc_2 where s.id = sc.studentId 
and sc.studentId = sc_2.studentId and sc.courseId = '1' and sc_2.courseId = '2';


# 7.检索1课程分数小于60，按分数降序排列的学生信息
select s.*, sc.score from student s, student_course sc 
where s.id = sc.studentId and sc.courseId = '1' and sc.score < 60 order by sc.score desc;

# 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列
select courseId, cast(AVG(score) as DECIMAL(18,2)) avg_score from student_course 
group by courseId order by AVG(score) desc, courseId asc;

# 9.查询课程名称为"数学"，且分数低于60的学生姓名和分数
select s.name, sc.score from student s, course c, student_course sc 
where s.id = sc.studentId and sc.courseId = c.id and c.name = '数学' and sc.score < 60;