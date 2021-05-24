use gourmet_friends;

create table `user`
(
    `user_id`   varchar(20) not null primary key,
    `user_pw`   varchar(20) not null,
    `user_ph`   bigint      not null,
    `user_nick` varchar(45) not null unique,
    `user_rank` varchar(45) not null,
    `admin`     varchar(30) not null
) ENGINE = InnoDB
  default charset = utf8;


create table `user_addr`
(
    `user_id`     varchar(20)  not null primary key,
                  `user_city`   varchar(30)  not null,
    `user_detail` varchar(100) not null
) ENGINE = InnoDB
  default charset = utf8;


create table `food_friends`
(
    `ff_bno`       bigint primary key auto_increment,
    `user_id`      varchar(20)   not null,
                   `title`        varchar(100)  not null,
    `content`      varchar(3000) not null,
    `reg_date`     datetime      not null,
    `update_date`  datetime,
    `notice`       varchar(3000),
    `ff_reply_cnt` bigint
) ENGINE = InnoDB
  default charset = utf8;


create table `ff_reply`
(
    `ff_rno`     bigint primary key auto_increment,
    `ff_bno`     bigint        not null,
                 `user_id`    varchar(20)   not null,
                 `ff_content` varchar(3000) not null,
    `ff_date`    datetime      not null
) ENGINE = InnoDB
  default charset = utf8;


create table `order_list`
(
    `order_list_no` bigint primary key auto_increment,
    `order_no`      bigint        not null,
                    `user_id`       varchar(20)   not null,
                    `rest_no`       bigint        not null,
                    `order_time`    datetime,
    `pay_time`      datetime,
    `notice`        varchar(3000) not null,
    `plz`           varchar(100)
) ENGINE = InnoDB
  default charset = utf8;


create table `order`
(
    `order_no`    bigint      not null primary key,
    `user_id`     varchar(20) not null,
                  `menu_no`     bigint,
                  `order_cnt`   bigint      not null,
    `order_price` bigint      not null
) ENGINE = InnoDB
  default charset = utf8;


create table `menu`
(
    `menu_no`    bigint auto_increment primary key,
    `rest_no`    bigint not null,
                 `price`      bigint not null,
    `intro`      varchar(1000),
    `food_photo` varchar(1000)
) ENGINE = InnoDB
  default charset = utf8;


create table `restaurant`
(
    `rest_no`    bigint       not null primary key,
    `cate_no`    bigint       not null,
                 `rest_name`  varchar(100) not null,
    `rest_ph`    bigint       not null,
    `rest_star`  bigint       not null,
    `rest_time`  datetime     not null,
    `rest_photo` varchar(1000),
    `rev_cnt`    bigint       not null
) ENGINE = InnoDB
  default charset = utf8;


create table `rest_addr`
(
    `rest_no`     bigint       not null primary key,
                  `rest_city`   varchar(30)  not null,
    `rest_detail` varchar(100) not null
) ENGINE = InnoDB
  default charset = utf8;


create table `category`
(
    `cate_no`   bigint primary key,
    `cate_name` varchar(30) not null
) ENGINE = InnoDB
  default charset = utf8;


create table `review`
(
    `rev_bno`       bigint auto_increment primary key,
    `user_id`       varchar(20) not null,
                    `rest_no`       bigint      not null,
                    `rev_star`      bigint      not null,
    `rev_photo`     varchar(1000),
    `report`        varchar(1000),
    `report_cnt`    bigint      not null,
    `rev_reply_cnt` bigint
) ENGINE = InnoDB
  default charset = utf8;


create table `rev_reply`
(
    `rev_rno`     bigint auto_increment primary key,
    `rev_bno`     bigint,
                  `user_id`     varchar(20)   not null,
                  `rev_content` varchar(1000) not null,
    `rev_date`    datetime      not null
) ENGINE = InnoDB
  default charset = utf8;

alter table food_friends add cate_notice varchar(20) DEFAULT 'GENERAL';

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