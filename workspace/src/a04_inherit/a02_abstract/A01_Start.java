package a04_inherit.a02_abstract;

/*
# 추상클래스
1. 추상이란 ?
	실체들 간의 공통되는 특징을 추출해서 그 특징에 맞는 실체를 만들기 위해
	선언한다.
	1) 새, 곤충, 물고기 ==> 동물(추상)
	2) 삼성, 현대, LG ==> 회사(추상)

2. 추상클래스란 ?
	1) 실제 클래스의 공통 속성을 추출하여 필드와 메서드로 정의하여 서용하는 클래스를
	말한다.
	2) 목적아 살제 클래스를 공통적인 필드와 메서드를 사용하기 위한 것이기 때문에 단독
	객체로 사용하지 않는다.
	
3. 추상클래스는 왜 사용하는가 ?
	1) 하위 실제 클래스의 공통되는 필드와 메서드를 정의하기 위하여 사용된다.
		특히, 추상 클래스 안에 추상 메서드는 상속 받는 하위 클래스에서 반드시 정의하여야 하기 때문에,
		메서드의 통일성을 유지할 수 있다.
		
4. 기본 형식
	abstract class 추상클래스명 {
		
		// 반드시 1이상 추상메서드가 선언되어야 한다.
		// 추상메서드는 boby({})가 없다.
		abstract void call();
		public void show1(){} // 공통되는 기능 메서드를 포함.
		public void show2(){}
	}
	
 */
abstract class Animal {
	public void move() { // 일반 공통 메서드
		System.out.println("이동을 한다.");
	}
	public abstract void sound(); // body({}) 없는 추상메서드 선언..
}

class Dog extends Animal{
	// 추상 클래스를 상속 받은 하위 클래스에서는 추상메서드를 반드시 상속 받아야 한다.
	@Override
	public void sound() {
		System.out.println("멍멍!!");
	}
}
class Cat extends Animal{
	// 추상 클래스를 상속 받은 하위 클래스에서는 추상메서드를 반드시 상속 받아야 한다.
	@Override
	public void sound() {
		System.out.println("야옹!!");
	}
}
/*
 * ex) 추상클래스 phone 필드 : 전화번호 추상메서드 : specialFunc()
 * 					일반 메서드 turnOn(), turnOff() 전원을 켜다/끄다.
 * 		상속받은 실제1 SmartPhone 추상메서드 overriding처리. 인터넷 검색
 * 		상속받은 실제2 CompanyPhone 추상메서드 overriding처리. 다른 직원에게 전화를 돌리다.
 */
abstract class Phone {
	private String number;
	public Phone(String number) {
		super();
		this.number = number;
	}
	public abstract void specialFunc();
	void turnOn() {
		System.out.println(number+" 번호의 폰의 전원을 끄다.");
	}
	void turnOff() {
		System.out.println(number+" 번호의 폰의 전원을 끄다.");
	}
}

class SmartPhone extends Phone {
	public SmartPhone(String number) {
		super(number);
		// TODO Auto-generated constructor stub
	}

	@Override
	public void specialFunc() {
		System.out.println("인터넷을 검색하다.");
	}
}
class CompanyPhone extends Phone {
	public CompanyPhone(String number) {
		super(number);
		// TODO Auto-generated constructor stub
	}

	@Override
	public void specialFunc() {
		System.out.println("다른 직원에게 전화를 돌리다.");
	}
}


public class A01_Start {
	public static void main(String[] args) {
		Animal an1 = new Dog();
		Animal an2 = new Cat();
		an1.sound();
		an2.sound();
		an1.move();
		
		Phone p1 = new SmartPhone("010-5678-5678");
		Phone p2 = new CompanyPhone("031-222-1245");
		p1.turnOn();
		p1.specialFunc();
		p1.turnOff();
		p2.turnOn();
		p2.specialFunc();
		p2.turnOff();
		
	}
}
