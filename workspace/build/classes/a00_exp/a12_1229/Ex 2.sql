/*
1. [하]타입변환에서 명시적/묵시적 형변환의 의미를 기술하고, 묵시적 형변환이 일어나는 이유와 해당 예제를
간단한 코드로 기술하세요.
명시적 형변환 : 함수를 통한 형변환
	일반적으로 데이터 베이스는 변환함수를 이용하여 데이터 타입을 변환하여 효과적으로
	처리한다.
	
	조건문에서 정확하게 해당 타입을 맞게 설정하지 않더라도 결과를 검색해주는 경우
	이것은 오라클 시스템 내부에서 내부적으로 타입을 변환했기 때문이다.
 */

--2. [하]명시적 형변환 3가지의 기본형식과 기본예제를 기술하세요.
/*
 * 	1) to_char(문자열로) : 숫자/날짜 타입을 문자열로 변환해주는 함수이다.
 * 	2) to_number(숫자로) : 날짜/문자 타입을 숫자로 변환해주는 함수
 *  3) to_date(날짜로) : 문자/숫자 타입을 날짜로 변환해주는 함수
 *  select to char(4533.243, '$999,999.99') from dual;
 *  select * from emp
 *  where sal >= to_number('3000');
 *  select * from emp
 *  where hiredate >= to_date('1980/01/01', 'YYYY/MM/DD');
 */

--3. [중]매월 첫째주에 입사한 사원의 이름과 년도 입사월과 주,요일을 표기하세요.
SELECT ENAME,
	   to_char(HIREDATE, 'YYYY') AS 연도,
	   to_char(HIREDATE, 'MM') AS 월,
	   to_char(HIREDATE, 'W') AS 주,
	   to_char(HIREDATE, 'DAY') AS 요일
  FROM EMP
 WHERE to_char(HIREDATE, 'W') = '1';

--4. [중]입사일을 상/하반기로 나누어서 상반기에 입사한 사람의 이름, 입사월, 상하반기구분으로 출력하세요.
--		to_number(to_char(hiredate, 'Q')) >= 3
--		to_number(to_char(hiredate, 'MM')) >= 7
SELECT ENAME,
	   to_char(HIREDATE, 'MM') AS 입사월
  FROM EMP
 WHERE to_number(to_char(HIREDATE, 'Q')) >= 3
;	   
SELECT ENAME,
	   to_char(HIREDATE, 'MM') AS 입사월,
	   decode(to_char(HIREDATE, 'Q'), '1', '상빈기', '2', '상반기', '하반기') AS "상하반기구분"
--	   decode(특정데이터, 1번째경우, 1번째경우처리할데이터, 2번째경우, 2번째경우처리할데이터, 그외처리데이터)
  FROM EMP
 WHERE to_number(to_char(HIREDATE, 'Q')) < 3;	 
-- to char(hiredate, 'Q') : 1~4 문자열
-- to number()/3 : 숫자로 전환해서 1,2:소수점이하, 3,4: 1이상
SELECT ENAME,
	   to_char(hiredate, 'MM') AS 입사월,
	   floor(to_number(to_char(hiredate, 'Q'))/3),0,'상반기','하반기')



--5. [하]시간의 문자열 형식을 나열하고, 입사일을 기준으로 @@@@년 @@월 @@일 @@시@@분@@초 형식으로 입사일
--   표기하세요.
/*
	1) CC : 세기
	2) YYYY/YYY/YY/Y : 년도 표기
	3) AD/A.D : AD/BC표기
	4) Q : 분기
	5) MM/MONTH/MON : 월표기
	6) WW/W : 연을 주간위로 표기/월을 주단위로 표기.
	7) DDD/DD/D : 날짜 표기
	8) DAY/DY : 요일표기
	1) AM/PM : 오전/오후 시간 표시
	2) A.M/P.M : 오전/오후 시각 표시
	3) HH/HH12 : 시각(1~12) 표시
	4) HH24 : 24시간(0~23) 표시
	5) MI : 분
	6) SS : 초
 */
SELECT ENAME,
	   to_char(HIREDATE, 'YYYY"년 "MM"월 "DD"일 " HH24"시 "MI"분 "')
 
--6. [중] emp03 복사테이블을 만들고 각분기별로 입사한 사원정보를 시간까지 입력하여 등록하고, 
--    YYYY/MM/DD일 @@/4분기에 @@요일 @@:@@:@@ 입사 형식으로 출력하세요.
CREATE TABLE emp3
AS SELECT * FROM emp;
-- to_date('2020-01-01 15:16:18', 'YYYY-MM-DD HH24:MI:SS')
-- to_date('2020-04-01 12:16:18', 'YYYY-MM-DD HH24:MI:SS')
-- to_date('2020-07-01 16:16:18', 'YYYY-MM-DD HH24:MI:SS')
-- to_date('2020-10-01 19:16:18', 'YYYY-MM-DD HH24:MI:SS')
INSERT INTO emp03(ENAME, HIREDATE) values('김길동', to_date('2020-01-01 15:16:18', 'YYYY-MM-DD HH24:MI:SS');
INSERT INTO emp03(ENAME, HIREDATE) values('신길동', to_date('2020-04-01 12:16:18', 'YYYY-MM-DD HH24:MI:SS');
INSERT INTO emp03(ENAME, HIREDATE) values('마길동', to_date('2020-07-01 16:16:18', 'YYYY-MM-DD HH24:MI:SS');
INSERT INTO emp03(ENAME, HIREDATE) values('오길동', to_date('2020-10-01 19:16:18', 'YYYY-MM-DD HH24:MI:SS');
SELECT ENAME, to_char(HIREDATE, 'YYYY/MM/DD Q"/4분기" DAY HH24:MI:SS') show
  FROM EMP;
  
/**
CREATE TABLE emp03 
AS SELECT * FROM emp;
-- to_date('2020-01-01 15:16:18','YYYY-MM-DD HH24:MI:SS')
-- to_date('2020-04-01 12:16:18','YYYY-MM-DD HH24:MI:SS')
-- to_date('2020-07-01 16:16:18','YYYY-MM-DD HH24:MI:SS')
-- to_date('2020-10-01 19:16:18','YYYY-MM-DD HH24:MI:SS')
INSERT INTO emp03(ename, hiredate) values('김길동',to_date('2020-01-01 15:16:18','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO emp03(ename, hiredate) values('신길동',to_date('2020-04-01 15:16:18','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO emp03(ename, hiredate) values('마길동',to_date('2020-07-01 15:16:18','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO emp03(ename, hiredate) values('오길동',to_date('2020-10-01 15:16:18','YYYY-MM-DD HH24:MI:SS'));
SELECT ename, to_char(hiredate, 'YYYY/MM/DD Q"/4분기" DAY HH24:MI:SS') show
FROM emp;
*/