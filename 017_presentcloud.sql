/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2020/4/7 11:22:49                            */
/*==============================================================*/
create database pcs;

use pcs;

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

/*==============================================================*/
/* Table: button                                                */
/*==============================================================*/
create table button
(
   b_id                 int not null,
   b_name               char(50),
   icon                 char(100),
   description          varchar(200),
   creator              int,
   create_time          datetime,
   last_modifier        int,
   last_modify_date     datetime,
   primary key (b_id)
);

/*==============================================================*/
/* Table: dictionary                                            */
/*==============================================================*/
create table dictionary
(
   d_id                 int not null,
   chinese_name         int,
   english_name         int,
   primary key (d_id)
);

/*==============================================================*/
/* Table: dictionary_detail                                     */
/*==============================================================*/
create table dictionary_detail
(
   dd_id                   int not null,
   d_id              int,
   english_tag          varchar(16),
   key_value            int,
   is_default           boolean,
   value                varchar(16),
   sort                 int,
   primary key (id)
);

/*==============================================================*/
/* Table: menu                                                  */
/*==============================================================*/
create table menu
(
   m_id                 int not null,
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

/*==============================================================*/
/* Table: menu_button                                           */
/*==============================================================*/
create table menu_button
(
   mb_id                int not null,
   m_id                 int,
   b_id                 int,
   status               int,
   primary key (mb_id)
);

/*==============================================================*/
/* Table: permission                                            */
/*==============================================================*/
create table permission
(
   p_id                 int not null,
   p_name               varchar(50),
   description          varchar(200),
   creator              int,
   create_time          datetime,
   last_modifier        int,
   last_modify_date     datetime,
   primary key (p_id)
);

/*==============================================================*/
/* Table: role                                                  */
/*==============================================================*/
create table role
(
   r_id                 int not null,
   r_name               varchar(50),
   description          varchar(200),
   creator              int,
   create_time          datetime,
   last_modifier        int,
   last_modify_date     datetime,
   primary key (r_id)
);

/*==============================================================*/
/* Table: role_permission                                       */
/*==============================================================*/
create table role_permission
(
   rp_id                int not null,
   r_id                 int,
   p_id                 int,
   status               int,
   primary key (rp_id)
);

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   u_id                 int not null,
   u_number             int,
   u_name               varchar(50),
   phone                int,
   emaile               varchar(32),
   create_date          datetime,
   status               int,
   primary key (u_id)
);

/*==============================================================*/
/* Table: user_role                                             */
/*==============================================================*/
create table user_role
(
   ur_id                int not null,
   u_id                 int,
   r_id                 int,
   status               int,
   primary key (ur_id)
);

/*==============================================================*/
/* Table: user_verification                                     */
/*==============================================================*/
create table user_verification
(
   uv_id                int not null,
   u_id                 int,
   login_type           int,
   is_third             boolean,
   login_token          varchar(16),
   password_token       varchar(16),
   status               int,
   primary key (uv_id)
);

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

