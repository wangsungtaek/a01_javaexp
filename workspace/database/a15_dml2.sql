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