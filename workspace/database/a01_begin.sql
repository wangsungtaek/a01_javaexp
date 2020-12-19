/*
# Database
1. 데이터 베이스란 무엇인가?
	데이터베이스란 여러 사람이 공유하여 사용할 목적으로 체계화해 통합, 관리하는 데이터의 집합이다.
	작성된 목록으로써 여러 응용 시스템들의 통홥된 정보들을 저장하여 운영할 수 있는 공용
	데이터들의 묶음이다.(위키백과)
2. 웹 프로그래밍에서 데이터베이스의 역할과 데이터베이스 식별
	1) 고정되어 유지하는 데이터를 체계적으로 저장 관리하는 역할을 한다.
		ex) 회원정보, 물품정보, 업무상 필요한 프로세스 정보..
		ex) 리스트 정보
		http:://browse.gmarket.co.kr/list?
		웹화면에 jsp로 요청 categoty=200001270 전달하며, database해당 category=200001270
		정보전달.
		
		select title, imgsrc, price
		from product
		where part ='유아용품'
		ordeer 판매개수 desc;
		order 판매갯수 desec;
		ex) 특정 상품에 대한 상세정보.
		select *
		from product
		where goodscode=125749989
		ex) 로그인 클릭시
		select *
		from member
		where id=? and pwd=?;
	
3. 데이터베이스 핵심 커리.
	1) SQL 기초
	2) 데이터타입
	3) 조건 검색 및 행의 정렬
	4) SQL 함수
	5) 그룹 함수
	6) 조인
	7) subquery
	8) 데이터 조작어
	9) 테이블관리
	10) 데이터무결성
	11) 인덱스 관리
	12) 뷰
	13) 권한 관리제어
	14) 계층적 질의문
	15) PL/SQL
	#) DB 설계
*/