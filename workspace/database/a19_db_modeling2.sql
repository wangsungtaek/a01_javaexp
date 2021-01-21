/*
# 정규화
1. 데이터베이스 설계시, 정규화를 통해서 데이터의 중복과
이상현상을 사전에 방지할 수 있다.
2. 정규화의 주요 개념
	1) 이상현상
	2) 함수 종속성.
3. 정규화 과정
	1) 제1정규화
	2) 제2정규화
	3) 제3정규화
	------------------
	4) BCNF정규화
	5) 제4정규화
	6) 제5정규화

# 이상현상
1. 잘못된 데이터베이스 설계는 이상현상을 발생하여,
	데이터의 중복과 잘못된 update및 입력이 될 수 있다.
2. 종류
	1) 삽입이상 : 데이터 입력시 특정 속성에 해당하는 값이
		null로 입력되어 데이터의 낭비를 초래할 수 있다.
	2) 삭제이상 : 데이터 row 단위 삭제시 저장된 다른 정보까지
		연쇄적으로 삭제되어, 추후에 해당 정보를 확인할 수 없는
		상황이 발생한다.
	3) 수정이상 : 수정시 중복된 데이터의 일부만 수정되어 데이터의
		불일치 문제가 발생한다.
*/
CREATE TABLE SUMMER (
	SID NUMBER,
	CLASS VARCHAR2(20),
	PRICE NUMBER
);

INSERT INTO SUMMER VALUES (100, 'FORTRAN', 20000);
INSERT INTO SUMMER VALUES (150, 'PASCAL', 15000);
INSERT INTO SUMMER VALUES (200, 'C', 10000);
SELECT * FROM SUMMER;
INSERT INTO SUMMER VALUES (250, 'FORTRAN', 20000);

-- 계절학기를 듣는 학생의 학번과 수강하는 과목?
SELECT SID AS 학번,
	   CLASS AS 수강하는과목
  FROM SUMMER;
-- C강좌의 수강료는?
SELECT CLASS, PRICE AS 수강료
  FROM SUMMER
 WHERE CLASS = 'C';
-- 수강료가 가장 비싼 과목?
SELECT *
  FROM SUMMER
 WHERE PRICE = (SELECT MAX(PRICE) FROM SUMMER);
-- 계절학기를 듣는 학생 수와 수강료 총합은?
SELECT COUNT(*) AS 학생수,
	   SUM(PRICE) AS "총합"
  FROM SUMMER;
  
-- # 삭제 이상의 예
-- 1. 200번 학생의 계절학기 수강신청을 취소처리
DELETE FROM SUMMER WHERE SID=250;

-- 2. C 강좌의 수강료를 조회..?
-- C강좌 정보와 수강료 정보까지 200학생을 삭제하는 순간 사라진다.
-- 정규화 과정은 이와 같이 특정 정보를 삭제하더라도 연관된 다른 정보는 
-- 다시 볼 수 있게 하는 것을 말한다. - 삭제 이상을 보완한다.
-- 실습을 입력
INSERT INTO SUMMER VALUES(200, 'C', 10000);
-- # 삽입 이상의 예
-- 1. 계절학기에 새로운 자바 강좌를 수강료 25000으로 개설하세요
INSERT INTO SUMMER VALUES(NULL, 'JAVA', 25000);
SELECT * FROM SUMMER;
-- 수강인원 확인
SELECT COUNT(*) AS 학생수, SUM(PRICE) AS "총합" FROM SUMMER;
-- row단위의 튜플은 4이지만, 수강인원은 sid를 기준으로 하여야 한다.
SELECT COUNT(SID) AS 학생수, SUM(PRICE) AS "총합" FROM SUMMER;
SELECT COUNT(*) AS 학생수, SUM(PRICE) AS "총합" FROM SUMMER
 WHERE SID IS NOT NULL;

-- sid가 수강인원이 없을 때는 Null로 비워져 있고, 통계치나 자료를 활용하고
-- 자 할때, 문제가 발생한다. : 삽입이상
-- 정규화 과정을 거치면 이와같이 필요없는 null 데이터 처리되는 것을 방지할 수 있다.
-- 다음 예제를 위해 250 FORTRAN 15000을 입력해주세요
-- 다음 예제를 위해 100 FORTRAN 15000을 입력해주세요
INSERT INTO SUMMER VALUES(250, 'FORTRAN', 15000);
INSERT INTO SUMMER VALUES(100, 'FORTRAN', 15000);

