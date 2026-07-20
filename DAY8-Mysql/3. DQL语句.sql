-- 数据准备
-- 员工表
create table `employee` (
  id int unsigned primary key auto_increment comment '主键',
  name varchar(10) not null comment '姓名',
  image varchar(255) comment '头像',
  gender tinyint unsigned not null comment '性别, 1:男, 2:女',
  job tinyint unsigned comment '职位, 1:班主任, 2:讲师, 3:学工主管, 4:教研主管, 5:咨询师',
  salary int unsigned not null comment '薪资',
  entry_date date comment '入职日期',
  create_time datetime comment '创建时间',
  update_time datetime comment '更新时间'
)  comment '员工信息表';

INSERT INTO `employee` (`id`, `name`, `image`, `gender`, `job`, `salary`, `entry_date`, `create_time`, `update_time`) VALUES
       (1,'夫子','https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg',1,4,30000,'2005-08-19','2025-04-16 16:30:39','2025-04-16 16:30:39'),
       (2,'颜瑟','https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg',1,3,18000,'2010-03-22','2025-04-16 16:30:39','2025-04-16 16:30:39'),
       (3,'君陌','https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg',1,2,22000,'2015-09-01','2025-04-16 16:30:39','2025-04-16 16:30:39'),
       (4,'李慢慢','https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg',1,2,17000,'2018-12-25','2025-04-16 16:30:39','2025-04-16 16:30:39'),
       (5,'叶红鱼','https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg',2,2,21000,'2013-07-14','2025-04-16 16:30:39','2025-04-16 16:30:39'),
       (6,'柳白','https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg',1,2,13000,'2021-04-17','2025-04-16 16:30:39','2025-04-16 16:30:39'),
       (7,'余帘','https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg',2,2,14500,'2020-10-31','2025-04-16 16:30:39','2025-04-16 16:30:39'),
       (8,'宁缺','https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg',1,1,6800,'2022-06-11','2025-04-16 16:30:39','2025-04-16 16:30:39'),
       (9,'李渔','https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg',2,1,4500,'2024-02-28','2025-04-16 16:30:39','2025-04-16 16:30:39'),
       (10,'唐小棠','https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg',2,1,6000,'2017-05-09','2025-04-16 16:30:39','2025-04-16 16:30:39'),
       (11,'陈皮皮','https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg',1,1,4700,'2025-01-15','2025-04-16 16:30:39','2025-04-16 16:30:39'),
       (12,'桑桑','https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg',2,5,8000,'2023-08-08','2025-04-16 16:30:39','2025-04-16 16:30:39'),
       (13,'莫山山','https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg',2,5,6500,'2020-10-31','2025-04-16 16:30:39','2025-04-16 16:30:39'),
       (14,'隆庆','https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg',1,5,5500,'2016-09-22','2025-04-16 16:30:39','2025-04-16 16:30:39'),
       (15,'夏侯','https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg',1,5,7500,'2011-12-12','2025-04-16 16:30:39','2025-04-16 16:30:39'),
       (16,'曲妮','https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg',2,5,6800,'2024-06-01','2025-04-16 16:30:39','2025-04-16 16:30:39'),
       (17,'何明池','https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg',1,5,6200,'2019-03-19','2025-04-16 16:30:39','2025-04-16 16:30:39'),
       (18,'陆晨迦','https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg',2,5,5800,'2015-09-01','2025-04-16 16:30:39','2025-04-16 16:30:39'),
       (19,'唐王','https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg',1,5,6800,'2022-07-07','2025-04-16 16:30:39','2025-04-16 16:30:39'),
       (20,'卫光明','https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg',1,2,19000,'2009-11-11','2025-04-16 16:30:39','2025-04-16 16:30:39'),
       (21,'朝小树','https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg',1,2,18500,'2020-05-05','2025-04-16 16:30:39','2025-04-16 16:30:39'),
       (22,'夏天','https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg',2,1,5500,'2014-08-16','2025-04-16 16:30:39','2025-04-16 16:30:39'),
       (23,'钟大俊','https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg',1,1,5500,'2015-09-01','2025-04-16 16:30:39','2025-04-16 16:30:39'),
       (24,'柯浩然','https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg',2,2,21000,'2023-01-01','2025-04-16 16:30:39','2025-04-16 16:30:39'),
       (25,'齐四','https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg',1,1,6500,'2018-10-10','2025-04-16 16:30:39','2025-04-16 16:30:39'),
       (26,'叶苏','https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg',1,5,5200,'2025-03-03','2025-04-16 16:30:39','2025-04-16 16:30:39'),
       (27,'七念','https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg',2,5,5500,'2015-06-18','2025-04-16 16:30:39','2025-04-16 16:30:39'),
       (28,'程立雪','https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg',2,5,6000,'2012-09-09','2025-04-16 16:30:39','2025-04-16 16:30:39'),
       (29,'观主','https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg',1,2,21000,'2007-07-07','2025-04-16 16:30:39','2025-04-16 16:30:39'),
       (30,'熊初墨','https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg',1,5,7000,'2024-04-04','2025-04-16 16:30:39','2025-04-16 16:30:39'),
       (31,'水珠儿',NULL,2,1,5000,'2019-09-23','2025-04-16 16:30:39','2025-04-16 16:30:39'),
       (32,'徐崇山','https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg',1,NULL,13000,'2021-12-25','2025-04-16 16:30:39','2025-04-16 16:30:39'),
       (33,'司徒依兰','https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg',2,NULL,22500,'2013-03-21','2025-04-16 16:30:39','2025-04-16 16:30:39');



