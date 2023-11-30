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
