# 관계 데이터 연산
1. 관계 데이터 연산의 개념
2. 관계 대수
3. 관계 해석

#### 학습 목표
![image](https://github.com/qlkdkd/Database/assets/71871927/794fbc3b-5ef1-40df-ae68-18176a2360dc)
* 관계 데이터 연산의 개념과 종류를 알아본다.
* 일반 집합 연산자와 순수 관계 연산자의 차이를 이해한다.
* 일반 집합 연산자와 순수 관계 연산자를 이용해 질의를 표현하는 방법을 익힌다.
* 관계 해석의 개념을 간단히 정리해본다.

---

## 1. 관계 데이터 연산의 개념
* 관계 데이터 모델에서의 연산: 원하는 데이터를 얻기 위해 릴레이션에 필요한 처리 요구를 수행하는 것
* 데이터 모델: 데이터 구조 + 연산 + 제약 조건건
![image](https://github.com/qlkdkd/Database/assets/71871927/76f9b633-b24c-4745-89c5-73b3eaf51b9a)

#### 관계 데이터 연산(relational data operation)
* 관계 데이터 모델의 **연산**
* *원하는 데이터를 얻기 위해* 릴레이션에 필요한 처리 요구를 수행하는 것
* **관계 대수**와 **관계 해석**
  * 기능과 표현력 측면에서 동등한 능력
> 관계 데이터 연산
> 
> 관계 대수: 원하는 결과를 얻기 위해 데이터의 *처리 과정을* **순서대로 기술**
> 
> 관계 해석: 원하는 결과를 얻기 위하 처리를 원하는 데이터가 무엇인지만 기술

#### 관계 대수와 관계 해석의 역할
* 데이터 언어의 유용성을 검증하는 기준
* 관계 대수나 관계 해석으로 기술할 수 있는 모든 질의를 기술할 수 있는 데이터 언어 -> 관계적으로 완전(relationally complete)하다고 판단
 * 질의(query): 데이터에 대한 처리 요구

---

## 2. 관계 대수

#### 관계 대수(relational algeber)의 개념
* 절차 언어(procedural language)
 * 원하는 결과를 얻기 위해 릴레이션 처리 과정을 순서대로 기술하는 언어

* 릴레이션을 처리하는 연산자들의 모임
 * 대표 연산자 8개
 * 일반 집합 연산자와 순수 관계 연산자로 분류

* 폐쇄 특성(closure property)
 * 피연산자도 릴레이션이고 연산의 결과도 릴레이션

#### 관계 대수의 연산자
* 일반 집합 연산자
   * 합집합: $\cup$
   * 교집합: $\cap$
   * 차집합: -
   * 카티션 프로덕트: $\times$

* 순수 관계 연산자
   * 셀렉트: $\sigma$
   * 프로젝트: $\pi$
   * 조인: $\triangleright \triangleleft$
   * 디비전: $\div$

#### 일반 집합 연산자
* 릴레이션이 튜플의 집합이라는 개념을 이용하는 연산자
* 수학의 집합 관련 연산자 차용함함

연산지|기호|표현|의미
---|---|---|---
합집합|$\cup$|$R\cup S$|릴레이션 R과 S의 합집합을 반환
교집합|$\cap$|$R\cap S = (R-R\cap S)$|릴레이션 R과 S의 교집합을 반환
차집합|$-$|$R-S$|릴레이션 R과 S의 차집합을 반환
카티션 프로덕트|$\times$|$R \times S$| 릴레이션 R의 각 튜플과 릴레이션 S의 각 튜플을 모두 연결하여 만든 새로운 튜플을 반환

![image](https://github.com/qlkdkd/Database/assets/71871927/196ec504-f9b5-46f6-bc31-95c73922b8f9)

#### 일반 집합 연산자의 특성
* 피연산자가 2개 필요
   * 2개의 릴레이션을 대상으로 연산 수행

* 합집합, 교집합, 차집합은 피연산지인 **두 릴레이션이 합병 가능해야함**
   * *합병 가능(Union Compatible) 조건*
      * 두 릴레이션의 *차수가 같아야 함*
      * 두 릴레이션에서 **서로 대응되는 속성의 도매인이 같아야 함**(도메인이 같으면 속성의 이름은 달라도 됨)
![image](https://github.com/qlkdkd/Database/assets/71871927/2467aa14-bbff-4df9-b410-439b509be66c)
* 불가능 한 예 이유: 고객릴레이션과 직원 릴레이션의 차수는 서로 같으나 속성이 다르다(고객: int, char, int, 직원: int, char, char)
* 가능한 예 이유: 둘 다 차수와 속성이 같다.

#### 일반 집합 연산자 - 합집합(union)
* 합병 가능한 두 릴레이션 R과 S의 합집합: $R \cup S$
   * 릴레이션 R에 속하거나 릴레이션 S에 속하는 모든 튜플로 결과 릴레이션 구성
* 결과 릴레이션의 특성
   * 차수는 릴레이션 R과 S의 차수와 같음
   * 카디널리티는 릴레이션 R과 S의 카디널리티를 더한 것과 같거나 적어짐
* 교환적 특징이 있음
   * $R \cup S = S \cup R$
* 결합적 특징이 있음
   * $(R \cup S)\cup T = R \cup(S \cup T)$

![image](https://github.com/qlkdkd/Database/assets/71871927/e5d4df01-f435-408c-8ddb-ab93c00fc326)

#### 일반 집합 연산자 - 교집합
* 합병 가능한 두 릴레이션 R과 S의 교집합: $R \cap S$
   * 릴레이션 R과 S에 공통으로 속하는 튜플로 결과 릴레이션 구성
* 결과 릴레이션의 특성
   * 차수는 릴레이션 R과 S의 차수와 같음
   * 카디널리티는 릴레이션 R과 S의 어떤 카디널리티보다 크지 않음(같거나 작음)
* 교환적 특징이 있음
   * $R \cap S = S \cap R$
* 결합적 특징이 있음
   * $(R \cap S)\cap T = R \cap (S \cap T)$

![image](https://github.com/qlkdkd/Database/assets/71871927/9fa43ada-cd38-4190-bab9-7cda4b8bce03)

#### 일반 집합 연산자 - 차집합
* 합병 가능한 두 릴레이션 R과 S의 차집합: $R-S$
   * 릴레이션 R에는 존재하지만 릴레이션 S에는 존재하지 않는 튜플로 결과 릴레이션 구성
* 결과 릴레이션 특성
   * 차수는 릴레이션 R과 S의 차수와 같음
   * R-S의 카디널리티는 릴레이션 R의 카니널리티와 같거나 작음
   * $S-R$의 카디널리티는 릴레이션 S의 카디널리티와 같거나 작음
* 교환적, 결합적 특징이 없음

![image](https://github.com/qlkdkd/Database/assets/71871927/80148e66-fb4a-439d-8c5f-a91a22702467)

#### 일반 집합 연산자 - 카티션 프로덕트(cartesian product)
* 두 릴레이션 R과 S의 카티션 프로덕트: $R \times S$
   * 릴레이션 *R에 속한 각 튜플*과 *릴레이션 S에 속한 각 튜플을 모두 연결*하여 만들어진 **새로운 튜플로 결과 릴레이션을 구성**
* 결과 릴레이션의 특성
   * **차수는** 릴레이션 **R과 S의 차수를 더한 것과 같음**
   * **카디널리티는** 릴레이션 **R과 S의 카디널리티를 곱한 것과 같음**
   * 합병이 불가능한 경우에도 카티션 프로덕트 연산은 가능함
* 교환법칙, 결합법칙 성립됨
![image](https://github.com/qlkdkd/Database/assets/71871927/ef3801c7-6c51-4438-9883-4c3e223ef920)

### 순수 관계 연산자-셀렉트(select)
* 셀렉트 연산은 주어진 조건을 만족하는 투플만 석택하여 결과 릴레이션을 구성함 -> 그 결과 릴레이션은 주어진 릴레이션을 수평으로 절단한 모양이 됨
* 수학적 표현: $\sigma_{조건식}(릴레이션)$
* 데이터 언어적 표현: 릴레이션 where 조건식
* 조건식
    * 비교식, 프레디킷(predicate)이라고도 함
    * 속성과 상수의 비교나 속성들 간의 비교로 표현
    * 비교 연산자(>, >=, <, <=, =, !=)와 논리 연산자($\wedge(and), \vee(or), ¬(not)$)를 이용해 작성
![image](https://github.com/qlkdkd/Database/assets/71871927/da0b3695-9f4d-4cca-8fa7-906a8df8c6d8)

![image](https://github.com/qlkdkd/Database/assets/71871927/ffe4bd77-e8f9-4189-ae49-1f86b5996cbd)
![image](https://github.com/qlkdkd/Database/assets/71871927/f3684ffb-7df3-4129-9026-6998e6c07dc9)

* 셀렉트 연산자는 교환적 특징이 있다.
$$\sigma_{조건식1}(\sigma{조건식2}(릴레이션))=\sigma_{조건식2}(\sigma_{조건식1}(릴레이션))$$


### 순수 관계 연산자-프로젝트(project)
* 프로젝트 연산은 릴레이션에서 선택한 속성에 해당하는 값으로 결과 릴레이션을 구성한다. 결과 릴레이션이 주어진 릴레이션의 일부 열로만 구성되어 해당 릴레이션에서 수직적 부분집합을 생성하는 것과 같다.
* 수학적 표현: $\pi_{속성 리스트}(릴레이션)$
* 데이터 언어 표현: 릴레이션[속성 리스트]
![image](https://github.com/qlkdkd/Database/assets/71871927/3aa9e72f-02a9-4ae0-8e0f-b0360743712b)
![image](https://github.com/qlkdkd/Database/assets/71871927/acecd3ae-2708-403f-b16d-9a48b1d52d85)
![image](https://github.com/qlkdkd/Database/assets/71871927/a0d6ec3c-5786-42ce-8268-b520a751ac5c)

![image](https://github.com/qlkdkd/Database/assets/71871927/01f721a1-f2d3-43ec-a373-ec8223518a3b)
* 프로젝트 연산을 한 결과 릴레이션에도 동일한 투플이 중복되지 않고 한 번만 나타난다. 프로젝트 연산의 결과도 릴레이션이기 때문에 중복되는 투플이 존재할 수 없다는 릴레이션의 기본적 특성을 유지하는 것이다.

### 순수 관계 연산자-조인(join)
* 조인 연산은 조인 속성을 이용해 두 릴레이션을 조합하여 하나의 결과 릴레이션을 구성한다.
* 조인 속성은 두 릴레이션이 공통으로 가지고 있는 속성으로, 두 릴레이션이 관계가 있음을 나타낸다.
* 조인 연산한 결과 릴레이션은 피연산자 릴레이션에서 조인 속성의 값이 같은 투플만 연결하여 만든 새로운 투플을 포함한다.
* 조인 연산의 결과는 두 릴레이션에 대해 카티션 프로덕트 연산을 수행한 후 조인 속성의 값이 같은 조건을 만족하는 투플을 반환하는 셀렉트 연산을 수행한 것과 같다.
* 표현: $릴레이션1 \Join 릴레이션2$
* 동등 조인(equal join)이라고도 함
![image](https://github.com/qlkdkd/Database/assets/71871927/7ad217a2-2154-4269-a1c3-c3088839d27c)

![image](https://github.com/qlkdkd/Database/assets/71871927/8d85bf0f-5da9-46d1-8952-581fb552c6d0)

#### 세타 조인(theta-join)
* 세타조인은 주어진 조인 조건을 만족하는 두 릴레이션의 모든 투플을 연결한 새로운 투플로 결과 릴레이션을 구성한다.
* 동등 조인에 비해 더 일반화된 조인
* 결과 릴레이션의 차수는 두 릴레이션의 차수를 더한 것과 같다.
* 표현법: $릴레이션1 \Join_{A\theta B} 릴레이션2)
    * $\theta=비교연산자(>, >=, <, <=, =, !=)$
    * A와 B는 같은 도메인으로 정의되어야 함
* 세타 조인 연산 결과의 릴레이션 차수: 릴레이션1의 차수 + 릴레이션2의 차수

#### 동등조인(equal-join)
* $\theta=$"="인 세타 조인

#### 자연 조인(natural join)
* 자연 조인은 동등 조인의 결과 릴레이션에서 중복된 속성을 제거하여 조인 속성을 한번만 나타내고, $\Join_{N}$기호로 표현한다.
* 표현법: $릴레이션1 \Join_{N} 릴레이션2$
![image](https://github.com/qlkdkd/Database/assets/71871927/7326ec1c-2673-49e7-b397-ae8a214ca266)

![image](https://github.com/qlkdkd/Database/assets/71871927/2f6113fc-a4f0-413e-b0b3-1b51ed47c966)

### 순수 관계 연산자-디비전(division)
* 표현법: $릴레이션1 \div 릴레이션2$
* 릴레이션1 $\div$ 릴레이션2은 릴레이션2의 모든 투플과 관련있는 릴레이션1의 투플로 결과 릴레이션을 구성한다.
    * 단, 릴레이션1이 릴레이션2의 모든 속성을 포함하고 있어야 연산이 가능함(도메인이 같아야 한다는 의미)
    * 정수의 나눗셈과 유사
 
![image](https://github.com/qlkdkd/Database/assets/71871927/8c09bc1d-b7db-492b-8d85-9be7f0665fdd)
![image](https://github.com/qlkdkd/Database/assets/71871927/b4c38b07-d1b7-4ad4-a301-0c398448be7c)


## 관계 대수를 이용한 질의 표현 예
* 사용자의 질의가 단순하여 앞서 살펴본 예처럼 한 가지 연산자만으로 표현이 가능한 경우도 있지만, 대부분 여러 연산지를 함께 사용해 복잡하게 표현되는 경우가 많다.
 ![image](https://github.com/qlkdkd/Database/assets/71871927/406e1cfe-bf89-42d1-b40e-23059334862d)

![image](https://github.com/qlkdkd/Database/assets/71871927/da5f07d6-38e0-43d6-9134-c23b5853acb2)
![image](https://github.com/qlkdkd/Database/assets/71871927/3233b5c2-ab0c-412b-9b58-86972f6ab133)
![image](https://github.com/qlkdkd/Database/assets/71871927/f9516b16-6287-42b0-b9e9-a178d6a9f9a7)

## 확장된 관계 대수 연산자-세미조인(semi-join)
* 조인 속성으로 프로젝트 연산을 수행한 릴레이션을 이용하는 조인
* 표현법: $릴레이션1 ⋉ 릴레이션2$
* 릴레이션2를 조인 속성으로 프로젝트 연산 후, 릴레이션1에 자연 조인하여 결과 릴레이션을 구성
* 불필요한 속성을 미리 제거하여 조인 연산 비용을 줄이는 장점이 있음
* 교환적 특징이 없음($R⋉S != S⋉R)$
![image](https://github.com/qlkdkd/Database/assets/71871927/74c45b36-d01c-430b-b7ae-e4115413589c)

## 확장된 관계 대수 연산자-외부 조인(outer join)
* 자연 조인 연산에서 제외되는 투플도 결과 릴레이션에 포함시키는 조인
    * 결과 릴레이션에 속성 값이 없는 경우 널 값으로 처리
* 분류
    * 왼쪽 외부조인(⟕): 왼쪽에 있는 릴레이션1에 존재하는 모든 투플을 결과 릴레이션에 포함시킴. 표현법: $릴레이션1 ⟕ 릴레이션2$
 ![image](https://github.com/qlkdkd/Database/assets/71871927/951b6d48-c14d-4630-9d6e-2efae4665874)
![image](https://github.com/qlkdkd/Database/assets/71871927/5c9fee39-936b-4caa-be95-dcba6b470ac4)

    * 오른쪽 외부조인(⟖): 오른쪽에 있는 릴레이션2에 존재하는 모든 투플을 결과 릴레이션에 포함시킴. 표현법: $릴레이션1 ⟖ 릴레이션2$
![image](https://github.com/qlkdkd/Database/assets/71871927/a4d6394f-37e9-4f29-aa2e-e75a13a11bc9)
![image](https://github.com/qlkdkd/Database/assets/71871927/068629e3-dd10-4237-88d6-2bb6eaf61216)

    * 완전 외부조인(⟗): 두 릴레이션에 있는 모든 투플을 결과 릴레이션에 포함시킴. 표현법: $릴레이션1 ⟗ 릴레이션2$
  ![image](https://github.com/qlkdkd/Database/assets/71871927/9d44974d-6409-45db-9d01-7b8a11d90beb)
![image](https://github.com/qlkdkd/Database/assets/71871927/07460c60-679e-4ec1-a8ae-28697bad880a)
![image](https://github.com/qlkdkd/Database/assets/71871927/2be9eae8-6142-4461-9d4e-82740beaf0ed)

---

# 3. 관계해석
* 처리를 원하는 데이터가 무엇인지만 기술하는 언어: 비절차 언어
* 수학의 프레디킷 해석에 기반을 두고 있음
* 기능과 표현력 측면에서 관계 대수와 동등한 능력을 가짐
* 분류: 투플 관계 해석, 도메인 관계 해석
 



