/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2020/5/5 21:31:32                            */
/*==============================================================*/
create database pcs;
use pcs;

alter database pcs charset utf8;

drop table if exists button;

drop table if exists dictionary;

drop table if exists dictionary_detail;

drop table if exists menu;

drop table if exists menu_button;

drop table if exists permission;

drop table if exists role;

drop table if exists role_permission;

drop table if exists user;

drop table if exists user_role;

drop table if exists user_verification;

drop table if exists school;

drop table if exists person;

drop table if exists course;

drop table if exists sign_in;

drop table if exists person_course;

drop table if exists parameter;

/*==============================================================*/
/* Table: button                                                */
/*==============================================================*/
create table button
(
   b_id                 int not null auto_increment,
   b_name               char(50),
   icon                 char(100),
   description          varchar(200),
   creator              int,
   create_time          datetime,
   last_modifier        int,
   last_modify_date     datetime,
   primary key (b_id)
);
select * from button;
insert into button values(1,'添加','/icon/add.jpg','添加功能',1,'2020-05-15 16:35:01',1,'2020-05-15 16:35:01');
insert into button values(2,'查找','/icon/select.jpg','查找功能',1,'2020-05-15 16:35:01',1,'2020-05-15 16:35:01');
insert into button values(3,'修改','/icon/modify.jpg','修改功能',1,'2020-05-15 16:35:01',1,'2020-05-15 16:35:01');
insert into button values(4,'删除','/icon/delete.jpg','删除功能',1,'2020-05-15 16:35:01',1,'2020-05-15 16:35:01');

/*==============================================================*/
/* Table: dictionary                                            */
/*==============================================================*/
create table dictionary
(
   d_id                 int not null auto_increment,
   chinese_name         varchar(200),
   english_name         varchar(200),
   primary key (d_id)
);

select * from dictionary;
insert into dictionary values(1,'学籍','schoolroll');
insert into dictionary values(2,'性别','sex');
insert into dictionary values(3,'专业','major');

/*==============================================================*/
/* Table: dictionary_detail                                     */
/*==============================================================*/
create table dictionary_detail
(
   dd_id                int not null auto_increment,
   d_id                 int,
   dd_name               varchar(200),
   is_default           int,
   primary key (dd_id)
);

select * from dictionary_detail;
insert into dictionary_detail values(1,1,'福建',0);
insert into dictionary_detail values(2,1,'上海',1);
insert into dictionary_detail values(3,2,'男',0);
insert into dictionary_detail values(4,2,'女',1);
insert into dictionary_detail values(5,3,'计算机',0);
insert into dictionary_detail values(6,3,'软件工程',1);

/*==============================================================*/
/* Table: menu                                                  */
/*==============================================================*/
create table menu
(
   m_id                 int not null auto_increment,
   parent_id            int,
   menu_name            varchar(16),
   icon                 varchar(16),
   link                 varchar(32),
   sort                 int,
   is_display           boolean,
   is_page              boolean,
   creator              int,
   create_time          datetime,
   last_modifier        int,
   last_modify_date     datetime,
   primary key (m_id)
);
select * from menu;
insert into menu values(1,null,'菜单管理','/icon/menu.jpg','/root',1,true,true,1,'2020-05-15 16:35:01',1,'2020-05-15 16:35:01');
insert into menu values(2,null,'用户管理','/icon/user.jpg','/root',1,true,true,1,'2020-05-15 16:35:01',1,'2020-05-15 16:35:01');
insert into menu values(3,null,'角色管理','/icon/role.jpg','/root',1,true,true,1,'2020-05-15 16:35:01',1,'2020-05-15 16:35:01');
insert into menu values(4,null,'权限管理','/icon/per.jpg','/root',1,true,true,1,'2020-05-15 16:35:01',1,'2020-05-15 16:35:01');


/*==============================================================*/
/* Table: menu_button                                           */
/*==============================================================*/
create table menu_button
(
   mb_id                int not null auto_increment,
   m_id                 int,
   b_id                 int,
   status               int,
   primary key (mb_id)
);
select * from menu_button;
insert into menu_button values(1,1,1,1);
insert into menu_button values(2,2,2,2);
insert into menu_button values(3,3,3,3);
insert into menu_button values(4,4,4,4);

