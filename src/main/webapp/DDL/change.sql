#cate_notice
추가
alter table food_friends
    add cate_notice varchar(20) DEFAULT 'GENERAL';

#기존
fodd_friends테이블 notice 삭제
#alter table food_friends drop
notice;
#기존
review 테이블 report 삭제
#
alter table review drop report;

#reg_date
& update_date datetime dafault 수정
alter table food_friends modify reg_date datetime DEFAULT NOW();
alter table food_friends modify update_date datetime DEFAULT NOW();
#ff_reply
- ff_date datetime 수정
alter table ff_reply modify ff_date datetime DEFAULT NOW();
#review
테이블에 rev_content 컬럼 추가
alter table review
    add rev_content VARCHAR(150) NOT NULL;
#rev_reply
테이블 rev_content 컬럼 이름 변경
#alter table rev_reply change rev_content rev_reply VARCHAR(1000) NOT NULL;
#review
테이블 report_cnt NOT NULL 제거
alter table review modify report_cnt bigint;


#photo_upload
테이블 생성
create table `photo_upload`
(
    `rev_photo` VARCHAR(150) primary key,
    `reg_date`  datetime DEFAULT now(),
    `rev_bno`   bigint NOT NULL #fk
) ENGINE = InnoDB
  default charset = utf8;

#report
테이블 생성
create table report
(
    report_no   bigint primary key,
    rev_bno     bigint      NOT NULL,
    user_id     VARCHAR(20) NOT NULL,
    report_content VARCHAR(1000) NOT NULL,
    report_date datetime DEFAULT now()
)

CREATE SEQUENCE SEQ_REVIEW;
CREATE SEQUENCE SEQ_REV_REPLY;
CREATE SEQUENCE SEQ_REPORT;
CREATE SEQUENCE SEQ_FOOD_FRIENDS;
CREATE SEQUENCE SEQ_FF_REPLY;
CREATE SEQUENCE SEQ_RESTAURANT;
CREATE SEQUENCE SEQ_MENU;
CREATE SEQUENCE SEQ_CATEGORY;

#user
테이블 다시 생성
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

#restaurant
테이블 다시 생성
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

create table CATEGORY
(
    tier        bigint,
    cate_code   varchar(100) primary key,
    cate_name   varchar(100),
    cate_parent varchar(100)
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

#카테고리
완성
insert into CATEGORY(tier, cate_Name, cate_code) values (1, '음식점업', '100000');
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


alter table RESTAURANT add(rest_thumb_img varchar(200));
alter table RESTAURANT add(rest_img varchar(200));

alter table MENU add(menu_thumb_img varchar(200));
alter table MENU add(menu_img varchar(200));

alter table REVIEW add(review_thumb_img varchar(200));
alter table REVIEW add(review_img varchar(200));


