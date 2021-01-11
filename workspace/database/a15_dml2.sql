/*
# 데이터 수정
1. update 명령문은 테이블에 저장된 데이터 수정을 위한 조작어이다.
2. 기본형식
	update 테이블명
	set 컬럼1 = 변경할데이터,
		컬럼2 = 변경할데이터,
		컬럼3 = 변경할데이터
	where 조건문
3. 주의사항
	1) where 절을 생략하면 테이블의 모든 행이 수정된다.
	2) 조건문과 변경할 데이터부분 subquery를 이용하여 처리할 수 있다.
*/

-- 사원이름이 '김도희'를 사원번호, 직책, 관리자번호, 급여, 보너스, 부서번호 수정 처리
UPDATE EMP10
   SET EMPNO = 5005,
   	   MGR = 7698,
   	   SAL = 3600,
   	   COMM = 500,
   	   DEPTNO = 40
 WHERE ENAME = '김도희';
 
-- ex) 5003과 5004에 null로 된 데이터를 update 구문을 이용해서 수정 처리하세요
UPDATE EMP10
   SET JOB = '과장',
   	   MGR = 7698,
   	   HIREDATE = SYSDATE,
   	   COMM = 100
 WHERE EMPNO = 5003;
UPDATE EMP10
   SET JOB = '대리',
   	   HIREDATE = SYSDATE,
   	   COMM = 100
 WHERE EMPNO = 5004;
 
SELECT * FROM EMP10;

/*
# subquery를 통한 수정 처리
1. update명령문에 set절에 서브쿼리를 이용하여 수정 처리하는 것을 말한다.
2. 다른 테이블이나 현재 테이블의 정보를 변경할 때, 활용할 수 있다.
3. 변경할 컬럼의 타입과 갯수는 반드시 일치 하여야 한다.
*/

-- 부서번호 10인 사원의 급여
SELECT SAL
  FROM EMP10
 WHERE DEPTNO = 10;

SELECT MAX(SAL)
  FROM EMP10
 WHERE DEPTNO = 20;
-- update 구문의 subquery은 해당하는 컬럼에 맞는 하나의
-- 결과이기에 = (대입)으로 처리한다.
-- 1) 한개의 컬럼	SET 컬럼1 = (SELECT 1개의 결과 컬럼)
-- 2) 한개이상의 컬럼
--		SET(컬럼1, .. 컬럼n) = (SELECT n개의 결과 컬럼)

UPDATE EMP10
   SET SAL = (SELECT MAX(SAL)
		   		FROM EMP10
   			   WHERE DEPTNO = 20)
 WHERE DEPTNO = 10;
 
SELECT * FROM EMP10;


-- ex) JOB이 SALESMAN의 평균 급여를 사원번호 7499에 할당하세요.
UPDATE EMP10
   SET SAL = (SELECT TRUNC(AVG(SAL))
			    FROM EMP10
			   WHERE JOB = 'SALESMAN')
 WHERE EMPNO = 7499;

-- 사원번호 7369의 급여를 부서번호 30의 평균급여와 부서번호로 변경처리
SELECT TRUNC(AVG(SAL))
  FROM EMP10
 WHERE DEPTNO = 30;

UPDATE EMP10
   SET (DEPTNO, SAL) = (SELECT DEPTNO, TRUNC(AVG(SAL))
			    		  FROM EMP10
		 				 WHERE DEPTNO = 30
					  GROUP BY DEPTNO)
 WHERE EMPNO = 7369;

-- ex) SALESMAN의 평균급여를 사원번호 7566인 사람의 JOB과 급여를 수정처리하자.
UPDATE EMP10
   SET (JOB, SAL) = (SELECT JOB, ROUND(AVG(SAL))
					   FROM EMP10
					  WHERE JOB = 'SALESMAN'
				   GROUP BY JOB)
 WHERE EMPNO = 7566;

SELECT * FROM EMP10;

/*
# 삭제(delate)
1. 행단위로 데이터를 삭제하는 구문을 말한다.
2. 기본형식
	delete
	from 테이블명
	where 조건;
	행단위로 삭제가 되기 때문에 delete 구문이하의 컬럼을 정할 필요가 없다.
*/
-- 7369인 데이터를 삭제 처리
DELETE
  FROM EMP10
 WHERE EMPNO = 7369;

-- subquery를 이용
DELETE
  FROM EMP10
 WHERE SAL < ( SELECT AVG(SAL)
 			 	 FROM EMP10);

-- ex1) job이 CLERK인 데이터를 삭제 처리
DELETE
  FROM EMP11
 WHERE JOB = 'CLERK';