/*==============================================================*/
/* Table: permission                                            */
/*==============================================================*/
create table permission
(
   p_id                 int not null auto_increment,
   p_name               varchar(50),
   description          varchar(200),
   creator              int,
   create_time          datetime,
   last_modifier        int,
   last_modify_date     datetime,
   primary key (p_id)
);
select * from permission;
insert into permission values(1,'用户管理','用户的增删查改',1,'2020-05-15 16:35:01',1,'2020-05-15 16:35:01');
insert into permission values(2,'权限管理','权限的增删查改',1,'2020-05-15 16:35:01',1,'2020-05-15 16:35:01');
insert into permission values(3,'角色管理','角色的增删查改',1,'2020-05-15 16:35:01',1,'2020-05-15 16:35:01');
insert into permission values(4,'菜单管理','菜单的增删查改',1,'2020-05-15 16:35:01',1,'2020-05-15 16:35:01');


/*==============================================================*/
/* Table: role                                                  */
/*==============================================================*/
create table role
(
   r_id                 int not null auto_increment,
   r_name               varchar(50),
   description          varchar(200),
   creator              int,
   create_time          datetime,
   last_modifier        int,
   last_modify_date     datetime,
   primary key (r_id)
);
select * from role;
insert into role values(1,'学生','上课',1001,'2020-05-15 16:35:01',001,'2020-05-15 16:35:01');
insert into role values(2,'教师','教学',002,'2020-05-15 16:35:01',002,'2020-05-15 16:35:01');
insert into role values(3,'管理员','管理系统',002,'2020-05-15 16:35:01',002,'2020-05-15 16:35:01');
insert into role values(4,'班长','管理学生',002,'2020-05-15 16:35:01',002,'2020-05-15 16:35:01');

/*==============================================================*/
/* Table: role_permission                                       */
/*==============================================================*/
create table role_permission
(
   rp_id                int not null auto_increment,
   r_id                 int,
   p_id                 int,
   status               int,
   primary key (rp_id)
);
select * from role_permission;
insert into role_permission values(1,1,1,1);
insert into role_permission values(2,2,2,2);
insert into role_permission values(3,3,3,3);
insert into role_permission values(4,4,4,4);

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   u_id                 int not null auto_increment,
   u_number             varchar(100),
   u_name               varchar(100),
   phone                varchar(100),
   emaile               varchar(100),
   create_date          datetime,
   status               int,
   primary key (u_id)
);
select * from user;
insert into user values(01,'202001','小a','111111','aaa@qq.com','2020-05-15 16:35:01',1);
insert into user values(02,'202002','小b','222222','bb@qq.com','2020-05-15 16:35:01',1);
insert into user values(03,'202003','小c','333333','ccc@qq.com','2020-05-15 16:35:01',1);
insert into user values(04,'202004','小d','444444','ddd@qq.com','2020-05-15 16:35:01',1);


/*==============================================================*/
/* Table: user_role                                             */
/*==============================================================*/
create table user_role
(
   ur_id                int not null auto_increment,
   u_id                 int,
   r_id                 int,
   status               int,
   primary key (ur_id)
);

select * from user_role;
insert into user_role values(001,1,1,1);
insert into user_role values(002,2,2,1);
insert into user_role values(003,3,4,1);
insert into user_role values(004,4,4,1);

/*==============================================================*/
/* Table: user_verification                                     */
/*==============================================================*/
create table user_verification
(
   uv_id                int not null auto_increment,
   u_id                 int,
   login_type           int,
   login_token          varchar(100),
   password_token       varchar(256),
   status               int,
   primary key (uv_id)
);
select * from user_verification;
insert into user_verification values(1,1,1,'202001','9481E0D7A83CB52A',1);
insert into user_verification values(2,1,2,'111111','9481E0D7A83CB52A',1);
insert into user_verification values(3,1,3,'aaa@qq.com','9481E0D7A83CB52A',1);


/*==============================================================*/
/* Table: school                                                */
/*==============================================================*/
create table school
(
   s_id                 int not null auto_increment,
   s_name               varchar(100),
   college              varchar(100),
   major                varchar(100),
   primary key (s_id)
);
select * from school;
insert into school values(1,'福州大学','数计学院','软件工程');
insert into school values(2,'福州大学','数计学院','计算机技术');
insert into school values(3,'福州大学','经济管理学院','会计');
insert into school values(4,'福州大学','经济管理学院','电子商务');
insert into school values(5,'厦门大学','数计学院','软件工程');
insert into school values(6,'厦门大学','数计学院','计算机技术');
insert into school values(7,'厦门大学','经济管理学院','会计');
insert into school values(8,'厦门大学','经济管理学院','电子商务');

