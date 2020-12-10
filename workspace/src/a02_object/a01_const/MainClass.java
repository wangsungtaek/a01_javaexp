package a02_object.a01_const;

public class MainClass {
	public static void main(String[] args) {
		// 필드의 default 확인..
		Car c1 = new Car();	// default생성자 호출..
		// 객체는 null, 숫자형 데이터는 0, boolean false
		System.out.println(c1.company);
		System.out.println(c1.model);
		System.out.println(c1.maxSpeed);
		System.out.println(c1.isAuto);
		// 메인 메서드에서는 class 선언한 생성자 중에 하나를 선택해서
		// 객체로 생성을 한다. : 한 객체는 한 생성자를 사용한다.
		Car c2 = new Car("현대자동차","에쿠스",250,true);
		System.out.println("# c2 :"+c2+" #");
		System.out.println(c2.company);
		System.out.println(c2.model);
		System.out.println(c2.maxSpeed);
		System.out.println(c2.isAuto);
		System.out.println();
/*
ex) package a02_object.a01_const 안에
	BaseBallPlayer.java 클래스 선언하고
	1. 필드 : 소속사, 이름, 성적
	2. 생성자 : 입력값없는 생성자, 이름만할당, 소속사/이름/성적 할당 생성자
		구현하세요.
	main()에서 호출하여 필드값을 출력 처리하세요..~
 */	
		System.out.println("ex)");
		BaseBallPlayer player= new BaseBallPlayer("한화","김동규",100);

		System.out.println(player.agency);
		System.out.println(player.name);
		System.out.println(player.grades);
	}
}
class BaseBallPlayer {
	String agency;
	String name;
	int grades;
	
	BaseBallPlayer(){
		agency = "무소속";
		name = "익명";

	}
	BaseBallPlayer(String name){
		// 지역변수
		// 특정한 블럭(중괄호 {})안에서 선언하여 사용하는 변수..
		// 1. 매개변수
		// 2. 중괄호 블럭 안에서 새로 선언된 변수.
		// this.변수 : 지역변수와 이름이 같을 때, 구분하여 사용한다.
		// 3. 자바에서는 지역변수가 이름이 겹치지 않으면 this 없이도
		//		사용하여도 무방하다.
		// 아래의 agency는 필드 (전역변수) 이지만 중괄호 내에
		// 동일한 지역변수가 없기 때문에 선언된 내용으로 사용할 수 있다.
		this.name = name;
		agency = "무소속";
	}
	BaseBallPlayer(String agency, String name, int grades){
		this.agency = agency;
		this.name = name;
		this.grades = grades;
	}
}