package a02_object.a05_oneVsone;

public class A10_Weapon {
	String kind;
	int attackPt;

	public A10_Weapon(String kind, int attackPt) {
		this.kind = kind;
		this.attackPt = attackPt;
	}
	void show() {
		System.out.println("# 무기의 종류 #");
		System.out.println("이름:"+kind);
		System.out.println("공격력:"+attackPt);
	}
}
