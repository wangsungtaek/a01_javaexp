package a00_exp.a02_1214;

import java.util.*;

/*
# 월요일 과제
1. 동적 배열이 무엇인가 기술하세요.
	-> 배열의 크기를 정해주지 않아도 되는 배열
2. ArrayList에 지원하는 기능 메서드를 예제와 함께 기술하세요.
	-> add(객체)
	-> get(index)
	-> set(index, 객체)
	-> remove(index)
	-> size()
3. ArrayList의 할당시, default 데이터 유형과 generic 이용시 장/단점을
기술하세요.
	-> generic type만 배열에 추가 될 수 있으므로 다른 type의 접근을 막을 수 있으며
		객체 사용 시 따로 타입캐스팅이 불필요하다.
4. ArrayList의 generic Type으로 String과 Food(음식명,선호도-5점만점)
로 선언하고 활용 예제를 작성하세요.
5. 1:다 관계 처리로 학교의반(class01) 1-1반 객체에 
Student(이름, 국어,영어)로 로 설정하여 학생등록과 성적리스트를 출력하는
기능 메서드를 구현하세요.	
 */

public class A01_Exp {
	public static void main(String[] args) {
	
		// Ex1) 동적 배열이 무엇인가 기술하세요.
		//	-> 배열의 크기를 정해주지 않아도 되는 배열
		//		동적 배열이란? 배열이 동적으로 추가/변경이 가능하는 것을 말한다.
		//		프로그래밍에서 배열을 동적으로 변경해주는 것이 많은데, 자바는 따로
		//		동적배열을 지원하는 객체를 만들어서 사용한다. ArrayList 대표적인
		// 		동적베열 지원하는 객체이다.
		
		// Ex2) ArrayList에 지원하는 기능 메서드를 예제와 함께 기술하세요.
		//	-> add(객체) : 특정한 객체 마지막 위치에 추가할 때, 사용하는 메서드.
		//	-> get(index) 
		//	-> set(index, 객체) : 특정한 위치에 특정한 객체를 변경할 때 사용 된다.
		//	-> remove(index) : 특정한 위치에 있는 객체를  삭제할 때 사용된다.
		//	-> size()
		System.out.println("Ex2)");
		ArrayList<String> strs = new ArrayList<>();
		strs.add("AAA");
		strs.add("BBB");
		strs.add("CCC");
		strs.set(0, "A");
		strs.remove(2);
		for(String s : strs) {
			System.out.println(s);
		}
		for(int i=0; i<strs.size(); i++) {
			System.out.println(strs.get(i));
		}
		System.out.println();
		System.out.println();
		
		// Ex3) ArrayList의 할당시, default 데이터 유형과 generic 이용시 장/단점을 기술하세요.
		//		-> generic type만 배열에 추가 될 수 있으므로 다른 type의 접근을 막을 수 있으며
		//			객체 사용 시 따로 타입캐스팅이 불필요하다.
		//			아무것도 설정하지 않으면 <Object>이며, 모든 클래스를 다 할당할 수 있다.
		//			그러므로, 초기 default ArrayList은 모든 객체를 추가할 수 있는 특징을 가지고 있다.
		//			1. default ArrayList의 장점 : 모든 객체를 할당 할 수 있다.
		//			2. default ArrayList의 단점 : 다시 호출해서 사용하려면 type casting이 필요하다.
		//			Person p = (Person)list.get(1);
		//			일반적으러 하나의 데이터 유형을 동적배열로 만드는 경우에는 generic 개념을
		//			활용하여 ArrayLis<객체유형>형태로 사용한다.
		//			해당 type의 객체만 할당할 수 있게 끔 초기에 처리해 놓으면, 가져올 때, type casting을
		//			하지 않아도 바로 활용할 수 있다.
		
		
		// Ex4) ArrayList의 generic Type으로 String과 Food(음식명,선호도-5점만점)
		//	로 선언하고 활용 예제를 작성하세요.
		
		// Ex4) String 활용
		System.out.println("Ex4)");
		ArrayList<String> foods1 = new ArrayList<String>();
		foods1.add("스파게티");
		foods1.add("피자");
		foods1.add("햄버거");
		for(String s : foods1) {
			System.out.println(s);
		}
		System.out.println();

		
		// Ex4) 객체 활용
		System.out.println("Ex4_1)");
		ArrayList<Food> foods2 = new ArrayList<Food>();
		foods2.add(new Food("스파게티", 3));
		foods2.add(new Food("피자", 4));
		foods2.add(new Food("햄버거", 3));
		for(Food s : foods2) {
			s.foodInfo();
		}
		System.out.println();
		System.out.println();
		
		// Ex5) 1:다 관계 처리로 학교의반 학생 정보 출력
		System.out.println("Ex5)");
		Class01 class01 = new Class01("1-1반");
		class01.addStudent(new Student("왕성택",70,100));
		class01.addStudent(new Student("송진우",20,20));
		class01.addStudent(new Student("이영진",50,60));
		class01.classInfo();
	}
}
// Ex4)
class Food {
	private String name;
	private int grade;
	
	public Food(String name, int grade) {
		this.name = name;
		this.grade = grade;
	}
	
	public void foodInfo() {
		System.out.println("음식이름 : "+name);
		System.out.println("평점 : "+grade+"점");
	}
} // Food

// Ex5) 
class Class01 {
	private String ban;
	ArrayList<Student> students;

	public Class01(String ban) {
		this.ban = ban;
		students = new ArrayList<>();
	}
	
	public void addStudent(Student s) {
		students.add(s);
	}
	
	public void classInfo() {
		System.out.println(ban+"학생 정보");
		for(Student s : students) {
			s.studentInfo();
		}
	}
} // Class01
class Student {
	private String name;
	private int kor;
	private int eng;
	
	public Student(String name, int kor, int eng) {
		super();
		this.name = name;
		this.kor = kor;
		this.eng = eng;
	}
	public void studentInfo() {
		System.out.print("학생이름:"+name+"\t");
		System.out.print("국어점수:"+kor+"\t");
		System.out.print("영어점수:"+eng+"\n");
	}
} // Student