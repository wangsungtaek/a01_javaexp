/*
# 테이블 관리
1. 테이블의 생성과 구조의 변경(추가, 수정)을 처리하는 것을 말한다.
2. 테이블 생성
	1) 테이블에 대한 구조를 정의하고, 테이블을 저장하기 위한 공간을
		할당하는 과정을 말한다.
	2) 테이블에 대한 구조 정의는 테이블을 구성하는 컬럼의 데이터 유형과
		제약조건을 정의한다.
3. 테이블 생성 기본 형식
	CREATE 옵션1 TABLE 옵션2. 테이블명(
		컬럼명 	데이터유형 옵션3 옵션4,
		컬럼명 	데이터유형 옵션3 옵션4,
		..
		컬럼명 	데이터유형 옵션3 옵션4,
	)
	옵션 1 : global temporary - 임시테이블 만들 때, 사용
		해당 세션(클라이언트)에만 보임
	옵션 2 : 스키마(사용자계정) - 다른 계정에서 호출해서 사용한다.
		ex) system계정으로 접속해서 scott계정에서 사용할 테이블을 만들 때,
			반드시 스키마를 선언하여야 한다.
	옵션 3 : default 데이터 선언 - 데이터를 입력하지 않을 때, null값 대신에
		들어가는 데이터를 선언할 수 있다.
	옵션 4 : 제약조건 - primary key, not null 등 무결성 제약조건을 선언할 수 있다.
*/
-- 기본 테이블 생성.
CREATE TABLE ADDRESS(
	ID NUMBER(3),
	NAME VARCHAR2(50),
	ADDR VARCHAR2(50),
	PHONE VARCHAR2(50),
	EMAIL VARCHAR2(50)
);
-- 현재 등록된 테이블 확인
SELECT * FROM ADDRESS;
SELECT * FROM TAB;


CREATE TABLE ADDRESS2(
	ID NUMBER(3) DEFAULT 1,
	NAME VARCHAR2(50) DEFAULT '이름',
	ADDR VARCHAR2(100) DEFAULT '주소',
	PHONE VARCHAR2(30) DEFAULT '전화번호',
	EMAIL VARCHAR2(100) DEFAULT '이메일'
);
-- default는 명시적 null은 제외, 묵시적 null로 입력된 데이터.
INSERT INTO ADDRESS2(ID) VALUES(NULL);
SELECT * FROM ADDRESS2;
	
-- ex) 묵시적 데이터 선언에 대하여 기본 형식을 기술하고,
-- 회원가입 테이블(id, pass, name, regdte, uptdte)로
-- 만들 때, id, pass는 임시/1111, 익명,
-- 날짜형은 현재날짜로 default로 선언되게 하세요.

CREATE TABLE MEMBER(
	ID VARCHAR2(50) DEFAULT '임시',
	PASS VARCHAR2(50) DEFAULT '1111',
	NAME VARCHAR2(50) DEFAULT '익명',
	REGDTE DATE DEFAULT SYSDATE,
	UPTDATE DATE DEFAULT SYSDATE
);
INSERT INTO MEMBER (ID) VALUES('himan');
SELECT * FROM MEMBER;

/*
# 서브쿼리를 이용한 테이블 생성.
1. CREATE TABLE 명령문에 서브쿼리 절을 이용하여 다른 테이블
구조와 데이터를 복사하여 새로운 테이블 생성이 가능하다.
2. 서브쿼리의 출력 결과가 테이블의 초기 데이터로 삽입이 가능하다.
3. create table 명령문에 지정한 컬럼 수와 데이터 타입과
	반드시 일치하여 만들어 진다.
4. 컬럼 이름을 명시하지 않은 경우 서브쿼리 칼럼 이름과 동일
5. 무결성 제약조건은 not null 조건만 복사
6. default 옵션은 정의한 값 그대로 복사
*/
CREATE TABLE EMP40
AS SELECT * FROM EMP;
SELECT * FROM EMP40;

