package a02_object.a06_acess.a01_acc01;

public class Animal {
	void call() {
		// 객체생성..
		// 1. 접근 제어자 확인 : public class Person{}
		// 		클래스 선언 부분 - 외부에 모든 클래스에서 접근이 가능..
		//		Person p01
		// 2. new Person() : 생성자에 대한 접근이 가능할 때,
		//		처리될 수 있다.
		Person p01 = new Person();
		System.out.println(p01.age);
//		System.out.println(p01.name);

	}
}
