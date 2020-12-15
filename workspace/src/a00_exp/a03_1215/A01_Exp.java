package a00_exp.a03_1215;

import java.util.ArrayList;

public class A01_Exp {
	public static void main(String[] args) {
		// Ex1) 1:다 관계 컴퓨터
		System.out.println("Ex1)");
		Computer c1 = new Computer("노트북");
		c1.showInfo();
		c1.mounting(new Cpu("인텔","3.4GHz"));
		c1.mounting(new Ram("삼성","8G"));
		c1.mounting(new Hdd("삼성","1TB"));
		c1.showInfo();
		System.out.println();
		System.out.println();
		
		// Ex2) 상속관계 기술
		// 아버지에게 재산을 상속 받는 것처럼,
		// 객체지향 프로그램에서는 상위 클래스로부터 필드와 메서드를 상속 받을 수 있다.
		// 하지만 현실에선 어머니와 아버지 재산을 물려 받을 수 있다면,
		// 객체지향 프로그램에서는 단일 상속만이 가능하다.(자바만 해당된다)
		// class Father { 
		// }
		// class Son extends Father {
		// }
		
		// Ex3) 상속에서 접근제어자로 통한 한계를 기술하세요.
		// 오버라이딩하여 부모클래스의 메서드를 재정의 할 경우,
		// 메서드명이 동일해야하고 접근제어자의 범위가 넓어야한다.
		// ex) 부모의 기능메서드 중 하나를 protected로 정의 했을 경우
		// 상속받은 하위 메서드는 protected 보다 접근범위가 넓은 default, public으로 설정해야한다.
		
		// Ex4) 다중상속이 안 된다! 라는 말의 의미, 예제로 설명
		// 같이 이름의 메서드가 정의된 클래스가 두개 있을 경우,
		// 하위 클래스 입장에선 어떤 클래스의 메서드를 오버라이딩 할지 예매하기 때문에 단일 상속만 가능하다.
		// class Person extends mother, father (불가능)
		
		// Ex5) 상속에서 상위 생성자에 따른 하위 생성자의 영향을 매개변수 관점에서 코드로 설명
		// 하위 생성자 호출할때 무조건 상위클래스의 생성자를 실행하게 되는데 생성자에 아무것도 없으면 자동으로 컴파일러가
		// super 클래스의 default를 호출하게 된다. 하지만 슈퍼클래스인 상위클래스에 매개변수가 있는 생성자일 경우,
		// 매개변수를 맞춰주어야 한다.
		// class Father {
		//		String secret
		// 		Father(Stirng secret) {
		//			this.secret = secret		
		//		}
		// }
		// class Son extends Father {
		//		Son() {
		//			super("아버지의 비밀");
		//		}
		// }
		
		// Ex6) overloading과 overriding의 차이점
		// 오버로딩은 영어로 무언가를 적층한다는 의미를 담고 있으며,
		// 같은 이름의 메서드를 여러개 정의할 수 있다. 메서드를 매개변수의 갯수또는 타입에 따라 다르게 정의하고 싶을때 사용된다.
		// 오버라이딩은 상속관계에서 나타난다.
		// 상위클래스에서 정의한 메서드를 새롭게 재정의 할때, 사용된다.
		
		// Ex7) 다각형이라는 클래스에서 상속받은 삼각형, 사각형, 오각형의 클래스를 필드와 메서드를 이용하여 적절하게 구성해 보세요.
		System.out.println("Ex7)");
		Polygon p1 = new Polygon();
		Polygon p2 = new Triangle();
		Polygon p3 = new Rectangle();
		Polygon p4 = new Pentagon();
		
		p1.showProperty();
		p2.showProperty();
		p3.showProperty();
		p4.showProperty();
		System.out.println();
		System.out.println();
		
		// Ex8)다형성의 개념으로 Robot에서 재정의 할 attack()메서드를 통해,
		//   상속받은 2가지 이상 로봇 종류클래스(태권브이, 마징가제트)를 선언하고, 
		//   상위 = 하위로 처리하여, 재정의된 메서드를 통해 기능을 출력하세요.
		//   attack() 하위에서 미사일 발사/로켓포발사 등 여러가지 재정의가 가능/이런 내용을 처리하라는 말
		System.out.println("Ex8)");
		Robot r = new Robot();
		r.attack();
		r = new Vrobot();
		r.attack();
		r = new Zrobot();
		r.attack();
	}
}
class Computer { // Ex1
	private String kind;
	private ArrayList<Components> components;
	
	public Computer(String kind) {
		this.kind = kind;
		components = new ArrayList<>();
	}
	void showInfo() {
		System.out.println(kind+" 의 부품 사양..");
		if(components.size() != 0) {
			System.out.println("부품\t제조사\t속도/크기");
			for(Components c : components) {
				c.showInfo();
			}
		} else {
			System.out.println("장착된 부품이 없습니다.");
		}
	}
	void mounting(Components components) {
		this.components.add(components);
	}
}

class Components {
	protected String name;
	protected String capacity;

	public Components(String name, String capacity) {
		this.name = name;
		this.capacity = capacity;
	}
	void showInfo() {}
}

class Cpu extends Components {
	public Cpu(String name, String capacity) {
		super(name, capacity);
	}
	void showInfo() {
		System.out.println("Cpu\t"+name+"\t"+capacity);
	}
}

class Ram extends Components {
	public Ram(String name, String capacity) {
		super(name, capacity);
	}
	void showInfo() {
		System.out.println("Ram\t"+name+"\t"+capacity);
	}
}

class Hdd extends Components {
	public Hdd(String name, String capacity) {
		super(name, capacity);
	}
	void showInfo() {
		System.out.println("Hdd\t"+name+"\t"+capacity);
	}
} // Ex1 end

class Polygon { // Ex7
	protected String name;
	protected int numOfsides;

	public Polygon() {
		this.name = "다각형";
		this.numOfsides = 0;
	}
	protected Polygon(int numOfsides, String name) {
		this.numOfsides = numOfsides;
		this.name = name;
	}
	protected void showProperty() {
		System.out.println(name + "은 셋 이상의 선분으로 둘러싸인 평면 도형이다.");
	}
}
class Triangle extends Polygon {

	public Triangle() {
		super(3,"삼각형");
	}
	@Override
	protected void showProperty() {
		System.out.println(name+"의 변의 개수:"+numOfsides);
	}
}
class Rectangle extends Polygon {

	public Rectangle() {
		super(4,"사각형");
	}
	@Override
	protected void showProperty() {
		System.out.println(name+"의 변의 개수:"+numOfsides);
	}
}
class Pentagon extends Polygon {

	public Pentagon() {
		super(5,"오각형");
	}
	@Override
	protected void showProperty() {
		System.out.println(name+"의 변의 개수:"+numOfsides);
	}
} // Ex7 end

class Robot { // Ex8 
	protected String name;
	protected String weapon;

	public Robot() {
		this.name = "깡통로봇";
		this.weapon = "맨손";
		
	}
	public Robot(String name, String weapon) {
		this.name = name;
		this.weapon = weapon;
	}
	protected void attack() {
		System.out.println(name + "이 "+weapon + " 공격을 합니다.");
	}
}
class Vrobot extends Robot {
	public Vrobot() {
		super("태권브이","미사일");
	}
	@Override
	protected void attack() {
		System.out.println(name+"가 "+weapon+"공격을 합니다.");
	}
}

class Zrobot extends Robot {
	public Zrobot() {
		super("태권브이","로켓포발사");
	}
	@Override
	protected void attack() {
		System.out.println(name+"가 "+weapon+"공격을 합니다.");
	}
} // Ex8 end