SELECT * FROM SUMMER;
-- # 수정이상 현상
-- FORTRAN 강좌 SID가 100 수강료 수정 15000으로 수정 처리하세요.
-- 특정한 사람의 수강료를 변경했는데, 다시 과목이 같지만 다른 수강료는 수정이
-- 되지 못한 것을 확인할 수 있다. 특정한 사람이라고 실수를 하더라도 과목의
-- 수강료를 수정하면 모음 부터 해당 수강료가 다 수정되게 수정오류를 정규식에서는
-- 방지할 수 있다.

/*
*/
-- summer 테이블 조회하면 fortan강좌의 수강료가 한건만 수정 처리.
SELECT * FROM SUMMER;
-- update 구문을 이용해서 fortran, 100의 pricefmf 1500으로 변경.
UPDATE SUMMER
   SET PRICE = 15000
 WHERE CLASS = 'FORTRAN' AND SID = 100;
-- 어떤 계정에서든 fortran을 변경을 하면 fortran의 수강료가 변경된
-- 데이터로 처리가 되어야 되는데 불일치가 발생하고 있다. 수정이상으로
-- 정규화가 필요로 하다.
-- # 이와같은 등록, 수정, 삭제의 이상현상을 벗어나기 위하여 테이블 정규화
-- 과정을 처리하도록 하자.
-- 1. 다음 단계 처리를 위해 원복
UPDATE SUMMER
   SET PRICE = 20000
 WHERE CLASS = 'FORTRAN' AND SID = 100;
SELECT * FROM SUMMER;

-- 2. 테이블 분리로 과목별가격이 있는 테이블과 학번별로 수강클래스 분리하여 구성하자.
-- 		1) 계절학기 강좌 수강료 확인
SELECT CLASS, PRICE FROM SUMMER;
-- 중복 내용 distinct
SELECT DISTINCT CLASS, PRICE
  FROM SUMMER
ORDER BY CLASS;

-- 계절학기 강좌 수강 테이블 생성
CREATE TABLE SUMMERPRICE
AS SELECT DISTINCT CLASS, PRICE
  FROM SUMMER
ORDER BY CLASS;

-- 학번별 수강클래스 테이블 조회
SELECT SID, CLASS
  FROM SUMMER
 WHERE SID IS NOT NULL
ORDER BY SID;

-- 학번별 수강클래스 테이블 생성
CREATE TABLE SUMMERENROLL
AS SELECT SID, CLASS
  FROM SUMMER
 WHERE SID IS NOT NULL
ORDER BY SID;

SELECT * FROM SUMMERPRICE;
SELECT * FROM SUMMERENROLL;

--sql을 작성해보세요.
--계절학기를 듣는 학생의 학번과 수강하는 과목?
SELECT * FROM SUMMERENROLL;
--C 강좌의 수강료는?
SELECT * FROM SUMMERPRICE WHERE CLASS='C';
--수강료가 가장 비싼 과목?
SELECT * FROM SUMMERPRICE WHERE PRICE = (SELECT MAX(PRICE) FROM SUMMERPRICE);
--계절학기를 듣는 학생 수와 수강료 총합은?
SELECT COUNT(*), SUM(PRICE)
  FROM SUMMERENROLL R, SUMMERPRICE P
 WHERE R.CLASS = P.CLASS;

-- # 정규화 처리 후, 이상현상 확인
-- 1. 삭제 이상 확인
--		200번 학생의 계절학기 수강신청을 취소했을 때, 해당 과목의 정보를 확인할 수 있는지 확인
SELECT * FROM SUMMERENROLL
 WHERE SID = 200;
DELETE
  FROM SUMMERENROLL
 WHERE SID = 200;

SELECT * FROM SUMMERENROLL; -- 수강신청항목에는 없어짐.
SELECT * FROM SUMMERPRICE; -- 수강과목에는 C가 있는 것을 확인할 수 있다.

