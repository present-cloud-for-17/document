/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2020/3/27 10:05:18                           */
/*==============================================================*/


drop table if exists tb_call_theroll;

drop table if exists tb_course;

drop table if exists tb_course_time;

drop table if exists tb_course_time_rel;

drop table if exists tb_dict;

drop table if exists tb_mark;

drop table if exists tb_menu;

drop table if exists tb_permi;

drop table if exists tb_question;

drop table if exists tb_role;

drop table if exists tb_role_permi_rel;

drop table if exists tb_school_info;

drop table if exists tb_teach_stu;

drop table if exists tb_user;

drop table if exists tb_user_course_rel;

/*==============================================================*/
/* Table: tb_call_theroll                                       */
/*==============================================================*/
create table tb_call_theroll
(
   call_theroll_id      int(10) not null comment '记录标识',
   course_id            int(10) comment '课程ID',
   course_name          varchar(32) comment '课程名称',
   user_id              int(10) comment '用户ID',
   stu_no               varchar(100) comment '学号',
   stu_name             varchar(50) comment '学生姓名',
   call_state           int(1) comment '签到状态',
   call_date            datetime comment '签到日期',
   call_position        varchar(10) comment '签到位置',
   primary key (call_theroll_id)
);

alter table tb_call_theroll comment '签到表';

/*==============================================================*/
/* Table: tb_course                                             */
/*==============================================================*/
create table tb_course
(
   course_id            int(10) not null comment '记录标识',
   course_name          varchar(100) comment '课程名称',
   description          varchar(500) comment '课程描述',
   term                 varchar(10) comment '学期',
   class_date           varchar(10) comment '学周',
   class_order          int comment '学分',
   daily_weight         double comment '日常比重',
   final_weight         double,
   picket_line          int,
   creat_id             int(10),
   creat_date           datetime,
   primary key (course_id)
);

alter table tb_course comment '课程表';

/*==============================================================*/
/* Table: tb_course_time                                        */
/*==============================================================*/
create table tb_course_time
(
   course_time_id       int(10) not null comment '记录标识',
   week                 int(1) comment '星期(0-6)',
   start_period         int(2) comment '节次',
   end_period           int(2),
   class_location       varchar(100) comment '上课地点',
   shape                varchar(30) comment '教室布局',
   is_active            int,
   primary key (course_time_id)
);

alter table tb_course_time comment '课程时间表';

/*==============================================================*/
/* Table: tb_course_time_rel                                    */
/*==============================================================*/
create table tb_course_time_rel
(
   couse_time_rel_id    int(10) not null comment '记录标识',
   course_id            int(10) comment '课程ID',
   course_time_id       int(10) comment '课程时间ID',
   primary key (couse_time_rel_id)
);

alter table tb_course_time_rel comment '课程时间关联表';