-- 1. 컬럼명을 특정 컬럼명을 선택해서, 갯수를 맞추면
--		원하는 컬럼명으로 테이블을 생성할 수 있다.
CREATE TABLE EMP41(NO, NAME, GRADE)
AS SELECT EMPNO, ENAME, JOB FROM EMP;
SELECT * FROM EMP41;
/*
# 테이블의 구조변경
1. 개요
	alter table 명령문을 이용하여,
	컬럼의 추가, 삭제, 타입이나 길이의 재정의와 같은
	작업을 할 수 있다.
2. 컬럼의 추가
	alter table 테이블명
	add 컬럼명 데이터유형 [default 디폴트데이터], [제약조건]
*/
SELECT * FROM ADDRESS;
ALTER TABLE ADDRESS
ADD BIRTH DATE;

-- ex) EMP41테이블에 SALARY로 급여, DEPARTNO로 부서번호를 추가처리하세요.
ALTER TABLE EMP41
ADD SALARY NUMBER;

ALTER TABLE EMP41
ADD DEPARTNO NUMBER(2);

SELECT * FROM EMP41;

/*
3. 컬럼의 삭제 처리
	ALTER TABLE 테이블명 DROP COLUMN 컬렴명;
*/
ALTER TABLE EMP41 DROP COLUMN DEPARTNO;
SELECT * FROM EMP41;

/*
4. 컬럼의 변경
	1) 테이블의 컬럼의 타입, 크기, 기본 값은 변경이 가능하다.
	2) 기본형식
		ALTER TABLE 테이블명
		MODIFY 컬럼 데이터유형 옵션1
		옵션1 (default 기본데이터)
	3) 기존 컬럼에 데이터가 없는 경우
		컬럼 타입이나 크기 변경이 가능
		ex) 큰데이터할당 ==> 작은데이터할당으로 변경도 가능하다.
	4) 기존 칼럼에 데이터가 있는 경우
		- 타입변경 char, varchar2허용
		- 변경한 컬럼의 크기가 저장된 데이터의 크기보다 같거나 클 경우만 가능
			varchar2(10) ==> varchar2(15) 변경가능
			varchar2(5) ==> varchar2(4) 변경불가능
	5) default 값 변경은 변경 후에 입력되는 데이터 부터 적용.
-- 데이터 없을 때, 변경.
 */
-- 테이블 복사
CREATE TABLE EMP50
AS SELECT * FROM EMP WHERE 1=0;

-- 컬럼변경
ALTER TABLE EMP50
MODIFY (ENAME VARCHAR2(50),
	    JOB VARCHAR2(50));
	   
ALTER TABLE EMP50
MODIFY (ENAME VARCHAR2(10),
	    JOB VARCHAR2(10));

-- ex) 컬럼의 유형을 변경 처리(크기, 유형, Default 설정)
ALTER TABLE EMP50
MODIFY (EMPNO NUMBER(6) DEFAULT 0,
	    MGR NUMBER(6));

SELECT * FROM EMP50;
DROP TABLE EMP50;
	   
-- 데이터가 있는 테이블 컬럼의 변경
-- 테이블 복사
CREATE TABLE EMP51
AS SELECT * FROM EMP;

-- 작은 크기 ==> 큰 크기로 변경
ALTER TABLE EMP51
MODIFY (ENAME VARCHAR2(50),
		JOB VARCHAR2(50));
	
-- ex) 다른 유형의 데이터로 변경, 큰유형에서 작은 유형으로 변경 확인.
-- 
ALTER TABLE EMP51
MODIFY (ENAME NUMBER(4),
		JOB NUMBER(10)); -- error

-- 있는 데이터의 범위보다 작은 것은 에러발생
ALTER TABLE EMP51
MODIFY (ENAME VARCHAR2(40),
		JOB VARCHAR2(2)); -- error
		
-- 숫자형 데이터는 정밀도가 number(p, s)
-- 작은 데이터로 변경이 불가능 하고,
-- 정밀도가 한번 커지면 할당 데이터 상관없이 작은 크기로 변경이 불가능 하다.
ALTER TABLE EMP51
MODIFY DEPTNO NUMBER(3,1);
ALTER TABLE EMP51
MODIFY DEPTNO NUMBER(2,1); -- error

SELECT * FROM EMP51;
DROP TABLE EMP51;
