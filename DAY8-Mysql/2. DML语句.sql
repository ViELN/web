-- ========== DML : 数据操作语言【重点掌握】 ==========
-- DML : 插入数据 - insert
/*语法：
    1、指定字段添加数据：insert into 表名 (字段名1, 字段名2)  values (值1, 值2);
    2、全部字段添加数据：insert into 表名 values (值1, 值2, ...);
    3、批量添加数据（指定字段）：insert into 表名 (字段名1, 字段名2)  values (值1, 值2), (值1, 值2);
    4、批量添加数据（全部字段）：insert into 表名 values (值1, 值2, ...), (值1, 值2, ...);
*/
-- 1. 为 emp 表的 username,name,phone,gender, job, salary字段插入值
/*    insert into emp(username,name,gender,phone,job,salary) values('admin123','老大',1,'12341234100',2,10000);
-- 2. 为 emp 表的 所有字段插入值
    insert into emp values
    (null,'zhangwei','123666','张伟',1,'13612341235',2,15000,'http://www.itheima.com/a.jpg','2026-10-08',now(),now());
-- 注意：在有些公司内部规定，即使给所有字段添加数据，也必须将字段名都列举出来，防止后期向表中添加列或者删除列。
insert into emp(id, username, password, name, gender, phone, job, salary, image, entrydate, create_time, update_time) values
(null,'zhangwei2','123667','张伟2',2,'13612341236',2,15000,'http://www.itheima.com/a.jpg','2026-10-08',now(),now());
-- 3. 批量为 emp 表的 name, gender, job, salary字段插入数据
insert into emp(username,name,gender,phone,job,salary) values
 ('zhangyida2','张益达2',1,'13612341237',2,10000),
 ('zhangyida3','张益达3',2,'13612341238',2,10000),
 ('zhangyida4','张益达4',2,'13612341239',2,10000),
 ('zhangyida5','张益达5',1,'13612341210',2,10000),
 ('zhangyida6','张益达6',2,'13612341211',2,10000);*/

-- DML : 更新数据 - update
/*语法：
    1、修改数据：update  表名  set  字段名1 = 值1 , 字段名2 = 值2 , .... [ where  条件 ] ;
*/
-- 1. 将 emp 表的ID为1的员工 姓名更新为 '张三丰', 性别更新为男
    update emp set name='张三丰',gender='1' where id=1;
-- 2. 将 emp 表的所有员工的入职日期更新为 '2010-01-01'
    update emp set entrydate='2010-01-01';
-- 3. 将 emp 表的所有员工, 每人涨薪500
    update emp set salary = salary +500;

-- DML : 删除数据 - delete
/*语法：
    1、删除数据：delete  from  表名  [ where  条件 ];
*/
-- 1. 删除 emp 表中 ID为1的员工
    delete from emp where id=1;
-- 2. 删除 emp 表中的所有员工
    delete from emp;