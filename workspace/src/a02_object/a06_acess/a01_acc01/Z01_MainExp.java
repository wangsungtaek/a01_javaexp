package a02_object.a06_acess.a01_acc01;

public class Z01_MainExp {
	public static void main(String[] args) {
		Animal n01 = new Animal();
		Person p01 = new Person();
		
		System.out.println(p01.age);
		n01.call();
	}
}
