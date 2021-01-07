/*
# 조인이란?
1. 하나의 sql명령문에 의해 여러 테이블에 저장된 데이터를 한번에 조회할 수 있는 기능을 말한다.
2. 두개 테이블에서 공통되는 컬럼을 기준으로 조건문을 만들어, 조인을 한다.
3. 기본 형식
	select 테이블별칭.컬럼명, 테이블별칭.컬럼명 ..
	from 테이블1 별칭, 테이블2 별칭
	where 별칭.공통컬럼 = 별칭.공통컬럼
*/
SELECT *
  FROM EMP;
 -- dept는 첫번째 컬럼인 deptno를 통해서 부서 정보를 가지고 있다.
SELECT *
  FROM dept;
--사원별로 부서이름을 가져올려면 다음 같은 sql을 사용하여야 한다.
SELECT *
  FROM EMP
 WHERE DEPTNO = 20;
-- 부서테이블에서 부서 정보 sql를 사용하여 가져온다.
SELECT *
  FROM DEPT
 WHERE DEPTNO = 20;
-- 두 개의 테이블에 공통되는 부서번호(deptno)가 있기 때문에 한번에 join관계를 활용하면
-- 사원별로 부서정보(부서번호, 부서명, 부서위치)를 가져올 수 있다.
SELECT E.*, D.*
  FROM EMP E, DEPT D
 WHERE E.DEPTNO = D.DEPTNO;
-- 부서명, 사원명, 급여
SELECT D.DNAME, E.ENAME, E.SAL
  FROM EMP E, DEPT D
 WHERE E.DEPTNO = D.DEPTNO;
-- 
SELECT DEPTNO AS 부서번호, DNAME AS 부서이름, LOC AS 부서위치
  FROM DEPT;
-- ex) 사원번호, 사원명, 부서이름, 부서위치를 출력하세요
-- 컬럼명 해당 테이블 고유의 컬럼이면, 테이블의 별칭을 사용하지 않아도 된다.
SELECT EMPNO 사원번호, ENAME, DNAME, D.LOC
  FROM EMP E, DEPT D
 WHERE E.DEPTNO = D.DEPTNO;
-- 검색 조건의 추가 또는 기존의 여러가지 sql query 사용하기
-- 급여가 3000이상인 부서명, 부서위치, 사원명, 급여를 출력
SELECT DNAME, LOC, ENAME, SAL
  FROM EMP E, DEPT D
 WHERE E.DEPTNO = D.DEPTNO
   AND SAL >= 3000;
-- ex1) 3,4분기에 입사한 사원의 이름과 부서위치, 분기를 출력하세요.
SELECT ENAME, LOC, TO_CHAR(HIREDATE, 'Q')
  FROM EMP E, DEPT D
 WHERE E.DEPTNO = D.DEPTNO
   AND TO_CHAR(HIREDATE, 'Q') IN ('3','4');

-- ex2) 부서명별 최고 급여를 출력하세요. 부서명, 급여
SELECT DNAME, MAX(SAL)
  FROM EMP E, DEPT D
 WHERE E.DEPTNO = D.DEPTNO
GROUP BY DNAME;

/*
# 카티션 곱
1. 전체 데이터 내용을 리스트 처리하는 것을 말한다.
	where 조건을 걸지 않을 때, 연관 관계와 별도로 하나의 테이블의 하나의 행에
	반대쪽 테이블에 전체행이 연결되어 리스트 되어진다.
*/
SELECT E.*, D.*
  FROM EMP E, DEPT D;
SELECT E.*, D.*
  FROM EMP E CROSS JOIN DEPT D;
-- # equi join = natural join
-- 두 개의 공통되는 컬럼으로 조인을 하는 것을 말한다.
SELECT *
  FROM EMP NATURAL JOIN DEPT;

