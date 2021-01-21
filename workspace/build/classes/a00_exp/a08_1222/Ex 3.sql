/*
1. sql 명령문의 종류(ex DQL, DDL...)와 기능을 설명하고 주요 명령문의 예제 확인해서 정리하세요.
	1) DQL(data query language) 질의어 : 데이터 검색시 사용 ex) select * from 테이브ㅡㄹ
	2) DML(data manipulation language) : 데이터 조작어 :
		ex) insert into 테이블명(컬럼명1, 컬럼명2..) values(데이터1, 데이터2..);
			update 테이블명
			   set 컬렴명 = 변경할데이터,
			   		컬럼명 = 변경할데이터
			where 조건문;
			delete
			from 테이블명
			where 조건문; 삭제는 row단위로 하기때문에 컬럼명을 지칭할 필요가 없음.
	3) DOL(data defintion language) 데이터 정의어
		create 객체의 생성, alter 객체의 구조변경(ex-컬럼의 타입변경..),
		drop 객체의 삭제, rename 객체의 이름 변경, truncate 저장공간에서 삭제.
	4) TCL(transaction control language) 트랜잭션 처리어.
		dml 처리 후, session별(계정접속) 트랜잭션 처리 완료 및 취소를 해주는 것을 말한다.
		commit : dml 처리 확정, rollback : dml 처리 취소, savepoint : 임의의 저장지점 설정
	5) DCL(data control language) : 계정별 권한 부여 처리..
		grant 권한을 부여, revoke 권한의 부여 취소

2. sal+comm으로 연산하는 경우 comm null인 경우, 문제가 발생한다. 어떤 문제이고 이것을 해결할려면 어떤 처리를 하는지 정리하세요.
	데이터베이스에서 null인 데이터는 연산을 처리시, 연산 결과가 null로 처리 된다. null인 경우 숫자값을'
	default인 0으로 설정해주는 함수로 지정하는 경우와 조건절에서 null을 배제하는 경우가 있다.
	nv1(컬럼명, null일경우 치리할 데이터)
	위 경우,
	1) select sal + nvl(comm,0) 총계
	2) select sal + comm
		from emp
		where comm is null;

3. 오라클에서 사용하는 주요 데이터 타입의 종류를 예시와 함께 기술하세요.
	데이터베이스에서 각 컬럼에 대한 데이터 타입을 설정하여, 적절한 데이터의 크기와 유형과 사용형태
	맞게 설정해 준다.
	create table 테이블명(컬럼명1 데이터타입, 컬럼명2 데이터타입);
	1) varchar2(최대크기) : 사용하는 최대크기를 설정하고, 입력되는 데이터에 따라 가변적으로 데이터크기가
		설정되는 것을 말한다. 최대 4000바이트.. - 메모리효율화를 이룰 수 있다.
	2) number, number(p,s) : 정수/실수 등 숫자형 데이터를 설정할 때, 활용된다. 정밀도(p)와 스케일(s)
		로 표현된다. 전체크기, 소숫점 이하 크기로 쉽게 표현한다.
	3) date : 날짜/시간 형식을 저장하기 위한 데이터 타입..
	4) char(고정크기) : 고정길이 문자 데이터타입, 최대 2000바이트
		코드성 데이터 즉, 학번, 사번, 주민번호 등과 같이 길이가 일정하여 변경될 일이 없는 경우 사용된다.
		가변형에 비해 입력 속도가 빠르다.
	-----------------------------------------------------------
	5) nvarchar2(최대크기) : 국가별 문자 집합에 따른 최고 크기의 문자를 설정하는 가변형 데이터 처리.
	6) rowid : 테이블 내 행의 고유 주소를 가지는 64진수 문자 타입. 행당 6바이트 또는 10바이트
	7) blob : 대용량의 바이너리 데이터를 저장하기 위한 데이터타입 최대, 4gb
	8) clob : 대용량의 문자열 데이터를 저장하기 위한 데이터타입 최대, 4gb
	9) bfile : 대용량의 바이너리 데이터를 파일 형태로 저장하기 위한 데이터 타입, 4gb
	1) timestamp(n) : 날짜형 데이터타입의 확정된 형태 n은 millisecond. 자리수는 최대 9자리까지 표현 가능

4. 
*/
--6. 스포츠 스타의 이름 소속사 올해 성적을 입력하는 테이블을 만들고 데이터를 입력하고 조회하세요.
	CREATE TABLE sprotstar(
		name varchar2(30),
		team varchar2(50),
		records NUMBER -- 컬럼명을 입력하다가 대문자로 변경이 되는 경우 내장된 keyword이기 때문에 변경요망
	);
	INSERT INTO sprotstar VALUES('류현진','토론토 블루제이스',2.69);
	SELECT * FROM sprotstar;
/*
7. select에서 쓰이는 컬럼과 where 조건의 비교 연산자에 쓰이는 컬럼은 어떤 차이가 있는가?
	select 선택컬럼1, 선택컬럼2
	from 테이블
	where 조건컬럼1 = 데이터,
	and 조건컬럼2 = 데이터
	
	선택컬럼 : 출력할 컬럼에 대한 선택을 처리한다.(열단위 선택)
	조건컬럼 : 출력할 row단위 filtering 처리 (행단위 filtering 처리)
	#2차원의 데이터를 SELECT, WHERE에 의해서 행/단위로 선택 및 FILTERING 을 해준다.
 */
	SELECT empno, ename, job
	FROM emp
	WHERE job = 'SALESMAN';
/*
8. where 조건에 쓰이는 비교 연산자의 종류와 논리 연산자의 종류를 기술하세요.
	WHERE 컬럼명1 = 데이터
	AND 컬럼명2 = 데이터
	비교 연산자 : =, !=, <>, <, <=, >, >=(연산자)
	논리 연산자 : and, or, not
	기타 함수나 키워드 : between a and b, is null, in ..
	
9. between, in 구문의 기본형식을 선언하고, 기본 예제를 기술하세요.
	컬럼명 between A and B : A와 B 사이
	컬럼명 in (데이터1, 데이터2...), 컬럼명 in (subquery)
*/
	SELECT * FROM emp WHERE sal BETWEEN 1000 AND 3000;
	SELECT * FROM emp WHERE deptno in(10,30);