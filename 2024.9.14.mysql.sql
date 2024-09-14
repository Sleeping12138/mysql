-- 视图的使用
SELECT 
s.student_id,s.`name`,cl.class_id,cl.`name`,c.course_id,c.`name`,sc.score_id,sc.score
FROM student s,class cl,course c,score sc WHERE s.student_id = sc.student_id AND s.class_id = cl.class_id AND sc.course_id = c.course_id;

CREATE VIEW v_student AS SELECT 
s.student_id,s.`name` stu_name,cl.`name` class_name,c.`name` course_name,sc.score_id,sc.score
FROM student s,class cl,course c,score sc WHERE s.student_id = sc.student_id AND s.class_id = cl.class_id AND sc.course_id = c.course_id;

-- 查看所有的内容
SELECT * FROM v_student;

-- 查看简单的内容
SHOW CREATE VIEW v_student;

SELECT * FROM v_student;

-- 修改基表视图也会进行修改
UPDATE score SET score = 60 WHERE score_id = 1;

-- 修改视图基表也会进行修改
UPDATE v_student SET score = 90 WHERE score_id = 1;

-- 视图就是存储复杂查询的虚拟表

SELECT * FROM v_student;

DROP VIEW v_student;


SELECT 
s.student_id,s.`name` stu_name,cl.`name` class_name,c.`name` course_name,sc.score_id,sc.score
FROM student s,class cl,course c,score sc WHERE s.student_id = sc.student_id AND s.class_id = cl.class_id AND sc.course_id = c.course_id;

-- 可以自定义其列的名称
CREATE VIEW v_student (id,stuName,className,courseName,sid,score) AS SELECT 
s.student_id,s.`name` stu_name,cl.`name` class_name,c.`name` course_name,sc.score_id,sc.score
FROM student s,class cl,course c,score sc WHERE s.student_id = sc.student_id AND s.class_id = cl.class_id AND sc.course_id = c.course_id;

SELECT * FROM v_student;

SHOW CREATE VIEW v_student;

DROP VIEW v_student;

SHOW TABLEs;

-- 索引
DROP TABLE clockingin;

DROP TABLE book;

SELECT * FROM exam1;

DROP TABLE exam1;

CREATE TABLE temp (
	id BIGINT PRIMARY KEY auto_increment,
	name VARCHAR(10)
);

INSERT INTO temp VALUES (1,'zhangsan');
INSERT INTO temp VALUES (2,'lisi');

SELECT * FROM temp;

DESC temp;

ALTER TABLE temp ADD UNIQUE (name);
DESC temp;

-- 唯一索引也是主键索引之外的
ALTER TABLE temp DROP INDEX name;

DESC temp;

ALTER TABLE temp ADD COLUMN age INT NOT NULL AFTER name;

DESC temp;

SELECT * FROM temp;

DROP TABLE temp;

CREATE TABLE temp (
	id BIGINT PRIMARY KEY auto_increment,
	name VARCHAR(10)
);

CREATE INDEX temp_name ON temp(name);

DESC temp;

DROP TABLE temp;

CREATE TABLE temp(
	id BIGINT PRIMARY KEY,
	name VARCHAR(10),
	INDEX (name)
);

DESC temp;

ALTER TABLE temp DROP INDEX name;

DESC temp;

SELECT * FROM temp;

ALTER TABLE temp RENAME TO temp2;

SELECT * FROM temp2;

DROP TABLE temp2;

DESC temp;

ALTER TABLE temp DROP PRIMARY KEY;

DESC temp;

ALTER TABLE temp ADD PRIMARY KEY (id);

DESC temp;

EXPLAIN SELECT * FROM student;

EXPLAIN SELECT * FROM student WHERE sn = '00835';

DROP TABLE temp;

CREATE TABLE temp (
	id BIGINT PRIMARY KEY,
	name VARCHAR(10),
	age INT
);

CREATE INDEX temp_name_age ON temp (name,age);

DESC temp;

SHOW INDEX FROM temp;

SELECT age FROM temp WHERE `name` = 'tellme';
EXPLAIN SELECT age FROM temp WHERE `name` = 'tellme';


































