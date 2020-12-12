package a02_object.a06_acess.a02_friendship;

public class Deer {
	void callWoodCutter() {
		WoodCutter c1 = new WoodCutter();
		// System.out.println(c1.cacheDrees);
		// private이기에 같은 package에서도 접근이 불가능.
		// 접근이 가능하다라는 말은 외부 다른 객체에 해당 멤버를
		// 참조변수.멤버 : 호출하는 것이 가능한지 여부를 확인하는 부분이다.
		System.out.println("사슴이 숨은 곳:"+c1.cacheDeer);
		// 같은 package이기에 접근가능
		System.out.println(c1.weddingDate);
		// public은 같은 package뿐만아니라 외부 package에서도
		// 접근이 가능하다.
	}
}