/*==============================================================*/
/* Table: person                                                */
/*==============================================================*/
create table person
(
   pe_id                int not null auto_increment,
   u_id                 int,
   s_id                 int,
   pe_number            varchar(100),
   pe_name              varchar(200),
   gender               int(1),
   grade                varchar(100),
   major                varchar(255),
   classes                int(2),
   is_teacher           int(1),
   primary key (pe_id)
);
select * from person;
insert into person values(1,1,1,'123','张三',1,'2019','软件工程',1,0);
insert into person values(2,2,1,'456','李四',1,'2019','软件工程',1,0);
delete from person where pe_id = 2;

/*==============================================================*/
/* Table: course                                                */
/*==============================================================*/
create table course
(
   c_id                 int not null auto_increment,
   c_number             varchar(100),
   c_name               varchar(255),
   description          varchar(255),
   term                 varchar(100),
   date                 int,
   credit             	double,
   daily_weight         double,
   final_weight         double,
   primary key (c_id)
);
select * from course;
insert into course values(1,'111','软件工程','无','2019-0',34,2.5,0.3,0.7);
insert into course values(2,'112','数据库','无','2019-1',34,2.5,0.3,0.7);


/*==============================================================*/
/* Table: sign_in                                               */
/*==============================================================*/
create table sign_in
(
   si_id                int not null auto_increment,
   c_number             varchar(100),
   c_name               varchar(200),
   pe_number            varchar(100),
   pe_name              varchar(200),
   state                int(1),
   date                 datetime,
   position             varchar(10),
   primary key (si_id)
);
select * from sign_in;
insert into sign_in values(1,'123','张三','111','软件工程',1,'2020-05-15 16:35:01','福州大学');
insert into sign_in values(2,'234','李四','112','数据库',1,'2020-05-15 16:35:01','福州大学');


/*==============================================================*/
/* Table: person_course                                         */
/*==============================================================*/
create table person_course
(
   pc_id                 int not null auto_increment,
   pe_id                int,
   c_id                 int,
   value                 int,
   status                 int,
   primary key (pc_id)

);

select * from person_course;
insert into person_course values(1,1,1,0,1);
insert into person_course values(2,1,1,0,1);


/*==============================================================*/
/* Table: parameter                                             */
/*==============================================================*/
create table parameter
(
   pa_id                int not null auto_increment,
   pa_name              varchar(200),
   description          varchar(400),
   value                double,
   primary key (pa_id)
);
select * from parameter;
insert into parameter values(1,'签到经验值','一次签到获取的经验值',1.0);
insert into parameter values(2,'签到有效距离','在指定有效范围内方可签到',50.0);

select pc.*,c.c_name,c.term FROM person_course pc left outer join course c on pc.c_id = c.c_id where pc.pe_id = 1;
        

alter table dictionary_detail add constraint FK_FK_DictDetail_Reference_Dict foreign key (d_id)
      references dictionary (d_id) on delete restrict on update restrict;

alter table menu add constraint FK_FK_Menu_Reference_Menu foreign key (parent_id)
      references menu (m_id) on delete restrict on update restrict;

alter table menu_button add constraint FK_FK_PageButt_Reference_Menu foreign key (m_id)
      references menu (m_id) on delete restrict on update restrict;

alter table menu_button add constraint FK_Reference_10 foreign key (b_id)
      references button (b_id) on delete restrict on update restrict;

alter table role_permission add constraint FK_FK_RolePerm_Reference_Role foreign key (r_id)
      references role (r_id) on delete restrict on update restrict;

alter table role_permission add constraint FK_Reference_9 foreign key (p_id)
      references permission (p_id) on delete restrict on update restrict;

alter table user_role add constraint FK_FK_UserRole_Reference_Role foreign key (r_id)
      references role (r_id) on delete restrict on update restrict;

alter table user_role add constraint FK_FK_UserRole_Reference_User foreign key (u_id)
      references user (u_id) on delete restrict on update restrict;

alter table user_verification add constraint FK_FK_UserVerfication_Reference_User foreign key (u_id)
      references user (u_id) on delete restrict on update restrict;

alter table person add constraint FK_FK_Person_Reference_User foreign key (u_id)
      references user (u_id) on delete restrict on update restrict;

alter table person add constraint FK_FK_Person_Reference_School foreign key (s_id)
      references school (s_id) on delete restrict on update restrict;

alter table person_course add constraint FK_FK_Person_Course_Reference_Person foreign key (pe_id)
      references person (pe_id) on delete restrict on update restrict;

alter table person_course add constraint FK_FK_Person_Course_Reference_Course foreign key (c_id)
      references course (c_id) on delete restrict on update restrict;
