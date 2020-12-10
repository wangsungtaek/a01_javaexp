package a02_object.a03_method;

public class A01_ReturnProc {
	// # 메서드의 리텅 유형..
	// 1. void : 리턴할 데이터가 없을 때.
	// 		주로 입력만 하거나 화면에 출력하는 용도로만 쓰일 때, 활용된다.
	void showHello() {
		System.out.println("안녕하세요!!~~");
	}
	void showHellos2(String name) {
		System.out.println(name + "님 안녕하세요!!~~");
	}
	// 2. int : 정수형 데이터의 return
	int plus(int num01, int num02) {
		int sum = num01 + num02;
		return sum;
	}
	// 3. String : 문자열 데이터 return
	String chMember(int chIdx) {
		String gender = "남자";
		if(chIdx == 0) {
			gender = "여자";
		}
		return gender;
	}
	int multiply(int price, int cnt) {
		return price * cnt;
	}
	
	public static void main(String[] args) {
		A01_ReturnProc a01 = new A01_ReturnProc();
		a01.showHello();
		a01.showHellos2("김진희");
		int sum = a01.plus(25,30);
		// 리턴하는 데이터를 해당 라인에 특정한 데이터
		// 메모리를 가지고 있다. 55라는 데이터는 현재 메모리에 있다.
		// 처리를 할려면 특정한 메모리를 만들어 할당하거나,
		// 출력메서드 System.out.println를 통해서 출력한다.
		System.out.println("합산한 데이터:"+sum);
		System.out.println();
		
		// ex1) 물건 가격과 갯수를 입력받아서 곱셈연산 후 리턴할 데이터 메서드를
		//	선언하고, 그 리턴값을 출력하세요..
		System.out.println("ex1)");
		System.out.println(a01.multiply(1000, 2));
		System.out.println();
		
/*
# 메서드의 리턴값 처리..
1. 객체는 생성자와 필드를 통해서 데이터를 저장하고,
	또한, 특정 메서드를 통해서 데이터 변경/수정할 수 있다.

2. 메서드 기능 중에 특정 데이터가 입력되면, 그 결과 데이터
	여러 조건/반복을 통해서 원하는 결과를 처리할 수 있다.
	
3. 메서드 return값은 메서드를 통해서 최종 결과값을 가져오는 것을
	말한다.

4. 기본 형식..
	리턴데이터type 메서드명(매개변수1, 매개변수2){
		// 처리될 프로세스..
		return 실제 리턴할 값;
	}
	
	
 */
	}
}
