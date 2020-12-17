package a04_inherit.a03_Interface;

public class Mz {
	private String name;
	private Flyway flyway;
	private AttackWay attackWay;
	
	public Mz() {
		name = "마징가Z";
	}
	// 날개 실제 객체가 들어올 수 있게 선언..
	// Flyway flyway = new Wing01();
	public void setFlyway(Flyway flyway) {
		this.flyway = flyway;
	}
	public void setAttackWay(AttackWay attackWay) {
		this.attackWay = attackWay;
	}
	public void run() {
		System.out.println(name+"뛰어 다닌다!!");
	}
	public void attack() {
		if(attackWay != null) {
			System.out.print(name+"는 ");
			attackWay.attack();
		} else {
			System.out.println(name+"공격을 한다.!!");
		}
	}
	public void fly() {
		// 인테페이스에 setFlyway()메서드에 의해 실제 객체가 할당되었을 때..
		if(flyway != null) {
			System.out.print(name+"는 ");
			flyway.flying();
		} else {
			System.out.println(name+"에는 날개가 아직 장착되지 않았습니다.");
		}
	}
}
