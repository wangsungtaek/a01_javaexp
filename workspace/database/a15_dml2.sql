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