/*
--[하] 1. 데이터베이스의 권한의 종류와 권한 부여의 기본 형식을 기술하세요.
	1. 권한의 종류
		1) 시스템 권한
			- 시스템 차원의 자원 관리나 사용자 스키마 객체 관리
			등과 같은 데이터베이스 관리 작업을 할 수 있는 권한
			- 오라클에서는 테이블, 뷰, 롤백 세그먼트, 프로시저
			와 같은 객체를 생성, 삭제, 수정하는 작업과 관련된
			140여 종류의 시스템 권한을 지원한다.
		2) 객체 권한
			- 테이블, 뷰, 시퀀스, 함수 등과 같은 객체를 조작
			할 수 있는 권한
			- 객체의 종류에 따라 서로 다른 유형의 객체 권한
			- 테이블의 컬럼별로 insert, update, references
			등의 권한을 상세 부여한다.
	2.권한 부여 기본형식
		grant 권한명 to 계정명;
		grant 권한1명, 권한2.. on 테이블 등 객체 to 사용자(스키마단위)
*/
/*
--[하] 2. goodman/9999 계정을 생성하고 테이블생성/활용 권한을 부여하고
 테이블 생성하고 입력 처리하세요.
*/
SQL> conn system/1111;
SQL> CREATE USER goodman identified BY 9999;
SQL> GRANT resource, CREATE SESSION, CREATE TABLE TO goodman; -- 접근권한 부여
-- resource : 객체권한 및 자원을 활용할 수 있는 권한 포함.
SQL> conn goodman/9999;
SQL> CREATE TABLE goodTable (col1 number); -- 테이블 생성
SQL> INSERT INTO goodTable values(1); -- 데이터 입력
SQL> SELECT * FROM goodTable;

/*
--[하] 3. scott계정에서 emp10테이블에 대한 조회/등록/수정/삭제 권한을 goodman에 할당하세요.
*/
SQL> conn scott/tiger;
-- 권한부여
SQL> GRANT SELECT, INSERT, DELETE, UPDATE ON EMP10 TO goodman;
SQL> conn goodman/9999;
-- DML(등록, 수정, 삭제)
SQL> INSERT INTO SCOTT.EMP10(EMPNO) VALUES(123);
SQL> UPDATE SCOTT.EMP10 SET EMPNO = 111 WHERE EMPNO=123;
SQL> DELETE FROM SCOTT.EMP10 WHERE EMPNO=111;
-- 조회
SQL> SELECT * FROM SCOTT.EMP10;

--[하] 4. scott계정에서 emp10테이블에 대한 등록/수정/삭제 권한을 goodman에 발탈하세요.
SQL> conn scott/tiger;
-- 권한 회수
SQL> REVOKE SELECT, INSERT, DELETE, UPDATE ON EMP10 FROM goodman;
SQL> conn goodman/9999;