/*
http://dbeaver.io/update/latest/
1. 오라클 사이트 접속 - 필요로하는 서버 설치 파일 다운로드
	ex) 11g xe	docker(맥사용자)
2. setup.exe 파일을 통해 실행
	1) 관리자 계정 비밀번호 설정 : 1111
		system
	2) 설치 여부 확인
		cmd 창에서 sqlplus 명령어 실행
		sqlpuls : 기본 오라클 DB client tools
		system/1111로 접속
3. 설치된 폴드에 주요 정보
	1) JDBC 드라이버
		D:\oraclexe\app\oracle\product\11.2.0\server\jdbc\lib\ojdbc6.jar
	2) sample script파일
		D:\oraclexe\app\oracle\product\11.2.0\server\rdbms\admin\scott.sql
		==> 연습용 데이터베이스 접속 계정과 테이블 생성
4. scott.sql(샘플 파일..) 파일변경
	계정명 : 대소문자 구별하지 않음.
	비밀번호 : 대소문자 구별 ==> tiger로 소문자로 변경.
5. sqlplus에서 관리자 계정으로 접속한 후, 해당 폴드 C:/Users/507-00에
	scott.sql을 위치시킨 후에, @scott.sql 명령어를 수행하여 주면 된다.
	@ ==> run
	run scott.sql
	scott/tiger 계정 생성과 함께 사용할 연습테이블 emp,dept 생성됨.
	conn scott/tiger; 로 접속하여
	select * from emp; 명령어를 통해서 실행한다.
6. eclipse 지원하는 database client plugin 설치
	1) 상단메뉴 help ==> market place
	2) dbeaver 검색 후, dbeaver 7.3.0 install
7. 서버와 client
	1) client가 서버에 접속할려면, 고유의 툴을 이용해서
		socket통신을 통해서 접속한다.
	2) 서버에 접속할 socket통신모듈을 만들어 놓고,
		그 모듈(driver-java에는 @@.jar)을 이용해서 접속한다.
8. driver를 이용해서 기본적으로 서버에 접속이 가능하다.
	0) ORACLE 서버에서 JDBC 드라이버 위치
	c:\oraclexe\app\oracle\product\11.2.0\server\jdbc\lib\\ojdbc6.jar
	1) oracle은 위에 언급한 경로 jdbc드라이버를 사용하기 쉬운
		경로에 설정하고, 해당 jdbc드라이버를 plugin에 설정한다.
		WebContent\WEB-INF\lib\ojdbc6.jar
		웹 프로그램에서 JDBC드라이버를 사용하고자 할 때..
9. eclise dbeaver 플로그인에서 설정방법
	1) 플러그인이 설정되면 2가지 메뉴 보임 SQL편집기, 데이터 베이스
	2) 데이터베이스에 드라이버 관리자에 가서 oracle ==> edit 클릭
	3) add file을 통해서 WebContent\WEB-INF\lib\ojdbc6.jar에 있는
	드라이버 선택
	4) find class ==> oracle.jdbc.driver.OracleDriver 선택
	5) 데이터베이스 메뉴 새데이터베이스 연결 oracle 선택
		host : localhost	port : 1521
		sid : XE
		계정 : scott/tiger
		test connection을 통해 확인 후, finish
10. sql 편집기를 통해서 새 sql편집기를 통해서 저장후..
	sql 작성 ctrl + enter를 통해서 실행..
	

eclipse 로 접속 안되시는 분들..
cmd 창에서 system/1111로 접속하여서 
아래 명령어를 하나씩 붙여 넣으세요..
그리고, 다시 접속하시길..

SQL> alter system set LOCAL_LISTENER='(ADDRESS=(PROTOCOL=TCP)(HOST=localhost)(PORT=1521))' scope=both;
SQL> alter system register;