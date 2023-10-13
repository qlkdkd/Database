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
