/*
--[하] 1. 테이블 구조변경 형식을 기본 예제와 함께 기술하세요.
	ALTER TABLE 테이블명
	MODIFY 컬럼명 타입
*/
ALTER TABLE TEST
MODIFY EMPNO VARCHAR(10);

SELECT * FROM TEST;
/*
--[하] 2. 테이블 구조변경의 한계(데이터 입력, 유형, 크기 별로)를 기술하세요.
	1) 기존 컬럼에 데이터가 없는 경우
		컬럼 타입이나 크기 변경이 가능하다
		ex) 큰 데이터 할당 ==> 작은 데이터 할당으로 변경도 가능하다.
	2) 기존 컬럼에 데이터가 있는 경우
		- 타입변경 char, varchar2허용
		- 변경한 컬럼의 크기가 저장된 데이터의 크기보다 같거나 클 경우만 가능
		(1) key(primary key) empno와 함께 특정 임시컬럼으로 저장
		(2) update 테이블명
				set 컬럼명 = null;
		(3) 컬럼 타입변경.
		(4) 해당 타입에 맞는 유형을 to_xxx()함수를 이용해서 할당 후
		(5) 필요없는 임시컬럼을 삭제 처리

# 데이터가 있는 경우
	1. 문자열(char, varchar2)
		- 현재 입력된 데이터의 크기 범위 안에서 작거나 크게 변경이 가능하다.
			입력된 데이터가 varchar2(10), length(컬럼명) 10이하일 때,
			20로 변경하고 다시 11로 변경은 가능하다.
			그러나, 10이하로 변경은 에러가 발생	
	2. 숫자형
		- 입력된 데이터 상관없이 정밀도를 한번 크게 변경이 되면,
			다시 작게 변경이 불가능하다.
**/

--[중] 3. 테이블 구조복사 종합예제
--    1) emp54으로 구조복사해서 테이블 만들고,
--    2) 테이블을 dname, position 를 추가. 
--       grade char(1) 추가
--       tmp_empno char(10)로 추가
--    3) 입사년월(4)부서번호(2)사원번호(4) 로 tmp_empno 할당 처리,
--    4) subquery를 이용해서 해당 데이터에 맞게 데이터를 입력처리.
--        grade는 sal의 등급에 따라 5000이상 A, 4000 이상 B, .. C...로 할당 처리.
--    5) hiredate는 credte로 변경 char(8)  YYYYMMDD  변경처리
--    6) empno 컬럼 삭제 처리, tmp_empno는 empno로 컬럼명 변경

-- 1) 구조복사
CREATE TABLE EMP54 AS SELECT * FROM EMP WHERE 1=0;

-- 2) dname, position, grade, tmp_empno 추가
ALTER TABLE EMP54
ADD (DNAME VARCHAR2(14),
	 POSITION VARCHAR2(15),
	 GRADE CHAR(1),
	 TEMP_EMPNO CHAR(10));
	
-- 3, 4) 데이터 입력
INSERT INTO EMP54
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM,
	   D.DEPTNO, D.DNAME, D.LOC,
	   CASE
	   		WHEN SAL>=5000 THEN 'A'
	   		WHEN SAL>=4000 THEN 'B'
	   		WHEN SAL>=3000 THEN 'C'
	   		WHEN SAL>=2000 THEN 'D'
	   		WHEN SAL>=1000 THEN 'E'
	   		ELSE 'F'
	   END AS GRADE,
	   TO_CHAR(HIREDATE, 'YYMM')||E.DEPTNO||E.EMPNO AS TEMP_EMPNO
  FROM EMP E, DEPT D, SALGRADE S
 WHERE E.SAL BETWEEN LOSAL AND HISAL
   AND E.DEPTNO = D.DEPTNO;

-- 5) hiredate는 credte로 변경 char(8)  YYYYMMDD  변경처리
ALTER TABLE EMP54
RENAME COLUMN HIREDATE TO CREDTE;

UPDATE EMP54
   SET CREDTE = NULL;
  
ALTER TABLE EMP54
MODIFY CREDTE CHAR(8);
  
UPDATE EMP54 A
   SET CREDTE = (SELECT TO_CHAR(HIREDATE, 'YYYYMMDD')
				   FROM EMP B
				  WHERE A.EMPNO = B.EMPNO);
				 
-- 6) empno 컬럼 삭제 처리, tmp_empno는 empno로 컬럼명 변경
ALTER TABLE EMP54
DROP COLUMN EMPNO;

ALTER TABLE EMP54
RENAME COLUMN TEMP_EMPNO TO EMPNO;

SELECT * FROM EMP54;
