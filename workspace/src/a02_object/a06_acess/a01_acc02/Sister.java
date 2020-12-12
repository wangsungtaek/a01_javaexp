package a02_object.a06_acess.a01_acc02;

public class Sister {

	void callMother() {
		Mother m1 = new Mother();
//		System.out.println(m1.sec01); // private 접근이 불가능..
		System.out.println(m1.dinnerFood);
	}
}
