package a04_inherit.a01_basic;

//ex) worker 상위 일의 종류, 생성자를 통해서 종류 설정.
//메서드 : working() @@가 일을 합니다.
//	하위 클래스 : PoliceMan, FireMan 선언과 함께 상위 생성자를 호출
//하세요

public class A03_ConstuctorExp {
	public static void main(String[] args) {
		Car c1 = new Car();
		c1.show();
		Bus b1 = new Bus();
		b1.show();
		
		PoliceMan p1 = new PoliceMan();
		p1.working();
		FireMan f1 = new FireMan();
		f1.working();
	}
}
