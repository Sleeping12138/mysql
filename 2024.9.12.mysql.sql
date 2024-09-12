-- 显示当前的mysql版本
SELECT VERSION();

SHOW DATABASES;

-- 创建新的数据库
CREATE DATABASE temp CHARACTER SET utf8mb4 COLLATE  
utf8mb4_0900_ai_ci;

-- 使用数据库
use test01;

CREATE DATABASE temp;

use temp;

use test01;

-- 查看当前选择的数据库
SELECT DATABASE();

SHOW WARNINGS;

-- 有关表的操作
show TABLE;
show TABLES;

CREATE TABLE temp (
	id BIGINT PRIMARY KEY,
	name VARCHAR(10),
	age INT
);

drop TABLE temp;

DESC student;

-- 有关表的增删改查
SELECT * FROM goods;

drop table goods;

CREATE TABLE temp (
	id BIGINT PRIMARY KEY,
	name VARCHAR(10),
	age INT
);

INSERT INTO temp VALUES (1,'zhangsan',18);

INSERT INTO temp (id,name) VALUES (2,'lisi');

INSERT INTO temp (id,age) VALUES (3,19);

-- 查询操作
SELECT * FROM temp;

UPDATE temp SET age = 20 WHERE id = 2;

SELECT * FROM temp;

SELECT name,age FROM temp;

SELECT * FROM student;

SELECT * FROM exam;

SELECT id,name,chinese + math + english as total FROM exam;
SELECT id,name,chinese + math + english as total FROM exam ORDER BY total DESC;

-- 去重查询
SELECT DISTINCT chinese FROM exam;
SELECT id,name,chinese FROM exam ORDER BY chinese asc;

show tables;

SELECT * FROM score;

SELECT * FROM student;

-- 条件查询
SELECT * FROM student WHERE student_id <= 5 ORDER BY student_id DESC;

SELECT * FROM student WHERE student_id BETWEEN 1 AND 5;

SELECT * FROM student;

SELECT * FROM exam;

SELECT * FROM exam WHERE name LIKE '孙_';
SELECT * FROM exam WHERE name LIKE '孙%';

SHOW tables;

SELECT * FROM temp;

-- 直接复制类型框架，但是数据不会复制
CREATE TABLE temp1 LIKE temp;

SELECT * FROM student WHERE student_id BETWEEN 1 AND 5 LIMIT 3 OFFSET 1;

-- 表的更新和删除
SELECT * FROM temp;

UPDATE temp SET name = 'wangwu' WHERE id = 3;

SELECT * FROM temp;

drop TABLE temp1;

SELECT * FROM student;

UPDATE student SET mail = 'putizushi@123' WHERE name = '菩提老祖';

SELECT * FROM student;

SELECT * FROM temp;

-- 删除是删除数据行
DELETE FROM temp WHERE id = 2;

SELECT * FROM temp;

-- 数据库约束
DROP TABLE temp;

CREATE TABLE temp (
	id BIGINT PRIMARY KEY,
	name VARCHAR(10) NOT NULL,
	age INT DEFAULT(0);
);

DROP TABLE temp;

CREATE TABLE class1 (
	class_id BIGINT PRIMARY KEY auto_increment,
	name VARCHAR(10)
);

CREATE TABLE stu(
	id BIGINT PRIMARY KEY auto_increment,
	name VARCHAR(10),
	class_id BIGINT,
	FOREIGN KEY (class_id) REFERENCES class1(class_id)
);
INSERT INTO class1 VALUES (1,'1');

INSERT INTO stu VALUES (1,'zhangsan',1);
INSERT INTO stu VALUES (1,'zhangsan',2);

DROP TABLE class1;

DROP TABLE stu;

-- 复合主键的设置
CREATE TABLE stu (
	stu_id BIGINT,
	name VARCHAR(10),
	class_id BIGINT,
	PRIMARY KEY (stu_id,class_id)
);

DESC stu;

DROP TABLE stu;

-- 聚合函数
SELECT * FROM student;

SELECT * FROM emp;

SELECT COUNT(0) FROM emp;

SELECT * FROM exam;

SELECT COUNT(*) FROM exam WHERE name LIKE '孙%';

SELECT * FROM emp;

SELECT COUNT(*),role,ROUND(AVG(salary),2) FROM emp GROUP BY role HAVING AVG(salary)>10000 ORDER BY ROUND(AVG(salary),2) DESC;

-- HAVING用于处理分组之后的虚拟表
-- WHERE用于基表的数据判断

-- 联合查询
SELECT * FROM student;

SELECT * FROM student,class;
SELECT * FROM student,class WHERE student.class_id = class.class_id;

SELECT * FROM student s INNER JOIN class c ON s.class_id = c.class_id;

SELECT * FROM student s LEFT JOIN class c ON s.class_id = c.class_id;

-- 没有全部使用空来进行补位
SELECT * FROM student s RIGHT JOIN class c ON s.class_id = c.class_id;


-- 找出学生中1比3成绩高的数据
SELECT * FROM score s1,score s2 WHERE s1.student_id = s2.student_id AND s1.course_id = 1 AND s2.course_id = 3 AND s1.score>s2.score;

SELECT * FROM student WHERE class_id = (SELECT class_id FROM class WHERE name = '中文系2019级3班');

SELECT course_id,score FROM score WHERE course_id IN (SELECT course_id FROM course WHERE name = 'Java' OR name = '计算机原理')

-- 合并查询
SELECT * FROM student WHERE student_id BETWEEN 1 AND 5 UNION ALL SELECT * FROM student WHERE student_id>3;









