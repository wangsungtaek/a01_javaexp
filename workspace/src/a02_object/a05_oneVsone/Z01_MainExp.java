package a02_object.a05_oneVsone;

public class Z01_MainExp {
/*
# 객체지향 프로그램에서 관계 설정이란 ?
1. 객체는 객체안에서 메모리를 설정해서 사용할 수 있다.
	ex) 자동차라는 객체 안에는 핸들객체, 바퀴객체, 엔진객체들이 각각의
	속성과 속성값을 가지고 유기체적으로 연관관계를 만들어 수행하듯이
	객체지향 프로그램에서는 객체와 객체의 연관관계를 아는 것이 중요하고,
	그 연관관계 프로그래밍을 하여야 한다.
2. 객체 안에 객체의 선언과 활동.
	1) 포함될 객체 부터 class로 먼저 선언..
		class Woman{}
	2) 포함할 객체에서 필드나 메서드 안에서 선언하여 활용을 할 수 있다.
		class Man{
			Woman woman;
		}
	3) main()에서 실제 메모리를 만들어 할당한다.
		Woman woman = new Woman();
		Man man = new Man();
		man.woman = woman; // Man객체 안에 Woman 객체를 할당..
		man.woman = new Woman(); // Man객체 안에 woman객체에 생성하면서 바로 할당..
 */
	public static void main(String[] args) {
		A02_Woman w1 = new A02_Woman("송지나");
		System.out.println("w1.name:"+w1.name);
		A01_Man m1 = new A01_Man("김철수");
		System.out.println("m1.name:"+m1.name);
		// A02_Woman에서 생성된 w1을 A01_Man의 m1 하위에 있는
		// Woman메모리에 할당 처리
		// m1 객체에 종속적인 메모리에 있는 woman에 할당처리..
		m1.woman = w1;
		A01_Man m2 = new A01_Man("마승수");
		m2.woman = new A02_Woman("김신영"); // m2에 종속적인 Woman처리.
		// 종속적인 woman의 속성 추력..
		System.out.println("Man종속적 woman의 이름:"+m1.woman.name);
		System.out.println("Man종속적 woman의 이름:"+m2.woman.name);
		System.out.println();
/*
ex) 
 */
		Product p1 = new Product("바나나", 4000);
		Buyer buyer = new Buyer("김철수");
		buyer.product = p1;
		
		System.out.println("Ex1)");
		System.out.println("buyer 이름:" + buyer.name);
		System.out.println("buyer 산 물품:" + buyer.product.name);
		System.out.println("buyer 산 물품가격:" + buyer.product.price);
		System.out.println();
	
		Buyer buyer2 = new Buyer("이상만");
		buyer2.product = new Product("사과", 1000);
	
		System.out.println("buyer2 이름:" + buyer2.name);
		System.out.println("buyer2 산 물품:" + buyer2.product.name);
		System.out.println("buyer2 산 물품가격:" + buyer2.product.price);
		System.out.println();
		
		A05_Product p2 = new A05_Product("김밥",3000,2);
		A06_Buyer b2 = new A06_Buyer("김철수");
		b2.showBuyInfo();
		b2.prod = p2;
		b2.showBuyInfo();
		System.out.println();
		
/*
# 1:1 관계 설정 연습..
 */
		System.out.println("Ex)");
		A08_Driver wang = new A08_Driver("왕성택");
		A07_Car car = new A07_Car("셀토스",220);
		wang.drivingCar();
		wang.car = car;
		wang.drivingCar();
	}
}

class Product {
	String name;
	int price;
	public Product(String name, int price) {
		this.name = name;
		this.price = price;
	}
}

class Buyer {
	String name;
	Product product;
	
	public Buyer(String name) {
		this.name = name;
	}
}
