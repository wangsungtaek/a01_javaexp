package a04_inherit.a01_basic;

public class Worker {
	private String kind;

	public Worker(String kind) {
		super(); // object의 생성자 호출..
		this.kind = kind;
	}
	
	public void working() {
		System.out.println(kind+" 일을 하다!");
	}
}
class PoliceMan extends Worker {
	public PoliceMan() {
		super("경찰관");
	}
	// 상속된 내용 하위 클래스가 동일 working()내용 각각 다르게 재정의해서 사용할 필요가 있다. => 오버라이딩
	public void working() {
		super.working();
		System.out.println("치안을 담당하다.");
	}
} 



class FireMan extends Worker {
	public FireMan() {
		super("소방관");
	}
	public void working() {
		super.working();
		System.out.println("불을 끄다.");
	}
}