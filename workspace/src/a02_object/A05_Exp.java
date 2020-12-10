package a02_object;

import java.util.*;

public class A05_Exp {
	public static void main(String[] args) {
/*
# 전날 복습 내용.
1. 조건문의 형식은 if, switch문이 있다. if문의 형식과 기본 예제를 기술하세요.
-> if(조건식 참) 일 경우, {} 안의 프로세스를 진행한다.
	if(boolean1){
		boolean1이 참일경우 실행된다.
	} else if(boolean2) {
		boolean1이 false이고, boolean2가 ture 일때, 실행된다.
	} else {
		boolean1,2모두 false이면 실행된다.
	}

2. 임의의 객관식 문제의 정답을 변수 corNum으로 할당하고 있다가,
	Scanner를 통해서 입력받은 변수 inputNum과 비교하여, 같으면 정답, 다르면
	오답을 처리하는 프로그램을 만드세요.
	
3. 반복문 for의 기본형식 2가지를 기술하세요.
-> for(초깃값, 반복조건, )
-> for(변수타입 변수명 : 반복할 객체 또는 배열)

4. 반복문에서 사용되는 continue와 break의 차이를 기술하세요.
-> continue는 반복문이 종료되지 않고 프로세서를 반복문의 첫부분부터 재시작한다.
-> break는 반복문을 종료시킨다.

5. for을 활용하여 3의 배수를 1~100까지 출력하고, 5의 배수를 100부터 50으로
	감소처리하는 구문을 만드세요,

6. 실수형 배열로 3명의 키를 할당하고, for문을 이용하여 출력하세요.

7. primitive data type의 default 데이터와 객체의 default 데이터에 대하여
	기술하세요.
-> byte, short, int, long = 0 // float, double = 0.0 // 객체는 null 값을 갖는다.
-> String = "" // char = null?
8. 클래스의 구성요소 3가지를 Music(타이틀, 가수)이라는 이름으로 선언하고
	호출하세요.

9. 생성자의 overloading은 무엇을 의미하는지 기술하세요.
-> 오버로딩은 적재한다는 의미를 담고있다.
생성자는 오버로딩 하지 않으면 컴파일러에서 자동으로 디폴트 생성자를 생성하게 된다.
하지만 클래스내에 오버로딩이 한개라도 되면 디폴트 생성자는 컴파일러에 의해 생성되지 않는다.
오버로딩의 조건은 이름은 같아야하며
파라미터로 오는 매개변수의 갯수가 다르거나 타입이 달라야만 오버로딩을 할 수 있다.
 */
		//ex2
		int corNum = 5;
		System.out.println("Ex2)");
//		System.out.print("정답을 입력하세요>>");
//		Scanner s = new Scanner(System.in);
//		int inputNum = s.nextInt();
		int inputNum = 5;
		System.out.println((corNum==inputNum) ? "정답" : "오답");
		System.out.println();

		//ex5
		System.out.println("Ex5)");
		for(int i=3; i<=100; i+=3) {
			System.out.print(i+" ");
		}
		System.out.println();
		for(int i=100; i>=50; i-=5) {
			System.out.print(i+" ");
		}
		System.out.println();
		System.out.println();
		
		//ex6
		System.out.println("Ex6)");
		double[] d = {177.5,180.2,160.7};
		for(int i=0; i<d.length; i++) {
			System.out.print(d[i] + " ");
		}
		System.out.println();
		System.out.println();
		
		//ex7
		System.out.println("Ex7)");
		Music m1 = new Music("정승환","어김없이 이 거리에");
	}
} 
class Music {
	String title;
	String singer;
	
	public Music(String title, String singer) {
		this.title = title;
		this.singer = singer;
	}
}
