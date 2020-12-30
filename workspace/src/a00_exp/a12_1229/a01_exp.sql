/*
1. [하]타입변환에서 명시적/묵시적 형변환의 의미를 기술하고, 묵시적 형변환이 일어나는 이유와 해당 예제를
간단한 코드로 기술하세요.
 */
-- Ex1)
SELECT '3'+3 AS show -- 문자열"3"이 묵시적으로 숫자형으로 형변환됨.
  FROM DUAL;

SELECT to_number(3)+3 AS show -- 명시적으로 문자열3을 숫자형으로 변환함.
  FROM DUAL;

--2. [하]명시적 형변환 3가지의 기본형식과 기본예제를 기술하세요.
-- Ex2)
SELECT to_char(12345, '$999') AS "1.숫자->문자",
	   to_char(12345, '00000') AS "2.숫자->문자",
	   to_char(sysdate, 'YYYY"년 "MM"월 "DD"일"') AS "날짜->문자",
	   to_char(sysdate, 'HH24"시 "MI"분 "SS"초"') AS "시간->문자",
	   to_number('123444') AS "문자->숫자",
	   to_date('20101020','YYYY-MM-DD') AS "문자->날짜"
  FROM DUAL;
 
--3. [중]매월 첫째주에 입사한 사원의 이름과 년도 입사월과 주,요일을 표기하세요.
-- Ex2)
SELECT ENAME AS 이름,
	   HIREDATE AS 입사일,
	   to_char(HIREDATE, 'YYYY"년"') AS 입사년도,
	   to_char(HIREDATE, 'MM"월"') AS 입사월,
	   to_char(HIREDATE, 'W') AS 입사주,
	   to_char(HIREDATE, 'DAY') AS 입사요일
  FROM EMP
 WHERE to_char(HIREDATE, 'W') = '1';

--4. [중]입사일을 상/하반기로 나누어서 상반기에 입사한 사람의 이름, 입사월, 상하반기구분으로 출력하세요.
SELECT ENAME AS 이름,
	   to_char(HIREDATE, 'MM') AS 입사월
  FROM EMP
 WHERE to_char(HIREDATE, 'MM') > 6;

--5. [하]시간의 문자열 형식을 나열하고, 입사일을 기준으로 @@@@년 @@월 @@일 @@시@@분@@초 형식으로 입사일
--   표기하세요.
SELECT to_char(HIREDATE, 'YYYY"년 " MM"월 " DD"일 "HH"시 "MI"분 "SS"초"') AS 입사일
  FROM EMP;

--6. [중] emp03 복사테이블을 만들고 각분기별로 입사한 사원정보를 시간까지 입력하여 등록하고, 
--    YYYY/MM/DD일 @@/4분기에 @@요일 @@:@@:@@ 입사 형식으로 출력하세요.
CREATE TABLE EMP03 AS SELECT * FROM EMP; -- EMP테이블 복사
INSERT INTO EMP03(ENAME, HIREDATE)
			values('홍길동', to_date('2020-12-01 13:20:31', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO EMP03(ENAME, HIREDATE)
			values('김길동', to_date('2020-11-01 17:30:50', 'YYYY-MM-DD HH24:MI:SS'));
SELECT to_char(HIREDATE, 'YYYY/MM/DD"일" Q"/4분기 "DAY HH:MI:SS "입사"') AS 입사일
  FROM EMP03;