--  =================== DQL: 基本查询 ======================
-- 1. 查询返回所有字段
select *
from employee;
-- 注意：在有写公司内部规定，如果要查询所有字段数据，也必须将字段名都写出。
select id, name, image, gender, job, salary, entry_date, create_time, update_time
from employee;
-- 2. 查询指定字段 name,entry_date 并返回
select name, entry_date
from employee ;
-- 3. 查询所有员工的 name,entry_date, 并起别名(name的别名为姓名、entry_date的别名为入职日期)
select name as 姓名, entry_date 入职日期
from employee;
-- 4. 查询已有的员工关联了哪几种职位(不要重复)
select distinct job from employee; -- 6条数据
-- distinct：去除重复值，只有当两行数据完全一样时才去重。
select distinct name,job from employee;  -- 33条数据,虽然job一样，但是name不一样，所以不能去重。
--  =================== DQL: 条件查询 ======================
-- 1. 查询 姓名 为 莫山山 的员工
select * from employee where name ='莫山山';
-- 2. 查询 薪资小于等于5000 的员工信息
select * from employee where salary <= 5000;
-- 3. 查询 没有分配职位 的员工信息
select * from employee where job is null ;
-- 4. 查询 入职日期 在 '2020-01-01' (包含) 到 '2025-01-01'(包含) 之间的员工信息
select * from employee where entry_date between '2020-01-01' and '2025-01-01';
select * from employee where entry_date >= '2020-01-01' and entry_date <= '2025-01-01';
-- 5. 查询 入职时间 在 '2020-01-01' (包含) 到 '2025-01-01'(包含) 之间 且 性别为女 的员工信息
select * from employee where entry_date between '2020-01-01' and '2025-01-01' and gender=2;
select * from employee where entry_date >= '2020-01-01' and entry_date <= '2025-01-01' and gender=2;
-- 6. 查询 职位是 2 (讲师), 3 (学工主管), 4 (教研主管) 的员工信息
select * from employee where job in (2,3,4);
select * from employee where job=2 or job=3 or job=4;
-- 7. 查询 姓名 为两个字的员工信息
select * from employee where name like '__';
select * from employee where char_length(name)=2;-- char_length(name)获取名字的长度(字符个数)
-- 8. 查询 姓 '李' 的员工信息
select * from employee where name like '李%';
-- 0. 查询 姓名中包含 '小' 的员工信息
select * from employee where name like '%小%';


--  =================== DQL: 分组查询 ======================
-- 聚合函数

-- 1. 统计该企业员工数量
select count(*)from employee; -- 33条数据
select count(job) from employee; -- 31条数据 null不参与聚合函数运算
-- 2. 统计该企业员工的平均薪资
select avg(salary) from employee;
-- 3. 统计该企业员工的最低薪资
select min(salary) from employee;
-- 4. 统计该企业员工的最高薪资
select max(salary) from employee;
-- 5. 统计该企业每月要给员工发放的薪资总额(薪资之和)
select sum(salary) from employee;


-- 分组
-- 1. 根据性别分组 , 统计男性和女性员工的数量
select gender,count(*) from employee group by gender;
-- 2. 先查询入职时间在 '2015-01-01' (包含) 以前的员工 , 并对结果根据职位分组 , 获取员工数量大于等于2的职位
select job,count(*)
from employee where entry_date<='2015-01-01' group by job having count(*)>=2;

--  =================== 排序查询 ======================
-- 1. 根据入职时间, 对员工进行升序排序
select * from employee order by entry_date;
select * from employee order by entry_date asc;
-- 2. 根据入职时间, 对员工进行降序排序
select * from employee order by entry_date desc ;
-- 3. 根据 入职时间 对公司的员工进行 升序排序 ， 入职时间相同 , 再按照 薪资 进行降序排序
select * from employee order by entry_date,salary desc ;

--  =================== 分页查询 ======================
-- 从起始索引0开始查询员工数据, 每页展示5条记录
-- 1. 查询 第1页 员工数据, 每页展示5条记录
select * from employee limit 0,5;
-- 2. 查询 第2页 员工数据, 每页展示5条记录
select * from employee limit 5,5;
-- 3. 查询 第3页 员工数据, 每页展示5条记录
select * from employee limit 10,5;
-- 规律： 起始索引 = (页码 - 1)*每页条数
-- 需求：查询薪资前三的员工信息
select * from employee order by salary desc limit 3;
-- 需求：查询薪资最高的员工信息
select * from employee order by salary desc limit 1;


