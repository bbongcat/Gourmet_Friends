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
    `user_id`     varchar(20)  not null primary key, #fk
                  `user_city`   varchar(30)  not null,
    `user_detail` varchar(100) not null
) ENGINE = InnoDB
  default charset = utf8;


create table `food_friends`
(
    `ff_bno`       bigint primary key auto_increment,
    `user_id`      varchar(20)   not null, #fk
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
    `ff_bno`     bigint        not null, #fk
                 `user_id`    varchar(20)   not null, #fk
                 `ff_content` varchar(3000) not null,
    `ff_date`    datetime      not null
) ENGINE = InnoDB
  default charset = utf8;


create table `order_list`
(
    `order_list_no` bigint primary key auto_increment,
    `order_no`      bigint        not null, #fk
                    `user_id`       varchar(20)   not null, #fk
                    `rest_no`       bigint        not null, #fk
                    `order_time`    datetime,
    `pay_time`      datetime,
    `notice`        varchar(3000) not null,
    `plz`           varchar(100)
) ENGINE = InnoDB
  default charset = utf8;


create table `order`
(
    `order_no`    bigint      not null primary key,
    `user_id`     varchar(20) not null,  #fk
                  `menu_no`     bigint, #fk
                  `order_cnt`   bigint      not null,
    `order_price` bigint      not null
) ENGINE = InnoDB
  default charset = utf8;


create table `menu`
(
    `menu_no`    bigint auto_increment primary key,
    `rest_no`    bigint not null, #fk
                 `price`      bigint not null,
    `intro`      varchar(1000),
    `food_photo` varchar(1000)
) ENGINE = InnoDB
  default charset = utf8;


create table `restaurant`
(
    `rest_no`    bigint       not null primary key,
    `cate_no`    bigint       not null, #fk
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
    `rest_no`     bigint       not null primary key, #fk
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
    `user_id`       varchar(20) not null, #fk
                    `rest_no`       bigint      not null, #fk
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
    `rev_bno`     bigint,                 #fk
                  `user_id`     varchar(20)   not null, #fk
                  `rev_content` varchar(1000) not null,
    `rev_date`    datetime      not null
) ENGINE = InnoDB
  default charset = utf8;

alter table food_friends add cate_notice varchar(20) DEFAULT 'GENERAL';
