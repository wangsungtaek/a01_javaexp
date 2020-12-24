/*
# database에서 함수(function)
1. sql에서 함수(주로 내장함수)
	1) 컬럼의 값이나 데이터 타입이 변경하는 경우
	2) 숫자 또는 날짜 데이터의출력 형식이 변경하는 경우
	3) 하나 이상의 행에 대한 집계(aggregation)를 하는 경우

2. sql 함수의 유형
	1) 	단일 행 함수 : 테이블에 저장되어 있는 개별 행을 대상으로 하는 함수를
		적용하여 하나의 결과를 반환하는 함수
	2) 복수 행 함수 : 조건에 따라 여러 행을 그룹화하여 그룹별로 결과를 하나씩
		반환하는 함수..
*/
--  단일행 함수
SELECT ename, comm, nvl(comm,0) 보너스
FROM emp;
-- 복수행 함수
SELECT deptno, max(sal) "부서별 최고 연봉"
FROM emp
GROUP BY deptno;