package a01_basic;

public class A06_Process {
	public static void main(String[] args) {

/*
# 코드 실행과 흐름 제어
1. main(String[] args)메서드 블럭({})안에서 코드는 위에서 아래로 실행된다.
	대입연산자에 의해서 오른쪽에서 왼쪽으로 데이터가 흘러간다.
	int num01 = 70;
2. 특정한 에러나 문제가 발생하면 해당 라인에서 프로세서가 중지가 되고, 예외를 던져
	그 이후에 코드는 처리되지 않는다.
	- 이에 대한 대안으로 조건문(ex - heap 영역에 메모리가 할당되지 않는 경우를
	감안해서 조건문 처리), 예외(Exception) 처리를 한다.
# 제어문
1. 코드 실행 흐름을 개발자가 의도하는 방향으로 흘러 갈수 있도록 처리하는 코드를 말한다.
특정한 코드를 처리 하거나 생략, 반복 수행하게 하는 것을 말한다.
2. 제어문의 기본형식..
	1) 조건문 기본 형식..
		if(boolean1) {
			boolean1이 true일 때, 처리될 코드 내용.
		}
	2) 분기 조건문2
		if(boolean2) {
			boolean2이 true일 때, 처리할 코드
		} else {
			boolean2이 false일 때, 처리할 코드
		}
	3) 분기 조건문3
		if(boolean3) {
			boolean3이 true일 때, 처리할 코드
		} else if(boolean4) {
			boolean3이 false이고, boolean4가 true일 때 치리할 코드..
		} else {
			위에 나열된 boolean3과 boolean4에 해당하지 않을 때,
			처리할 코드..
		}
 */
/*
	ex1) num01에 1~4 중에 임의의 데이터를 할당하고,
		num02에 1~4 중에 임의의 데이터를 할당했을 때,
		동일하면 정답 그외에는 오답으로 표기하세요 if else 활용..
	ex2) point 점수를 0~100까지 임의로 할당하고,
		90이상일 때, A... 80이상일 때, B등 학점 계산하는 프로그램을
		만들어 출력하세요..if else if.. 문 활용.
 */
		int num01 = (int)(Math.random()*4+1);
		int num02 = (int)(Math.random()*4+1);
		System.out.println("num01 : "+num01);
		System.out.println("num01 : "+num02);
		if(num01==num02) {
			System.out.println("정답");
		} else {
			System.out.println("오답");
		}
		System.out.println();
		
		int point = (int)(Math.random()*100+1);
		System.out.println("점수 : "+point);
		if(point >= 90) {
			System.out.println("A등급");
		} else if(point >= 80) {
			System.out.println("B등급");
		} else if(point >= 70){
			System.out.println("C등급");
		} else if(point >= 60){
			System.out.println("D등급");
		} else {
			System.out.println("F등급");
		}
	}
}
