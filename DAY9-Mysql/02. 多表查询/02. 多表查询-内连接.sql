-- ============================= 内连接 ==========================
-- A. 查询所有员工的ID, 姓名 , 及所属的部门名称 (隐式、显式内连接实现)
# 显式内连接
select e.id,e.dept_id,e.name,d.name,d.id
from emp as e
inner join dept as d
on e.dept_id = d.id;

select e.id,e.dept_id,e.name,d.name,d.id
from emp e join dept d
on e.dept_id = d.id;

# 隐式内连接
select e.id,e.dept_id,e.name,d.name,d.id
from emp e,dept d
where e.dept_id=d.id;

-- B. 查询 性别为男, 且工资 高于8000 的员工的ID, 姓名, 及所属的部门名称 (隐式、显式内连接实现)
select e.id,e.dept_id,e.name,e.salary,gender,d.name,d.id
from emp e,dept d
where e.dept_id=d.id and gender=1 and salary>8000;

select e.id,e.dept_id,e.name,e.salary,gender,d.name,d.id
from emp e join dept d
on e.dept_id = d.id
where gender=1 and salary>8000;
