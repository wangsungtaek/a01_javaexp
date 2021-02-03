/*
# 정규화
1. 이상 현상이 발생하지 않도록, 릴레이션을 관련 있는 속성들로만
구성하기 위해 릴레이션을 분해(decomposition)하는 과정
함수적 종속성을 판단하여 정규화를 수행함

2. 함수 종속
"X가 Y를 함수적으로 결정한다"
릴레이션 내의 모든 투플에서 하나의 X값에 대한 Y값이 항상 하나임
X와Y는 하나의 릴레이션을 구성하는 속성들의 부분 집합
"Y가 X에 함수적으로 종속되어있다"와 같은 의미
X->Y로 표현(X는 결정자, Y는 종속자)

3. 함수 종속 관계 판단 시 유의 사항
속성 자체의 특성과 의미를 기반으로 함수 종속성을 판단해야 함
속성 값은 계속 변할 수 있으므로 현재 릴레이션에 포함된 속성 값만으로 판단하면 안됨
일반적으로 기본키와 후보키는 릴레이션의 다른 모든 속성들을 함수적으로 결정함
기본키나 후보키가 아니어도 다른 속성 값을 유일하게 결정하는 속성은 함수 종속
관계에서 결정자가 될 수 있음

4. 완전 함수 종속(FFD; Full Functional Dependency)
릴레이션에서 속성 집합 Y가 속성 집합 X에 함수적으로 종속되어 있지만, 속성 집합
X의 전체가 아닌 일부분에는 종속되지 않음을 의미
일반적으로 함수 종속은 완전 함수 종속을 의미함
예) 당첨여부는 {고객아이디, 이벤트번호}에 완전 함수 종속됨

5. 부분 함수 종속(PFD; partial Functional Dependency)
릴레이션에서 속성 집합 Y가 속성 집합 X의 전체가 아닌 일부분에도 함수적으로 종속됨을 의미

6. 정규화(normalization)
1) 개념
	함수 종속성을 이용해 릴레이션을 연관성이 있는 속성들로만 구성되도록 분해해서,
	이상 현상이 발생하지 않는 올바른 릴레이션으로 만들어 가는 과정
	기본 목표 : 관련이 없는 함수 종속성은 별개의 릴레이션으로 표현
2) 주의사항
	정규화를 통해 릴레이션은 무손실 분해(nonloss decomposition)되어야 함
	릴레이션이 의미상 동등한 릴레이션들로 분해도어야 하고, 분해로 인한 정보 손실이
	발생하지 않아야 함 분해된 릴레이션들을 자연 조인하면 분해 전의 릴레이션으로
	복원 가능해야 함
3) 정규형(NF; Normal Form)
	릴레이션이 정규화된 정도
	각 정규형마다 제약조건이 존재
	정규형의 치수가 높아질수록 요구되는 제약조건이 많아지고 엄격해짐
	릴레이션의 특성을 고려해서 적합한 정규형을 선택
4) 정규화 과정.
	 - 제 1 정규형(1NF; First Normal Form)
	 릴레이션의 모든 속성이 더는 분해되지 않는 원자 값(atomic value)만 가지면
	 제 1 정규형을 만족함 제 1 정규형을 만족해야 관계 데이터베이스의
	 릴레이션이 될 자격이 있음
예) 고객이름은 {고객아이디, 이벤트번호}에 부분 함수 종속됨

*/
CREATE TABLE nomalform1 (
	cus_id varchar2(30),
	event_no varchar2(100),
	is_checked varchar2(50),
	grade varchar2(30),
	discount number	
);
INSERT INTO nomalform1 values('apple', 'E001,E005,E010','Y,N,Y', 'gold', 0.3);
INSERT INTO nomalform1 values('banana', 'E002','N,Y', 'vip', 0.2);
INSERT INTO nomalform1 values('carot', 'E003,E007','Y,Y', 'gold', 0.3);
INSERT INTO nomalform1 values('orange', 'E004','N', 'silver', 0.05);
SELECT * FROM nomalform1;
/*
normalform1를 원자값 : 테이블의 컬럼에 데이터는 1개의 데이터가 들어서 처리되어야 한다.
제 1정규화가 처리가 된 normalform2테이블을 만들고 데이터 입력 처리 결과를 확인 해주세요.
*/
CREATE TABLE nomalform2
AS SELECT * FROM nomalform1 WHERE 1=0;
INSERT INTO nomalform2 VALUES('apple','E001','Y','gold',0.5);
INSERT INTO nomalform2 VALUES('apple','E005','N','gold',0.5);
INSERT INTO nomalform2 VALUES('apple','E010','Y','gold',0.5);
INSERT INTO nomalform2 VALUES('banana','E002','N','vip',0.2);
INSERT INTO nomalform2 VALUES('banana','E002','Y','vip',0.2);
INSERT INTO nomalform2 VALUES('carot','E003','Y','gold',0.1);
INSERT INTO nomalform2 VALUES('carot','E007','Y','gold',0.1);
INSERT INTO nomalform2 VALUES('orange','E004','N','silver',0.05);
SELECT * FROM nomalform2;
/*
	- 제 2 정규형(2NF; Second Normal Form)
	릴레이션이 제 1 정규형에 속하고, 기본키가 아닌 모든 속성이 기본키에
	완전 함수 종속되면 제 2 정규형을 만족함
	제 1 정규형에 속하는 릴레이션이 제 2 정규형을 만족하게 하려면?
	부분 함수 종속을 제거하고 모든 속성이 기본키에 완전 함수 종속되도록 분해
	
ex) 1정규화가 끝난 테이블을 완전함수 종속적으로
	nomalform3_1, nomalform3_2 로 테이블을 분리시켜 2정규화를 처리하세요.
*/
SELECT DISTINCT cus_id, grade, discount FROM normalform2;
SELECT DISTINCT cus_id, event_no, is_checked
  FROM normalform2
ORDER BY event_no;

CREATE TABLE normalform3_1
AS SELECT DISTINCT cus_id, grade, discount FROM normalform2;
CREATE TABLE normalform3_2
AS SELECT DISTINCT cus_id, event_no is_checked
  FROM normalform2
ORDER BY event_no;
SELECT * FROM normalform3_1;
SELECT * FROM normalform3_2;

/*
* 이행적 함수 종속(transitive FD)
	릴레이션을 구성하는 3개의 속성 집합 X, Y, Z에 대해 함수 종속 관계 X -> Y와 Y -> Z가
	존재하면 논리적으로 X -> Z가 성립되는데, 이때 Z가 X에 이행적으로 함수 종속되었다고 함
3 제 3 정규화(3NF; Third Normal Form)
	릴레이션이 제 2 정규형에 속하고, 기본키가 아닌 모든 속성이 기본키에 이행적 함수 종속이
	되지 않으면 제 3 정규형을 만족함 제 2 정규형에 속하는 릴레이션이 제 3 정규형을 만족하게 하려면?
	모든 속성이 기본키에 이행적 함수 종속이 되지 않도록 분해
ex) normalform3_1 테이블을 이행적 함수 종속에 의해 분리시켜
normalform4_1, normalform3_2로 분리시켜 제 3정규형처리를 완료하세요
*/

UPDATE normalform3_1
SET discount = 0.1
WHERE grade = 'gold';
SELECT * FROM normalform3_1;
CREATE TABLE normalform4_1
AS SELECT cus_id, grade FROM normalform3_1;
CREATE TABLE normalform4_2
AS SELECT DISTINCT grade, discount
FROM normalform3_1
ORDER BY grade;
SELECT * FROM normalform4_1;
SELECT * FROM normalform4_2;