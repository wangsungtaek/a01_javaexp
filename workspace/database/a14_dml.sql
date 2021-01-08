/*
# DML (Data munipuration Language) 
1. 회원을 등록을 처리한다면, 실제 프로그램에서 어떤 과정을 거치면서 진행될까?
	요구사항을 정리하여, 저장할 데이터를 나열, data를 저장할 테이블 만들고,
	사용할 sql(insert, sql)을 통해서 입력을 확인.
	요구사항에 의해, 화면설계서 작성, html을 통해서 화면구현(form을 통해 전송할페이지 지정)
	jsp를 통해서 받은 데이터를 java를 통해 데이터를 입력 처리.
	일때, insert라는 구문을 통해서 데이터 입력 처리.
2. 게시판의 리스트내용을 확인하고, 클릭시, 상세화면이 나오고, 수정/삭제 버튼을 통해서
	해당 게시물에 대한 변경과 삭제를 처리한다. - db에서 처리해주는 프로세스 무엇일까?
	수정/삭제 버튼 클릭시 요청값으로 서버에 전달, jsp를 통해서 수정하는/삭제하는 객체를
	통해서 DB에 있는 내용을 수정 삭제 처리한다.
3. 위에 있는 화면에 데이터를 입력/수정/삭제 시, 네트웍상 문제가 발생하거나 잘못된 프로그램이나
	사용에 의해서 정상적으로 처리되지 않았을 때, 어떤 처리과정이 필요할까?
	- 프로그램적으로 exception, database 서버에서도 transaction 처리로
		rollback(원복)를 하여야 한다. DML을 처리할 때, 위와같은 상황에서도 데이터의
		신뢰성 확보를 위해 transaction처리(commit/rollback)을 한다.
		
# 학습목표
1. 데이터를 처리하는 항목 중에 DML이라는 개념을 이해한다.
2. 여러가지 DML의 기본 문법을 알고, 실제 프로그래밍에서 활용할 수 있다.
3. DML에서 단일 데이터 변경과 다중 데이터 변경 개념을 알고 활용할 수 있다.
4. subquery를 이용한 DML 처리할 수 있다.
5. transaction 개념을 알고, 필요한 transaction을 처리할 수 있다.

# 목차
1. 데이터 조작어
2. 데이터 입력
3. 데이터 수정
4. 데이터 삭제
5. 트랜잭션 관리
6. 기타 데이터 처리

# 데이터 조작어(Data manipulation Language)
1. 테이블에 새로운 데이터를 입력하거나 기존 데이터를 수정 또는 삭제하기 위한 명령이다.
2. 종류
	insert : 입력 처리 명령어
	update : 수정 처리 명령어
	delete : 삭제 처리 명령어
	marge : 병합처리 명령어(논리적 테이블의 병합-수정과 동시에 입력)
3. 트랜잭션
	여러 개의 명령문을 하나의 논리적인 작업단위로 처리하는 기능을 말한다.
	명령어 종류 : commit(정상종료 확정), rollback(비정상종료 복구)

# 데이터 입력 처리
1. 테이블에 데이터를 입력하기 위한 명령어 insert 구문을 말한다.
2. 입력방법
	1) 단일 행 입력 : 한 번에 하나의 행을 테이블에 입력하는 구문
	2) 다중 행 입력 : 서브 쿼리(subquery)를 이용하여 한번에 여러 행을 동시에 입력하는 구문
3. 단일행 입력 방법
	1) 기본 구문
		insert into 테이블명(컬럼1, 컬럼2...) values(데이터1, 데이터2);
		insert into 테이블명 values(테이블 구조 순서에 따른 데이터1, 데이터2);
*/
-- 복사테이블 만들기
-- create table 테이블명
-- as select * from 테이블명 : 구조와 데이터 모두 복사해서 새로운 테이블 생성.
-- create table 테이블명
-- as select * from 테이블명 where 1=0; : 구조 복사해서 새로운 테이블 생성.
CREATE TABLE emp10
AS SELECT * FROM EMP;

CREATE TABLE EMP11
AS SELECT * FROM EMP WHERE 1=0;

