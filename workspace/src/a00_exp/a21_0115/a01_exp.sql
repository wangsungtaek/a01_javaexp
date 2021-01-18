--[데이터베이스]
/*
--[하] 1. 데이터베이스 설계에서 entity, entity type, reference를 구분하여 기술하세요.
	1) entity
		- 현실 세계에서 조직을 운영하는데 꼭 필요한 사람이나 사물과 같이 구별되는 모든 것을 말한다.
		- 저장할 가치가 있는 중요 데이터를 가지고 있는 사람이나 사물, 개념, 사건
		- 다른 개체와 구별되는 이름을 가지고 있는 각 객체만의 고유한 특성이나 상태, 즉 속성을 하나 이상 가지고 있음
			ex) 서점 : 고객, 책
				학교 : 학과, 과목, 선생님
	2) entity type
		- 객체를 고유의 이름과 속성들로 정의한 것을 말한다.
		- 파일 구조의 레코드 타입에 대응된다.
		- 추후 컬럼의 데이터 타입으로 설정된다.
	3) reference
		- 실제 위에 지정한 컬럼에 데이터를 할당한 row단위를 말한다.
		- 파일 구조의 레코드를 의미한다.
	
*/
/*
--[하] 2. 무결성 제약조건 5가지를 기술하세요.
	1) primary key : not null + unique
	2) not null : 반드시 값을 입력해야 할 때.
	3) unique : 고유키 (중복 허용 하지 않음)
	4) references : 참조키를 설정할 때, 활용
	5) foreign : 한열과 참조된 테이블 열간의 외래 키 설정

*/
--[하] 3. 가계부테이블을 만들어 온라인 가계부를 처리할려고 한다. pk를 비롯한 제약조건이 있는 속성을 도출하고 테이블을 만들고 데이터를 등록해서
--    select문으로 출력하세요.
CREATE TABLE BOOK (
	dday DATE CONSTRAINT BOOK_PK PRIMARY KEY,
	spend NUMBER NOT NULL,
	price NUMBER NOT NULL
);
INSERT INTO BOOK VALUES(TO_DATE('2020/11/12', 'YYYY/DD/MM'), 2000, 1000);
SELECT * FROM BOOK;
SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'BOOK';

/*
-- 풀이)
		----- 가게부 ------
[no]		날짜	수입/지출구분	항목	금액	잔액
1			1/18	수입			용돈	100000	100000
2			1/18	지출			차비	5000	95000

CREATE TABLE BOOK (
	NO NUMBER CONSTRAINT BOOK_NO_PK PRIMARY KEY,
	IDATE DATE NOT NULL,
	KIND CHAR(6) NOT NULL,
	CONTENT CHAR(50),
	VAL NUMBER,
);
1. 설계시, 화면에 보이지 않지만 반드시 추가할 컬럼 ex) no (식별자)
2. 화면에 보이지만 데이터로 관리되지 않은 데이터 ex) 잔액/총계/평균값 등 연산처리 결과값..
*/

/*
--[하] 4. primary key와 not null을 함께 사용하는 테이블을 일상에서 생각해서 테이블을 각각의 컬럼에
--    지정하고 선언해 보세요.
	학과 관리프로그램에서 학생의 식별자와 이름, 도서 관리 프로그램에서 도서식별자와 도서명 등은
	primary key와 not null을 사용한다.
	CREATE TABLE BOOK {
		BK_ID NUMBER PRIMARY KEY,
		BNAME VARCHAR2 NOT NULL,
		ISUSE NUMBER(1), 
		-- 대출여부 boolean값은 데이터베이스에 없다. number(1) 0/1로 설정하면 boolean 전환 가능
		-- number(1) 0/1로 설정하면 boolean전환가능
		LOC CHAR(7) -- 위치를 코드값으로 설정, 코드값을 일반적으로 지정된 크기로 char로 설정
	};
*/
CREATE TABLE PLAN (
	NO NUMBER(1) CONSTRAINT MYNO_PK PRIMARY KEY,
	DREAM VARCHAR2(100) CONSTRAINT DREAM_NN NOT NULL,
	TARGETDAY DATE
);
SELECT * FROM ALL_CONSTRANITS WHERE TABLE_NAME = 'PLAN';
SELECT * FROM PLAN;