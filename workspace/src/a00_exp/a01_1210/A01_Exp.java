package a00_exp.a01_1210;

/*
# 개념과 코드 정리.
1. 생성자와 메서드의 차이점을 기술하세요.
-> 생성자 : 객체를 생성할때 처음 한번 실행되는 멤버, 리턴값이 없다.
-> 메서드 : 기능을 수행하는 멤버

2. default 생성자와 매개변수가 없는 생성자의 차이점과 장단점을 기술하세요.
-> default 생성자는 클래스 내에 생성자가 없을경우 컴파일러가 자동으로 만들어주는 생성자이고,
매개변수가 없는 생성자는 컴파일러가 생성하지 않아도 존재한다는 차이가 있다. 사용자가 생성한 매개변수가 없는 생성자
안에 구현 프로세스를 작성할 수 있는 차이가 있다. 디폴트 생성자의 장점은 개발자가 별도의 생성자를 생성하지 않아도되는
장점이 있으나 구현 프로세서를 작성할 수 없는 단점이있다.

3. '객체를 생성하면 생성자를 하나만 선택할 수 있다는 말! '라는 말은 클래스 내
생성자 선언과 관련하여 설명하세요.
-> 생성자는 new 예약어를 통해 객체를 생성할때 딱 한번 실행되므로 오버로딩된 생성자 중 하나를 골라서 사용해야한다.
생성자는 오버로딩이 가능한데, 이때 조건으로는 매개변수의 개수, 타입, 만약 갯수가 같다면 매개변수의 타입의 순서가 바뀌여야 한다.

 4. 메서드의 구성요소 4가지를 메서드 예제 선언과 함께 설명하세요...
 	리턴값, 프로세스, 메서드명(매개변수)
 	double avg(int kor, int eng, int math){
 		return (kor+eng+math)/3.0;
 	}
 5. 다음과 같은 메서드를 선언해 보세요.
 	1) 매개변수 정수형으로 1~7
 	2) 리턴값 문자열로 된 색상.
 	3) 프로세스 처리..
 		1~7 번에 따라 무지개 색상 선택 빨/주/노/파/남/보

 6. 메서드에서도 overloading이 사용된다. 예제를 만들어 설명하세요.
 class Person {
 	String name;
 	int age;
 	
 	void setPerson(String name){
 		this.name = name;
 	}
 	void setPerson(String name, int age){
 		this.name = name;
 		this.age = age;
 	}
 }
 -> setPerson이라는 메서드가 2개 정의 되어있다.
  	하지만 매개변수의 개수가 다르기때문에 오버로드 조건이 성립된다.
 
 
 7. final이 클래스의 구성요소에 쓰일 때, 각각의 형식과 차이점을 기술하세요.
 -> final로 설정된 값은 딱 한번 값을 할당하면 변경을 할 수 없다. 이를 상수라고 부른다.
 	상수의 이름은 전부 대문자로 표기한다.
 	final이 메서드에 붙으면 오버라이딩을 할 수 없다.
 	1) final class{} : 상속이 불가능하다.
 	2) final int NUM=25;: 상수가 되어, 다른 데이터 할당이 불가능하다.
 	3) final void rinning() : 상속되는 하위 클래스에서 재정의가 불가능하다.
 	
 8. 위에 final 내용 중에 메서드에서 쓰일 때에 예제를 간단하게 코딩해 보세요..
 
 9. static이란 무엇인가 ? 간단한 변수 앞에 쓰일 때, 어떻게 처리 되는지
 기술해보세요.
 -> 클래스 변수이며 모든 인스턴스가 공유하는 변수이다.
 	같은 클래스를 갖는 많은 객체중에 공통으로 가져가고 싶은 데이터를
 	클래스 변수로 선언하여 객들간의 유기적인 관계를 갖는다.
 	
 10. 클래스안에 static으로 메서드를 구현한 내용으로 가위/바위/보 3중에 하나가
 임의의 나오는 메서드를 구현하여 main()에서 호출 처리해보세요.
 
 11. 칫솔 클래스와 치약 클래스를 1:1 관계로 설정하여, 종속관계를 만들고
	출력해보세요.
	
 12. ## 만일 static과 final이 함께 쓰인다면 어던 효과가 발생하는지 기술해보세요..
 -> 변수에 사용 될경우 클래스 변수이므로 클래스명.상수 로 사용 할 수 있다.
 하지만 fianl로 선언 되어 있으므로 데이터는 처음에 한번 할당 할 수 있고, 이후에 변경은 불가능하다.
 메소드에 선언 할 경우 오버라이딩이 불가능하며 클래스명.메서드 로 호출하여 사용 할 수 있다.
 *
 */


//ex6, ex8
class Person {
	String name;
	int age;
	final String GENDER;
		
	Person(){
		GENDER = "남자";
	}
	
	void setPerson(String name){
		this.name = name;
	}
	void setPerson(String name, int age){
		this.name = name;
		this.age = age;
	}
}

class Chitsol {
	String name;
	Chityac chityac;
	Chitsol(String name){
		this.name = name;
	}
	void action() {
		if(chityac != null) {
			System.out.println(name + " 칫솔에 "+chityac.name+" 치약을 발랐습니다.");
		} else {
			System.out.println("치약이 없습니다.");
		}
	}
}
class Chityac {
	String name;
	Chityac(String name) {
		this.name = name;
	}
}

	
public class A01_Exp {
	// ex5 색상
	String getColor(int num) {
		String str = "";
		switch(num) {
			case(1) : str = "빨"; break;
			case(2) : str = "주"; break;
			case(3) : str = "노"; break;
			case(4) : str = "초"; break;
			case(5) : str = "파"; break;
			case(6) : str = "남"; break;
			case(7) : str = "보"; break;
			default : str =  "색상 범위를 벗어났습니다";
		}
		return str;
	}
	// ex10 가위바위보
	static String runGame() {
		int random = (int)(Math.random()*3+1);
		String result = "";
		switch(random) {
			case(1) : result = "가위"; break;
			case(2) : result = "바위"; break;
			default : result = "보";
		}
		System.out.println(random);
		return result;
	}
	/*
	 * static String runGame() {
	 * int random = (int)(Math.random()*3);
	 * String[] arr = {"가위","바위","보"}
	 * return arr[random];
	 * }
	 */
	public static void main(String[] args) {
		//ex5
		System.out.println("Ex5)");
		A01_Exp color = new A01_Exp();
		System.out.println(color.getColor(2));
		System.out.println();
		
		//ex10
		System.out.println("Ex10)");
		System.out.println(runGame());
		System.out.println();
		
		//ex11
		System.out.println("Ex11)");
		Chitsol chitsol = new Chitsol("닥터피쉬");
		chitsol.action();
		chitsol.chityac = new Chityac("메디슨");
		chitsol.action();
	}
}
