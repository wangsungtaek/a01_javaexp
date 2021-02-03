/*
# instr(지정된문자열데이터|컬럼, '검색문자')
1. 특정한 문자열을 검색해서 해당 문자열의 위치를 index로 반환해주는 처리를 하는 것을 말한다.
	ex) 주로 대용량의 문자열 데이터를 검색해서 해당 문자의 위치를 indexing 해당 문자의
		위치를 찾아서 처리해야할 필요가 있을 때, 활용된다.
*/
SELECT instr('sql*plus', '*') FROM dual;
SELECT * FROM emp;

-- ex) job 컬럼에서 'A'문자가 나오는 위치를 검색하여 위치를 출력하세요.
SELECT job,
	   instr(job,'A') AS 인덱스
  FROM emp;
 
/*
# lpad(left padding), rpad(right padding)
	1) lpad(컬럼/데이터, 지정한크기, 덧붙일문자열) : 왼쪽에 문자열 덧붙이기.
	2) rpad(컬럼/데이터, 지정한크기, 덧붙일문자열) : 오른쪽에 문자열 덧붙이기.

	지정한 크기를 설정하고 그보다 적은 데이터는 해당 문자열로 채워주는 처리.
*/
SELECT lpad('sql',5,'*') AS "왼쪽에 * 5회",
	   rpad('sql',5,'*') AS "오른쪽에 5회"
  FROM dual;
  
-- ex) 사원 테이블에 ename은 전체 6으로 job은 8로 설정하여
--		ename은 왼쪽에 #기호를 job은 오른쪽에 #기호를 추가하여 처리하세요.
SELECT lpad(ename,6,'#') AS 이름,
	   rpad(job,8,'#') AS 직업
  FROM emp;

/*
#ltrim/rtirm 왼쪽/오른쪽 지정 문자 삭제 처리.
**/
SELECT ltrim('*****sql*****','*') AS s1,
	   rtrim('*****sql*****','*') AS s2
  FROM emp;

-- ex) job 뒤에 있는 'MAN'을 삭제 처리하여 출력하세요.
SELECT ltrim(job,'MAN') AS job
  FROM emp;