/*
# foreign  key : 한 열과 참조된 테이블의 열간에 외래 키 관계를 설정하고
실행가능하게 처리.
ex) 아래와 같이 사원테이블의 부서번호는 참조키관계를 부서테이블의 부서번호와
	설정하면 반드시 부서테이블에 데이터가 있어야 입력이 사원테이블에 입력이 가능하다.

1. 기본형식
	컬럼명 데이터유형 constraint 제약조건명 references 참조할테이블(참조할컬럼)
*/

/*
-- 학사관리시스템의 학생테이블과 학과테이블을 만들고, 학과테이블의 학과 번호와
학생테이블의 학과번호를 참조키 관계를 설정해보자
*/
CREATE TABLE STUDEPT (
	DEPTNO NUMBER(3) PRIMARY KEY,
	DNAME VARCHAR2(50),
	LOC VARCHAR2(50)
);
INSERT INTO STUDEPT VALUES (101, '컴퓨터공학', '1호관');
SELECT * FROM STUDEPT;

CREATE TABLE STUDENT02 (
	STUDNO NUMBER PRIMARY KEY,
	NAME VARCHAR2(50) NOT NULL,
	DEPTNO NUMBER(3) CONSTRAINT STUDENT02_DEPTNO_FK REFERENCES STUDEPT(DEPTNO)
);

SELECT * FROM STUDEPT;
SELECT * FROM STUDENT02;
INSERT  INTO STUDENT02 VALUES(1000, '홍길동', 101);
-- 테이블에 있는 데이터 정산 입력
INSERT  INTO STUDENT02 VALUES(1001, '홍길동', 102);
-- 참조테이블에 없는 데이터 입력시 에러

