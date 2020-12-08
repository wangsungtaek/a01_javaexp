package javaexp.a02_object;

public class A04_Exp {
	public static void main(String[] args) {
/*
# 객체의 구성 요소를 통한 연습예제..
1. Friend 클래스를 선언하고, 이름, 친구가된시기, 생성자를 통해 초기화, 메서드 show() 출력처리.
2. Member 클래스 선언 필드 : id, pass, name, 생성자를 통해서 id, pass, name 할당,
	메서드 login()을 통해서 @@@님 패스워드 @@@를 통해서 로그인 성공 출력..(매개변수 없는 거)
3. Entertainer 클래스 선언 필드 : 이름, 나이, 성별, 생성자 초기화, showMyEnter() 메서드를 통해서
	정보 출력..
4. 위 2번에서 login()메서드를 매개변수로 id, pass를 입력하게 하여, 기존 필드에 있는 id, pass와
	동일하면, 로그인 성공, 아니면 로그인 실패..(매개변수 있는 거)
 */
	
		// ex1
		System.out.println("ex1)");
		Friend friend = new Friend("이영진",2002);
		friend.show();
		// ex2
		System.out.println("ex2)");
		Member member = new Member("asd","qwe123","왕성택");
		member.login();
		// ex3
		System.out.println("ex3)");
		Entertainer enter = new Entertainer("박보영",31,"여");
		enter.showMyEnter();
		// ex4
		System.out.println("ex4)");
		member.login("1233","asd");
		member.login("asd","qwe123");
		
	}
}
class Friend {
	String name;
	int meetDay;
	
	Friend(String name, int meetDay){
		this.name = name;
		this.meetDay = meetDay;
	}
	void show(){
		System.out.println("친구이름:"+name);
		System.out.println("만난년도:"+meetDay);
		System.out.println();
	}
}
class Member {
	String id;
	String pw;
	String name;
	
	Member(String id, String pw, String name){
		this.id = id;
		this.pw = pw;
		this.name = name;
	}
	void login() {
		System.out.println("\""+name+"\"님 패스워드 \""+pw+"\" 통해 로그인 성공하였습니다.");
		System.out.println();
	}
	void login(String id, String pw) {
		System.out.println((this.id == id && this.pw == pw) ? "로그인 성공" : "로그인 실패");
	}
}
class Entertainer {
	String name;
	int age;
	String gender;
	
	Entertainer(String name, int age, String gender){
		this.name = name;
		this.age = age;
		this.gender = gender;
	}
	
	void showMyEnter(){
		System.out.println("이름:"+name);
		System.out.println("나이:"+age);
		System.out.println("성별:"+gender);
		System.out.println();
	}
}
