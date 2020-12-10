package a01_basic;

public class A02_Memory {
	public static void main(String[] args) {
		
/*
# java의 메모리 사용..
 1. java는 핵심 메로리로 두 가지를 사용하고 있다.
 2. Stack : 기본데이터유형, 객체의 참조변수(heap영역의 주소값)
 3. heap : 실제 객체가 들어가는 메모리 영역..
 */
		// 기본데이터 할당..
		int num01 = 25;
		System.out.println("데이터의 할당 확인(stack) : " + num01);
		
		// 객체는
		// stack영역에 직접적으로 객체를 할당하는 것이 아니라,
		// heap영역의 주소값으로 할당하고 있다.
		// a01_basic.Person@3cd1f1c8
		// 패키지명.객체명@16진수의 주소값..
		Person p = new Person();
		System.out.println("데이터의 할당 확인(heap의 주소) : " + p);
		// 객체의 구성요소(필드, 생성자, 메서드)는 참조명을 통해서 접근이 가능하다.
		System.out.println("객체의 필드의 값 확인 : " + p.num01);
		
/*
ex) 일반 변수 num01과 num02의 사칙 연산 데이터를 할당한 결과값을 출력하고,
	클래스 Product를 선언하고, 필드로 name, price, cnt를 선언하고
	할당한 결과값을 출력하세요..
 */
		int num02 = 20;
		int num03 = 10;
		
		System.out.println(num02 + " + " + num03 + " = " + (num02+num03));
		System.out.println(num02 + " - " + num03 + " = " + (num02-num03));
		System.out.println(num02 + " * " + num03 + " = " + (num02*num03));
		System.out.println(num02 + " / " + num03 + " = " + (num02/num03));
		System.out.println();
		
		Product p01 = new Product();
		
		System.out.println(p01);
		System.out.println("물건명 : " + p01.name);
		System.out.println("가격 : " + p01.price);
		System.out.println("갯수 : " + p01.cnt);
		
/*
# String값과 메모리 할당..       
 1. boolean연산자 == 는 Stack영역의 데이터를 비교해준다.
 2. 기본 데이터 유형은 동일한 값을 할당하면 true로 처리되지만,
 	객체의 경우 동일한 값을 할당하더라도 주소값이 다르기때문에 false가 처리되는 경우가
 	많다.
 */
		int num04 = 50;
		int num05 = 50;
		System.out.println(num04 == num05);
		Product p02 = new Product();
		Product p03 = new Product();
		System.out.println(p02.name + ":" + p03.name);
		System.out.println(p02.price + ":" + p03.price);
		System.out.println(p02.cnt + ":" + p03.cnt);
		// 두 객체의 참조값을 비교..
		System.out.println("참조값의 비교 : " + (p02 == p03));
		// heap영역의 주소값이 다르기 때문에 stack영역의 주소값은 다른다.
		System.out.println(p02);
		System.out.println(p03);
/*
 3. String은 객체이다.
 4. 데이터는 heap영역에 할당된다..
 */
		String name01 = "홍길동";
		String name02 = "홍길동";
		String name03 = new String("홍길동");
		String name04 = new String("홍길동");
		// name03과 name04는 new Seting()로 생성하면 다른 heap주소 위치에
		// 객체가 생성이 된다.
		System.out.println(name03 == name04);
		// new 없이 바로 문자열을 할당하면, 어떤 메모리를 사용되는지?
		// "홍길동"이란 문자열은 모두 다 같은 heap영역의 메모리를 사용한다.
		System.out.println(name01 == name02);
/*
 5. 문자열을 동일한 문자열의 비교는 ==를 활용하면, 예외사항때문에 문제가 발생한다.
 6. 문자열의 동등 비교는 문자열이 객체이므로 사용되는 .equals()를 활용하여 비교하여야 한다.
 */
		System.out.println("name01.equlas(name2) : " + name01.equals(name02));
		System.out.println("name01.equlas(name4) : " + name01.equals(name04));
		System.out.println("name03.equlas(name4) : " + name03.equals(name04));
		System.out.println();
		
/*
 ex) 임의의 id, pass 문자열에 데이터를 할당하고, 해당 id pass가 동일하면 true 그렇지 않으면 false를
 	처리하세요.(문자열만 비교)
 */
		String id = "1234";
		String pw = "asdd";
		
		System.out.println("id.equals(\"1234\") : " + id.equals("1234"));
		System.out.println("pw.equals(\"asdd\") : " + pw.equals("asdd"));
	}
}
class Person {
	int num01 = 30;
}

class Product {
	String name = "사과";
	int price = 1000;
	int cnt = 3;
}