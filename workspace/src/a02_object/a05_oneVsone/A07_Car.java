package a02_object.a05_oneVsone;

public class A07_Car {
	String carName;
	int maxSpeed;
	public A07_Car(String carName, int maxSpeed) {
		this.carName = carName;
		this.maxSpeed = maxSpeed;
	}

	void showInfo() {
		System.out.println("차이름:"+carName);
		System.out.println("최고속도:"+maxSpeed);
	}
}
