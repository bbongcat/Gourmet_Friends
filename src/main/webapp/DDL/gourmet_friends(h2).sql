alter table food_friends alter column reg_date datetime DEFAULT NOW();
alter table food_friends alter column update_date datetime DEFAULT NOW();


alter table ff_reply alter column ff_date datetime DEFAULT NOW();

alter table food_friends
    add cate_notice varchar(20) DEFAULT 'GENERAL';

alter table review alter column report_cnt bigint;


-- use gourmet_friends;

create table `food_friends`
(
    `ff_bno`       bigint primary key,
    `user_id`      varchar(20)   not null,
    `title`        varchar(100)  not null,
    `content`      varchar(3000) not null,
    `reg_date`     datetime      not null,
    `update_date`  datetime,
    `ff_reply_cnt` bigint
);

create table `ff_reply`
(
    `ff_rno`     bigint primary key,
    `ff_bno`     bigint        not null,
    `user_id`    varchar(20)   not null,
    `ff_content` varchar(3000) not null,
    `ff_date`    datetime      not null
);

create table `review`
(
    `rev_bno`       bigint primary key,
    `user_id`       varchar(20) not null,
    `rest_no`       bigint      not null,
    `rev_star`      bigint      not null,
    `report_cnt`    bigint      not null,
    `rev_reply_cnt` bigint
);

create table `rev_reply`
(
    `rev_rno`     bigint primary key,
    `rev_bno`     bigint,
    `user_id`     varchar(20)   not null,
    `rev_content` varchar(1000) not null,
    `rev_date`    datetime      not null
);



create table MENU
(
    menu_no        bigint primary key,
    menu_name      varchar(100),
    rest_no        bigint,
    menu_intro     text,
    menu_price     bigint,
    menu_img       varchar(200),
    menu_thumb_img varchar(200)
);

-- #restaurant 테이블 다시 생성
create table RESTAURANT
(
    rest_no            bigint primary key,
    cate_code          varchar(100),
    rest_name          varchar(100),
    rest_ph            varchar(100),
    rest_star          bigint,
    rest_time          varchar(100),
    rev_cnt            bigint,
    rest_oaddress      varchar(100),
    rest_address       VARCHAR(100),
    rest_detailaddress varchar(100),
    rest_img           varchar(200),
    rest_thumb_img     varchar(200)
);


-- user 테이블 다시 생성
CREATE TABLE USER
(
    user_id            varchar(100) PRIMARY KEY,
    user_pw            VARCHAR(100),
    user_name          VARCHAR(100),
    user_birth         VARCHAR(100),
    user_email         VARCHAR(100),
    user_phone         VARCHAR(100),
    user_gender        VARCHAR(100),
    user_oaddress      VARCHAR(100),
    user_address       varchar(100),
    user_detailaddress varchar(200),
    user_auth          varchar(100) default 'COMMON',
    user_rank          varchar(100) default 'BRONZE'
);

create table CATEGORY
(
    tier        bigint,
    cate_code   varchar(100) primary key,
    cate_name   varchar(100),
    cate_parent varchar(100)
);

CREATE SEQUENCE SEQ_REVIEW;
CREATE SEQUENCE SEQ_REV_REPLY;
CREATE SEQUENCE SEQ_REPORT;
CREATE SEQUENCE SEQ_FOOD_FRIENDS;
CREATE SEQUENCE SEQ_FF_REPLY;
CREATE SEQUENCE SEQ_RESTAURANT;
CREATE SEQUENCE SEQ_MENU;
CREATE SEQUENCE SEQ_CATEGORY;


-- #report
-- #테이블 생성
create table report
(
    report_no      bigint primary key,
    rev_bno        bigint        NOT NULL,
    user_id        VARCHAR(20)   NOT NULL,
    report_content VARCHAR(1000) NOT NULL,
    report_date    datetime DEFAULT now()
);

alter table review
    add (review_thumb_img varchar(200));
alter table review
    add (review_img varchar(200));

-- #카테고리
-- #완성
insert into CATEGORY(tier, cate_Name, cate_code)
values (1, '음식점업', '100000');
insert into CATEGORY(tier, cate_Name, cate_code, cate_parent)
values (2, '일반 음식점', '101000', '100000');
insert into CATEGORY(tier, cate_Name, cate_code, cate_parent)
values (3, '한식', '101001', '101000');
insert into CATEGORY(tier, cate_Name, cate_code, cate_parent)
values (3, '중식', '101002', '101000');
insert into CATEGORY(tier, cate_Name, cate_code, cate_parent)
values (3, '일식', '101003', '101000');
insert into CATEGORY(tier, cate_Name, cate_code, cate_parent)
values (3, '양식', '101004', '101000');
insert into CATEGORY(tier, cate_Name, cate_code, cate_parent)
values (3, '기타 외국식', '101005', '101000');

insert into CATEGORY(tier, cate_Name, cate_code, cate_parent)
values (2, '기타 음식점', '102000', '100000');
insert into CATEGORY(tier, cate_Name, cate_code, cate_parent)
values (3, '제과점', '102001', '102000');
insert into CATEGORY(tier, cate_Name, cate_code, cate_parent)
values (3, '피자,햄버거,샌드위치', '102002', '102000');
insert into CATEGORY(tier, cate_Name, cate_code, cate_parent)
values (3, '치킨', '102003', '102000');
insert into CATEGORY(tier, cate_Name, cate_code, cate_parent)
values (3, '분식', '102004', '102000');
insert into CATEGORY(tier, cate_Name, cate_code, cate_parent)
values (3, '그외 기타', '102005', '102000');

insert into CATEGORY(tier, cate_Name, cate_code)
values (1, '주점 및 비알콜음료점업', '200000');
insert into CATEGORY(tier, cate_Name, cate_code, cate_parent)
values (2, '주점', '201000', '200000');
insert into CATEGORY(tier, cate_Name, cate_code, cate_parent)
values (3, '일반유흥', '201001', '201000');
insert into CATEGORY(tier, cate_Name, cate_code, cate_parent)
values (3, '무도유흥', '201002', '201000');
insert into CATEGORY(tier, cate_Name, cate_code, cate_parent)
values (3, '기타유흥', '201003', '201000');

insert into CATEGORY(tier, cate_Name, cate_code, cate_parent)
values (2, '비알콜음료점업', '202000', '200000');
insert into CATEGORY(tier, cate_Name, cate_code, cate_parent)
values (3, '카페', '202001', '202000');