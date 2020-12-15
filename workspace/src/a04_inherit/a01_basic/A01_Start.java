package a04_inherit.a01_basic;
/*
# 상속
1. 생각해봅시다.
	1) 현실 세계에서 상속은 어떤 개념인가?
	2) 상속은 어떤 효과가 있는가?
	3) 프로그래밍에 있어서 공통과 개별로 분화되면 어떤 장점이 있는가?
	4) 추가되는 기능이 다른 프로그래밍에 영향을 미치지 않게 하는 방법은 없을까?
	5) 효과적안 설계와 그 바탕하에 프로그래밍을 할려면 어떤 처리가 필요할까?
	
2. 학습목표
	1) 자바 프로그램에서 상속은 어떤 것인지를 명확히 파악한다.
	2) 상속의 기본 코드를 알고, 상속이 필요하는 다양한 상황에서 적절한 프로그래밍을 할 수 있다.
	3) 상속을 할 때, 생성자와 메서드 필드에는 어떤 영향이 있는지 안다.
	4) 메서드 overriding 개념을 알고, 실제 코드를 할 수 있다.
	5) 상속에서 접근 제어자와 어떤 영향이 있는지 알고, 접근 제어자를 적절하게 사용 할 수 있다.
	6) 상속에서 형변환의 의미를 알고, 활용할 수 있다.
	7) 추상 클래스의 기본 형식과 프로그래밍에서 필요한 경우를 파악하여 활용 할 수 있다.
	8) 인터페이스를 효과적으로 활용할 수 있다.
	
3. 주요 내용..
	1) 상속 개념
	2) 클래스 상속
	3) 부모 생성자 호출
	4) 메서드 재정의
	5) final 클래스와 final 메서드
	6) protected 접근 제한자
	7) 타입 변환관 다형성
	8) 추상클래스..

# 상속이란?
1. 현실세계 : 부모가 자식에게 물려주는 행위, 부모가 자식을 선택해서 물려주는 것을 말한다.
2. 객체 지향 프로그램
	- 자식(하위, 파생) 클래스가 부모 클래스의 멤버를 물려 받는 것
	- 자식이 부모를 선택해 물려받음.
	- 상속의 대상은 부모의 필드와 메서드이다.
3. 기본 형식
	class 상위클래스{
		필드1
		메서드1
	}
	class 하위클래스 extends 상위클래스{
		필드2
		메서드2
		// 하위 클래스에서는 상위클래스가 가지고 있는 필드1, 메서드1을
		// 접근제어자 범위에서 사용할 수 있다.
	}
# 상속 대상 제한.
1. 부모 클래스의 접근제한자 범위 안에서 
 */

public class A01_Start {
	public static void main(String[] args) {
		Son s1 = new Son();
		System.out.println("상위 객체의 필드 활용:"+s1.charac);
		s1.swim();
		// ex) Mother(어머니) 속성 : skill - 사람과 대화를 잘하다.
		//					메서드 : cooking() - 요리를 하다.
		//	   Daugher(딸) : 어머니 클래스를 상속
		//					속성 : study - 공부를 잘하다.
		//					메서드 : run() - 달리기를 하다.
		//	상속관계의 내용을 설정해서 하위 메서드 // main() 호출하여 사용하는 것을
		//	나타낼 수 있도록 한다.
		Daugher daugher = new Daugher();
		System.out.println(daugher.skill);
		daugher.callAll();
	}
}

class Son extends Father{
	String height = "키가 크다.";
	void training() {
		System.out.println("운동을 잘 한다!!");
		System.out.println(charac); // 상윈에 정의된 필드 사용.
		swim(); // 상위에 정의된 메서드 활용..
//		System.out.println(age); // 상속을 하더라도 접근제어자 범위를 넘어서 처리할 수 없다.
	}
}
// # 자바는 Extends를 이용해 상위 객체를 여러개 사용하는 다중 상속이 불가능한다.
// 불가능하다. - 단일 상속만 가능하다.(하위에서 상위를 바라보는 입장에서)
// class Son3 extens Father, Mother {} // 에러 발생..


class Mother {
	String skill = "사람과 대화를 잘한다.";
	void cooking() {
		System.out.println("요리를 하다.");
	}
}
class Daugher extends Mother {
	String study = "공부를 잘하다.";
	void run() {
		System.out.println("달리기를 하다.");
	}
	void callAll() {
		System.out.println("상위필드:"+skill);
		cooking();
		System.out.println("현재 객체 필드:"+study);
		run();
	}
}