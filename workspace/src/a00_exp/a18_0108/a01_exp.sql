/*
--[하] 1. subquery를 통한 수정 처리 기본형식을 기술하세요
	UPDATE 테이블명
	   SET 컬럼1 = 변경할데이터
	 WHERE 조건문(서브쿼리)
*/
--[하] 2. job이 CLERK이고 부서번호가 20인 사람을 SAL와 COMM을 각각20% 인상
--      처리 하세요.
UPDATE EMP17
   SET SAL = SAL * 1.2,
  	   COMM = COMM * 1.2
 WHERE JOB = 'CLERK'
   AND DEPTNO = 20;

SELECT * FROM EMP17;
--[하] 3.  comm이 null이거나 0인데이터를 sal의 15%로 comm으로 지정하고, 
--      hiredate를  2000-01-01로 변경하세요.
UPDATE EMP17
   SET COMM = SAL * 0.15,
   	   HIREDATE = TO_DATE('2000-01-01', 'YYYY-MM-DD')
 WHERE EMPNO IN (SELECT EMPNO
				   FROM EMP17
				  WHERE COMM IS NULL
				     OR COMM = 0);
SELECT * FROM EMP17;
-- 풀이
UPDATE EMP15
  SET COMM = (SAL * 0.15),
      HIREDATE = TO_DATE('2000/01/01', 'YYYY/MM/DD')
 WHERE NVL(COMM, 0) = 0;


--[중] 4. emp21복사테이블을 만들고, 부서별 최고 급여자의 사원번호를 확인하고, 
--        10=>20, 20=>30, 30 => 10으로 변경하고, 평균 급여로 변경
--        처리하세요.
-- 테이블 복사
CREATE TABLE EMP21 AS SELECT * FROM EMP;
 
-- 부서별 최고 급여자
SELECT EMPNO, SAL, DEPTNO
  FROM EMP21
 WHERE (DEPTNO, SAL) IN(SELECT DEPTNO, MAX(SAL)
					      FROM EMP21
					  GROUP BY DEPTNO);
					 
-- 부서 변경및 급여 업데이트					 
UPDATE EMP21
   SET DEPTNO = CASE DEPTNO WHEN 10 THEN 20 WHEN 20 THEN 30 WHEN 30 THEN 10 END,
   		  SAL = (SELECT FLOOR(AVG(SAL)) FROM EMP21)
 WHERE EMPNO IN(SELECT EMPNO
  				  FROM EMP21
				 WHERE (DEPTNO, SAL) IN(SELECT DEPTNO, MAX(SAL)
				  						  FROM EMP21
				  					  GROUP BY DEPTNO));

SELECT * FROM EMP21;
/*
--[하] 5. 삭제구분의 기본형식을 기술하세요
	DELETE
	  FROM 테이블이름
	 WHERE 조건문
*/
--[하] 6. emp22복사 테이블 만들고, 부서별 최저 급여 데이터를 삭제 처리하세요.
-- 테이블 생성
CREATE TABLE EMP22 AS SELECT * FROM EMP;

DELETE
  FROM EMP22
 WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, MIN(SAL)
						   FROM EMP22
					   GROUP BY DEPTNO);
SELECT * FROM EMP22;
