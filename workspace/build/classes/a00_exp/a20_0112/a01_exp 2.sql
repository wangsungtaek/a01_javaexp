--[데이터베이스]
/*
--[하] 1. seqence의 생성 기본 형식을 기술하세요.
CREATE SEQUNCE 시퀀스명
	INCREMENT BY N : 증가 단위
	START WITH N : 초기 번호
	MAXVALUE N | NOMAXVALUE : 최대 데이터
	MINVALUE N | NOMINVALUE : 최소 데이터
	CYCLE | NOCYCLE : 최대/최소에 이를 때, 반복여부
	CACHE | NOCACHE : 속도향상을 위한 캐시메모리
						사용여부	
*/
--[하] 2. 게시판 테이블을 번호, 제목, 작성자, 내용, 조회수로 생성하고,
--        sequence로 번호를 만들어 입력 처리하게 하세요..
-- 1) 테이블 생성
CREATE TABLE BOARD (
	NO NUMBER(5),
	TITLE VARCHAR2(20),
	AUTHOR VARCHAR2(10),
	CONTENT VARCHAR2(20),
	VIEWS NUMBER(5)
);
-- 2) 시퀀스 생성
CREATE SEQUENCE SEQ_NO
	INCREMENT BY 1
	START WITH 1
	MAXVALUE 200
	MINVALUE 1
	NOCYCLE
	NOCACHE;
CREATE SEQUENCE SEQ_VIEWS
	INCREMENT BY 1
	START WITH 1
	MAXVALUE 10000
	MINVALUE 1
	NOCYCLE
	NOCACHE;
-- 3) 게시판 작성
INSERT INTO BOARD VALUES(SEQ_NO.NEXTVAL, '프론트엔드' , '김언어', 'HTML, CSS, JS', SEQ_VIEWS.NEXTVAL);
INSERT INTO BOARD VALUES(SEQ_NO.NEXTVAL, '백엔드' , '김자바', '자바, 파이썬', SEQ_VIEWS.NEXTVAL);
INSERT INTO BOARD VALUES(SEQ_NO.NEXTVAL, '데이터베이스' , '데이터', '오라클, MySQL', SEQ_VIEWS.NEXTVAL);

SELECT * FROM BOARD;

--[중] 3. student2테이블 학번, 이름, 학과 테이블이다.
--        학번을 올해연도(2)학과코드(CS)번호(4)로 해당 자리수로 설정할 때,
--        테이블과 sequence를 만들고 데이터를 입력 처리하세요
/**
--[하] 4. sequence의 변경/삭제 구문을 기술하고, 한계를 예제를 통해서 나타내세요.
	1) 한계
		- START WITH는 변경이 불가하다.
		- MINVALUE|MAVALUE는 현재값을 기준에서 너무 적거나 많은 변경은 불가능하다.
		- 변경에 대한 한계로 인해 시퀀스 삭제가 필요로 한다.
**/
-- 2) 테스트 시퀀스 생성
CREATE SEQUENCE SEQ_TEST
	INCREMENT BY 1
	START WITH 1
	MAXVALUE 10000
	MINVALUE 1
	NOCYCLE
	NOCACHE;

-- 3) 테스트 시퀀스 변경
ALTER SEQUENCE SEQ_TEST
	INCREMENT BY 3;

-- 4) 결과 확인
SELECT SEQ_TEST.NEXTVAL FROM DUAL;

-- 5) 시퀀스 삭제
DROP SEQUENCE SEQ_TEST;

/*
--[하] 5. 테이블의 생성 기본형식을 옵션과 함께 기술하세요.
	1) 테이블 생성 기본 형식
		CREATE 옵션1 TABLE 옵션2. 테이블명(
			컬럼명 	데이터유형 옵션3 옵션4,
			컬럼명 	데이터유형 옵션3 옵션4,
			..
			컬럼명 	데이터유형 옵션3 옵션4,
		)
		
	2) 옵션	
		옵션 1 : global temporary - 임시테이블 만들 때, 사용
			해당 세션(클라이언트)에만 보임
		옵션 2 : 스키마(사용자계정) - 다른 계정에서 호출해서 사용한다.
			ex) system계정으로 접속해서 scott계정에서 사용할 테이블을 만들 때,
				반드시 스키마를 선언하여야 한다.
		옵션 3 : default 데이터 선언 - 데이터를 입력하지 않을 때, null값 대신에
			들어가는 데이터를 선언할 수 있다.
		옵션 4 : 제약조건 - primary key, not null 등 무결성 제약조건을 선언할 수 있다.
*/
--[하] 6. 테이블 생성시, default 데이터의 입력의 제약사항에 대하여 기술하세요.
/*
	1) 컬럼의 입력 값이 묵시적 null인 경우에 기본값을 지정하기 위하여 사용된다.
	2) 기본값을 설정하는 데이터 :
		리터럴 값, 표현식, sql함수, sysdate, user를 사용할 수 있다.
		특정 컬럼이나 의사컬럼(nextval, currval)은 사용할 수 없다.
*/
/*
--[하] 7. 테이블의 구조 변경 형식을 지정하고, 복사테이블 emp60만들고, 부서명, 부서위치를 추가 처리하세요
	1) 구조변경 형식
		ALTER TABLE 테이블이름
		변경할컬럼이름 데이터타입;
*/
-- 2) 복사테이블 생성
CREATE TABLE EMP60 AS SELECT * FROM EMP;

-- 3) 컬럼(부서명, 부서위치) 추가
ALTER TABLE EMP60
ADD DNAME VARCHAR2(20);
ALTER TABLE EMP60
ADD LOC VARCHAR2(20);

/*
--[하] 8. 컬럼의 삭제 처리하는 형식을 기술하고, 위 emp60에서 부서위치를 삭제 처리하세요.
	1) 형식
		ALTER TABLE 테이블이름
		DROP COLUMN 컬럼이름;
**/
ALTER TABLE EMP60
DROP COLUMN LOC;