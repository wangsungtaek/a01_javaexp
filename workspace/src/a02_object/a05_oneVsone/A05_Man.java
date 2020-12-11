package a02_object.a05_oneVsone;

public class A05_Man {
	String name;
	A06_Woman woman;
	
	public A05_Man(String name) {
		this.name = name;
	}
	void myInfo() {
		System.out.println("이 남자의 이름은 "+name);
		if(woman != null) { // woman 객체가 할당 되어 있을때..
			System.out.println("woman 객체가 있습니다.");
		} else { // woman 객체가 할당 되어 있지 않을때..
			System.out.println("woman 객체가 없습니다.");
		}
	}
}
