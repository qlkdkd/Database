![image](https://github.com/qlkdkd/Database/assets/71871927/46dabcfd-eabc-4856-b812-83c121bf6de8)
```sql
create table 고객(
	고객아이디 varchar(20) not null,
    고객이름 varchar(10) not null,
	나이 int,
    등급 varchar(20) not null,
    직업 varchar(20),
    적립금 int default 0,
    primary key(고객아이디)
)
```

![image](https://github.com/qlkdkd/Database/assets/71871927/5ec69339-1d8b-4e1d-8153-c20e6bba1038)
```sql
#7-2
create table 제품(
	제품번호 char(3) not null,
    제품명 varchar(20),
    재고량 int,
    단가 int,
    제조업체 varchar(20),
    primary key(제품번호),
    check(재고량>=0 and 재고량<=10000)
);
```

![image](https://github.com/qlkdkd/Database/assets/71871927/b5fc41f6-b825-4093-9609-d57d7e7fd46f)
```sql
#7-3
create table 주문(
	주문번호 char(3) not null,
    주문고객 varchar(20),
    주문제품 char(3),
    수량 int,
    배송지 varchar(30),
    주문일자 date,
    primary key(주문번호),
    foreign key(주문고객) references 고객(고객아이디),
    foreign key(주문제품) references 제품(제품번호)
);
```

![image](https://github.com/qlkdkd/Database/assets/71871927/99ba988c-fd50-46f5-aa0d-fd73e3465bed)
```sql
#7-4
create table 배송업체(
	업체번호 char(3),
    업체명 varchar(20),
    주소 varchar(100),
    전화번호 varchar(20),
    primary key(업체번호)
);
```

![image](https://github.com/qlkdkd/Database/assets/71871927/face469e-6358-4ab5-a0ac-cea74e5105cb)
```sql
alter table 고객 add 가입날짜 date;
```

![image](https://github.com/qlkdkd/Database/assets/71871927/9408f6f2-a727-440b-9168-7f5501cb37f1)
```sql
alter table 고객 drop column 가입날짜;
```

![image](https://github.com/qlkdkd/Database/assets/71871927/0a94cee7-3b32-4c37-8928-a169844e2ae4)
```sql
alter table 고객 add constraint chk_age check(나이>=20);
```

![image](https://github.com/qlkdkd/Database/assets/71871927/35f9f63f-cc53-4dc1-8daa-fdaecb24667f)
```sql
alter table 고객 drop constraint chk_age
```

![image](https://github.com/qlkdkd/Database/assets/71871927/b657aa26-6995-40b3-b5d2-13a1f0efcaac)
```sql
drop table 배송업체;
```

![image](https://github.com/qlkdkd/Database/assets/71871927/fd1f35ad-9bf5-492e-97f2-22c9fec910a8)
```sql
insert
into 고객(고객아이디, 고객이름, 나이, 등급, 직업, 적립금)
values ('strawberry', '최유경', 30, 'vip', '공무원', 100);

select * from 고객;
```

![image](https://github.com/qlkdkd/Database/assets/71871927/7a9536b9-eb26-4b8b-9fcf-5435b6645aa9)
```sql
insert
into 고객(고객아이디, 고객이름, 나이, 등급, 적립금)
values('tomato', '정은심', 36, 'gold', 4000);

select * from 고객;
```

![image](https://github.com/qlkdkd/Database/assets/71871927/310351d8-8615-4032-a2f0-4e5105a026a9)
```sql
select 고객아이디, 고객이름, 등급
from 고객;
```

![image](https://github.com/qlkdkd/Database/assets/71871927/be7f99de-0963-4835-85fe-4f26842c8820)
```sql
select 고객아이디, 고객이름, 나이, 등급, 직업, 적립금
from 고객;
```

![image](https://github.com/qlkdkd/Database/assets/71871927/5318376a-f345-41c5-824c-d61558970819)
```sql
select * from 고객;
```

![image](https://github.com/qlkdkd/Database/assets/71871927/76dfbe64-787d-40af-8719-499602a8c57c)
```sql
select 제조업체 from 제품;
```

![image](https://github.com/qlkdkd/Database/assets/71871927/cd4c1498-881b-4a5a-ad5a-3e18bec6a813)
```sql
select all 제조업체
from 제품;
```

![image](https://github.com/qlkdkd/Database/assets/71871927/344d403d-34f5-4de2-8405-a935b2e927c0)
```sql
select distinct 제조업체
from 제품;
```

![image](https://github.com/qlkdkd/Database/assets/71871927/59ccd98f-fc58-4b3b-8faf-12b9f1b95288)
```sql
select 제품명, 단가 as 가격
from 제품;
```

![image](https://github.com/qlkdkd/Database/assets/71871927/fbc50e0b-616a-49ce-85b0-ad967eae599f)
```sql
select 제품명, 단가+500 as "조정단가"
from 제품
```

![image](https://github.com/qlkdkd/Database/assets/71871927/d01fd929-d2af-41f7-a7c8-e78824b3a85f)
```sql
select 제품명, 재고량, 단가
from 제품
where 제조업체='한빛제과'
```

![image](https://github.com/qlkdkd/Database/assets/71871927/9700bc2d-022d-451b-a18a-ad26980447ff)
```sql
select 주문제품, 수량, 주문일자
from 주문
where 주문고객='apple' and 수량>=15;
```

![image](https://github.com/qlkdkd/Database/assets/71871927/771fbfd9-4131-4d2c-8101-5583af9e7dcc)
```sql
select 주문제품, 수량, 주문일자, 주문고객
from 주문
where 주문고객='apple' or 수량>=15;
```

![image](https://github.com/qlkdkd/Database/assets/71871927/4c2b85e2-222f-4a5d-a0ea-3f4a566f98e1)
```sql
select 제품명, 단가, 제조업체
from 제품
where 단가>=2000 and 단가<=3000
```

![image](https://github.com/qlkdkd/Database/assets/71871927/cd585bf5-015d-41d2-9e82-b19607f44dee)
```sql
select 고객이름, 나이, 등급, 적립금
from 고객
where 고객이름 like '김%'
```

![image](https://github.com/qlkdkd/Database/assets/71871927/fefdb552-d1ac-4830-8cbd-0777b44364ac)
```sql
select 고객아이디, 고객이름, 등급
from 고객
where 고객아이디 like '_____';
```

![image](https://github.com/qlkdkd/Database/assets/71871927/8a340a88-a699-4f6c-b5eb-c49f60903451)
```sql
select 고객이름
from 고객
where 나이 is null;
```

![image](https://github.com/qlkdkd/Database/assets/71871927/bc2c2fe7-6f90-4cbf-8627-264f1eb458a4)
```sql
select 고객이름
from 고객
where 나이 is null;
```

![image](https://github.com/qlkdkd/Database/assets/71871927/74fd48a5-057d-4f58-a4b0-a14946fd7395)
```sql
select 고객이름, 등급, 나이
from 고객
order by 나이 desc;
```

![image](https://github.com/qlkdkd/Database/assets/71871927/affbce68-fc1f-4868-8cd6-3e55bdff446b)
```sql
select 주문고객, 주문제품, 수량, 주문일자
from 주문
where 수량>10
order by 주문제품 asc, 수량 desc
```

![image](https://github.com/qlkdkd/Database/assets/71871927/bf25d4e7-39c3-4b7a-80a6-f5f749b656d6)
```sql
select avg(단가)
from 제품;
```

![image](https://github.com/qlkdkd/Database/assets/71871927/3846c109-547f-424f-9dc8-c197187b1458)
```sql
select sum(재고량) as "재고량 합계"
from 제품
where 제조업체='한빛제과'
```

![image](https://github.com/qlkdkd/Database/assets/71871927/4e206b60-77b0-48e5-9618-52af34812b8c)
```sql
#1. 고객아이디 속성 이용하는 경우
select count(고객아이디) as 고객수
from 고객;

#2. 나이 속성 이용
select count(나이) as 고객수
from 고객;

#3. *를 이용하는 경우
select (*) as 고객수
from 고객;
```

![image](https://github.com/qlkdkd/Database/assets/71871927/d5e45dfe-05be-4916-a0cb-391b554fba94)
```sql
select count(distinct 제조업체)as "제조업체 수"
from 제품;
```
