package a02_object.a05_oneVsone;

public class A09_Robot {
	String kind;
	A10_Weapon weapon;

	public A09_Robot(String kind) {
		this.kind = kind;
	}
	
	void setWeapon(A10_Weapon weapon){
		this.weapon = weapon;
	}
	
	void attack() {
		System.out.println(kind+" 공격을 한다.");
		if(weapon != null) {
			System.out.println("무기로 공격을 한다.");
			weapon.show();
		} else {
			System.out.println("무기가 할당되지 않음..");
		}
	}
}
