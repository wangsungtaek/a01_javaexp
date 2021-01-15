/*
# 데이터 무결성 제약조건
1. 학습목표
	1) 데이터의 제약조건에 대한 개념을 이해한ㄴ다.
	2) 테이블의 생성시, 제약조건을 설정해야 하는 경우와
		실제 코드로 제약조건을 생성할 수 있다.
	3) 업무에 따라서 제약조건에 대하여 효과적으로 생성한다.
2. 주요 키워드
	1) primary key : not null (반드시 입력)
					+ unique(유일한 데이터)
	2) not null : 반드시 입력해야 할 때.
	3) unique : 고유키
	4) check : 해당 컬럼에 저장 가능한 데이터의 값의 범위나 조건 지정
	5) constraint : 제약조건을 설정할 때, 선언되는 명명
	6) references : 참조키를 설정할 때, 활용된다.
	7) foreign : 한열과 참조된 테이블 열간의 외래 키 설정..
3. 퀴즈
	1) 테이블의 모든 행에 고유한 값을 갖는 열 또는 열조합 지정 키?
		unique key
	2) 유니크와 not null을 혼합한 키?
	3) 다른 테이블의 컬럼을 참조할 때 쓰이는 키와 참조라는 의미의 키워드?
		foreign key, refereneces

4. 키를 먼저 설정해 봅시다.
	기본 형식
	create table 테이블명(
		컬럼명 데이터유형 constraint 제약키이름 제약키
	);
*/
CREATE TABLE STUDENT01(
	STUDNO NUMBER CONSTRAINT STUD_STUDNO_PK PRIMARY KEY,
	NAME VARCHAR2(30)
);

-- 데이터 입력..
SELECT * FROM STUDENT01;
INSERT INTO STUDENT01 VALUES(1, '홍길동');
INSERT INTO STUDENT01 VALUES(2, '홍길동');
INSERT INTO STUDENT01 VALUES(NULL, '홍길동');
INSERT INTO STUDENT01 VALUES('홍길동');

DROP TABLE STUDENT01;
-- ex) product01 만들고 물건고유번호, 물건명, 가격에 대하여 물건고유번호를 primary
--		key로 설정해서 데이터를 입력해보세요.
CREATE TABLE PRODUCT01  (
	NUM NUMBER CONSTRAINT NUM_PK PRIMARY KEY,
	PRODUCT VARCHAR2(20),
	PRICE NUMBER
);
SELECT * FROM PRODUCT01;
INSERT INTO PRODUCT01 VALUES (1, '사과', 5000);
INSERT INTO PRODUCT01 VALUES (2, '사과', 5000);
-- primary key는 null이 아니고 식별할 수 있는 데이터를 입력하여야 한다.
-- ALL_CONSTRAINTS : 데이터베이스의 데이터베이스 - 메타데이터
-- 제약사항에 대한 정보를 확인할 수 있다.
-- CONSTRAINTS_NAME 컬럼으로 제약사항의 이름을 확인
-- 사용자 정의 제약이름과 시스템에서 자동으로 생성된 제약이름을 구분할 수 있다.
SELECT * FROM ALL_CONSTRAINTS
WHERE TABLE_NAME = 'PRODUCT01';
/*
# NOT NULL : 반드시 데이터를 입력해야하는 제약조건 설정.
	1. 기본형식 : constraint 제약조건이름 not null
	2. 제약조건이름 : 테이블명_컬럼명_nn
*/
CREATE TABLE STUDENT_NN_EXP(
	NAME VARCHAR2(50) CONSTRAINT STUDENT_NN_EXP_NAME_NN
	NOT NULL
);
INSERT INTO STUDENT_NN_EXP VALUES('홍길동');
SELECT * FROM STUDENT_NN_EXP;
INSERT INTO STUDENT_NN_EXP VALUES(null);
SELECT * FROM ALL_CONSTRAINTS
WHERE TABLE_NAME = 'STUDENT_NN_EXP';

-- ex) STUDENT02 테이블을 만들고,
--		학번, 이름, 국어, 영어, 수학 점수 컬럼 설정.
--		학번을 primary key, 이름은 not null을 설정하고,
--		데이터값의 입력을 통해 제약조건을 확인하세요.
CREATE TABLE STUDENT02 (
	NO NUMBER CONSTRAINT NO_PK PRIMARY KEY,
	NAME VARCHAR2(20) CONSTRAINT NAME_NN NOT NULL,
	KOR NUMBER,
	ENG NUMBER,
	MATH NUMBER
);
INSERT INTO STUDENT02 VALUES(1, '김영진', 90, 90, 90);
INSERT INTO STUDENT02 VALUES(1, '김영진', 90, 90, 90);
SELECT * FROM STUDENT02;
SELECT * FROM ALL_CONSTRAINTS
WHERE TABLE_NAME = 'STUDENT02';
