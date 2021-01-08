--[하] 1. exists, not exists 연산자의 기능과 기본예제를 기술하세요.
-- EXISTS : 서브쿼리 결과가 1개 이상이면 조건식이 true, 그렇지 않으면 false가 된다.
-- sub_quary에 데이터가 있을 때,
SELECT *
  FROM EMP
 WHERE EXISTS(SELECT *
			    FROM EMP
			   WHERE COMM IS NOT NULL);
			  
-- sub_quary에 데이터가 없을 때,
SELECT *
  FROM EMP
 WHERE EXISTS(SELECT *
			    FROM EMP
			   WHERE DEPTNO = 40);

--[하] 2. sql을 통해서 부서번호 40이 없을 때, 부서번호 10인 데이터를 조회하는 처리를 하세요.
SELECT *
  FROM EMP
 WHERE DEPTNO = 10
   AND EXISTS (SELECT *
				 FROM EMP
				WHERE DEPTNO <> 40);
			  
--[하] 3. 데이터의 단일행 입력 구문 2가지 형식과 예제를 통해 처리해 보세요.
-- 특정열을 명시하는 경우 (INSERT INTO 테이블명(컬럼1, 컬럼2) VALUES(데이터1, 데이터2))
INSERT INTO EMP11(EMPNO, ENAME, SAL) VALUES(5005, '왕성택', 6000);
-- 전체열에 데이터를 넣는 경우 (INSERT INTO 테이블명 VALUES(데이터1, 데이터2, ..))
INSERT INTO EMP11 
	 VALUES(5005, '왕성택', '과장',
			7902, SYSDATE, 5000, NULL, 30);
		
--[하] 4. 복사테이블 emp15(구조만 복사)를 만들고, ename/job의 크기를 50으로 변경하고, 
--        데이터를 입력처리(전체데이터입력, 부분컬럼입력) 하세요

		-- EMP테이블 복사(구조만)
CREATE TABLE EMP15 AS SELECT * FROM EMP WHERE 1=0;

-- 테이블 특정열 데이터 타입 변경(사이즈)
ALTER TABLE EMP15 MODIFY ENAME VARCHAR2(50);
ALTER TABLE EMP15 MODIFY JOB VARCHAR2(50);

-- 데이터 삽입(전체 컬럼)
INSERT INTO EMP15
	 VALUES (5000, '테스트1', '방송인', 4000, TO_DATE('2001-05-07', 'YYYY/MM/DD'),
	 		 3500, NULL, 30);
-- 데이터 삽입(특정 컬럼)
INSERT INTO EMP15(EMPNO, ENAME, JOB, SAL, DEPTNO)
	 VALUES	(5001, '테스트2', '운동인', 3000, 10);

SELECT * FROM EMP15;
--[하] 5. 다중행 insert 형식을 기술하세요.
-- 기본형식 : INSERT INTO 테이블명 서브쿼리
-- EMP테이블의 다중행 데이터를 EMP15의 서브쿼리로 사용하여 다중행 입력
INSERT INTO EMP15
SELECT *
  FROM EMP
 WHERE SAL > 2900;

--[중] 6. 부서별 최고급여의 구조와 데이터를 가진 복사 테이블 emp20을 만들고, emp20테이블에 subquery를 활용하여,
--        부서번호 10 데이터를 입력하세요.
-- 테이블 복사(EMP테이블의 부서별 최고급여 받는 사람의 데이터)
CREATE TABLE EMP20 AS
SELECT *
  FROM EMP
 WHERE (DEPTNO, SAL)
	IN (SELECT DEPTNO, MAX(SAL)
  		  FROM EMP
	  GROUP BY DEPTNO);

-- 서브쿼리를 사용하여 부서번호10 데이터 입력
INSERT ALL INTO EMP20(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
 		 VALUES (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
		 SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
		   FROM EMP
		  WHERE DEPTNO = 10;

SELECT * FROM EMP20;


--[하] 7. emp21,emp22,emp23 테이블을 만들고, 급여 2000인 이상의 데이터를 각 테이블에 입력 처리하세요.
-- 테이블 생성
CREATE TABLE EMP21 AS SELECT * FROM EMP WHERE 1=0;
CREATE TABLE EMP22 AS SELECT * FROM EMP WHERE 1=0;
CREATE TABLE EMP23 AS SELECT * FROM EMP WHERE 1=0;

-- 데이터 삽입
INSERT ALL
	INTO EMP21(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
	INTO EMP22(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
	INTO EMP23(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
  FROM EMP
 WHERE SAL >= 2000;

-- 데이터 조회
SELECT * FROM EMP21;
SELECT * FROM EMP22;
SELECT * FROM EMP23;

--[하] 8. 수정문의 기본형식을 기술하세요.
-- 형식 : UPDATE 테이블이름 
--			 SET 컬럼1=변경할데이터,
--			  	 컬럼2=변경할데이터,
--			 	 컬럼3=변경할데이터
-- 		   WHERE 조건식
UPDATE EMP21
   SET DEPTNO = 40
 WHERE SAL > 3000;

--[중] 9. emp10 테이블에서 입사일이 2000년도 이전 데이터에 대하여, 입사년도는 + 10(년)을 더하고, 급여는 +1000을 더하여
--       수정 처리하세요.
UPDATE EMP10 
   SET HIREDATE = ADD_MONTHS(HIREDATE, 120),
	   SAL = SAL + 1000
 WHERE TO_NUMBER(TO_CHAR(HIREDATE, 'YYYY')) < 2000;