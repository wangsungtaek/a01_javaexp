package a02_object.a03_method;

public class Duck {
	void sound() {
		System.out.println("꽥꽥");
	}
	void fly() {
		System.out.println("오리가 난다");
	}
	final void swim() {
		System.out.println("오리가 수영한다.");
	}
}

class RobotDuck extends Duck {

	@Override
	void sound() {
		super.sound();
		System.out.println("꽉");
	}

	@Override
	void fly() {
		super.fly();
		System.out.println("로봇덕 난다");
	}
}
