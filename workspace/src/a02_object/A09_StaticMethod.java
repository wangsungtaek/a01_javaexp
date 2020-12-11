package a02_object;
/*
# static 메서드도 객체 생성없이 바로 사용할 수 있다.
 */

class Calculator {
	static int plus(int num01, int num02) {
		return num01 + num02;
	}
}

class ShopMember {
	static String login(String id, String pass) {
		if("himan".equals(id) && "7777".equals(pass)) {
			return "로그인 성공";
		} else {
			return "로그인 실패";
		}
	}
}
// ex) ShopMember 클래스를 만들고 static 메서드로 login선언하고, 매개변수로 id, pass를
//	입력 하게하여, himan/7777 일때, 로그인 성공 문자열 그외에는 로그인 실패 문자열 리턴하게 하세요.

public class A09_StaticMethod {
	static int minus(int num01, int num02) {
		return num01 - num02;
	}
	public static void main(String[] args) {
		System.out.println("스테틱 메서드 활용1:"+Calculator.plus(25,30));
		System.out.println("스테틱 메서드 활용2:"+minus(25,30));
		System.out.println();
		
		System.out.println("Ex1)");
		System.out.println(ShopMember.login("himan", "7777"));
		System.out.println(ShopMember.login("142", "44"));
	}
}
