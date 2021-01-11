/*
# sequence
1. oracle 서버에서 유일한 식별자 만들기 위한 객체
2. 기본 키를 자동을 numbering 처리한다.
3. 여러 테이블에서 공유가 가능..
4. 기본 형식
	CREATE SEQUENCE 시퀀스명
		INCREMENT BY N : 증가 단위
		START WITH N : 초기 번호
		MAXVALUE N | NOMAXVALUE : 최대 데이터
		MINVALUE N | NOMINVALUE : 최소 데이터
		CYCLE | NOCYCLE : 최대 /최소에 이를 때, 반복여부
		CACHE | NOCACHE : 속도향상을 위한 캐시메모리
				사용 여부
*/
SELECT MAX(EMPNO) FROM EMP21;

CREATE SEQUENCE EMP21_seq
  INCREMENT BY 1
  START WITH 7935
  MINVALUE 1000
  MAXVALUE 9999
  CYCLE;
SELECT EMP21_seq.nextval FROM dual;
SELECT EMP21_seq.currval FROM dual;

INSERT INTO EMP21(EMPNO, ENAME) VALUES(EMP21_seq.nextval, '홍길동');
SELECT * FROM EMP21
ORDER BY EMPNO DESC;