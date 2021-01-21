-- 1. 부서 10과 30에 속하는 모든 사원의 이름과 부서번호를 이름과 알파벳 순으로 정렬되도록 질의문을 만드세요.
-- 2. 1982년도에 입사한 모든 사원의 이름과 입사일을 출력하세요(like %활용).
-- 3. 보너스가 급여의 20%이상이고 부서번호가 30인 모든 사원에 대하여 이름, 급여, 그리고 보너스를 출력하세요. 급여(sal), 보너스(comm)
-- 4. like 키워드에서 %, _ 의미를 기술하고 간단한 예제를 만드세요.
-- 5. 가장 최근에 입사한 사원의 이름과 입사일을 출력하세요(in subquery구문 활용)

-- 1.
SELECT ename, deptno
FROM emp
WHERE deptno IN(10,30);

-- 2.
-- ''||날짜형 강제 타입케스팅 HIREDATE LIKE '%82%'; 문자열 타입케스팅된 내용을 비교
-- 원칙적으로 날짜형 ==> 함수에 의해 ==> 문자열로 변환 변환된 문자열을 비교 연산자로 비교
SELECT ename, hiredate AS 입사일, ''||hiredate AS 날짜
  FROM emp
 WHERE HIREDATE LIKE '%82%';

SELECT ename 이름, hiredate 입사일
  FROM emp
 WHERE hiredate LIKE '%82%';

--4 
/*
	컬렁명 like '%검색할 키워드%'
1. 앞뒤에서 시작하는 문자열 검색 :
		컬럼명 like '시작문자열%'
		컬럼명 like '%마지막문자열'
2. 정확한 자리수에 문자/문자열 _(언더바)를 활용
	ex( 두번째에 A가 포함하는 문자열 검색 : 컬럼명 like '_문자열%'
	%s는 중간에 문자의 갯수 제한 없고, _해당 문자의 갯수를 체크
*/		

SELECT ename, hiredate
FROM  emp
WHERE hiredate in(SELECT max(hiredate) FROM emp);
 * 