/*==============================================================*/
/* Table: tb_dict                                               */
/*==============================================================*/
create table tb_dict
(
   dict_id              int(10) not null comment '记录标识',
   dict_name            varchar(20) default NULL comment '字典名称',
   dict_value           varchar(100) default NULL comment '字典值',
   dict_category        varchar(20) default NULL comment '字典类别',
   parent_id            int(10) default NULL comment '父类字典id',
   description          varchar(500) default NULL comment '字典描述',
   creat_id             int(10),
   create_time          datetime default NULL comment '创建时间',
   up_id                int(10),
   up_time              datetime,
   primary key (dict_id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';

alter table tb_dict comment '字典表';

/*==============================================================*/
/* Table: tb_mark                                               */
/*==============================================================*/
create table tb_mark
(
   mark_id              int(10) not null comment '记录标识',
   course_id            int(10) comment '课程ID',
   user_id              int(10) not null comment '用户ID',
   daily_score          float comment '平时分',
   final_score          float comment '期末分',
   exam_score           float,
   creat_id             int(10),
   datetime             datetime,
   up_id                int(10),
   up_date              datetime,
   primary key (mark_id)
);

alter table tb_mark comment '课程成绩表';

/*==============================================================*/
/* Table: tb_menu                                               */
/*==============================================================*/
create table tb_menu
(
   menu_id              int(10) not null comment '记录标识',
   parent_id            int(10) default NULL comment '父类菜单id',
   menu_name            varchar(100) default NULL comment '菜单名称',
   level                int(11) default NULL comment '菜单级别',
   menu_url             varchar(255) default NULL comment '菜单地址',
   is_leaf              int(1) default NULL comment '是否叶节点（0：是；1：否）',
   css_class            varchar(100) comment '样式',
   menu_icon_path       varchar(100) default NULL comment '菜单图标路径',
   creat_id             int(10),
   create_time          datetime default NULL comment '创建时间',
   up_id                int(10),
   up_time              datetime,
   is_visable           int(1) default NULL comment '是否有效（0：是；1否）',
   primary key (menu_id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

alter table tb_menu comment '菜单表';

/*==============================================================*/
/* Table: tb_permi                                              */
/*==============================================================*/
create table tb_permi
(
   permi_id             int(10) not null comment '记录标识',
   permi_name           varchar(100) default NULL comment '权限名称',
   description          varchar(200) default NULL comment '权限描述',
   req_url              varchar(200) default NULL comment '请求地址',
   is_page              int(1) comment '是否页面（0：是；1：否）',
   is_menu              int(1) default NULL comment '是否菜单（是：0；否：1）',
   create_time          datetime default NULL comment '创建时间',
   user_id              int(10) default NULL comment '创建者用户id',
   up_id                int(10),
   up_time              datetime,
   permi_type           int(1) default 0 comment '是否可访问（0：可访问；1：拒绝访问）',
   primary key (permi_id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限表';

alter table tb_permi comment '权限表';

/*==============================================================*/
/* Table: tb_question                                           */
/*==============================================================*/
create table tb_question
(
   question_id          int(10) not null comment '记录标识',
   course_id            int(10) comment '课程ID',
   course_name          varchar(100) comment '课程名称',
   user_id              int(10) comment '用户ID',
   question_date        datetime comment '提问日期',
   score                double comment '分数',
   primary key (question_id)
);

alter table tb_question comment '任务表';

/*==============================================================*/
/* Table: tb_role                                               */
/*==============================================================*/
create table tb_role
(
   role_id              int(10) not null comment '记录标识',
   role_name            varchar(100) not null comment '角色名称',
   create_time          datetime default NULL comment '创建时间',
   description          varchar(500) comment '角色描述',
   primary key (role_id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

alter table tb_role comment '角色表';

/*==============================================================*/
/* Table: tb_role_permi_rel                                     */
/*==============================================================*/
create table tb_role_permi_rel
(
   role_permi_rel_id    int(10) not null comment '记录标识',
   role_id              int(10) default NULL comment '角色id',
   permi_id             int(10) default NULL comment '权限id',
   primary key (role_permi_rel_id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限表';

alter table tb_role_permi_rel comment '角色权限表';

/*==============================================================*/
/* Table: tb_school_info                                        */
/*==============================================================*/
create table tb_school_info
(
   school_info_id       int(10) not null,
   school               varchar(100) not null comment '学校',
   college              varchar(100) not null comment '学院',
   department           varchar(100) comment '系别',
   primary key (school_info_id)
);

alter table tb_school_info comment '学校表';

/*==============================================================*/
/* Table: tb_teach_stu                                          */
/*==============================================================*/
create table tb_teach_stu
(
   teach_stu_id         int(10) not null comment '记录标识',
   no                   varchar(20) comment '学号',
   name                 varchar(200) comment '姓名',
   gender               int(1) comment '性别',
   birthday             datetime comment '生日',
   grade                varchar(10) comment '年级',
   major                varchar(255) comment '专业',
   class_no             int(2) comment '班级',
   is_teacher           int(1) comment '是否教师（0：是；1：否）',
   user_id              int(10) comment '用户ID',
   school_info_id       int(10),
   primary key (teach_stu_id)
);

alter table tb_teach_stu comment '教师学生表';

/*==============================================================*/
/* Table: tb_user                                               */
/*==============================================================*/
create table tb_user
(
   user_id              int(10) not null comment '记录标识',
   user_no              varchar(100) not null default NULL comment '用户编号',
   user_name            varchar(100) not null comment '用户名',
   role_id              int(10),
   pwd                  varchar(100) not null comment '密码',
   phone                varchar(11) default NULL comment '手机号码',
   email                varchar(100) default NULL comment '电子邮箱',
   create_time          datetime default NULL comment '创建时间',
   login_time           datetime default NULL comment '登陆时间',
   last_login_time      datetime default NULL comment '上次登陆时间',
   count                int(10) default NULL comment '登陆次数',
   login_type           int(2) comment '登陆方式',
   status               int(1) comment '用户状态',
   primary key (user_id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

alter table tb_user comment '用户表';

/*==============================================================*/
/* Table: tb_user_course_rel                                    */
/*==============================================================*/
create table tb_user_course_rel
(
   user_course_rel_id   int(10) not null comment '记录标识',
   user_id              int(10) comment '用户ID',
   course_id            int(10) comment '课程ID',
   course_time_id       int(10),
   course_class_no      int(2) comment '课程班级',
   primary key (user_course_rel_id)
);

alter table tb_user_course_rel comment '用户课程表';

alter table tb_call_theroll add constraint FK_Reference_13 foreign key (course_id)
      references tb_course (course_id) on delete restrict on update restrict;

alter table tb_call_theroll add constraint FK_Reference_14 foreign key (user_id)
      references tb_user (user_id) on delete restrict on update restrict;

alter table tb_course_time_rel add constraint FK_Reference_10 foreign key (course_time_id)
      references tb_course_time (course_time_id) on delete restrict on update restrict;

alter table tb_course_time_rel add constraint FK_Reference_9 foreign key (course_id)
      references tb_course (course_id) on delete restrict on update restrict;

alter table tb_mark add constraint FK_Reference_17 foreign key (course_id)
      references tb_course (course_id) on delete restrict on update restrict;

alter table tb_mark add constraint FK_Reference_18 foreign key (user_id)
      references tb_user (user_id) on delete restrict on update restrict;

alter table tb_menu add constraint FK_Reference_21 foreign key (parent_id)
      references tb_menu (menu_id) on delete restrict on update restrict;

alter table tb_question add constraint FK_Reference_15 foreign key (course_id)
      references tb_course (course_id) on delete restrict on update restrict;

alter table tb_question add constraint FK_Reference_16 foreign key (user_id)
      references tb_user (user_id) on delete restrict on update restrict;

alter table tb_role_permi_rel add constraint FK_Reference_5 foreign key (permi_id)
      references tb_permi (permi_id) on delete restrict on update restrict;

alter table tb_role_permi_rel add constraint FK_Reference_6 foreign key (role_id)
      references tb_role (role_id) on delete restrict on update restrict;

alter table tb_teach_stu add constraint FK_Reference_11 foreign key (user_id)
      references tb_user (user_id) on delete restrict on update restrict;

alter table tb_teach_stu add constraint FK_Reference_19 foreign key (school_info_id)
      references tb_school_info (school_info_id) on delete restrict on update restrict;

alter table tb_user add constraint FK_Reference_22 foreign key (role_id)
      references tb_role (role_id) on delete restrict on update restrict;

alter table tb_user_course_rel add constraint FK_Reference_20 foreign key (course_time_id)
      references tb_course_time (course_time_id) on delete restrict on update restrict;

alter table tb_user_course_rel add constraint FK_Reference_7 foreign key (course_id)
      references tb_course (course_id) on delete restrict on update restrict;

alter table tb_user_course_rel add constraint FK_Reference_8 foreign key (user_id)
      references tb_user (user_id) on delete restrict on update restrict;

