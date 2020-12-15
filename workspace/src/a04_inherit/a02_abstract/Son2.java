package a04_inherit.a02_abstract;

import a04_inherit.a01_basic.Father;

public class Son2 extends Father{
	public void callMember() {
//		System.out.println(age);	// private이기에 접근 불가
//		System.out.println(charac);	// default는 같은 패키지만
		System.out.println(favFood); // 상속관계있는 다른 패키지까지.
		System.out.println(announce); // 모두 다 가능..
	}
}