-- 2. 삽입 이상 확인
--		계절학기 과목을 등록하더라도, 수강신청자에 영향이 없게 처리.
INSERT INTO SUMMERPRICE VALUES('JSP',23000);

SELECT * FROM SUMMERENROLL;
SELECT * FROM SUMMERPRICE;
-- 테이블 분리로 정상적인 입력이 가능한 것을 알수 있다.
-- FORTRAN강좌의 수강료를 20000에서 150000으로 수정하고,
UPDATE SUMMERPRICE SET PRICE = 15000 WHERE CLASS = 'FORTRAN';
-- 신청자들의 수강료를 확인해보세요.
SELECT * FROM SUMMERENROLL R, SUMMERPRICE P WHERE R.CLASS = P.CLASS;

-- 1. 전체테이블 데이터입력
CREATE TABLE STUDENT(
	NO NUMBER(3),
	NAME VARCHAR2(20),
	DEPT VARCHAR2(20),
	ADRESS VARCHAR2(50),
	SUBJECT VARCHAR2(20),
	CLASS VARCHAR2(20)
);
INSERT INTO STUDENT VALUES(501,'박지성','컴퓨터과','영국 맨체스타','데이터베이스','공학관110');
INSERT INTO STUDENT VALUES(401,'김연아','체육학과','대한민국 서울','데이터베이스','공학관110');
INSERT INTO STUDENT VALUES(402,'장미란','체육학과','대한민국 강원도','스포츠 경영학','체육관103');
INSERT INTO STUDENT VALUES(501,'추신수','컴퓨터과','미국 클리블랜','자료구조','공학관111');
INSERT INTO STUDENT VALUES(501,'박지성','컴퓨터과','영국 맨체스타','자료구조','공학관111');
INSERT INTO STUDENT VALUES(402,'김연아','컴퓨터과','대한민국 서울','스포츠 경영학','체육관103');
SELECT * FROM STUDENT;

--1. 등록이상 : 학생만 등록을 하는데 수강과목과 강의실은 null이 되어있음
INSERT INTO ex1(num,name,study,address) values(503,'손흥민','체육학과','영국 런던');

--2. 수정이상 : 데이터베이스 공학과 정보가 다 변경되지 않음
   update ex1
   set sloc = '공학과 109'
   where num=401 and sname='데이터베이스';
   
3. 삭제 이상 : 501, 502수강 자료 구조 정보가 없어짐
   학번의 특정 정보를 삭제하던지, course로 조건을 삭제하면, 연결된 모든 정보가 삭제되어
   삭제이상이 발생한다.
   delete
   from ex1
   where num in (501,502);
 
--키값을 포함
SELECT 100 cno, a.*
FROM (SELECT DISTINCT sname, sloc FROM ex1 ORDER BY SNAME) a;

CREATE TABLE studyInfo
AS SELECT 100 cno, a.*
FROM (SELECT DISTINCT sname, sloc FROM ex1 ORDER BY SNAME) a;

SELECT * FROM studyInfo;
SELECT * FROM studentInfo;

CREATE TABLE sname_reg(
	NO NUMBER,
	cno NUMBER
);
INSERT INTO sname_reg values(501,100);
INSERT INTO sname_reg values(401,100);
INSERT INTO sname_reg values(402,101);
INSERT INTO sname_reg values(502,102);
INSERT INTO sname_reg values(501,102);
INSERT INTO sname_reg values(401,101);
SELECT * FROM stud;
SELECT * FROM course;
SELECT * FROM corse_reg;
-- 학생별 수강 정보 출력.
SELECT a.name, c.course
  FROM stud a, corse_reg b, course c
 WHERE a,NO = b.NO
   AND b.cno = c.cno;

-- 1. 등록이상 : 학생정보, 수강신청정보, 과목정보를 각 테이블에
--		등록시, 등록이상이 생기지 않는다.
-- 2. 수정이상 : 학생정보가 수정, 수정신청정보 수정, 과목정보를
--		수정하더라도 수정이상이 생기지 않는다.
-- 3. 삭제이상 : 수강신청 정보가 삭제되더라도 학생정보나 과목정보가	
--		사라지지 않는다.

