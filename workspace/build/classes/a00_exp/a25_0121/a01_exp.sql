--[데이터베이스]
/*
--[하] 1. 설계의 정규화 과정에서 삽입,삭제,등록 이상이 무엇을 말하는지 기술하세요.
	1) 삽입이상
		- 데이터 입력시 특정 속성에 해당하는 값이 null로 입력되어 데이터의 낭비를 초래할 수 있다.
	2) 삭제이상
		- 데이터 row 단위 삭제시 저장된 다른 정보까지 연쇄적으로 삭제되어,
			추후에 해당 정보를 확인할 수 없는 상황이 발생한다.
	3) 수정이상
		- 수정시 중복된 데이터의 일부만 수정되어 데이터의 불일치 문제가 발생한다.
*/
--[중] 2. 아래와 같은 데이터를 테이블로 만들고, 정규화 과정을 거친 테이블로 구성하세요.
--    회원아이디  패스워드  회원명 구매할물건명  구매갯수  물건가격  재고량
--    himan     7777 	  홍길동 	 사과      	  3     	 3000     27
--    higirl    8888 	  신미나  	사과       	 2     		 3000     25

-- 테이블 생성
CREATE TABLE member_buy (
	id VARCHAR2(50),
	pass VARCHAR2(30),
	name VARCHAR2(50),
	pname VARCHAR2(50),
	pcnt NUMBER,
	price  NUMBER,
	stock NUMBER
);

-- 데이터 삽입
INSERT INTO member_buy VALUES('himan','7777','홍길동','사과',3,3000,27);
INSERT INTO member_buy VALUES('himan','7777','홍길동','바나나',4,4000,50);
INSERT INTO member_buy VALUES('higirl','8888','신미나','사과',2,3000,25);
INSERT INTO member_buy VALUES('higirl','8888','신미나','오렌지',3,2000,30);

-- # 이상현상을 방지를 위해 3개의 테이블 분리
-- shop_member : id, pass, name
-- shop_product : pid, pname, price, stock
-- shop_buy : id, pid, pcnt

CREATE TABLE shop_member
AS SELECT DISTINCT id, pass, name FROM member_buy; 
SELECT * FROM shop_member;
SELECT * FROM member_buy;
SELECT pname, min(stock)
FROM member_buy
GROUP BY pname;
-- 물건테이블 pid(key 컬럼이 필요하다)
-- 재고량이 최종 내용이기에 group by로 설정해서
-- 테이블 적용시 sql을 사용하여야 한다.
SELECT 1111 pid, pname, price, stock
FROM member_buy
WHERE (pname, stock)
   IN (SELECT pname, min(stock)
 		 FROM member_buy
	 GROUP BY pname);
-- 최종 복사테이블 생성 
CREATE TABLE shop_product
AS SELECT 1111 pid, pname, price, stock
FROM member_buy
WHERE (pname, stock)
   IN (SELECT pname, min(stock)
 		 FROM member_buy
	 GROUP BY pname);
-- pid 값 업데이트
UPDATE shop_product SET PID = 1001 WHERE pname = '바나나';
UPDATE shop_product SET PID = 1002 WHERE pname = '사과';
UPDATE shop_product SET PID = 1003 WHERE pname = '오렌지';

CREATE TABLE shop_buy(
	id VARCHAR2(50),
	pid NUMBER,
	pcnt NUMBER
);
-- 1001 바나나
-- 1002 사과
-- 1003 오렌지
-- show_buy : id, pid, pcnt
SELECT id, pname, pcnt FROM member_buy;
INSERT INTO shop_buy VALUES('higirl',1002,2);
INSERT INTO shop_buy VALUES('higirl',1003,3);
INSERT INTO shop_buy VALUES('himan',1002,3);
INSERT INTO shop_buy VALUES('himan',1001,4);
  
SELECT a.name, b.pname, c.pcnt, b.stock
  FROM shop_member a, shop_product b, shop_buy c
 WHERE a.id = c.id
   AND b.pid = c.pid;

SELECT * FROM member_buy;
SELECT * FROM shop_member;
SELECT * FROM shop_product;
SELECT * FROM shop_buy;