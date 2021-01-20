/*
# 정규화
1. 데이터베이스 설계시, 정규화를 통해서 데이터의 중복과
미상현상을 사전에 방지할 수 있다.
2. 정규화의 주요 개념
	1) 이상현상
	2) 함수 종속성.
3. 정규화 과정
	1) 제1정규화
	2) 제2정규화
	3) 제3정규화
	4) BCNF정규화

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