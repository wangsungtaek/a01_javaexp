/*
1.
	1) 자리수 처리
		round(데이터, 자리수) : 반올림
		trunc(데이터, 자리수) : 절삭처리
	
	2) 정수로 처리
		ceil(데이터) : 올림
		floor(데이터) : 내림
	
	3) mod(m,n) : m에서 n을 나눈 나머지
*/

SELECT ename, sal, deptno||'%'