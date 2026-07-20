-- 需求:
-- 1. 查询 "教研部" 的 "男性" 员工，且在 "2011-05-01" 之后入职的员工信息 。
select *
from emp e,dept d
where e.dept_id = d.id and d.name ='教研部' and e.entry_date>'2011-05-01' and e.gender =1;

-- 2. 查询工资 低于公司平均工资的 且 性别为男 的员工信息 。
select avg(salary) from emp;
select emp.*
from emp where salary<(select avg(salary) from emp) and gender=1;
-- 3. 查询部门人数超过 10 人的部门名称 。
-- 做法一：连接查询
select d.name,count(*)
from emp e,dept d where e.dept_id=d.id
group by d.name having count(*)>10;

-- 做法二：子查询
-- 3.1 查询每个部门的人数并筛选出人数超过 10 人的部门id（分组查询）
select dept_id from emp group by dept_id having count(*)>10;
-- 3.2 查询部门id为上述结果的部门信息
select name
from dept where id=(select dept_id from emp group by dept_id having count(*)>10);

-- 4. 查询在 "2010-05-01" 后入职，且薪资高于 10000 的 "教研部" 员工信息，并根据薪资倒序排序。
select *
from emp e,dept d
where e.dept_id=d.id and e.entry_date>'2010-05-01' and e.salary>10000 and d.name='教研部'
order by e.salary desc ;

-- 5. 查询每个部门最高薪资的员工信息
-- 5.1 查询每个部门的最高工资(表)
select dept_id,max(salary) from emp where dept_id is not null group by dept_id ;
-- 5.2 将员工表和上述结果连接查询，条件是员工的部门id和薪资都等于上述结果
select *
from emp e,(select dept_id,max(salary) max from emp where dept_id is not null group by dept_id) ms
where e.dept_id=ms.dept_id and e.salary = ms.max;

-- 6. 查询每个部门高于平均工资的员工信息
-- 6.1 查询每个部门的平均工资(表)
select dept_id,avg(salary) from emp where dept_id is not null group by dept_id ;
-- 6.2 将员工表和上述结果连接查询，条件是员工的部门id等于临时表的部门id，且薪资高于临时表的平均薪资
select e.*
from emp e,(select dept_id,avg(salary) asy from emp where dept_id is not null group by dept_id ) ag
where e.dept_id=ag.dept_id and e.salary>asy;