-- ex) 부서번호 30의 SAL평균을 기준으로 그 이하인 데이터를 삭제 처리
DELETE
  FROM EMP11 
 WHERE SAL < (SELECT AVG(SAL)
			    FROM EMP11
			   WHERE DEPTNO = 30);

CREATE TABLE EMP11 AS SELECT * FROM EMP;
SELECT * FROM EMP11;
DROP TABLE EMP11;

/*
# merge
1. 변경 내지 입력할 데이터의 구조가 같은 두 개의 테이블을
비교하여 하나의 테이블로 합치기 위한 오라클에서 지원하는 데이터 조작어.
2. 조건문을 이용해서 해당 테이블 특정한 컬럼값이 있으면 update구문
처리하고, 데이터가 없으면 insert구문을 처리한다.
3. 기본 형식
	MERGE INTO 테이블명 A
	USING 테이블명 B
	ON A와 B의 특정한 컬럼 비교
	WHEN MATHCHED THEN : 두개의 테이블의 특정 컬럼에 데이터가 있을 때.
		UPDATE SET : 수정 처리..
	WHEN NOT MATHCHED THEN
		INSERT INTO VALUES : 등록 처리
*/
CREATE TABLE EMP30
AS SELECT * FROM EMP;
CREATE TABLE EMP31
AS SELECT * FROM EMP WHERE 1=0;
SELECT * FROM EMP30;
SELECT * FROM EMP31;

--1) 두개의 테이블의 비교를 통해 입력하기..
MERGE INTO EMP31 S
USING EMP30 T
ON (S.EMPNO = T.EMPNO)
WHERE MATCHED THEN
	UPDATE SET S.ENAME = T.ENAME,
			   S.JOB = T.JOB,
			   S.SAL = T.SAL
WHERE NOT MATCHED THEN
	INSERT (EMPNO, ENAME, SAL, DEPTNO)
	VALUES (T.EMPNO, T.ENAME, T.SAL, T.DEPTNO);

SELECT * FROM EMP30;
SELECT * FROM EMP31;

--2) 가상의 테이블로 데이터 입력 처리
-- 8000, '홍길동' 프로그램을 통해서 전달된 입력값...
-- 해당 데이터의 KEY인 EMPNO가 있으면 수정이 되고, 없으면 등록 처리되는 내용
MERGE INTO EMP31 S
USING DUAL
ON(S.EMPNO = 8000)
WHEN MATCHED THEN
	UPDATE SET S.ENAME = '신길동'
WHEN NOT MATCHED THEN
	INSERT (S.EMPNO, S.ENAME)
	VALUES (8000, '홍길동');
SELECT * FROM EMP31;

-- EX) EMP32테이블로 구조만 복사된 테이블을 만들고,
--		전체데이터 기준으로 수정/등록되게 3개정도 데이터를 입력/수정 테스트 해보세요.

-- 테이블 구조 복사
CREATE TABLE EMP32 AS SELECT * FROM EMP WHERE 1=0;

MERGE INTO EMP32 S
USING DUAL
ON(S.EMPNO = 8003)
WHEN MATCHED THEN
	UPDATE SET S.ENAME = '오길동', S.JOB = '대리', S.MGR = 7999, S.HIREDATE = SYSDATE
WHEN NOT MATCHED THEN
	INSERT
	VALUES(8003, '하길동', '사원', 7999, SYSDATE, 3000, 100, 10);
-- MERGE INTO EMP32에서 대상 테이블을 지정했기 때문에,
-- INSERT 구문의 기본형식인 INTO 테이블명을 지정하지 않아야 된다.

SELECT * FROM EMP32;

-- EX) EMP33테이블을 구조만 복사한 테이블로 만들고,
--		EMP30기준되는 데이터 EMPNO컬럼으로 사원명, 부서명, 입사일을
--		MERGE처리하세요
CREATE TABLE EMP33 AS SELECT * FROM EMP WHERE 1=0;
MERGE INTO EMP33 S
USING EMP30 T
ON(S.EMPNO = T.EMPNO)
WHEN MATCHED THEN
	UPDATE SET S.ENAME = T.ENAME,
			   S.DEPTNO = T.DEPTNO,
			   S.HIREDATE = T.HIREDATE
WHEN NOT MATCHED THEN
	INSERT (EMPNO, ENAME, DEPTNO, HIREDATE)
	VALUES (T.EMPNO, T.ENAME, T.DEPTNO, T.HIREDATE);

SELECT * FROM EMP30;
SELECT * FROM EMP33;