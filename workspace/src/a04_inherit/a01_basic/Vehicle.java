package a04_inherit.a01_basic;

public class Vehicle {
	private String kind;
	public Vehicle(String kind) {
		this.kind = kind;
	}
	public void show() {
		System.out.println("탈 것의 종류는 "+kind+"입니다!");
	}
}
class Car extends Vehicle {
	public Car() {
		super("자동차");
	}
}

class Bus extends Vehicle {

	public Bus() {
		super("버스");
	}
}