package a02_object.a07_oneVsmulti;

import java.util.*;

/*
# 동적배열을 처리하는 선형구조 객체 ArrayList
1. 기본 개념
	1) 동적 배열 : 배열은 일반적으로 초기에 크기가 정해지면, 배열의
	크기를 추가하거나 축소할 수 없다. 그래서, 동적인 배열에 대한 필요성이
	증가하여, 선형구조 객체인 ArrayList가 사용되게 되었다.
	동적 배열이라는 말 그대로, 배열의 동적으로 변경가능 한 것을 말한다.

	2) ArrayList의 기본 기능
	할당할 default 데이터 object형이 객체이다.
	object는 java의 api뿐만 아니라 사용자 정의 클래스 등 모든 객체
	상속하는 최상위 객체이다.
	모든 객체는 Object에 할당 가능하다.(상속개념에 의해서)
	
	3) ArrayList을 객체를 할당, 호출, 변경, 삭제 등을 할 수 있다.
	
2. ArrayList의 사용
	1) java.lang.* 패키지 하위에 있는 클래스가 아니기 때문에 import하여야한다.
	2) 지원되는 메서드.
		.add(객체) : 해당 객체를 추가할 때, 쓰인다.
		.get(index) : 객체가 추가되면 index로 저장이 된다.
			선형구조 0, 1, 2...
		.set(index, 변경할 객체) : 특정한 위치에 있는 객체를 변경 처리한다.
		.remove(index) : 특정한 위치에 있는 객체를 삭제 처리된다.
			삭제처리되는 순간, 크기가 하나씩 줄어든다.
		.size() : ArrayList의 전체 크기를 가져올 수 있다.
 */

public class Z02_ArrayList {
	public static void main(String[] args) {
		String [] array = new String [5];
		// 초기에 배열의 크기를 고정화 된다.
		// array라는 참조변수로 배열의 크기를 변경할 수 없다.
		// 할당만할 수 있다.
		// 자바에서는 배열에 대한 동적 변경이 불가능하다.
		// 새로운 메모리와 기능 util API통해서 가능은 하다.
		Object ob = new Object();
		Object ob1 = new String("안녕");
		Object ob2 = new ArrayList();
		Object ob3 = new Person();
		// String은 Object의 toString() 문자열을 처리하기에 바로 사용
		// 될 수 있다.
		// 1. ArrayList 선언..
		ArrayList strList = new ArrayList();
		strList.add("사과");
		strList.add("바나나");
		strList.add("딸기");
		Object ob4 = "사과";
		// String만 참조변수를 호출하면 해당 문자열 데이터를 확인할 수 있다.
		System.out.println("object object의 참조변수:"+ob4);
		Object ob5 = new Person();
		System.out.println("Person object의 참조변수:"+ob5);
		// ArrayList 있는 데이터 가져오기..
		System.out.println(strList.get(0));
		System.out.println(strList.get(1));
		System.out.println(strList.get(2));
	
		// Q1) ArrayList은 어떤 유형의 객체의 default로 할당하는가?
		//		할당할 default 데이터 Object형이 객체이다.
		//		다른 데이터 유형을 할당 수 잇는데,String도 할당이 가능하다.
		//		외부 객체를 할당할 수 있다.
		// Q2) ArrayList에 할당한 String과 다른 객체의 할당의 차이점 무엇인가?
		//		String은 toString이 오버라이딩 되어 있음
		//		일반 객체는 참조변수로 주소값을 할당하듯,
		//		ArrayList에서도 객체로 할당하되, 해당 객체의 참조변수.메서드로 호출하여야 한다.
		// Q3) ArrayList에서 제공하는 추가와 가져오는 메서드는 무엇인가?
		//		add(객체), get(index)
		// ex1) ArrayList 문자열 객체 할당해서 가져오기..
		//		- 좋아하는 스포츠 스타 이름 3명 할당..
		// ex2) 일반 Person() 객체 할당해서 가져오기..
		//		- Person 객체 할당해서 가져오기..
		
		ArrayList strs = new ArrayList();
		strs.add(new String("손흥민"));
		strs.add(new String("이운재"));
		strs.add(new String("메시"));
		for(Object s : strs) {
			System.out.print(s);
		}
		ArrayList plist = new ArrayList();
		plist.add(new Person("손흥민",25));
		plist.add(new Person("이운재",40));
		plist.add(new Person("메시",30));
		for(Object p : plist) {
			System.out.println(p);
		}
		// 이와같이 객체는 Object로 할당된 것은 그대로 사용할 수 없다.
		// 이 때 필요한 것이 두가지..
		// 1) Object ==> type casting을 통해서 필요로 하는 객체로 만들어서 사용하는 방법.
		// 2) 초창기에 ArrayList에 default인 Object가 아닌 실제 들어갈 데이터,
		//	를 generic으로 선언하여 호출하여 사용된다. ArrayList<만들타입>
		//	- 일반 ArrayList Object이기에 typecasting이 필요하지만, generic은 ArrayList
		//		생성시에, 해당 type으로 선언하여 사용하기때문에 바로 사용이 가능하다...
		
		ArrayList<Person> plist2 = new ArrayList<Person>();
		plist2.add(new Person("손흥민",25));
		plist2.add(new Person("이운재",40));
		plist2.add(new Person("메시",30));
		for(int idx=0; idx<plist2.size(); idx++) {
			Person p = plist2.get(idx);	// 타입casting이 필요 없다. genetic이기 때문에..
			p.show();
		}
		// Q1) generic은 왜? typecasting을 할 필요가 없는가?
		//		ArrayList을 선언할 들어올 객체의 type을 정했기때문에 casting이 필요 없다.
		// ex) Fruit 클래스에 필드 과일명과 가격, 메서드 buy()를 설정하고,
		//	ArrayList generic으로 3개를 할당한 후 출력하세요..
		
		ArrayList<Fruit> fruits = new ArrayList<>();
		fruits.add(new Fruit("사과",1000));
		fruits.add(new Fruit("바나나",2000));
		fruits.add(new Fruit("앵두",1500));
		// 변경 처리
		fruits.set(0, new Fruit("포도",22000));
		fruits.remove(1);
		
		for(int i=0; i<fruits.size(); i++) {
			fruits.get(i).buy();
		}
		for(Fruit fr : fruits) {
			fr.buy();
		}
	}
}
class Person{
	private String name;
	private int age;
	
	public Person() {}
	public Person(String name, int age) {
		this.name = name;
		this.age = age;
	}
	public void show() {
		System.out.println(name + "\t" + age);
	}
}

class Fruit {
	private String name;
	private int price;
	
	public Fruit(String name, int price) {
		this.name = name;
		this.price = price;
	}
	void buy(){
		System.out.println(name+"을 구매하였습니다.");
	}
}