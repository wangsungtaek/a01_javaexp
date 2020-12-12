package a02_object.a06_acess.a01_acc01;
// a02_object.a06_acess.a01_acc01.Person
public class Person {
	private String name;
	int age;
	
	Person(){
		System.out.println("이름:"+name);
	}
	void callPerson(){
		System.out.println("이름:"+name);
	}
}
