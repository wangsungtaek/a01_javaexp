package a02_object.a06_acess.a06_ourhome;

import a02_object.a06_acess.a05_grandhome.GrandFather;

public class Father extends GrandFather{
	void callGrandFather() {
		System.out.println(earnMoney);	// protected 여서 패키지가 달라도 상속관계이므로 호출이 가능하다.
	}
}
