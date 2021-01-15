--[데이터베이스]
/*
--[하] 1. 데이터베이스 설계에서 entity, entity type, reference를 구분하여 기술하세요.
	1) entity
		1) 현실 세계에서 조직을 운영하는데 꼭 필요한 사람이나 사물과 같이 구별되는 모든 것을 말한다.
		2) 저장할 가치가 있는 중요 데이터를 가지고 있는 사람이나 사물, 개념, 사건
		3) 다른 개체와 구별되는 이름을 가지고 있는 각 객체만의 고유한 특성이나 상태, 즉 속성을 하나 이상 가지고 있음
			ex) 서점 : 고객, 책
				학교 : 학과, 과목, 선생님
	2) entity type
		1) 객체를 고유의 이름과 속성들로 정의한 것을 말한다.
		2) 파일 구조의 레코드 타입에 대응된다.
		3) 추후 컬럼의 데이터 타입으로 설정된다.
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

--[하] 4. primary key와 not null을 함께 사용하는 테이블을 일상에서 생각해서 테이블을 각각의 컬럼에
--    지정하고 선언해 보세요.
CREATE TABLE PLAN (
	NO NUMBER(1) CONSTRAINT MYNO_PK PRIMARY KEY,
	DREAM VARCHAR2(100) CONSTRAINT DREAM_NN NOT NULL,
	TARGETDAY DATE
);
SELECT * FROM ALL_CONSTRANITS WHERE TABLE_NAME = 'PLAN';
SELECT * FROM PLAN;