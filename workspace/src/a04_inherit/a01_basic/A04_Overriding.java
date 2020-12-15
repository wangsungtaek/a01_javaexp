package a04_inherit.a01_basic;
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