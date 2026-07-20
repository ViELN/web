-- 创建学生表
create table Student(
    Sno varchar(20),    -- 编号
    Sname varchar(20) not null,    -- 姓名
    Ssex varchar(20) not null,    -- 性别
    Sbirthday datetime,    -- 生日
    Class varchar(20)    -- 班级编号
);
-- 创建教师表
create table Teacher(
    Tno varchar(20),    -- 编号
    Tname varchar(20) not null,    -- 姓名
    Tsex varchar(20) not null, -- 性别
    Tbrithday datetime, -- 生日
    Prof varchar(20), -- 职称
    Depart varchar(20) not null -- 院系

);
-- 创建课程表
create table Course(
    Cno varchar(20),    -- 编号
    Cname varchar(20) not null, -- 课程名称
    Tno varchar(20) not null -- 教师编号
);
-- 创建成绩表
create table Score(
    Sno varchar(20) not null,   -- 学生编号
    Cno varchar(20) not null,   -- 课程编号
    -- 成绩
    Degree Decimal    -- 分数
);

--添加数据
-- 添加学生信息
insert into student values('108','曾华','男','1977-09-01','95033');
insert into student values('105','匡明','男','1975-10-02','95031');
insert into student values('107','王丽','女','1976-01-23','95033');
insert into student values('101','李军','男','1976-02-20','95033');
insert into student values('109','王芳','女','1975-02-10','95031');
insert into student values('103','陆君','男','1974-06-03','95031');

-- 添加教师信息
insert into teacher values('804','李诚','男','1958-12-02','副教授','计算机系');
insert into teacher values('856','张旭','男','1969-03-12','讲师','电子工程系');
insert into teacher values('825','王萍','女','1972-05-05','助教','计算机系');
insert into teacher values('831','刘冰','女','1977-08-14','助教','电子工程系');

-- 添加课程信息
insert into course values('3-105','计算机导论','825');
insert into course values('3-245','操作系统','804');
insert into course values('6-166','数字电路','856');
insert into course values('9-888','高等数学','831');

-- 添加成绩信息
insert into score values('103','3-245','86');
insert into score values('105','3-245','75');
insert into score values('109','3-245','68');
insert into score values('103','3-105','92');
insert into score values('105','3-105','88');
insert into score values('109','3-105','76');
insert into score values('103','6-166','85');
insert into score values('105','6-166','79');
insert into score values('109','6-166','81');


-- 建立新表grade表（等级表）
create table grade (
    low  int,    -- 最低分
    upp  int,    -- 最高分
    ranks  char(1)    -- 等级：A、B、C、D、E
);
insert into grade values(90,100,'A');
insert into grade values(80,89,'B');
insert into grade values(70,79,'C');
insert into grade values(60,69,'D');
insert into grade values(0,59,'E');


