SELECT DATABASE();

show tables;

SELECT * from emp;

SELECT role,AVG(salary) from emp GROUP BY role;

SELECT role,AVG(salary),SUM(salary) FROM emp GROUP BY role;

SELECT role,AVG(salary),SUM(salary) from emp GROUP BY role HAVING AVG(salary)>10000;

SHOW TABLES;

DROP TABLE temp;

CREATE TABLE temp(
	id BIGINT UNIQUE AUTO_INCREMENT,
	name VARCHAR(10)
);

DESC temp;

INSERT INTO temp VALUES (1,'zhangsan');
INSERT INTO temp VALUES ('lisi');

DESC temp;

ALTER TABLE temp MODIFY COLUMN id BIGINT NOT NULL auto_increment;

DROP TABLE temp;

SHOW TABLEs;

DESC temp;

ALTER TABLE temp MODIFY COLUMN id BIGINT UNIQUE auto_increment;

ALTER TABLE temp add COLUMN sex VARCHAR(10) DEFAULT('male'); 

INSERT INTO temp VALUES ('wangwu');

SELECT * from temp;

INSERT INTO temp (name,sex) VALUES ('lisi','female');
INSERT INTO temp VALUES (2,'lisi','female');

DROP TABLE temp;

CREATE TABLE temp(
	id BIGINT,
	name VARCHAR(10),
	sex TINYINT(1),
	PRIMARY KEY(id,name)
);

ALTER TABLE temp drop PRIMARY key;

DESC temp;

ALTER TABLE temp add PRIMARY KEY (id,name);

show tables;

drop TABLE temp;
drop TABLE temp1;

SELECT * from test;
SELECT * from test01;

DESC course;

show tables;

SELECT * from class;
SELECT * from student;
SELECT * from class;

DESC class;

INSERT INTO student VALUES (9,'00123','zhangsan','xxx',3);

ALTER TABLE class ADD FOREIGN KEY (class_id) REFERENCES student(class_id); 

DESC class;


show CREATE TABLE class;

ALTER TABLE class DROP FOREIGN KEY class_ibfk_1;

ALTER TABLE class ADD CONSTRAINT outkey FOREIGN KEY (class_id) REFERENCES student(class_id);


show CREATE TABLE class;

show TABLEs;

CREATE TABLE temp(
	id BIGINT PRIMARY KEY auto_increment,
	age INT DEFAULT(0),
	name VARCHAR(10),
	CHECK (age>18)
);

DESC temp;

INSERT INTO temp VALUES (1,20,'zhangsan');
INSERT INTO temp VALUES (2,10,'lisi');

DESC temp;

show CREATE TABLE temp;








































































