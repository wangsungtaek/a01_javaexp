/*
# 권한(privilege)
1. 권한이란?
	사용자가 데이터베이스 시스템을 관리하거나 객체를 이용할
	수 있는 권리
2. 권한의 종류
	1) 시스템 권한
		- 시스템 차원의 자원 관리나 사용자 스키마 객체 관리
		등과 같은 데이터베이스 관리 작업을 할 수 있는 권한
		- 오라클에서는 테이블, 뷰, 롤백 세그먼트, 프로시저
		와 같은 객체를 생성, 삭제, 수정하는 작업과 관련된
		140여 종류의 시스템 권한을 지원한다.
	2) 객체 권한
		- 테이블, 뷰, 시퀀스, 함수 등과 같은 객체를 조작
		할 수 있는 권한
		- 객체의 종류에 따라 서로 다른 유형의 객체 권한
		- 테이블의 컬럼별로 insert, update, references
		등의 권한을 상세 부여한다.
3. 계정 생성과 권한 설정
	1) 사용자 생성 권한이 있는 계정으로 접근.
	2) 사용자 생성 script 처리.
		create user 사용자명 identified by 비밀번호;
		ex) create user orauser01
			identified by user01;
	3) 접속 권한을 할당, 처리
		grant 권한명 to 계정명;
		create sesstion : 접속을 가능하는 권한
		ex) grant create session
			to orauser01;
-- ex) 계정 생성 예제 oraclstudy/oracle로 계정을 생성하고,
--		접근 권한을 설정하고 다시 접근 해보세요
SQL> create user oraclestudy identified by 1111;
SQL> grant create session to oraclestudy;
SQL> conn oraclestudy/1111;
	4) 비밀번호 변경
		alter user 계정명 identified by 변경할비밀번호;
**/
ALTER USER orauser01 IDENTIFIED BY 1111;
-- ex1) himan 계정 생성 및 비번 변경
-- SQL> create user himan identified by 7777; -- 계정 생성 
-- SQL> grant create session to himan; -- 접근 권한 부여
-- SQL> alter user himan identified by 1111; -- 비밀번호 변경


/*
# 시스템 권한
1. 일반 사용자가 가질 수 있는 시스템 권한
	- 사용자가 생성한 객체를 관리, 내장 프로시저를 관리하는 권한을 말한다.
2. 시스템 권한의 종류
	- create session : 데이터베이스 서버에 접속할 수 있는 권한
	- create table : 사용자 스키마에서 테이블을 생성할 수 있는 권한
	- create sequence : 사용자 스키마에서 시퀀스를 생성할 수 있는 권한
	- create view : 사용자 스키마에서 뷰를 생성할 수 있는 권한
	- create procedure : 사용자 스키마에서 프로시저, 함수, 패키지를
		생성할 수 있는 권한.
3. 시스템 권한 부여
	- 시스템 권한은 특정 사용자나 모든 사용자에세 부여 기능
	- grant 명령문을 사용한다.
	- 권한부여 기본형식
		grant 권한명 to 사용자[public] : public는 모든 사용자에게 권한부여
		[with admmin option] : 권한의 재할당을 할 수 있게 한다.
	- resource는 위에 정의된 내용을 한번에 할당할 수 있는 권한 처리
		ex) grant resource to 사용자;
4. 객체 권한
	- 객체 권한은 테이블, 뷰, 시퀀스, 함수 등과 같이 객체별로 사용할 수 있는 권한
	- 종류
		select, insert, update, delete
		alter, execute, index, references
ex) higirl/8888 계정 생성하고, 시스템 권한 부여/객체권한 부여하여
	테이블을 생성하고, 데이터를 입력 조회하세요.
SQL> create user higirl identified by 8888;
SQL> grant create session, create table, resource to higirl;
SQL> conn higirl/8888;
SQL> create table tmp(name varchar2(10));
SQL> insert into tmp values('홍');
SQL> select * from tmp;
	- 대상 객체별로 특정 권한 부여
		grant 객체권한 on 객체 to 계정명;

5. 권한의 철회
	1) 기본형식
		revoke 권한명
		on 객체(테이블, sequence 등 사용 객체)
		from 계정명;

SQL> conn scott/tiger;
SQL> create table temp(col1 varchar2(10));
SQL> insert into temp values('himan');
SQL> grant select on temp to oraclestudy;
SQL> grant insert on temp to oraclestudy;
-- scott 계정에서 temp테이블에 대한 insert권한을 orclestudy에 할당
SQL> conn system/oracle;
SQL> grant resource, create session, create table to oraclestudy;
SQL> conn oraclestudy/1111;
SQL> select * from scott.temp; -- scott계정의 temp테이블 조회가능
SQL>  ,.insert into scott.temp values('asdaa');

-- 관리자 계정으로 기본적인 차원에 대한 권한할당
ex) scott계정으로 접근해서 member3테이블로 id,pass,name을 설정하고,
	데이터를 등록한 후,
	member3테이블에 대한 조회와 입력권한을 himan계정에 부여한다.
	다시 himan으로 접근한 후, scott계정의 member3테이블에 조회와 등록처리를
	확인한다.
SQL> conn scott/tiger;
SQL> create table member3(id varchar2(20), pass varchar2(20), name varchar2(20));
SQL> grant select on member3 to himan;
SQL> grant insert on member3 to himan;
SQL> conn himan/1111;
SQL> select * from scott.member3;
SQL> insert into scott.member3 values('hi','1234','gima');
SQL> select * from scott.member3;

-- 권한 회수
SQL> conn scott/tiger;
SQL> revoke select, insert on temp from oraclestudy;
SQL> conn oraclestudy/1111;
SQL> select * from scott.temp;

-- ex) scott계정에서 himan에 준 member3테이블에 대한 
	select, insert권한을 회수하고, himan으로 접속해서 확인하세요
conn scott/tiger;
revoke select, insert on member3 from himan;
conn himan/1111;
select * from scott.member3;

-- 
*/