SHOW DATABASES;

DROP DATABASE temp;

show databases;

CREATE DATABASE IF NOT EXISTS temp;

show databases;

SELECT DATABASE();

SHOW CHARSET;

show collation;

show tables;

CREATE TABLE temp(
	id BIGINT PRIMARY KEY auto_increment,
	name VARCHAR(10),
	birthday DATETIME
);
INSERT INTO temp VALUES ('zhangsan','2004-08-20 00:00:10');

DESC temp;

DROP TABLE temp;

INSERT INTO temp (name,birthday) VALUES ('zhangsan','2004-9-20 00:00:01');

SELECT * FROM temp;

DESC temp;

-- 全列插入

INSERT INTO temp VALUES (6,'lisi','2004-09-20 00:00:00'),
(7,'wangwu','2004-04-23 10:00:03');

SELECT * FROM temp;

SHOW TABLEs;

SELECT * FROM student;

SELECT * FROM exam;

SELECT name,chinese+math+english total FROM exam;

SELECT name,math '数学' FROM exam;

SELECT DISTINCT english FROM exam;

SELECT name,chinese + math + english as 'total' FROM exam ORDER BY total DESC; 

DESC temp;

CREATE TABLE new LIKE temp;

SELECT * FROM new;

DROP TABLE new;

DESC new;

SELECT * FROM exam;

SELECT * FROM exam WHERE chinese IN (99) OR math IN (98) OR english IN (90);

SELECT * FROM exam;

SELECT * FROM exam LIMIT 3;

SELECT * FROM exam LIMIT 0,3;

SELECT * FROM exam LIMIT 5,100;

UPDATE exam SET math = 90 WHERE name = '唐三藏';

UPDATE exam SET math = 60,english = 70 WHERE name = '曹孟德';

UPDATE exam SET chinese = 80,math = 60,english = 70 WHERE name = '曹孟德';

-- 删除数据行
DELETE FROM exam WHERE id = 8;

DROP TABLE temp;

-- 复合主键
CREATE TABLE temp(
	id BIGINT,
	sn VARCHAR(10),
	name VARCHAR(10),
	PRIMARY KEY(id,sn)
);

DESC temp;

CREATE TABLE class1(
	id BIGINT PRIMARY KEY,
	class_name VARCHAR(10)
);

CREATE TABLE stu (
	id BIGINT PRIMARY KEY,
	name VARCHAR(10),
	class_id BIGINT,
	FOREIGN KEY (class_id) REFERENCES class1(id) 
);

INSERT INTO class1 VALUES (1,'java113');

INSERT INTO stu VALUES (1,'zhangsan',1);

-- 由于主表中没有2的班级
INSERT INTO stu VALUES (2,'lisi',1);

show TABLEs;

CREATE TABLE temp(
	id BIGINT PRIMARY KEY,
	name VARCHAR(10),
	math INT
);
DESC temp;

ALTER TABLE temp DROP PRIMARY KEY;

ALTER TABLE temp MODIFY id BIGINT PRIMARY KEY auto_increment;

-- 插入查询结果
INSERT INTO temp (id,name,math) SELECT id,name,math FROM exam;

SELECT * FROM temp;

INSERT INTO temp (name,math) SELECT name,english FROM exam;

select * FROM temp;

DROP TABLE temp;

-- 聚合查询
SELECT COUNT(*) FROM exam;

SELECT COUNT(0) FROM exam WHERE chinese + math + english >200;

SELECT name,chinese + math + english total FROM exam WHERE 
chinese + math + english > 200;

SELECT role,ROUND(AVG(salary),2),COUNT(*) FROM emp GROUP BY role;

SELECT * from children;

DROP TABLE children;

DROP TABLE stu;

SELECT * FROM student;

-- 自连接 - 使用where来筛选出正确的数据
SELECT * FROM student s,class c WHERE s.class_id =c.class_id;

-- 使用join on 语句
SELECT * FROM student s JOIN class c ON s.class_id = c.class_id;

SELECT * FROM course;

-- 左自连接
SELECT * FROM student s LEFT JOIN class c ON s.class_id = c.class_id;

SELECT * FROM student s RIGHT JOIN class c ON s.class_id = c.class_id;

SELECT * FROM exam;

SELECT * FROM student WHERE class_id = (SELECT class_id FROM class WHERE name = '计算机系2019级1班');

SELECT * FROM exam EXISTS SELECT class_id FROM class WHERE class_id = 2;

SELECT * FROM exam WHERE EXISTS (SELECT class_id FROM class WHERE class_id = 4);

CREATE TABLE temp (
	id BIGINT PRIMARY KEY,
	name VARCHAR(10)
);

INSERT into temp VALUES (1,'zhangsan');

SELECT * FROM temp;

-- 就是将两个查询结果进行合并
SELECT * FROM temp union SELECT * FROM class;

-- 视图
SELECT st.name,st.mail,cl.name,sc.score,co.name FROM student st,class cl,score sc,course co WHERE st.class_id = cl.class_id AND sc.student_id = st.student_id AND sc.course_id = co.course_id;

-- 创建视图
CREATE VIEW stu_view (stu_name,mail,class_name,score,course_name) AS SELECT st.name,st.mail,cl.name,sc.score,co.name FROM student st,class cl,score sc,course co WHERE st.class_id = cl.class_id AND sc.student_id = st.student_id AND sc.course_id = co.course_id;

SHOW CREATE VIEW stu_view;

SELECT * FROM stu_view;

SHOW CREATE VIEW stu_view;

SELECT * FROM stu_view;

DROP VIEW stu_view;

CREATE TABLE temp(
	id BIGINT PRIMARY KEY,
	sn INT UNIQUE,
	name VARCHAR(10)
);

DROP TABLE temp;


SHOW INDEX FROM temp;

CREATE TABLE temp(
	id BIGINT,
	sn INT,
	name VARCHAR(10),
	PRIMARY KEY(id),
	UNIQUE(sn)
);

SHOW KEYs FROM temp;


-- 普通索引的创建
CREATE TABLE temp(
	id BIGINT PRIMARY KEY,
	sn INT,
	name VARCHAR(10)
);

ALTER TABLE temp ADD INDEX(name);

ALTER TABLE temp DROP INDEX name;

-- 使用这种方式可以对创建的索引进行命名
CREATE INDEX sn_index ON temp(sn);

show INDEX FROM temp;

ALTER TABLE temp DROP INDEX sn_index;

ALTER TABLE temp DROP PRIMARY KEY;

ALTER TABLE temp ADD PRIMARY KEY(id);

CREATE INDEX sn_index ON temp (sn);

SHOW INDEX FROM temp;

DROP TABLE temp;

SELECT * FROM emp;

ALTER TABLE student DROP INDEX sn;

CREATE INDEX sn_index ON student(sn);

SHOW INDEX FROM student;

ALTER TABLE student DROP INDEX class_id;

-- 已经在sn的B+树中可以找到了，发生了索引覆盖
EXPLAIN SELECT sn FROM student WHERE sn = '09982';
EXPLAIN SELECT * FROM student WHERE sn = '09982';

CREATE TABLE temp(
	id BIGINT PRIMARY KEY,
	name VARCHAR(10),
	age INT
);

ALTER TABLE temp DROP age;

-- 查看隔离级别
SELECT @@GLOBAL.TRANSACTION_isolation;
SELECT @@SESSION.TRANSACTION_isolation;

-- set GLOBAL TRANSACTION ISOLATION LEVEL 





























































