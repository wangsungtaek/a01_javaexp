package a02_object.a04_methodExp;

public class A01_MethodExp {
	public static void main(String[] args) {
		Member m01 = new Member();
		
		m01.setUser("hong","1234","홍길동");
		m01.setPass("5678");
		m01.addPoint(1000);
		m01.addPoint(1000);
		m01.addPoint(500);
		System.out.println("현재 포인트 :"+m01.buy("사과", 1000));
		System.out.println("현재 포인트 :"+m01.buy("사과", 1000));
		System.out.println("현재 포인트 :"+m01.buy("사과", 1000));
		System.out.println("현재 포인트 :"+m01.buy("사탕", 300));
	}
}

class Member {
	String id;
	String pass;
	String name;
	int point;

	void setUser(String id, String pass, String name) {
		this.id = id;
		this.pass = pass;
		this.name = name;
		System.out.println("== 회원 정보 변경 ==");
		System.out.println("회원 정보가 변경 되었습니다.");
		System.out.println("id:"+this.id);
		System.out.println("pass:"+this.pass);
		System.out.println("name:"+this.name);
		System.out.println();
	}
	
	void setPass(String pass) {
		this.pass = pass;
		System.out.println("== 비밀번호 변경 ==");
		System.out.println("비밀번호가 "+this.pass+" 에서" +pass+" 로 변경 되었습니다.");
		System.out.println();
	}
	
	
	void addPoint(int point) {
		this.point += point;
		System.out.println("== 포인트 추가 ==");
		System.out.println("추가된 포인트:"+point);
		System.out.println("현재 포인트:"+this.point);
		System.out.println();
	}
	
	int buy(String buyProduct, int price) {
		System.out.println("== 구매 ==");
		if(this.point < price) {
			System.out.printf("포인트가 부족합니다.\t\t");
			return this.point;
		} else {
			System.out.printf(buyProduct +"를 구매하였습니다.\t");
			return this.point-=price;
		}
	}
}