-- 1、 查询Student表中的所有记录的Sname、Ssex和Class列。
select Sname,Ssex,Class from student;
-- 2、 查询教师所有的单位即不重复的Depart列。
select Depart from teacher group by Depart;
-- 3、查询Student表的所有记录。
select * from student ;
-- 4、查询Score表中成绩在60到80之间的所有记录
select * from score where Degree between 60 and 80;
-- 5、查询Score表中成绩为85，86或88的记录。
select *
from score where Degree in (85,86,88);
-- 6、查询Student表中"95031"班或性别为"女"的同学记录。
select *
from student
where Class='95031' and Ssex='女';
-- 7、以Class降序查询Student表的所有记录。
select *
from student order by Class desc ;
-- 8、以Cno升序、Degree降序查询Score表的所有记录。
select *
from score order by cno asc,Degree desc ;
-- 9、查询"95031"班的学生人数。
select *
from student where Class='95031';
-- 10、 查询Score表中的最高分的学生学号和课程号。（子查询或者排序）
select max(Degree) from score ;
select Sno,Cno
from score where Degree=(select max(Degree) from score );
-- 11、查询每门课的平均成绩，要按照课程分组group by，然后求没门课平均avg
select Cno,avg(Degree)
from score group by Cno;
-- 12、查询Score表中至少有2名学生选修的并以3开头的课程的平均分数。
select Cno,avg(Degree)
from score where Cno like '3%' group by Cno having count(*) >= 2;
-- 13、查询分数大于70，小于90的Sno列。
select Sno
from Score where Degree between 70 and 90;
-- 14、查询所有学生的Sname、Cno和Degree列。
select s.Sname, c.Cno, c.Degree
from student s left join score c on s.Sno = c.Sno;
-- 15、查询所有学生的Sno、Cname和Degree列。
select s.Sno,c.Cname,s.Degree
from score s left join course c on s.Cno=c.Cno;
-- 16、查询所有学生的Sname、Cname和Degree列。
SELECT Student.Sname, Course.Cname, Score.Degree
FROM Student
LEFT JOIN Score ON Student.Sno = Score.Sno
LEFT JOIN Course ON Score.Cno = Course.Cno;
-- 17、 查询“95033”班学生的平均分。
select Sno from student where Class='95033';
select avg(Degree)
from student s,score c where c.Sno in (select Sno from student where Class='95033');
-- 18、现查询所有同学的Sno、Cno和ranks列。
select c.Sno,c.Cno,g.ranks
from grade g left join score c on Degree between g.low and g.upp
where c.Sno is not null ;
-- 19、查询选修"3-105"课程的成绩高于"109"号同学成绩的所有同学的记录。
select c.Degree
from student s left join score c on s.Sno=c.Sno where s.Sno='109' and Cno='3-105';
select *
from student s left join score c on s.Sno=c.Sno
where c.Degree>(select c.Degree
from student s left join score c on s.Sno=c.Sno where s.Sno='109' and Cno='3-105');
-- 20、查询score中选学多门课程的同学中分数为非最高分成绩的记录。
select *
from student s left join score c on s.Sno=c.Sno
where c.Degree <(select max(Degree) from score);
-- 22、查询和学号为105的同学同年出生的所有学生的Sno、Sname和Sbirthday列。
select Sno,Sname,Sbirthday
from student where Sbirthday <(select Sbirthday from student where sno='105');
-- 23、查询“张旭“教师任的学生成绩。
select c.Cno
from teacher t left join course c on t.Depart=c.Cname
where t.Tname='张旭';
select *
from student s left join score c on s.Sno=c.Sno
where c.Cno=(select c.Cno
from teacher t left join course c on t.Depart=c.Cname
where t.Tname='张旭');
-- 24、查询选修某课程的同学人数多于5人的教师姓名。
select distinct t.Tname
from teacher t
join course c on t.Tno=c.Tno
join score s on  c.Cno=s.Cno
group by c.Cno,t.Tname
having count(distinct s.Sno)>5;
-- 25、查询95033班和95031班全体学生的记录。
select *
from Student where Class in('95033','95031');
-- 26、查询存在有85分以上成绩的课程Cno.
select distinct Cno
from score where Degree>85;
-- 27、查询出"计算机系"教师所教课程的成绩表。
select sc.Degree
from score sc
join course c on c.Cno in ('3-105,3-245');
-- 28、查询"计算机系"与"电子工程系"不同职称的教师的Tname(姓名)和Prof(职称)。?
select distinct Tname,Prof from teacher  ;
-- 29、查询选修编号为"3-105"课程且成绩至少高于选修编号为"3-245"的同学的记录
select max(Degree) from score where Cno='3-245';
select *
from score where Degree>(select max(Degree) from score where Cno='3-245')
and Cno='3-105';
-- 30、 查询成绩比该课程平均成绩低的同学的成绩表。
select Cno,avg(Degree) from score group by Cno;
select c.*
from score c,(select Cno,avg(Degree) avg from score group by Cno) sc
where c.Degree<sc.avg and c.Cno=sc.Cno;
-- 31、查询所有任课教师的Tname和Depart.
select Tname,Depart from teacher;
-- 32、查询所有未讲课的教师的Tname和Depart.

-- 33、查询至少有2名男生的班号。
select Class,count(*)
from student where Ssex='男' group by Class order by count(*)>=2;
-- 34、查询不姓王的同学信息
select *
from student where Sname not like ('王%');
-- 35、查询Student表中每个学生的姓名和年龄。
select Sname,Sbirthday
from student;
-- 36、查询Student表中最大和最小的Sbirthday日期值。
SELECT Sname, YEAR(CURDATE()) - YEAR(Sbirthday) AS 年龄 FROM Student;
-- 37、以班号和年龄从大到小的顺序查询Student表中的全部记录。
select class,year(curdate())-year(Sbirthday) as 年龄
from student order by Class,年龄 desc ;
-- 38、查询“男”教师及其所上的课程。
select Depart
from teacher where Tsex='男';
-- 39、查询最高分同学的Sno、Cno和Degree列。
select Cno,max(Degree) from score group by Cno;
select s.Sno,s.Cno,s.Degree
from score s,(select Cno,max(Degree) max from score group by Cno) c
where s.Degree=max;
-- 40、查询和“李军”同性别的所有同学的Sname.
select Sname
from student where Sname like ('李%') and Sname !='李军';
-- 41、查询和“李军”同性别并同班的同学Sname.
select Sname
from student where Sname like ('李%') and Sname !='李军'
and Class =(select Class from student where Sname='李军') and Ssex='男';
-- 42、查询所有选修"计算机导论"课程的“男”同学的成绩表。
select sc.Degree
from student s left join score sc on s.Sno=sc.Sno
join course c on c.Cno=sc.Cno
where s.Ssex='男';
-- 43,查询"3-245"课程比"3-105"课程成绩高的学生的信息及课程分数
select s.*,s1.Degree
from student s left join (select * from score where Cno='3-105') s2 on s.Sno=s2.Sno
left join(select * from score where Cno='3-245') s1 on s.Sno=s1.Sno
where s2.Degree<s1.Degree
;
-- 44查询所有学生的课程及分数情况（存在学生没成绩，没选课的情况）
select c.Cname,sc.Degree
from student s left join score sc on s.Sno=sc.Sno
left join course c on sc.Cno=c.Cno;
-- 45.查询不同课程成绩相同的学生的学生编号、课程编号、学生成绩
SELECT distinct s1.Sno, s1.Cno, s1.Degree
FROM score s1
INNER JOIN score s2
  ON s1.Degree = s2.Degree
 AND s1.Cno != s2.Cno
GROUP BY s1.Sno, s1.Cno, s1.Degree;