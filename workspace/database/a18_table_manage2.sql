/*
1. 테이블명의 변경
	1) 형식
		rename 기존테이블명 to 새로운테이블명
*/
RENAME EMP51 TO EMP52;

/*
2. 컬럼명 변경
	1) ALTER TABLE 테이블명
		RENAME COLUMN 기존컬럼명 TO 새로운컬럼명;
 */
ALTER TABLE EMP52
RENAME COLUMN EMPNO TO NO;

SELECT * FROM EMP52;
/*
1. 테이블 변견명 명령어를 활용하여 아래 내용을 처리하세요.
	1) EMP53으로 구조복사해서 테이블 만들고,
	2) DEPT테이블을 DNAME, LOC를 추가
		SALGRADE GRADE 추가
	3) DEPTNO 컬럼 삭제
	4) subquery를 이용해서 해당 데이터에 맞게 데이터를 입력처리.
	5) hiredate의 credte로 컬럼명 변경,
		데이터 삭제 후, varchar2로 변경하여 2001/12/12 형식으로
		데이터 입력 처리
 */
-- 1)
CREATE TABLE EMP53 AS SELECT * FROM EMP WHERE 1=0;

-- 2)
ALTER TABLE EMP53
ADD (DNAME VARCHAR2(14),
	 LOC VARCHAR2(13),
	 GRADE NUMBER(1));
	
-- 3)
ALTER TABLE EMP53
DROP COLUMN DEPTNO;

-- 4)
INSERT INTO EMP53
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, D.DNAME, D.LOC, S.GRADE
  FROM EMP E, DEPT D, SALGRADE S
 WHERE E.DEPTNO = D.DEPTNO
   AND E.SAL BETWEEN S.LOSAL AND S.HISAL;

-- 5)
-- 컬럼명 변경
ALTER TABLE EMP53
RENAME COLUMN HIREDATE TO CREDTE;

-- 컬럼 업데이트
UPDATE EMP53
   SET CREDTE = NULL;

-- 컬럼 타입 변경
ALTER TABLE EMP53
MODIFY CREDTE VARCHAR(20);

-- 데이터 입력 ( 수정처리할 기준으로 기존테이블에 있는 EMPNO와 입력할 테이블 EMPNO의 JOIN관계로 수정)
UPDATE EMP53 B
   SET CREDTE = (SELECT TO_CHAR(HIREDATE, 'YYYY/MM/DD')
   				   FROM EMP A
   				  WHERE A.EMPNO = B.EMPNO); -- 수정할 기준 선정

SELECT * FROM EMP53;
DROP TABLE EMP53;