-- 테이블 데이터타입 변경
ALTER TABLE EMP10 MODIFY ENAME VARCHAR2(30);
ALTER TABLE EMP10 MODIFY JOB VARCHAR2(30);
-- 단일 전체 데이터 입력
-- to_date('2021/01/01', 'YYYY/MM/DD'); : 특정 날짜 입력
-- SELECT TO_DATE('2021/01/01', 'YYYY/MM/DD') FROM DUAL;
INSERT INTO EMP10 VALUES(5000, '홍길동', '사원', 7902, SYSDATE, 3000, 100, 10);
INSERT INTO EMP10 VALUES(5001, '신길동', '대리', 7902, TO_DATE('2021/01/01', 'YYYY/MM/DD'),
						 4000, 200, 20);

-- ex1) EMP10에 본인 이름과 생일로 데이터를 등록해보세요.
INSERT INTO EMP10 VALUES(5002, '왕성택', '대리', 7902, TO_DATE('1991/11/15', 'YYYY/MM/DD'),
						 4000, 400, 30);
						
-- INSERT INTO 테이블명(컬럼1, 컬럼2..) VALUES(데이터1, 데이터2);
INSERT INTO EMP10(EMPNO, ENAME, SAL, DEPTNO)
		VALUES(5003, '신철환', 7698, 40);

-- ex) 사원이름, 직책, 입사일을 입력하세요.
INSERT INTO EMP10(ENAME, JOB, HIREDATE)
		VALUES('김도희', 'developer', SYSDATE);
	
-- 명시적으로 NULL 입력
INSERT INTO EMP10 VALUES(5004, '민현식', NULL, 7902, NULL,
						 3500, 100, 20);
						
/*
# 다중행 입력
1. 데이터를 하나의 테이블에 여러 행을 한번에 입력하는 query를 말한다.
2. 형식
	1) insert명령문에서 서브쿼리로 다른 테이블에서 조회해 와서 입력처리.
	2) insert명령문에 의해 한 번에 여러행을 동시에 입력
	3) 아래의 형식
		insert all
		first insert
 **/
-- sub_query를 이용한 입력
SELECT *
  FROM EMP10
 WHERE EMPNO BETWEEN 5000 AND 6000;

INSERT INTO EMP11
SELECT *
  FROM EMP10
 WHERE EMPNO BETWEEN 5000 AND 6000;

-- ex)EMP10의 구조만 복사된 복사테이블을 만들고,
--		EMP테이블에서 부서번호가 10인 데이터를 subquery에 입력하세요
-- 1) EMP테이블 구조 복사
CREATE TABLE EMP12 AS SELECT * FROM EMP10 WHERE 1=0;
-- 2) 데이터 입력
INSERT INTO EMP12
SELECT *
  FROM EMP
 WHERE DEPTNO = 10;

DROP TABLE EMP12;
SELECT * FROM EMP;
SELECT * FROM EMP10;
SELECT * FROM EMP11;
SELECT * FROM EMP12;

/*
# 다중행 입력 - insert all 명령어
1. 서브쿼리의 결과 결합을 조건없이 여러 테이블에 동시에 입력
2. 형식
	insert all|first : all(전체), first(첫번째 데이터)
	insert 테이블1 values (데이터1, 데이터2..);
	insert 테이블2 values (데이터1, 데이터2..);
	insert 테이블3 values (데이터1, 데이터2..);
	서버쿼리;
*/
CREATE TABLE EMP16 AS SELECT * FROM EMP10 WHERE 1=0;
CREATE TABLE EMP17 AS SELECT * FROM EMP10 WHERE 1=0;
CREATE TABLE EMP18 AS SELECT * FROM EMP10 WHERE 1=0;
-- INTO EMP16(컬럼명1, 컬럼명2, 컬럼명3) VALUES(subquery에서온 데이터1, 데이터2, 데이터3)
INSERT ALL
INTO EMP16(EMPNO, ENAME, DEPTNO) VALUES(EMPNO, ENAME, DEPTNO)
INTO EMP17(EMPNO, ENAME, DEPTNO) VALUES(EMPNO, ENAME, DEPTNO)
INTO EMP18(EMPNO, ENAME, DEPTNO) VALUES(EMPNO, ENAME, DEPTNO)
SELECT EMPNO, ENAME, DEPTNO
  FROM EMP10
 WHERE DEPTNO = 10;
 
SELECT * FROM EMP16;
SELECT * FROM EMP17;
SELECT * FROM EMP18;