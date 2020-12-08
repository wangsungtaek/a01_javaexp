package javaexp.a02_object;
// 클래스는 객체를 위한 설계도 역할..

class Person {
//	1. 필드 선언..
	String name;
	int age;
	String loc;
//	2. 생성자 선언(필드를 초기화)
	Person(String name, int age, String loc){
		// this : 현재 객체가 생성되었을 때, 해당 객체를 지칭..
		// this.name : 현재 객체가 기지고 있는 필드인 name을 지칭..
		this.name = name;
		this.age = age;
		this.loc = loc;
	}
//	3. 기능 메서드 선언..
	void showInfo() {
		System.out.println("# Person 객체가 가지는 정보 출력 #");
		System.out.println("이름:"+name);
		System.out.println("나이:"+age);
		System.out.println("사는 곳:"+loc);
	}
}
public class A02_Object_Declare {
	public static void main(String[] args) {
/*
1. 객체(Object)
	1) 물리적으로 존재하는 것(자동차, 책, 사람...)
	2) 추상적으로 존재하는 것(회사, 날짜) 중에서 속성, 동작을 가지는 것은 포함한다.
	3) 객체의 구성요소..
		- 메모리 : field
		- 새로 만들어질 때, 기본 처리 : constructor(생성자)
		- 동작/기능 : 메서드(method)
		
		class person {
			int age;
		}
2. 클래스와 객체
	1) 클래스가 선언된 이후 main()메서드를 통해서, 객체를 생성하고
		해당 객체를 사용할 수 있다.
	2) 선언된 클래스를 객체로 생성.
		- 클래스명 참조변수; // 선언..
		- 참조변수 = new 생성자명(); // 객체 생성과 메모리할당..
		- 참조변수.필드;
		- 참조변수.메서드명();
 */
		Person p1 = null;
		p1 = new Person("홍길동",25,"서울 신림동");
		System.out.println("필드 확인 이름:" + p1.name);
		// 메서드 확인...
		p1.showInfo();
		System.out.println();
/*
ex) class Product를 선언하고, 필드로 물건명 가격 갯수 선언, 생성자를 통해서 할당
	buy() 메서드를 통해서 구매 정보를 출력처리하여, main()에서 호출 처리하세요..
 */
		// 객체 선언, 생성자를 통해서 필드값 초기화..
		Product p01 = new Product("사과",2000,2);
		p01.buy();
		// p01과 p02은 동일한 클래스를 통해서 만들어 지지만,
		// heap영역의 메모리가 다르고, 할당하는 데이터도 다르게 처리된다.
		// 두 객체는 틀/설계도가 같은 클래스에서 나온 다른 객체를 말한다.
		Product p02 = new Product("음료수",4000,2);
		p02.buy();
		System.out.println(p01);
		System.out.println(p02);
	}
}

class Product {
	// 필드 선언..
	String name;
	int price;
	int cnt;
	
	// 생성자를 통해 필드 초기화..
	Product(String name, int price, int cnt) {
		this.name = name;
		this.price = price;
		this.cnt = cnt;
	}
	// 기능 메서드 선언..
	void buy() {
		System.out.println("# Produt 객체가 가지는 정보 출력 #");
		System.out.println("물건명:"+name);
		System.out.println("가격:"+price);
		System.out.println("갯수:"+cnt);
	}
}