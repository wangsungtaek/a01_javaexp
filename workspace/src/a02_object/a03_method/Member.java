package a02_object.a03_method;

public class Member {
	String id;
	String pass;
	String name;
	String auth;
	int point;
	
	Member(String id, String pass, String name){
		this.id = id;
		this.pass = pass;
		this.name = name;
	}
	
	void showInfo() {
		System.out.println("# 회원 정보 #");
		System.out.println("아이디:"+id);
		System.out.println("비밀번호:"+pass);
		System.out.println("이름:"+name);
	}
	
	void setId(String id) {
		this.id = id;
	}
	
	void setIdPass(String id, String pass) {
		this.id = id;
		this.pass = pass;
	}
	
	void setName(String name) {
		this.name = name;
	}
	
	void setAuth(String auth) {
		this.auth = auth;
	}
	void setData(String auth, int point) {
		this.auth = auth;
		this.point = point;
	}
/*
# 메서드란?
1. 객체의 구성요소로, 객체가 필요로 하는 기능처리를 위해서 사용한다.
2. 기능 처리란?
	1) 데이터를 저장처리(매개변수로 받아 필드값에 저장 처리)
	2) 특정한 데이터를 조건이나 반복 의해서 return 해준다.
	
	
 */
}
