/*
# 테이블에 사용되는 데이터 타입..
1. 개요
	1) 데이터베이스에 저장되는 데이터는 문자, 숫자, 날짜, 이미지 등과 같은
		다양한 형식으로 표현된다.
	2) 실무에서 컬럼에 대한 데이터 타입이나 길이의 결정은 데이터베이스 설계
		단계에서 신중하게 고려해야 하는 중요한 사항
	3) 데이터베이스 설계 단계에서 잘못 선정된 데이터 타입은 응용 프로그램
		개발을 어렵게 하거나 성능을 저하시키는 요인이 된다.

2. 오라클에서 지원되는 데이터 타입의 종류
	1) char(size) : 고정 길이 문자 데이터 타입. 최대 2000바이트
		- ex) 코드성 데이터 - 학번, 사번, 주민번호 : 자리 수가 정해진데이터
			create table personnel(
				civilnum char(13);
			);
	2) varchar2(size) : 가변 길이 문자 데이터 타입, 최대 4000바이트
		- ex) 최대 크기를 설정하기에 그 보다 작은 데이터 할당시 효울화.
		create table personnel)
			name varchar2(15)
		);
	3) number(p, s) : 정밀도(p)와 스케일(s)로 표현되는 숫자 데이터 타입
		- ex) 전체크기 소숙점 이하 크기 지정.
	4) date : 날짜/시간 형식을 저장하기 위한 데이터 타입
	5) navrchar2(size) : 국가별 문자 집합에 따른 size크기의 문자/바이트
		문자 데이터 타입
	6) rowid : 테이블내 행의 고유 주소를 가지는 64진수 문자 타입
		행단 6바이트 또는 10바이트
	7) blob : 대용량의 바이너리 데이터를 저장하기 위한 테이터 타입 최대 4gb
	8) clob : 대용량의 텍스트 데이터를 저장하기 위한 데이터 타입 최대 4gb
	9) bfile : 대용량의 바이너리 데이터를 파일 형태로 저장하기 위한 데이터 타입
		최대 4gb
	10) timstamp(n) date : 데이터 타입의 확장된 형태. n은 millis second 
		자리수로 최대 9자리까지 표현 가능.
*/
-- 테이블 생성
CREATE TABLE MEMBER (
	id varchar2(20),
	pass varchar2(12),
	civilnum char(13),
	point NUMBER, -- 기본 정수형 데이터
	auth varchar2(20)
);

-- 테이블 값 할당
INSERT INTO MEMBER VALUES('himan','7777','9112122801618',1000,'관리자');
SELECT * FROM member;

-- ex1) 프로야구 선수 팀 정보를 입력하려고 합니다. 구글에 프로야구 순위 확인하셔서,
--		해당 데이터를 입력하기 위한 테이블을 만들고, 데이터를 입력한 후, 조회하세요.
CREATE TABLE baseteam (
	tname varchar2(20),
	vic	NUMBER, 
	def NUMBER,
	eq NUMBER
);
INSERT INTO baseteam VALUES('키움',80,63,1);
SELECT  tname 팀, vic 승, def 패, eq 무, round(vic/(vic+def),3) 승률
FROM BASETEAM;
SELECT * FROM baseteam;