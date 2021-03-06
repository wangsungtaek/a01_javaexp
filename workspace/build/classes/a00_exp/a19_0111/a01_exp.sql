/*
--[하] 1. merge의 형식으로 테이블간, 입력데이터간 처리 기본형식을 기술하세요.
	MERGE INTO 테이블명 A
	USING 테이블명 B
	ON A와 B의 특정한 컬럼비교
	WHEN MATCHED THEN : 두개의 테이블의 특정 컬럼에 데이터가 있을 때.
		UPDATE SET : 수정 처리..
	WHEN NOT MATCHED THEN
		INSERT INTO VALUES : 등록 처리

 */
--[중] 2. dept구조 복사 테이블 dept10, dept11을 만들고, 위에 기술한 merge입력처리 예제, 
--    테이블간 복사 merge예제를 만드세요
-- (1) 테이블 복사
CREATE TABLE DEPT10 AS SELECT * FROM DEPT WHERE 1=0;
CREATE TABLE DEPT11 AS SELECT * FROM DEPT WHERE 1=0;

MERGE INTO DEPT10 D
USING DUAL
ON (D.DEPTNO = 10)
WHEN MATCHED THEN
	UPDATE SET D.LOC = '수원'
WHEN NOT MATCHED THEN
	INSERT (D.DEPTNO, D.DNAME, D.LOC)
	VALUES (10, '김두한', '청주');

MERGE INTO DEPT11 A
USING DEPT10 B
ON (A.DEPTNO = B.DEPTNO)
WHEN MATCHED THEN
	UPDATE SET A.LOC = '서울'
WHEN NOT MATCHED THEN
	INSERT (A.DEPTNO, A.DNAME, A.LOC)
	VALUES (B.DEPTNO, B.DNAME, B.LOC);

SELECT * FROM DEPT10;
SELECT * FROM DEPT11;