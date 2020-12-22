package a00_exp.a06_1218;

import java.util.ArrayList;

/*
8. 상속에서 Robot을 추상클래스로 정의하고 하위에 실제클래스를 TV, Dagan, MZ를
	선언하여 처리할 수 있도록 하되, Interface는 Weapon으로 하위에 여러 무기(로켓,
	레이저빔..등) 처리 할 수 있게 하되, 각 로봇마다 무기를 여러가지를 장착 가능하게
	처리하세요. (오버라이딩, 공통메서드)를 활용하여 처리해보세요.
*/
public class Ex8 {
	public static void main(String[] args) {
		// 추상클래스에서 상속받으면, 공통내용을 효과적 사용 및 재정의할 수 있다.
		// 추상/인터페이스 이용시, 추가되는 객체는 기존 코드에 영향을 미치지 않는다.
		TV tv = new TV(); 
		tv.attack();
		tv.addWeapon(new Rocket());
		tv.addWeapon(new Laser());
		tv.addWeapon(new ChangeAttack());
		tv.attack();
		tv.shapeAndColor();
	}
}
abstract class Robot2{
	private String kind;
	private ArrayList<Weapon2> wlist;
	// 추가할 무기종류. 상위 = 하위에 list형식으로 추가할 수 있도록 선언..
	public Robot2(String kind) {
		super();
		this.kind = kind;
		wlist = new ArrayList<Weapon2>();
	}
	// 무기를 추가할 수 있는 메서드 Weapon2 wp = 상속받은 하위 객체.
	public void addWeapon(Weapon2 wp) {
		wlist.add(wp);
		System.out.println("무기 장착");
	}
	public void attack() {
		System.out.println("# "+kind+" 로봇 공격하다 #");
		if(wlist.size()>=1) {
//		for(Weapon2 wp : wlist) { // 1. list내에 객체를 바로 할당해서 활용할 때..
			for(int idx=0; idx<wlist.size(); idx++) {
				// 2. numbering이나 인덱스를 활용할때
				Weapon2 wp = wlist.get(idx);
				System.out.print("\t"+(idx+1)+"번째 무기!");
				wp.attack();
			}
		} else {
			System.out.println("무기가 장착되지 않았습니다.");
		}
	}
	// 추상클래스를 상속받은 하위 실제 클래스에서 재정의할 내용.(추상메서드만선언)
	public abstract void shapeAndColor();
}
class TV extends Robot2{
	public TV() {
		super("태권브이");
	}
	@Override
	public void shapeAndColor() {
		System.out.println("빨간색 V 심볼과 철제 거대 로봇이다.");
	}
}
class MZ2 extends Robot2{
	public MZ2() {
		super("마징가Z");
	}
	@Override
	public void shapeAndColor() {
		System.out.println("빨간색 Z 심볼과 여러가지 무기를 활용하는 로봇이다.");
	}
}
class Dagan2 extends Robot2{
	public Dagan2() {
		super("다간");
	}
	@Override
	public void shapeAndColor() {
		System.out.println("변신을 해서 여러가지 기능을 하는 로봇이다.");
	}
}

interface Weapon2 {
	public void attack();
}
class Rocket implements Weapon2{
	@Override
	public void attack() {
		System.out.println("로켓포로 공격하다!");
	}
}
class Laser implements Weapon2{
	@Override
	public void attack() {
		System.out.println("레이저빔으로 공격하다!");
	}
}
class ChangeAttack implements Weapon2{
	@Override
	public void attack() {
		System.out.println("변신 공격하다!");
	}
}