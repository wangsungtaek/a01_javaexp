/*
--[하] 1. self 조인이란 무엇인가? 개념을 기술하세요.
	하나의 테이블에 연관관계에 있는 컬럼을 처리할때 사용한다.
	SELECT A.컬럼1, B.컬럼2
	  FROM EMP A, EMP B
	 WHERE A.컬럼1 = B.컬럼2
*/
--[중] 2. company테이블을 만들고 아래와 같은 직책과 상위 관리자를 만들어 
--         @@@님의 현재 직잭은 @@이고 직속상관은 @@@이며 @@직책에 있다. 출력하세요.
-- 테이블 생성
CREATE TABLE COMPANY (
	NO NUMBER,
	NAME VARCHAR2(20),
	POS VARCHAR2(20),
	TOPNO NUMBER
);

-- 데이터 삽입
INSERT INTO COMPANY VALUES(1, '김회장', '대표',0);
INSERT INTO COMPANY VALUES(2, '김이사', '이사',1);
INSERT INTO COMPANY VALUES(3, '김과장', '과장',2);
INSERT INTO COMPANY VALUES(4, '이과장', '과장',2);
INSERT INTO COMPANY VALUES(5, '김대리', '대리',3);
INSERT INTO COMPANY VALUES(6, '송사원', '사원',5);

-- 데이터 조회
SELECT A.NAME||'님의 현재 직책은 '||A.POS||'이고, 직속상관은 '||
	   B.NAME||'이며 '||B.POS||'직책에 있다.' AS SHOW
  FROM COMPANY A, COMPANY B
 WHERE A.TOPNO = B.NO;

/*
--[하] 3. sub query란 무엇인가? 기본 예제를 통해 개념을 설명하세요.
	- SQL에 내부에서 사용하는 SELECT문을 의미한다.
	- 두 개 이상의 SQL문을 하나의 SQL문을 만드는 것
*/
SELECT *
  FROM EMP
 WHERE JOB = (
	SELECT JOB
	  FROM EMP
	 WHERE ENAME = 'ALLEN');

/*
--[하] 4. 단일행과 다중행 subquery의 차이점은 무엇인가 기술하세요.
	서브쿼리의 결과로 1개의 행이 조회되어 메인쿼리의 조건으로 사용하되는 것이 단일행이고,
	1개 이상의 행이 조회되어 메인쿼리의 조건으로 사용되는 것이 다중행이다.
*/
--[중] 5. 1981년 1~2사분기에 입사한 사람 중에서 가장 급여가 높은 사람 
--        보다 많은 사원의 정보를 출력하세요.
SELECT *
  FROM EMP
 WHERE SAL > (SELECT MAX(SAL)
			    FROM EMP
			   WHERE TO_CHAR(HIREDATE, 'Q') IN('1', '2'));

/*
--[하] 6. 다중행 subquery의 연산자에 대하여 차이점을 기술하세요.
	in : 결과값이 or 조건으로 처리해야할 필요가 있는 경우 활용된다.
	any, some : 결과값이 1개라도 있는 경우 min(조회데이터)과 동일
	all : 모든 결과값이 일치하는 경우 max(조회데이터)과 동일
*/		  
	