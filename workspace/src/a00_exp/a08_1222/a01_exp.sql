
--1. sql 명령문의 종류(ex DQL, DDL...)와 기능을 설명하고 주요 명령문의 예제 확인해서 정리하세요.
/*
	1) 데이터 질의어 (DQL : data quary language) : 데이터 조회
	2) 데이터 정의어 (DDL : data definition language) : 객체 생성(Create), 객체변경(alter)
		객체 삭제(drop), 객체 이름 변경(rename), 데이터 및 저장 공간 삭제(truncate)
	3) 데이터 조작어 (DML : data manipulation language) : 데이터를 입력/수정/삭제
		insert, update, delete
	4) 트랜젝선 처리어 (TCL : transaction control language) : 트랜잭션의 정상적인 종료
		처리(commit), 트랜잭션 취소(rollback), 트랜잭션내의 임시 저장점 설정(savepoint)
	5) 데이터 제어어 (DCL : data contorll language) : 데이터 객체에 대한 접근 권한 부여
		(grant), 데이터베이스 객체에 대한 접근 권한 취소(revoke)
 */
CREATE TABLE test( -- 데이터 정의어(테이블 생성)
	name varchar2(20),
	gender varchar2(10),
	age NUMBER
);
ALTER TABLE test RENAME TO person; -- 테이블 정의어(테이블 이름변경)
DROP TABLE person; -- 데이터 정의어(테이블 삭제)
INSERT INTO person VALUES('왕성택','남자',30); -- 데이터 처리어(데이터 추가)
INSERT INTO person VALUES('왕윤희','여자',30); -- 데이터 처리어(데이터 추가)
INSERT INTO person VALUES('송진우','남자',30); -- 데이터 처리어(데이터 추가)

UPDATE person -- 데이터 처리어(데이터 변경)
SET age = 29
WHERE name='송진우';

DELETE FROM person -- 데이터 처리어(데이터 삭제)
WHERE name='송진우';

SELECT * FROM person; -- 데이터 질의어(테이블 조회)

/*
--2. sal+comm으로 연산하는 경우 comm null인 경우, 문제가 발생한다. 어떤 문제이고 이것을 해결할려면 어떤 처리를 하는지 정리하세요.
	1) where절의 조건식을 사용하여 처리한다.
	2) nvl 함수를 사용하여 처리한다.
***/
-- WHERE 사용
SELECT *
FROM emp
WHERE comm IS not null;

-- nal 함수 사용
SELECT ename, sal, comm, sal+nvl(comm,0) 합산
FROM emp;
/*
--3. 오라클에서 사용하는 주요 데이터 타입의 종류를 예시와 함께 기술하세요.
	1) char(size) : 고정 길이 문자 데이터 타입. 최대 2000바이트
	2) varchar2(size) : 가변 길이 문자 데이터 타입. 최대 4000바이트
	3) number(p, s) : 숫자 데이터 타입
	4) date : 날짜/시간 형식을 저장할 수 있는 데이터 타입
	5) nvarchar2 : 국가별 문자 집합에 따른 size크기의 문자/바이트 문자 데이터 타입
	6) rowid : 테이블내 행의 고유 주소를 가지는 64진수 문자 타입
	7) blob : 대용량의 바이너리 데이터를 저장하기 위한 데이터 타입 최대 4gb
	8) clob : 대용량의 텍스트 데이터를 저장하기 위한 데이터 타입 최대 4gb
	9) bfile : 대용량의 바이너리 데이터를 파일 형태로 저장하기 위한 데이터 입 최대 4gb
	10) timstamp(n) date : 데이터 타입의 확장된 형태. n은 millis second 자리수로
		최대 9자리까지 표현 가능.
**/
CREATE table test2(
	inchar char(4),
	invarchar varchar2(20),
	innumber NUMBER
);

INSERT INTO test2 VALUES('aaaaa','adfsdf',32);
SELECT * FROM test2;

DROP TABLE test2;
DELETE FROM test2;

/*
--4. 문자열을 저장하는 데이터 중, 고정형과 가변형이 있다. 두 데이터 유형의 차이점을 기술하세요.
	1) char(size)
		. 고정형 데이터 타입 : 지정한 길이보다 짧거나 같은 사이즈의 문자열만 저장할 수 있다.
		. size보다 짧은 데이터가 들어올 경우 남은 size를 공백으로 채운다.
		. 학번, 주민등록번와 같이 자리수가 고정일때, 사용한다.
	2) varchar2(size)
		. 가변형 데이터 타입 : 지정한 길이보다 짧거나 같은 사이즈의문자열만 저장할 수 있다.
		. 고정형과 차이점은 데이터를 입력받고 나머지 공간을 공백으로 채우지 않는다.
**/
/*
--5. 데이터 유형을 확인하고, 학생테이블(번호, 이름, 국어, 영어, 수학)을 만들고 데이터를 입력하세요.
*/
CREATE TABLE student( -- 테이블 생성
	num char(10),
	name varchar2(15),
	kor NUMBER,
	eng NUMBER,
	math NUMBER
);
INSERT INTO student values('2000000001','김영수',100,90,20); -- 데이터 입력
INSERT INTO student values('2000000002','최철수',70,100,40);
INSERT INTO student values('2000000003','홍길동',900,90,90);
SELECT num 학번, name 이름, kor 국어, eng 영어, math 수학 FROM student; -- 조회
/*
--6. 스포츠 스타의 이름 소속사 올해 성적을 입력하는 테이블을 만들고 데이터를 입력하고 조회하세요.
*/
CREATE TABLE star( -- 테이블 생성
	agen varchar2(20),
	name varchar2(15),
	G NUMBER,
	PA NUMBER,
	AB NUMBER,
	R NUMBER,
	H NUMBER,
	B2 NUMBER,
	B3 NUMBER,
	HR NUMBER,
	TB NUMBER,
	RBI NUMBER,
	SAC NUMBER,
	SF NUMBER
);
INSERT INTO star values('KIA','최형우',140,600,522,93,185,37,1,28,308,115,0,3); -- 데이터 입력
INSERT INTO star values('롯데','손아섭',141,611,540,98,190,43,0,11,266,85,1,7);
INSERT INTO star values('두산','페르난데스',144,668,586,104,199,29,0,21,291,105,0,11);
SELECT * FROM star; -- 조회
/*
--7. select에서 쓰이는 컬럼과 where 조건의 비교 연산자에 쓰이는 컬럼은 어떤 차이가 있는가?

**/
/*
--8. where 조건에 쓰이는 비교 연산자의 종류와 논리 연산자의 종류를 기술하세요.
	비교연산자 : =, >, <, >=, >=
	논리연산자 : AND, OR, NOR
*/
/*
--9. between, in 구문의 기본형식을 선언하고, 기본 예제를 기술하세요.

*/
SELECT * 
FROM emp
WHERE deptno BETWEEN 10 AND 20; -- 10~20 사이 전부

SELECT * 
FROM emp
WHERE deptno IN(10,30); -- 10 or 30

/*
------------------------------------------------------------------
