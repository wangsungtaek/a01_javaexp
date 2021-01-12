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

/*student 테이블 번호 이름 국어 영어 수학
    student_seq로 1부터 시작하여 30번까지 입력되게 sequence를 만들어 입력처리하세요 
 */
CREATE TABLE student(
   snum NUMBER,
   sname varchar2(20),
   kor NUMBER,
   eng NUMBER,
   math number
);
INSERT INTO student VALUES (1,'홍길동',90,80,100);
SELECT * FROM student;

CREATE SEQUENCE student_seq
   INCREMENT BY 1
   START WITH 1
   MINVALUE 1
   MAXVALUE 30;
INSERT INTO student values(student_seq.nextval,'홍길동',80,80,80);
SELECT * FROM student;
--사번 코드 체계(입사년월4자리)(부서코드 2자리)(sequence5자리)
CREATE SEQUENCE com_seq
   START WITH 10000
   INCREMENT BY 1
   MINVALUE 10000
   MAXVALUE 99999
   CYCLE;
SELECT to_char(sysdate,'yymm')||'QA'||com_seq.nextval empno FROM dual;
/*
 # sequence의 수정과 삭제
 1. 시퀀스의 속성을 다음과 같은 형식으로 수정할 수 있다.
    1) 기본 형식
       alter sequence 시퀀스명
       increment by n
       maxvalue n|nomaxvalue
       minvalue n|nominvalue
       cycle|nocycle
       cache|nocache
    2) 변경처리 내용
       증가치, 최소값, 최대값 정의를 수정 가능하다.
       start with 절은 생성 직후 시작값을 변경 불가.
 */
SELECT student_seq.nextval FROM dual;

ALTER SEQUENCE student_seq
   INCREMENT BY 5
   MAXVALUE 99999;

SELECT student_seq.nextval FROM DUAL;
SELECT student_seq.currval FROM DUAL;

--   START WITH 15;--start with는 변경 불가   
--    minvalue|maxvalue : 현재값을 기준에서 너무 적거나 많은 변경은 불가능하다.
--  변경에 대한 한계로 인해 시퀀스 삭제가 필요로 하다.
/*
# squence 삭제
1. 기본 구분
	drop sequence 시퀀스명;
	cf) 오라클 관련 객체들은 drop 객체유형 객체명;
 */
SELECT EMP21.SEQ.CURRVAL FROM DUAL;
DROP SEQUENCE EMP21_SEQ;
SELECT MAX(EMPNO) FROM EMP21;
CREATE SEQUENCE EMP21_SEQ
	START WITH 7954
	MINVALUE 1000
	MAXVALUE 9999
	CYCLE;
