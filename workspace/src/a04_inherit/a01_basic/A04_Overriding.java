package a04_inherit.a01_basic;

import java.util.ArrayList;

import javax.print.attribute.SetOfIntegerSyntax;

/*
ex) overriding 예제 만들기..
	Duck 오리클래스 필드 : kind
				 메서드 : sound()
	
NormalDuck(보통) Mallard(청둥)

# 다형성과 형변환..
1. sound()라는 재정의 메서드는 각 하위 객체별로 선언하는데,
	만약에 공통부분이 필요하지 않고, 하위에 개별적인 내용만 선언하여야 한다면?

2. 상속받은 모든 하위클래스에서 반드시 특정한 기능메서드의 구현이 필요(재정의)로
	하는 경우에는 어떻게 할까? ==> 강제화 하기 위해서 필요로 하는 메서드

3. 상위 내용은 공통적으로 쓰지만, 현실적으로 실현화 될 필요가 없는 추상적인
	클래스일 경우, 굳이 실제 클래스 만들어 놓지 않아도 되는 경우가 있다.
	
4. 이러한 필요에 의해서 상위는 추상적인 클래스만 선언하고 하위 구체적인 객체를
	생성화하는 것이 추상화 개념이고 이것을 필요로 하는 부분이 다형성 개념이다.
	
# 다형성이라는 개념...
1. 상위에 공통된 내용의 객체를 기반으로 여러가지 하위에 객체를 생성하는 것을 다양하게
객체를 형성하는 개념으로 다형성이라는 개념으로 사용하고 있다.
	ex) 오리를 상위하고 실제 상속받은 하위 객체로 보통오리, 청동오리, 장난감 오리 등의
		모양을 만든다고 할 수 있다.
		
2. 메모리 관점에서 이 다형성의 개념을 살펴보자..
	1) 상속을 한다는 것은 상위객체를 통해서 하위 객체가 만들어지는 것이기 때문에
		모든 하위 객체는 상위객체의 메모리(참조변수)에 할당이 가능하다.
		ex) 상위 클래스 참조 = new 하위생성자();
	2) 다형성의 한계
		다형을 통한 상위클래스의 처리내용은 상위클래스의 변수와 상위클래스에서
		재정의한 메서드까지 상위클래스의 참조객체로 사용할 수 있다.
		하위클래스의 추가적인 변수나 메서드를 활용하고자 할 때, 다시 typecasting을
		하여 처리한다.

 */
public class A04_Overriding {
	public static void main(String[] args) {
		NormalDuck d1 = new NormalDuck();
		d1.sound();
		Mallard d2 = new Mallard();
		d2.sound();
		
		// 상위 메모리에 하위 객체들이 할당이 가능하다.
		// 다형성이 하나의 객체를 통해서 여러 모양의 객체로 만들어지는 것이기 때문에
		// 다형성(Polymorphism)이라는 말을 활용한다.
		// 부모 = 자식; 상속통해서 모든 자식은 부모에 할당할 수 있다.
		// cf) Object는 default로 모든 클래스의 상위클래스이기 때문에 하위 객체를
		//		할당할 수 있다.
		
		Duck dk1 = new NormalDuck();
		Duck dk2 = new Mallard();
		dk1.sound();
		dk2.sound();
//		dk1.move(); NormalDuck에 있는 move()메서드를 사용할 수 없다.
//		다형성의 한계로 하위의 고유의 추가 멤버(필드, 메서드)를 사용할 수는 없다.
		// 하위클래스 = (타입캐스팅)다형성으로 만든 참조변수;
		// 하위의 고유 기능을 쓸려면 타입캐스팅이 필요로 하다.
		NormalDuck nd = (NormalDuck)dk1;
		nd.running();
//ex) 상위 Book(필드 - 도서명, 가격, buy()..),
//	  하위 ITBook(.. 추가메서드 read() @@ 도서를 읽다)
//	  다형성과 typecasting	을 처리하여 재정의한 메서드와 하위 추가한 메서드를 호출하세요..
		Book b1 = new ITBook("자바 기초", 28000);
		b1.buy(); // 다형성은 하위에 재정의된 내용까지 영향을 미친다.
//		b1.read(); 사용불가능하다. 하위에서만 선언한 내용이기 때문에...
		ITBook b2 = (ITBook)b1; // 타입캐스팅 처리.
		b2.read();
		// 자바의 최상 클래스는 모든 클래스를 다형성으로 할당할 수 있다.
		Object ob1 = new Book("인문학","서양서",23000);
		Object ob2 = new ITBook("스프링",28000);
		// 해당 내용을 구성해서 처리할려면, typecasting을 하여야 한다.
		Book bk5 = (Book)ob1;
		ITBook bk6 = (ITBook)ob2;
		// ArrayList형태에서도 상속관계가 있는 클래스는 모두다 할당이 가능하다.
		ArrayList<Book> list = new ArrayList<Book>();
		list.add(new  ITBook("jsp 기초", 32000));
		list.add(new  HistoryBook("로마사 입문", 32000));
		for(Book bk : list) {
			bk.buy();
		}
	}
}
class Book {
	private String name;
	private String title;
	private int price;

	public Book(String name, String title, int price) {
		this.name = name;
		this.title = title;
		this.price = price;
	}
	public void buy() {
		System.out.println("# 도서구매 #");
		System.out.println("도서명:"+name);
		System.out.println("가격:"+price);
	}
	public String getTitle() {
		return title;
	}
}
class HistoryBook extends Book {
	public HistoryBook(String title, int price) {
		super("역사", title, price);
	}
	@Override
	public void buy() {
		System.out.println("# 역사 관련 서적 파트에서 구매");
		super.buy();
	}
}
class ITBook extends Book{
	public ITBook(String title, int price) {
		super("기술",title,price);
	}

	@Override
	public void buy() {
		System.out.println("# IT 관련 서적 파트에서 구매");
		super.buy();
	}
	public void read() {
		System.out.println(getTitle()+"를 읽다!!");
	}
}

class Duck {
	protected String kind;
	Duck(String kind) {
		this.kind = kind;
	}
	void sound() {
		System.out.println(kind + "가 소리를 낸다");
	}
}

class NormalDuck extends Duck {
	NormalDuck() {
		super("집오리");
	}

	@Override
	void sound() {
		System.out.println(kind + "가 꽉꽉 소리를 낸다.");
	}
	public void running() {
		System.out.println("뛰어 다니다!");
	}
}

class Mallard extends Duck {
	Mallard() {
		super("청둥오리");
	}

	@Override
	void sound() {
		System.out.println(kind + "가 꽥꽥 소리를 낸다.");
	}
}