/*
# non-equi JOIN
1. 두개의 테이블에 조인할 조건 '=' (동일) 조건이 아니고, 범위를 지정할 때,
	활용된다.
*/
SELECT * FROM SALGRADE;
-- grade : 등급, losal : 최소, hisal : 최대범위
-- 사원의 이름과 급여, 등급을 표시하세요.
SELECT ENAME, SAL, GRADE
  FROM EMP E, SALGRADE S
 WHERE SAL BETWEEN LOSAL AND HISAL;

/*
# outer join
1. 두개의 테이블에서 equi join시, 한쪽에 해당 데이터가 없으면,
	나타나지 않는 특징이 있다. 일때, 특정한 테이블 기준으로 해당 테이블과
	조인하는 테이블이 데이터가 없더라도 데이터를 출력하게 해주는 join이 outer join이다.
*/
SELECT *
  FROM DEPT;
SELECT DISTINCT DEPTNO
  FROM EMP;
-- EMP에 있는 DEPTNO데이터와 DEPT에 있는 DEPTNO에는 차이가 발생한다.
-- 데이터의 존재여부에 상관없이 조인하여 현재 부서번에 따른 할당 내용을 확인하고자
-- outer join을 활용한다.
SELECT D.*, ENAME, JOB, SAL
  FROM DEPT D, EMP E
 WHERE D.DEPTNO = E.DEPTNO(+)
ORDER BY D.DEPTNO;

/*
# self 조인
1. 하나의 테이블 안에 컬럼끼리 연관관계가 있어, join형식으로 데이터를 처리하는
	것을 말한다.
2. 형식
	SELECT a.*, b.*
	  FROM 테이블1 a, 테이블2 b
	  where a.컬럼1 = b.컬럼2
*/
SELECT EMPNO, ENAME, MGR
  FROM EMP
 WHERE ENAME='SMITH';
SELECT EMPNO, ENAME
  FROM EMP
 WHERE EMPNO=7902;
-- 사원의 이름과 사원의 관리자 이름을 출력..
-- 1. 연관관계가 있는 컬럼을 선택 : empno, mgr
-- 2. 하나의 테이블을 두개로 alias이름으로 선언하고, 두 개의 컬럼을 연관관계를
--		설정한다.
SELECT A.EMPNO, A.ENAME, A.JOB, A.MGR, B.EMPNO, B.ENAME
  FROM EMP A, EMP B
 WHERE A.MGR = B.EMPNO;
 
/*
위 계층 관계의 테이블을 이해했으면, 아래와 같은 하나의 테이블 내에 계층 관계가 있는
데이터를 처리해보세요.
family
no(번호)	pos(역할)	name(이름)	parno(부모번호)
1			할아버지	홍말순		0
2			아버지		홍판서		1
3			아들1		홍진희		2
4			아들2		홍길동		2
sample 데이터를 3개이상 입력해보세요.
2. 데이터 입력
3. sql이용해서 @@@의 아버지는 이름 @@@이다. 출력
 */ 
-- 테이블 생성
CREATE TABLE FAMILY (
	NO NUMBER,
	POS VARCHAR2(20),
	NAME VARCHAR2(20),
	PARNO NUMBER
);

-- 테이블 삭제
DROP TABLE FAMILY;

-- 테이블 입력
INSERT INTO FAMILY VALUES(1, '할아버지', '홍말순', 0);
INSERT INTO FAMILY VALUES(2, '아버지', '홍판서', 1);
INSERT INTO FAMILY VALUES(3, '아들1', '홍진희', 2);
INSERT INTO FAMILY VALUES(4, '아들2', '홍길동', 2);
INSERT INTO FAMILY VALUES(5, '딸', '홍미자', 3);
INSERT INTO FAMILY VALUES(6, '손녀', '홍현희', 5);
INSERT INTO FAMILY VALUES(7, '초기유닛', '라바1', 0);
INSERT INTO FAMILY VALUES(8, '1차유닛', '드론1', 7);
INSERT INTO FAMILY VALUES(9, '1차유닛', '저글링', 7);

SELECT F1.NAME||'의 부모의 이름 '||F2.NAME||'이다' AS SHOW
  FROM FAMILY F1, FAMILY F2
 WHERE F1.PARNO = F2.NO;
