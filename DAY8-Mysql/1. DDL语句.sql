-- ========== DDL : 数据库操作【了解】 ==========
-- 1 查询所有数据库    语法：show databases;
#     show databasses ;
-- 2 创建数据库db1(如果不存在就创建)  语法：create  database [ if not exists ] 数据库名 ;
#     create database db2 ;
-- 3 查看当前数据库    语法：select database();
#     select database() ;
-- 4 使用db1数据库   语法：use  数据库名 ;
#     use db2 ;
-- 5 删除数据库  语法：drop  database [ if exists ]   数据库名 ;
#     drop database if exists db2 ;
-- 6 创建db1数据库，schema关键字，语法：create  schema [ if not exists ] 数据库名 ;
# create schema if not exists db2;

-- ========== DDL : 创建表结构【能读懂即可】 ==========
-- 1、创建: 基本语法
/*语法：
       create table  表名(
            字段1  字段类型  [ 约束 ]  [ comment  字段1注释 ] ,
            字段n  字段类型  [ 约束 ]  [ comment  字段n注释 ]
        ) [ comment  表注释 ] ;
       需求1：创建user用户表，有如下字段：
            id 整数类型(int) '编号'
            username 字符串(varchar) '用户名'
            name 字符串(varchar) '姓名'
            age 整数(int) '年龄'
            gender 字符串(varchar) '性别'
*/
/*create table user(
    id int comment "编号，唯一标识",
    username varchar(20) comment "用户名",
    name varchar(20) comment "姓名",
    age int comment "年龄",
    gender varchar(1) comment "性别"
) comment "用户表"*/

-- 2、创建: 基本语法 (约束)
/*语法：
       create table  表名(
            字段1  字段类型  [ 约束 ]  [ comment  字段1注释 ] ,
            字段n  字段类型  [ 约束 ]  [ comment  字段n注释 ]
        ) [ comment  表注释 ] ;
       需求2：创建user用户表，有如下字段和约束：
            id 整数类型(int) 主键自动增长 '编号'
            username 字符串(varchar) 非空 唯一 '用户名'
            name 字符串(varchar) 非空 '姓名'
            age 整数(int) '年龄'
            gender 字符串(char) 默认性别 '男'
*/
/*create table if not exists user(
#     id 整数类型(int) 主键自动增长 '编号'
    id       int primary key  auto_increment comment "编号，数据的唯一标识",
#     username 字符串(varchar) 非空 唯一 '用户名'
    username varchar(20) not null unique comment "用户名",
#     name 字符串(varchar) 非空 '姓名'
    name     varchar(20) not null comment "姓名",
#     age 整数(int) '年龄'
    age      int comment "年龄",
#     gender 字符串(char) 默认性别 '男'
    gender   varchar(1) default '男' comment "性别"
)comment "用户表"*/

-- 3、案例：图形化界面创建表 emp


-- ========== DDL: 查看表结构【了解】 ==========
-- 查看: 当前数据库下的表 语法：show tables;
-- 查看: 查看指定表结构 语法：desc  表名;
-- 查看: 数据库的建表语句 语法：show create table 表名;


-- ========== DDL: 修改表结构【了解】 ==========
create table emp
(
    id          int primary key auto_increment comment '编号，唯一标识',
    username    varchar(20)  not null unique comment '用户名',
    password    varchar(20)  default '123456' comment '密码',
    name        varchar(10)  not null comment '姓名',
    gender      tinyint      not null comment '性别，1：男，2：女',
    phone       char(11)     not null unique  comment '手机号',
    job         int          null comment '职位，1:班主任,2:讲师,3:学工主管,4:教研主管5:咨询师',
    salary      double       null comment '薪资',
    image       varchar(100) null comment '头像',
    entrydate   date         null comment '入职日期',
    create_time datetime     null comment '创建时间',
    update_time datetime     null comment '修改时间(最后操作时间)'
);
/*语法：
    1、添加字段：			alter table 表名  add  字段名  类型(长度) [约束] [comment  注释];
    2、修改字段类型：		alter table 表名 modify  字段名  新数据类型(长度);
    3、修改字段名和字段类型：	alter table 表名 change  旧字段名  新字段名  类型 (长度) [约束] [comment 注释];
    4、删除字段：			alter table 表名 drop  column 字段名;
    5、修改表名： 			alter table 表名 rename to  新表名;  或者	rename table 表名 to  新表名;
*/
/*-- 修改: 为表 emp 添加字段 qq varchar(11)
    alter table emp add qq varchar(11) comment 'qq号';
-- 修改: 修改 emp 字段类型 qq varchar(13)
    alter table emp modify qq varchar(13);
-- 修改: 修改 emp 字段名 qq 为 qq_num varchar(13)
    alter table emp change qq qq_num varchar(13);
-- 修改: 删除 temp 的 qq_num 字段
    alter table emp drop column qq_num;
-- 修改: 将 emp 表名修改为 tb_emp
    alter table emp rename  to tb_tmp;*/
-- ========== DDL: 删除表结构【了解】 ==========
-- 删除: 删除 tb_emp 表 语法：drop table [ if exists ] 表名;
    drop table if exists tb_tmp;