# 데이터베이스 언어 SQL
1. SQL의 소개
2. SQL을 이용한 데이터 정의
3. SQL을 이용한 데이터 조작
4. 뷰
5. 삽입 SQL

## 학습 목표
![image](https://github.com/qlkdkd/Database/assets/71871927/4282d38b-880c-4764-b4c5-47fc12c64eab)
* SQL의 역할을 이해하고, 이를 기능별로 분류해본다.
* SQL의 데이터 정의 기능을 예제로 통해 익힌다.
* SQL의 데이터 조작 기능을 예제를 통해 익힌다.
* 뷰의 개념과 장점을 이해한다.
* 삽입 SQL의 역할을 이해한다.

---

## 1. SQL의 소개
### SQL(Structured Query Language)
#### 의미
* 관계 데이터베이스를 위한 표준 질의어
* 비절차적 데이터 언어
#### 발전 역사
* SEQUEL(Structured English QUEry Language)에서 유래
* 미국 표준 연구소인 ANSI와 국제 표준화 기구인 ISO에서 표준화 작업을 진행
      * 계속 수정 및 보완되고 있음
#### 사용 방식
* 대화식 SQL: 데이터베이스 관리 시스템에 **직접 질의를 작성하고 실행**
* 삽입 SQL: 프로그래밍 언어로 작성한 응용 프로그램에 삽입

### SQL의 분류
![image](https://github.com/qlkdkd/Database/assets/71871927/b9e650fa-42f4-4f4d-80de-5e8c6c7d3320)
* 데이터 정의어(DDL): 테이블을 **생성**하고 **변경, 삭제**하는 기능을 제공
* 데이터 조작어(DML): 테이블에 **새 데이터를 삽입**하거나, 테이블에 **저장된 데이터를 수정/삭제/ 검색**하는 기능을 제공
* 데이터 제어어(DCL): 보안을 위해 **데이터에 대한 접근 및 사용 권한을 사용자별로 부여하거나 취소하는 기능을 제공**
### 질의에 사용할 판매 데이터베이스: 고객 테이블
![image](https://github.com/qlkdkd/Database/assets/71871927/b896de45-e11e-4ce5-b708-79e5347f3679)
* 속성: 고객아이디, 고객이름, 나이, 등급, 직업, 적립금
* 기본키: 고객 아이디
* 타입
    * 아이디, 이름, 등급, 직업: char
    * 나이, 적립금: int
### 제품 테이블
![image](https://github.com/qlkdkd/Database/assets/71871927/bbab2149-2316-498e-905f-70a3dcb55c92)
* 기본키: 제품번호
* 속성: 제품명, 재고량, 단가, 제조업체
![image](https://github.com/qlkdkd/Database/assets/71871927/d647fb60-f6b7-4c0f-89ba-eba71509fcc5)
* 기본키: 주문번호
* 외래키: 주문고객(고객 테이블), 주문제품(제품 테이블)
* 속성: 주문번호, 주문고객, 주문제품, 수량, 배송지, 주문일자

(일반적으로 테이블 이름은 영어로 쓴다. 한글은 깨질수 있다)

---

## 2. SQL을 이용한 데이터 정의
### [참고: MySQL 사용방법]()
### SQL의 데이터 정의 기능
* 테이블, 생성, 테이블 구조의 변경, 테이블 삭제
![image](https://github.com/qlkdkd/Database/assets/71871927/5abd703b-875d-4aca-914f-126ad0fb3835)
* 생성: CREATE TABLE
* 변경: ALTER TABLE
* 삭제: DROP

### MySQL 명령창에서 `testdb` 데이터베이스 생성
* `mysql> show database;`
* `mysql> create database testdb;`
* `mysql> use testdb;`

### 테이블 생성: create table 문
```sql
create table 테이블_이름(
     속성_이름 데이터_타입[NOT NULL][DEFAULT 기본값]# 테이블을 구성하는 각 속성의 이름, 데이터 타입, 기본 제약 사항 정의
     [PRIMARY KEY (속성 리스트)# 기본키 정의
     [UNIQUE (속성_리스트)]# 대체키 정의
     [FOREIGN KEY(속성_리스트) RERERENCES 테이블_이름(속성_리스트)]# 외래키 저으이
     [ON DELETE 옵션][ON UPDATE 옵션]
     [CONSTRAINT 이름][CHECK(조건)]# 데이터 무결성을 위한 제약조건 정의
);
```

예제
```sql
CREATE TABLE `mall_`.`products` (
  `pid` INT NOT NULL,
  `pname` VARCHAR(45) NULL,
  `pisze` VARCHAR(45) NULL,
  `pcnt` VARCHAR(45) NULL,
  PRIMARY KEY (`pid`));
```

#### 속성의 정의
* 테이블을 구성하는 각 속성의 데이터 타입을 선택한 후 널 값 허용 여부와 기본 값 필요 여부를 결정
* NOT NULL
     * 속성이 널값을 허용하지 않음을 의미하는 키워드
     * 예)고객 아이디 varchar(20) not null
* DEFAULT
     * 속성의 기본값을 지정하는 키워드
     * 예) 적립금 int default 0
     * 예) 담당자 varchar(10) default '방경아'
![image](https://github.com/qlkdkd/Database/assets/71871927/e9f1cde0-d214-4a16-9080-5561c90f4978)
* 키의 정의
     * `PRIMARY KEY`
          * 기본키를 지정하는 키워드
          * 예) PRIMARY KEY(고객 아이디)
          * 예) PRIMARY KEY(주문고객, 주문제품)
     * `UNIQUE`
          * 대체키를 지정하는 키워드
          * 대체키로 지정된 속성의 값은 유일성을 가지며, 기본키와 다리 널 값이 허용됨
          * 예)UNIQUE(고객이름)
     * `FOREIGN KEY`
          * 외래키를 지정하는 키워드
          * 외랰리가 어떤 테이블의 무슨 속성을 참조하는지 REFERANCES 키워드 다음에 제시
          * 참조 무결성 제약조건 유지를 위해 참조되는 테이블에서 튜플 삭제 시 처리방법을 지정하는 옵션
```sql
on delete no action# 튜플을 삭제하지 못하게 함
on delete cascade# 관련 튜플을 함께 삭제함
on delete set null# 관련 튜플의 외래키 값을 null로 변경함
on delete set default# 관련 튜플의 외래키 값을 미리 지정한 기본 값으로 변경함
```

          * 예) FOREIGN KEY(소속 부서)REFERANCES 부서(부서번호)
          * 예) FOREIGN KEY(소속 부서)REFERANCES 부서(부서번호) ON DELETE CASCADE ON UPDATE CASCADE

