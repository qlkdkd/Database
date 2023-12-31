# 7. 데이터베이스 언어 SQL

## 7-1. SQL의 소개
### 의미
* SQL(Structured Query Language)는 데이터베이스를 위한 표준 질의어

### 발전 역사
* SQL은 1974년에 대발된 SEQUEL(Structured English QUEry Language)에서 유래
    * SEQUEL: IBM 연구소에서 개발한 연구용 관계 데이터베이스 관리 시스템인 SYSTEM R을 위한 언어
* 1986년 미국 표준 연구소인 ANSI와 국제 표준화 기구인 ISO에서 SQL을 관계 데이터베이스의 표준 질의어로 채택하고 표준화 작업 진행
    * 계속 수정 및 보완되고 있음

### 사용 방식
* 대화식 SQL: 데이터베이스 관리 시스템에 직접 접근하여 대화식으로 질의를 작성하고 실행
* 삽입 SQL: 프로그래밍 언어(C, C++, Java 등)로 작성한 응용 프로그래밍으로 삽입

### SQL의 분류
![image](https://github.com/qlkdkd/Database/assets/71871927/b836fb0e-97b2-4ef8-9489-8a9b2f03e1cb)
* 데이터 정의어(DDL): 테이블을 생성하고 변경/삭제하는 기능을 제공
* 데이터 조작어(DML): 테이블에 새 데이터를 삽입하거나, 테이블에 저장된 데이터를 수정, 삭제, 검색하는 기능을 제공
* 데이터 제어어(DCL): 보안을 위해 데이터에 대한 접근 및 사용 권한을 사용자별로 부여하거나 취소하는 기능을 제공

![image](https://github.com/qlkdkd/Database/assets/71871927/ca51197f-4b82-478d-a77d-cc834d07bef5)
![image](https://github.com/qlkdkd/Database/assets/71871927/46340b0f-6acd-49ee-8f96-43e2388ce5c9)
![image](https://github.com/qlkdkd/Database/assets/71871927/f898d4e0-4f94-4384-9626-2be2bdf108b0)

---

## 7-2. SQL을 이용한 데이터 정의
### SQL의 데이터 정의 기능
* 테이블 생성, 테이블 구조의 변경, 테이블 삭제
![image](https://github.com/qlkdkd/Database/assets/71871927/21673dc2-c034-43fc-80bb-c155a5390b43)

### MySQL 명령창에서 'testdb'데이터베이스 생성
```
mysql>show databases;
mysql>create database testdb;
mysql>use testdb;
```
### 테이블 생성: create table문
```sql
create table 테이블_이름(
    속성_이름 데이터_타입[not null][default 기본값],#1
    [primary key(속성_리스트)],#2
    [unique(속성_리스트)],#3
    [foreign key(속성_리스트) references 테이블_이름(속성_리스트)],#4
    [constraint 이름] [check(조건)]$5
);
```
* 테이블을 생성하는 SQL 명령어: create table
* create table문은 생성할 테이블을 구성하는 속성들의 이름과 데이터 타입 및 제약사항에 대한 정의, 기본키, 대체키, 외래키의 정의, 데이터 무결성을 위한 제약조건의 정의 등을 포함

1. 테이블을 구성하는 각 속성의 이름과 데이터 타입, 기본적인 제약 사항을 정의한다.
2. 기본키: 테이블에 하나만 존재할 수 있다.
3. 대체키: 테이블에 여러 개 존재할 수 있다.
4. 외래키: 테이블에 여러개 존재할 수 있다.
5. 데이터 무결성을 위한 제약 조건: 테이블에 존재할 수 있다.

* []로 표시한 항목은 생략 자능
* 모든 SQL문은 세미콜론(;)으로 문장 끝을 표시한다.
* SQL문에 사용되는 `CREATE` 등과 같은 키워드는 대소문자를 구분하지 않는다.

#### 속성의 정의
* 테이블을 구성하는 각 속성의 데이터 타입을 선택한 후에 널 값 혀용 여부와 기본 값 필요 여부를 결정
* not null
    * 속성이 널 값을 허용하지 않음을 의미하는 키워드
    * 일반적으로 create table문은 널 값을 허용
    * 예)`고객 아이디 varchar(20) not null`
* defalut
    * 속성의 기본값을 지정하는 키워드
    * 예) `적립금 int defalut 0
    * 예) `담당자 varchar(10) default '방경아'`
> 문자열이나 날짜 데이터는 작은따옴표로 묶어서 표현(작은따옴표로 묶인 문자열은 대소문자를 구분함)

데이터 타입|의미
---|---
int, integer|정수
smallint|int보다 작은 정수
char(n), character(n)|길이가 n인 고정 길의의 문자열
varchar(n), character varying(n)|최대 길이가 n인 가변 길이의 문자열
numeric(p, s), decimal(p, s)|고정 소수점 실수. p는 소수점을 제외한 전체 숫자의 길이, s는 소수점 이하 숫자의 길이
float(n)|길이가 n인 부동 소수점
real|부동 소수점의 실수
date|연, 월, 일로 표현되는 날짜
time|시, 분, 초로 표현되는 시간
datetime|날짜와 시간

#### 키의 정의
* `primary key`
   * 기본키를 지정하는 키워드
   * 기본키가 없어도 테이블을 정의할 수 있지만 각 투플을 식별할 수 있는 기본키는 가능한 한개 이상 선택하는것이 좋다.
   * 모든 테이블에서 기본키는 반드시 하나만 지정할 수 있고, 여러개의 속성으로 구성할 수도 있다.
   * 예: `primary key(고객아이디)`, `primary key(주문고객, 주문제품)`
* `unique`
   * 대체키를 지정하는 키워드
   * 대체키로 지정된 속성의 값은 유일성을 가지며, 기본키와 달리 널 값이 허용됨
   * 대체키는 한 테이블에서 여러개를 지정할 수 있음
   * 예: `unique(고객이름)`
 
* `foriegn key`
   * 왜래키를 지정하는 키워드
   * 외래키가 어떤 테이블의 무슨 속성을 참조하는지 `references` 키워드를 다음에 제시
   * 참조 무결성 제약 조건 유지를 위해 참조되는 테이블에서 투플 삭제 시 처리 방법을 지정하는 옵션
  ![image](https://github.com/qlkdkd/Database/assets/71871927/dcfa64e7-24d9-42d4-8419-7d4d4fe5f295)
   * 사원 테이블의 소속부서 속성은 부서 테이블의 부서번호 속성을 참조하는 외래키
   * 부서 테이블에서 홍보부 투플을 삭제하려고 할 때 다음 4가지 중 한가지 방법으로 처리하도록 선택할 수 있음
   * 사원테이블을 정의하는 create table문을 작성할 떄 이 중 하나를 지정하면 됨
      * 별도로 지정하지 않으면 `on delete no action`이 기본으로 선택됨
      > * on delete no action: 투플을 삭제하지 못하게 함
      >    * 부서 테이블을 참조하는 사원 테이블이 존재하므로 부서 테이블의 투플을 삭제하지 못하게 함
      > * on delete cascade: 관련 투플을 함께 삭제
      >    * 사원 테이블에서 정소화 사원에 대한 투플도 함께 삭제
      > * on delete set null: 관련 투플의 외래키 값을 null로 변경한다.
      >    * 사원 테이블에서 정소화 사원의 소속부서 속성 값을 null로 변경
      > * on delete set default: 관련 투플의 외래키 값을 미리 지정한 기본 값으로 변경한다.
      >    * 사원 테이블에서 정소화 사원의 소속부서 속성 값을 기본값으로 변경
   * 참조되는 테이블의 투플이 변경될 때도 다음 네 가지 중 한 가지 방법으로 처리하도록 선택할 수 있다.
      * 사원 테이블을 정의하는 `create table`문을 작성할 때 4가지 방법 중 하나를 지정하면 됨
         * 지정하지 않으면 `on update no action`이 기본으로 선택
### 데이터 무결성 제약조건의 정의
* `create table`문으로 테이블을 정의할 때 **`check` 키워드를 사용해 특정 속성에 대한 제약 조건 지정할 수 있음**
   * 예: check(재고량>0 and 재고량<=10000)
* `check` 키워드를 사용해 지정한 제약조건에 `constraint` 키워드와 함께 고유의 이름을 부여할 수도 있다.
   * 예: constraint CHK_CPY CHECK(제조업체='한빛제과')

## 테이블 변경: alter table문
### 새로운 속성 추가
* 테이블은 `alter table`문으로 변경할 수 있다. `alter table`문을 이용해 새로운 속성 추가, 기존 속성 삭제, 새로운 제약조건 추가, 기존 제약조건 삭제 등이 가능하다.
* `alter table`문의 기본 형식
```sql
alter table(
   add 속성이름 데이터타입 [not null] [default 기본값]
);
```


### 기존 속성 삭제
```sql
alter table 테이블이름 drop column 속성_이름;
```
* 만약 삭제할 속성과 관련된 제약조건이 존재하거나 이 속성을 참조하는 다른 속성이 존재하는 경우에 속성을 삭제할 수 없음
    * 관련된 제약조건이나 참조하는 다른 속성을 먼저 삭제한 후 해당 속성을 삭제해야 함


### 새로운 제약조건의 추가
```sql
alter table 테이블이름 add constraint 제약조건이름 제약조건내용;
```

### 기존 제약조건의 삭제
```sql
alter table 테이블이름 drop constraint 제약조건이름;
```

## 테이블 삭제: drop table문
```sql
drop table 테이블이름;
```
* 삭제할 테이블을 참조하는 테이블이 있다면 삭제가 수행되지 않음
    * 삭제하고자 하는 테이블을 참조하는 외래키의 제약조건을 먼저 삭제해야 함.

# 7-3. sql을 이용한 데이터 조작
## sql의 데이터 조작 기능
* 데이터 검색, 새로운 데이터 삽입, 데이터 수정, 데이터 삭제
![image](https://github.com/qlkdkd/Database/assets/71871927/f96195b8-4a08-44b4-b0ba-4c4661b35570)

![image](https://github.com/qlkdkd/Database/assets/71871927/f5a657c5-9af7-4754-aea8-ca84c9111ce7)
![image](https://github.com/qlkdkd/Database/assets/71871927/cd3162a0-498e-4719-858a-10abe62d49ad)
![image](https://github.com/qlkdkd/Database/assets/71871927/0e6e41e7-484f-427f-bd6d-5ca2d0139887)

## 데이터 삽입
### 데이터 직접 삽입
* 테이블에 투플을 직접 삽입
```sql
insert
into 테이블이름[(속성리스트)]
values(속성값리스트);
```
* `into`키워드와 함께 투플을 삽입할 테이블의 이름을 제시한 후, 속성의 이름을 나열하는데 이 나열순서대로 `values`키워드 다음의 속성 값들이 차례로 삽입됨.
* `into`절의 속성 이름과 `value`절의 속성 값은 손서대로 일대일 대응되고 개수도 같아야 한다.
* `into`절의 속성 이름이 나열 순서대로 `values`키워드 다음의 속성 값들이 차례로 삽입됨
* `into`절에서 속성 이름의 리스트 생략 가능: 생략한 경우에는 테이블을 정의할 때 지정한 속성의 순서대로 values절의 속성 값이 삽입됨
* `value`절에 나열되는 속성 값은 문자나 날짜 타입의 데이터인 경우에는 작은따옴표로 묶어야 함
![image](https://github.com/qlkdkd/Database/assets/71871927/d04aa5ac-dccd-44e1-9363-c9cd41fd4609)
![image](https://github.com/qlkdkd/Database/assets/71871927/6b768272-33ca-4648-85a7-d01bafaedf60)
![image](https://github.com/qlkdkd/Database/assets/71871927/07514361-b00d-4e29-bb75-78d6422e1e2b)

### 부속 질의문을 이용한 데이터 삽입
* `select`문을 이용하여 다른 테이블에서 검색한 데이터를 투플로 삽입
```sql
insert
into 테이블이름[(속성리스트)]
select문;
```

## 데이터 검색: select문
### 기본 검색
* `select`키워드와 함께 검색하고 싶은 속성의 이름을 콤마(,)로 구분하여 차례로 나열
* `from`키워드와 함께 검색하고 싶은 속성이 있는 테이블의 이름을 콤마(,)로 구분하여 차례로 나열
* `select`문은 테이블을 대상으로 하고 수행 결과도 테이블임
```sql
select [all|distinct] 속성리스트
from 테이블리스트;
```
* `all`: 결과 테이블이 투플의 중복을 허용하도록 지정, 생략 가능
* `distinct`: 결과 테이블이 투플의 중복을 허용하지 않도록 지정
* \*를 사용하면 테이블에 존재하는 모든 속성을 검색하기 위해 속성의 이름을 전부 나열하지 않고 검색할 수 있음

* `as`키워드를 이용해 결과 테이블에서 속성의 이름을 바꾸어 출력 가능
    * 원래 테이블의 속성 이름이 실제 바뀌진 않음
  	 * select문의 결과 테이블에서만 지정한 이름으로 출력되는 것 뿐
    * 지정하는 이름에 공백이 포함되어 있으면 오라클에서는 큰따옴표로 묶어주고 MySQL서버에서는 작은따옴표로 묶어줘야함
    * as키워드 생략 가능

### 산술식을 이용한 검색
* select 키워드와 함께 산술식을 제시할 수 있음
    * 산술식: 속성의 이름과 +, -, *, /등의 산술 연산자와 상수로 구성
* 결과 테이블에서만 계산된 결과 값이 출력됨
    * 속성의 값이 실제로 변경되는 것은 아님

### 조건 검색
```sql
select [all|distinct] 속성리스트
from 테이블리스트
[where 조건];
```
* where 키워드와 논리 연산자를 이용한 검색 조건 제시
* 조건에서는 비교연산자를 이용해 숫자 뿐만 아니라 문자나 날짜 값을 비교할 수 있음
   * 'a'<'c', '2022-12-01'<'2022-12-02'
* 조건에서 숫자 값은 그대로 작성해도 되지만 문자나 날짜값은 속성의 이름과 구별할 수 있도록 작은따옴표로 묶어야 함
* 논리 연산자는 조건을 여러개 결합하거나 조건을 만족하지 않는 데이터를 검색하고자 할 때 이용
![image](https://github.com/qlkdkd/Database/assets/71871927/e3d4417e-e885-4406-88e0-30eb73b1b94c)

### like를 이용한 검색
* 검색조건을 부분적으로 알고 있다면 like 키워드를 이용해 검색
* 단, like 키워드는 문자열을 이용하는 조건에만 사용할 수 있음

![image](https://github.com/qlkdkd/Database/assets/71871927/f8b3afc9-c917-417b-bb8a-be63f4befb1d)
![image](https://github.com/qlkdkd/Database/assets/71871927/f1cbafc2-322d-4ad3-a7ba-bfa2bb3b6659)

### null을 이용한 검색
* is null: 검색 조건에서 특정 속성의 값이 널값인지를 비교
* is not null: 특정 속성의 값이 널 값이 아닌지 비교

### 정렬검색
* select 문의 검색 결과 테이블은 일반적으로 dbms가 정한 순서대로 출력
* 결과 테이블의 내용을 사용자가 원하는 순서로 출력하려면 order by 키워드 사용
```sql
select [all|distinct] 속성리스트
from 테이블리스트
[where 조건]
[order by속성리스트[asc|desc]]
```
* order by 키워드와 함께 정렬 기준이 되는 속성과 정렬 방식을 지정
   * 오름차순: acs
   * 내림차순: desc
* 여러 기준에 따라 정렬하려면 정렬 기준이 되는 속성들을 차례대로 제시

### 집계함수를 이용한 검색
* 특정 속성 값을 통계적으로 계산한 결과를 검색하기 위해 집계 함수를 이용
   * 집계 함수(aggregate function)
      * 열함수(column function)이라고도 함
      * 개수, 합계, 평균, 최댓값, 최솟값의 계산 기능 제공
   * 집계 함수 사용시 주의사항
      * 집계 함수는 널인 속성 값은 제외하고 계산함
      * 집계 함수는 where절에서는 사용할 수 없고, select절이나 having절에서만 사용 가능
 ![image](https://github.com/qlkdkd/Database/assets/71871927/7a443c1f-7508-415d-98f1-68def447b0e5)
