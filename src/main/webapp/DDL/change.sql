#cate_notice 추가
alter table food_friends add cate_notice varchar(20) DEFAULT 'GENERAL';

#기존 fodd_friends테이블 notice 삭제
#alter table food_friends drop notice;
#기존 review 테이블 report 삭제
# alter table review drop report;

#reg_date & update_date datetime dafault 수정
alter table food_friends modify reg_date datetime DEFAULT NOW();
alter table food_friends modify update_date datetime DEFAULT NOW();
#ff_reply - ff_date datetime 수정
alter table ff_reply modify ff_date datetime DEFAULT NOW();
#review 테이블에 rev_content 컬럼 추가
alter table review add rev_content VARCHAR(150) NOT NULL;
#rev_reply 테이블 rev_content 컬럼 이름 변경
#alter table rev_reply change rev_content rev_reply VARCHAR(1000) NOT NULL;
#review 테이블 report_cnt NOT NULL 제거
alter table review modify report_cnt bigint;


#photo_upload 테이블 생성
create table `photo_upload`
(
    `rev_photo` VARCHAR(150) primary key,
    `reg_date` datetime DEFAULT now(),
    `rev_bno` bigint NOT NULL #fk
) ENGINE = InnoDB
  default charset = utf8;

#report 테이블 생성
create table `report`
(
    `report_no` bigint auto_increment primary key ,
    `rev_bno` bigint NOT NULL, #fk
                `user_id` VARCHAR(20) NOT NULL , #fk
                `report_content` VARCHAR(1000) NOT NULL,
    `report_date` datetime DEFAULT now()
) ENGINE = InnoDB
  default charset = utf8;

CREATE SEQUENCE SEQ_REVIEW;
CREATE SEQUENCE SEQ_REV_REPLY;
CREATE SEQUENCE SEQ_REPORT;
CREATE SEQUENCE SEQ_FOOD_FRIENDS;
CREATE SEQUENCE SEQ_FF_REPLY;
CREATE SEQUENCE SEQ_RESTAURANT;


drop table USER_ADDR;
drop table USER;

#user 테이블 다시 생성
CREATE TABLE USER(
                     user_id varchar(100) PRIMARY KEY ,
                     user_pw VARCHAR(100) ,
                     user_name VARCHAR(100) ,
                     user_birth VARCHAR(100) ,
                     user_email VARCHAR(100) ,
                     user_phone VARCHAR(100),
                     user_gender VARCHAR(100),
                     user_oaddress VARCHAR(100),
                     user_address varchar(100),
                     user_detailaddress varchar(200),
                     user_rank varchar(100) default 'COMMON',
                     user_auth varchar(100) default 'BRONZE'
);

#restaurant 테이블 다시 생성
create table RESTAURANT
(
    rest_no    int primary key,
    cate_no    int ,
    rest_name  varchar(100) ,
    rest_ph    varchar(100) ,
    rest_star  int ,
    rest_time  datetime ,
    rest_photo varchar(1000),
    rev_cnt    int,
    rest_oaddress varchar(100),
    rest_address VARCHAR(100),
    rest_detailaddress varchar(100)
);