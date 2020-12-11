package a02_object.a05_oneVsone;

public class A01_Man {
	String name;
	A02_Woman woman;	// Man 안에 Woman할당 될 수 있는 메모리를 선언.
	A01_Man(String name){
		this.name = "신사:"+name; // 생성자를 통해서서 이름할당.
	}
}
