package a02_object.a05_oneVsone;

public class A08_Driver {
	String name;
	A07_Car car;

	public A08_Driver(String name) {
		this.name = name;
	}
	
	void drivingCar() {
		if(car != null) {
			System.out.println(name+" 님이 "+car.carName+"차 를 몰고 최고 "+car.maxSpeed+" 로 주행합니다.");
		} else {
			System.out.println(name+" 님은 차가 없네요..");
		}
	}
}
