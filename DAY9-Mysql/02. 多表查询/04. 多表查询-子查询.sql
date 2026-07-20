-- ========================= 子查询 ================================
-- 标量子查询
-- A. 查询在 "阮小五" 入职之后入职的员工信息
-- 1 查询 "阮小五" 的入职时间
select entry_date from emp where name = '阮小五';
-- 2 查询入职时间在上述结果之后的员工信息
select *
from emp where entry_date='2015-01-01';
-- 合二为一
select *
from emp where entry_date=(select entry_date from emp where name = '阮小五');
-- 列子查询
-- A. 查询 "教研部" 和 "咨询部" 的所有员工信息
-- 1 查询"教研部" 和 "咨询部"的部门id
select id from dept where name in('教研部','咨询部');
-- 2 查询部门id等于上述结果的员工信息
select * from emp where dept_id in(2,3);
-- 合二为一
select * from emp where dept_id in (select id from dept where name in('教研部','咨询部'));
-- 行子查询
-- A. 查询与 "李忠" 的薪资 及 职位都相同的员工信息 ;
-- 1 查询李忠的薪资和职位
select emp.salary,emp.job from emp where name='李忠';
-- 2 查询薪资和职位等于上述结果的员工信息
select *
from emp where emp.job=5 and emp.salary=5000;
-- 2.1 作为条件使用
-- 合二为一
select *
from emp e where (salary,job)=(select emp.salary,emp.job from emp where name='李忠')
and name !='李忠';
-- 2.2 作为表使用
select *
from emp e1 ,(select emp.salary,emp.job from emp where name='李忠') e2
where e1.salary=e2.salary and e1.job=e2.job and name !='李忠';
-- 表子查询
-- A. 查询入职日期是 "2006-01-01" 之后的员工信息 , 及其部门信息
-- 1 先查询入职日期是 "2006-01-01" 之后的员工信息
select * from emp where entry_date>'2006-01-01';
-- 2 将上述结果和部门表连接查询。
select *
from (select * from emp where entry_date>'2006-01-01') e,dept d where e.dept_id=d.id;


-- 先将两个表连起来，再筛选
select *
from emp e,dept d where e.dept_id = d.id and e.entry_date > '2006-01-01';