![image](https://github.com/qlkdkd/Database/assets/71871927/08f8b522-1ba4-48f6-8f3b-5fcec8fac882)
* ON DELETE NO ACTION: 부서 테이블의 튜플을 삭제하지 못하게 함
* ON DELETE CASCADE: 사원 테이블에서 홍보부에 근무하는 정소화 사원 튜플도 함께 삭제
* ON DELETE SET NULL: 사원 테이블에서 정소화 사원의 소속 부서 속성 값을 NULL로 변경
* ON DELETE SET DEFAULT: 사원 테이블에서 정소화 사원의 소속부서 속성값을 기본 값으로 변

#### 데이터 무결성 제약조건의 정의
* CHECK
     * 테이블에 정확하고 유효한 데이터를 유지하기 위해 특정 속성에 대한 제약 조건을 지정
     * CONSTRAINT 키워드와 함께 고유의 이름을 부여할 수도 있음
     * 예) CHECK(재고량>=0 AND 재고량<=1000)
     * 예) CONSTRAINT CHK_CPY CHECK(제조업체='한빛제과')
### 고객 테이블 생성을 위한 CREATE TABLE 문 작성 예
![image](https://github.com/qlkdkd/Database/assets/71871927/74235730-30ca-469f-93c9-196879e3c9b3)
```SQL
create table 고객(
	고객아이디 varchar(20) not null,
    고객이름 varchar(10) not null,
    나이 int,
    등급 varchar(10) not null,
    직업 varchar(20),
    적립금 int default 0,
    primary key(고객아이디)
);
```

![image](https://github.com/qlkdkd/Database/assets/71871927/a71e88c5-074c-4224-a4ab-7ccb6b6131fb)
```sql
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

![image](https://github.com/qlkdkd/Database/assets/71871927/3ea7be2e-7355-41e8-8aa5-4b1f30dcf889)
```sql
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

![image](https://github.com/qlkdkd/Database/assets/71871927/2fb3081e-ef4a-411e-8d64-d1461f21c077)
```sql
create table 배송업체(
	업체번호 char(3) not null,
    업체명 varchar(20),
    주소 varchar(100),
    전화번호 varchar(20),
    primary key(업체번호)
);
```

### 테이블 변경: alter table문
* 새로운 속성 추가
```sql
alter table 테이블_이름(
     add 속성_이름 데이터_타입[not null][default 기본_값]
);
```

![image](https://github.com/qlkdkd/Database/assets/71871927/c6dd63aa-b7e8-4fe5-ac40-e363ede251bf)
```sql
alter table 고객 add 가입날짜 date;
```

* 기존 속성 삭제
```sql
alter table 테이블_이름 drop column 속성_이름;
```
* 만약 삭제할 속성과 관련된 제약조건이나 참조하는 다른 속성이 존재한다면?
     * 속성 삭제가 수행되지 않음
     * 관련된 제약조건이나 참조하는 다른 속성을 먼저 삭제해야 함

![image](https://github.com/qlkdkd/Database/assets/71871927/672c9d86-bdaa-4be5-b75d-a5f3f70872ab)
```sql
alter table 고객 drop column 가입날짜;
```

* 새로운 제약 조건의 추가
```sql
alter table 테이블_이름 add constraint 제약조건_이름 제약조건_내용;
```
![image](https://github.com/qlkdkd/Database/assets/71871927/8d40417c-321d-44f2-b1fc-e0a335c0d24f)
```sql
alter table 고객 add constraint chk_age check(나이>=20);
```
![image](https://github.com/qlkdkd/Database/assets/71871927/30cf3ca6-0acb-488e-a3e8-81a669b6c1c4)
![image](https://github.com/qlkdkd/Database/assets/71871927/6136267f-d7b5-42c9-ba9b-b91cde09a3f0)

---

## 3. SQL을 이용한 데이터 조작
### SQL의 데이터 조작 기능
* 데이터의 검색, 새로운 데이터 삽입,데이터 수정, 데이터 삭제
![image](https://github.com/qlkdkd/Database/assets/71871927/628beb99-aa00-4add-9c56-33629ad87964)
![image](https://github.com/qlkdkd/Database/assets/71871927/11680567-51f8-41ed-ac3a-11a106e4b31c)
![image](https://github.com/qlkdkd/Database/assets/71871927/529cf76c-6428-4a05-9d3f-72c5e6e1e7d2)
![image](https://github.com/qlkdkd/Database/assets/71871927/f9881424-4710-49e8-aff7-11e97c18af9d)

### 데이터 삽입: insert문
* 데이터 직접 삽입: 테이블 튜플을 직접 삽입
```sql
insert
into 테이블_이름[(속성_리스트)]
values(속성값_리스트);
```
* into키워드와 함꼐 튜플을 삽입할 테이블의 이름을 나열: 속성 리스트를 생략하면 테이블을 정의할 때 지정한 속성의 순서대로 값이 삽입됨
* values 키워드와 함께 삽입할 속성 값들을 나열
* into 절의 속성 이름과 values절의 값은 순서대로 일대일 대응되어야 함.

#### 테이블
```sql
# 고객 테이블
INSERT INTO 고객 VALUES ('apple', '정소화', 20, 'gold', '학생', 1000);
INSERT INTO 고객 VALUES ('banana', '김선우', 25, 'vip', '간호사', 2500);
INSERT INTO 고객 VALUES ('carrot', '고명석', 28, 'gold', '교사', 4500);
INSERT INTO 고객 VALUES ('orange', '김용욱', 22, 'silver', '학생', 0);
INSERT INTO 고객 VALUES ('melon', '성원용', 35, 'gold', '회사원', 5000);
INSERT INTO 고객 VALUES ('pear', '채광주', 31, 'silver', '회사원', 500);
INSERT INTO 고객 VALUES ('peach', '오형준', NULL, 'silver', '의사', 300);

# 제품 테이블
INSERT INTO 제품 VALUES ('p01', '그냥만두', 5000, 4500, '대한식품');
INSERT INTO 제품 VALUES ('p02', '매운쫄면', 2500, 5500, '민국푸드');
INSERT INTO 제품 VALUES ('p03', '쿵떡파이', 3600, 2600, '한빛제과');
INSERT INTO 제품 VALUES ('p04', '맛난초콜렛', 1250, 2500, '한빛제과');
INSERT INTO 제품 VALUES ('p05', '얼큰라면', 2200, 1200, '대한식품');
INSERT INTO 제품 VALUES ('p06', '통통우동', 1000, 1550, '민국푸드');
INSERT INTO 제품 VALUES ('p07', '달콤비스켓', 1650, 1500, '한빛제과');

# 주문 테이블
INSERT INTO 주문 VALUES ('o01', 'apple', 'p03', 10, '서울시 마포구', '13/01/01');
INSERT INTO 주문 VALUES ('o02', 'melon', 'p01', 5, '인천시 계양구', '13/01/10');
INSERT INTO 주문 VALUES ('o03', 'banana', 'p06', 45, '경기도 부천시', '13/01/11');
INSERT INTO 주문 VALUES ('o04', 'carrot', 'p02', 8, '부산시 금정구', '13/02/01');
INSERT INTO 주문 VALUES ('o05', 'melon', 'p06', 36, '경기도 용인시', '13/02/20');
INSERT INTO 주문 VALUES ('o06', 'banana', 'p01', 19, '충청북도 보은군', '13/03/02');
INSERT INTO 주문 VALUES ('o07', 'apple', 'p03', 22, '서울시 영등포구', '13/03/15');
INSERT INTO 주문 VALUES ('o08', 'pear', 'p02', 50, '강원도 춘천시', '13/04/10');
INSERT INTO 주문 VALUES ('o09', 'banana', 'p04', 15, '전라남도 목포시', '13/04/11');
INSERT INTO 주문 VALUES ('o10', 'carrot', 'p03', 20, '경기도 안양시', '13/05/22');
```

### 데이터 검색: select문
* 기본검색
	* select 키워드와 함께 검색하고 싶은 속성의 나열
 	* from 키워드와 함께 검색하고 싶은 속성이 있는 테이블의 이름을 나열
    	* 검색 결과는 테이블 형태로 반환됨
```sql
select [all|distinct] 속성_리스트
from 테이블_리스트;
```
	* all: 결과 테이블이 튜플의 중복을 허용하도록 지정, 생략 가능
	* distinct: 결과 테이블이 튜플의 중복을 허용하지 않도록 지정

#### 예제 7-10 고객 테이블에서 고객 아이디, 고객 이름, 등급 속성을 검색해보자
```sql
select 고객아이디, 고객이름, 등급
from 고객;
```

#### 예제 7-11. 고객 테이블에 존재하는 모든 속성을 검색해보자
```sql
select 고객아이디, 고객이름, 나이, 등급, 직업, 적립금
from 고객;
```

#### 예제 7-12. 제품 테이블에서 제조업체를 검색해보자
```sql
select 제조업체
from 제품;
```

#### 예제 7-14. 제품 테이블에서 제조업체를 검색하되, all키워드를 사용해보자
```sql
select all 제조업체
from 제품;
```

#### 예제 7-15. 제품 테이블에서 제조업체 속성을 중복 없이 검색해보자.
```sql
select distinct 제조업체
from 제품;
```

* as 키워드를 이용하여 결과 테이블에서 속성의 이름을 바꾸어 출력 가능
	* 새로운 이름에 공백이 포함되어 있으면 큰따옴표나 작은 따옴표로 묶어주어야 함
 	> 오라클에서는 큰따옴표, ms sql 서버에서는 작은따옴표 사용
  	* as키워드는 생략 가능

#### 예제 7-16. 제품 테이블에서 제품명과 단가를 검색하되, 단가를 가격이라는 새 이름으로 출력해보자
```sql
select 제품명, 단가 as 가격
from 제품;
```

* 산술식을 이용한 검색
	* select 키워드와 함께 산술식 제시(산술식: 속성의 이름과 +, -, *, / 등의 산술 연산자와 상수로 구성)
 	* 결과 테이블에서만 계산된 결과 값이 출력됨(속성의 값이 실제로 변경되는 것은 아님)

#### 예제 7-17. 제품테이블에서 제품명과 단가 속성을 검색하되, 단가에 500원을 더해 '조정 단가'라는 새 이름으로 출력해보자
```sql
select 제품명, 단가+500 as "조정 단가"
from 제품;
```

#### 조건 검색
* 조건을 만족하는 데이터만을 검색
```sql
select [all|distinct] 속성_리스트
from 테이블_리스트
[where 조건];
```
* where 키워드와 함께 비교 연산자와 논리 연산자를 이용한 검색 조건 제시
> 숫자뿐만 아니라 문자나 날짜 값을 비교하는 것도 가능
> 예) 'a'<'c'
> 예) '2022-12-01'<'2022-12-02'
> 조건에서 문자나 날짜 값은 작은따옴표로 묶어서 표현

* 조건 검색
![image](https://github.com/qlkdkd/Database/assets/71871927/3d4fd8eb-e069-4889-abff-2cf44a3b0f0b)

#### 예제 7-18. 제품 테이블에서 한빛제과가 제조한 제품의 제품명, 재고량, 단가를 검색해보자.
```sql
select 제품명, 재고량, 단가
from 제품
where 제조업체="한빛제과";
```

#### 예제 7-19 주문 테이블에서 apple 고객이 15개 이상 주문한 주문제품, 수량, 주문일자를 검색해보자.
```sql
select 주문제품, 수량, 주문일자
from 주문
where 주문고객='apple' and 수량>=15;
```

#### 예제 7-20. 주문 테이블에서 apple 고객이 주문했거나 15개 이상 주문된 제품의 주문제품, 수량, 주문일자, 주문고객을 검색해보자.
```sql
select 주문제품, 주문일자, 주문고객
from 주문
where 주문고객='apple' or ; 수량>=15;
```

#### 예제 7-21. 제품 테이블에서 단가가 2000원 이상이면서 3000원 이하인 제품의 제품명, 단가, 제조업체를 검색해보자.
```sql
select 제품명, 단가, 제조업체
from 제품
where 단가>=2000 and 단가<=3000;
```

#### LIKE를 이용한 검색
* like 키워드를 이용해 부분적으로 일치하는 데이터 검색
* 문자열을 이용하는 조건에만 like 키워드 사용 가능

기호|설명
---|---
%|0개 이상의 문자(문자 내용과 개수는 상관 없음
_|1개의 문자(문자의 내용은 상관 없음)

* like를 이용한 검색

사용 예|설명
---|---
like '데이터%'|데이터로 시작하는 문자열(데이터로 시작하기만 하면 길이는 상관 없음)
like '%데이터'|데이터로 끝나는 문자열(데이터로 끝나기만 하면 길이는 상관 없음)
like '%데이터%'|데이터가 포함된 문자열
like '데이터___'|데이터로 시작하는 6자 길이의 문자열
like '__한'|세번째 글자가 '한'인 문자열

#### 예제 7-22. 고객 테이블에서 성이 김 씨인 고객의 고객이름, 나이, 등급, 적립금을 검색해보자
```sql
select 나이, 등급, 적립금
from 고객
where 고객이름 like "김%";
```

#### 예제 7-23. 고객 테이블에서 고객 아이디가 5자인 고객의 고객 아이디, 고객이름, 등급을 검색해보자.
```sql
select 고객아이디, 고객이름, 등급
from 고객
where 고객아이디 like "_____";
```

#### NULL을 이용한 검색
* is null 키워드를 이용해 특정 속성의 값이 널 값인지를 비교
* is not null 키워드를 이용해 특정 속성의 값이 널 값이 아닌지를 비교
* 검색 조건에서 널 값은 다른 값의 크기를 비교하면 결과가 모두 거짓이 됨

#### 예제 7-24. 고객 테이블에서 나이가 입력되지 않은 고객의 고객이름을 검색해보자.
```sql
select 고객이름
from 고객
where 나이 is null;
```
![image](https://github.com/qlkdkd/Database/assets/71871927/07787ea0-1b28-4333-89a7-227008103603)
