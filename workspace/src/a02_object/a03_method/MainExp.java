package a02_object.a03_method;

public class MainExp {
	public static void main(String[] args) {
		Member member = new Member("himan","7777","홍길동");
		member.showInfo();
		member.setId("hi girl");
		member.showInfo();
		member.setIdPass("hi girl","1234");
		member.showInfo();

// ex1) name값을 저장하는 메서드 선언하고 변경된 name을 출력하세요..
// ex2) 필드로 auth(권한)을 추가하여, 메서드로 auto권한 변경하는 처리를 하세요.
// ex3) 필드 Point(정수)를 추가하여, aush와 point를 같이 변경할 수 있게 한다.

		member.setName("홍리나");
		System.out.println("이름:"+member.name);
		member.setAuth("관리자권한");
		System.out.println("권한:"+member.auth);
		member.setData("일반사용자권한",1000);
		System.out.println("변경된 권한:"+member.auth);
		System.out.println("포인트:"+member.point);
	}
}
