package a04_inherit.a03_Interface;
/*
# 인터페이스
1. 시작하면서..

2. 인터페이스를 사용하면, 기본 클래스에 영향을 미치지 않고, 추가적인 개발을 계속할 수있는 특징이 있다.

3. 인터페이스란?
	개발 코드와 객체가 서로 통신하는 접점을 말한다.
	1) 주요 역할
		개발 코드가 객체에 종속되지 않게, 상속에 의해 생성되는 여러 객체들로
		간편하게 교체할 수 있는 역할을 한다.
		ex) Mz에 여러가지 날개1호, 날개2호 교체..
			여러가지 무기종류 교체..
		메인 코드를 변경 없이 추가적이거나 변경되는 코드를 다양하게 사용할 수 있다.
		ex) Mz의 코드 변경 없이 날으는 기능이나 무기를 다양하게 사용
			할 수 있다.

4. 인터페이스 선언..
	interface 인터페이스명 {
		[public static final] 데이터타입 상수명 = 할당할데이터;
		[public abstract] 리턴타입 추상메서드();
		default 리턴타입 메서드명(매개변수) {
		
		} // default 메서드.
		static 리턴타입 메서드명(){
		
		}
	}
	1) 안터페이스명은 클래스와 동일하게 대문자로 사작하여 사용한다.
	2) 인터페이스는 초기값이 할당된 static	상수만 사용할 수 있다.
	*/
interface RemoteControl {
	int MAX_VALUME=10; // public static final이 생략됨..
	int MIN_VOLUME=0;
	void setVolume(int volumn); // public abstract 생략됨..
	default void setMute(boolean mute) {
		if(mute) {
			System.out.println("무음 처리합니다.");
		} else {
			System.out.println("무음 해제 합니다.");
		}
	}
	static void changeBattery() {
		System.out.println("건전지를 교환합니다.");
	}
}
class Audio implements RemoteControl {

	private int volumn;
	@Override
	public void setVolume(int volumn) {
		if(volumn>RemoteControl.MAX_VALUME) {
			this.volumn = RemoteControl.MAX_VALUME;
		} else if(volumn<RemoteControl.MIN_VOLUME) {
			this.volumn = RemoteControl.MIN_VOLUME;
		} else {
			this.volumn = volumn;
		}
		System.out.println("현재 오디오 볼륨은 "+this.volumn);
	}
}
/*
	3) 추상메서드 : 상속 받은 하위 클래스에서 재정의할 메서드...
	4) 공통기능메서드 : default메서드, 객체생성 없이 쓸 수 있는
		static 메서드 (1.8~~)

 */


public class A01_Interface {
	public static void main(String[] args) {
		Mz m1 = new Mz();
		m1.run();
		m1.attack();
		m1.fly();
		// 날개1호를 장착..
		m1.setFlyway(new Wing01());
		m1.fly();
		// Mz에 코드를 변경하지 않고, Flyway를 상속받은 클래스만
		// .setFlyway에 장착하면 된다.
		// 날개호를 장착
		m1.setFlyway(new Wing02());
		m1.fly();
		m1.setAttackWay(new Wapon01());
		m1.attack();
		m1.setAttackWay(new Wapon02());
		m1.attack();
		m1.setAttackWay(new Wapon03());
		m1.attack();
		
		Audio audio = new Audio();
		audio.setMute(true); // default 메서드
		audio.setVolume(15); // 재정의한 메서드
		RemoteControl.changeBattery(); // static 메서드로 객체 생성없이 바로 호출가능
	}
// ex) 인터페이스 AttackWay 선언하고 attack()를 추상메서드 선언.
// 		상속받은 하기 실제 클래스로 무기의 종류를 새롭게 장착하여
//		공격방벙을 다르게 처리하세요.. 무기 - 로켓포, 미사일, 레이저빔..
	
}
