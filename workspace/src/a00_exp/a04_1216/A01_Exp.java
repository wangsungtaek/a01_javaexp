package a00_exp.a04_1216;

public class A01_Exp {
	public static void main(String[] args) {
		// Ex1) 추상클래스를 상속하는 것과 일반 클래스를 상속하는 궁극적인 차이점을 기술하세요.
		//	-> 추상클래스는 반드시 한 개 이상의 추상메서드를 포함하고 있고, 상속받는 하위 클래스에서 반드시 오버라이딩 해야한다.

		// Ex2) 추상클래스에서는 두가지 유형의 메서드를 사용할 수 있다. 실제 메서드와 추상메서드
		//		히위 클래스에서 이 클래스를 어떤 경우에 활용하는지 예제를 통헤서 기술하세요.
		//	->  실제 메서드 : 하위 클래스에서 공통으로 사용되는 기능을 정의할때 사용되고,
		//		추상 메서드 : 하위 클래스에서 메서드를 강제로 재정의 하게 강제한다.
		// 		public abstract class Animal {
		//			public abstract food();	// 먹이는 동물마다 다르기 때문에 추상 메서드로 정의한다.
		//			public void toEat(){	// 먹는 행동은 모든 동물들이 같기 때문에 실제 메서드로 정의한다.
		//				음식을 먹다.
		//			}
		//		}
		
		// Ex3) 추상클래스로 Starcraft의 zerg종족의 초기 유닉 Larba를 선언하고
		//		필드명 유닛명, 재정의할 메서드 attack()으로 선언하여, 하위 실제클래스로
		//		Zerggling, Hydra, Mutal .. 계층 구조화된 내용으로 실제 객체를 선언하고,
		//		공격방식에 따른 처리를 하세요.
		System.out.println("Ex3)");
		Zergling unit1 = new Zergling();
		Hydra unit2 = new Hydra();
		Mutal unit3 = new Mutal();
		unit1.attack();
		unit2.attack();
		unit3.attack();
		System.out.println();
		System.out.println();
		
		// Ex4) 인터페이스와 추상클래스와의 차이를 멤버를 위주로 기술하세요..
		// -> 인터페이스 : public static final 상수타입 상수명 = 데이터;
		//				public abstract 반환타입 메서드명();
		//				public default 반환타입 메서드명(){구현내용}
		//				public static 반환타입 메서드명(){구현내용}
		// -> 추상메서드 : public abstract 반환타입 메서드명();
		//				public 반환타입 메서드명(){구현내용}
		// 인터페이스는 추상메서드, 가능메서드, 정적기능메서드, 정적상수를 멤버로 정의할 수 있으며,
		// 추상메서드는 추상메서드, 기능메서드를 멤버로 정의 할 수 있다.
		
		
		
		// Ex5) DataAccessObj라는 데이터베이스 처리하는 인터페이스를 추상메서드(조회, 수정, 삭제, 등록)으로 선언하고,
		// 		이를 상속받은 mysqlDao, OracleDao 실제 클래스를 선언하여, 각 클래스마다 다른 처리를 구현하여
		// 		호출할 수 있도록 하세요,
		System.out.println("Ex5)");
		MysqlDao db1 = new MysqlDao();
		OracleDao db2 = new OracleDao();
		db1.search();
		db1.modify();
		db1.delete();
		db1.add();
		db2.search();
		db2.modify();
		db2.delete();
		db2.add();
		System.out.println();
		System.out.println();
		
		// Ex6) 추상 클래스와 인터페이스를 통한 익명클래스를 생성하여, 처리하는 예제를 구현하새요
		//		Larba/robot DataAccessObj를 활용하여 처리
		System.out.println("Ex6)");
		Larba unit5 = new Larba("울트라") {
			public void attack() {
				System.out.println(getName()+"큰 발톱으로 공격을 합니다.");
			}
		};
		unit5.attack();
		
	}

	private static OracleDao OracleDao() {
		// TODO Auto-generated method stub
		return null;
	}

	private static MysqlDao MysqlDao() {
		// TODO Auto-generated method stub
		return null;
	}
}

abstract class Larba { // Ex3
	private String name;
	public abstract void attack();

	public Larba(String name) {
		this.name = name;
	}
	public String getName() {
		return name;
	}
}
class Zergling extends Larba {

	public Zergling() {
		super("저글링");
	}
	@Override
	public void attack() {
		System.out.println(getName()+"이 발톱으로 공격합니다.");
	}
}
class Hydra extends Larba {

	public Hydra() {
		super("히드라");
	}
	@Override
	public void attack() {
		System.out.println(getName()+"가 독으로 공격합니다.");
	}
}
class Mutal extends Larba {

	public Mutal() {
		super("뮤탈");
	}
	@Override
	public void attack() {
		System.out.println(getName()+"이 도끼로 공격합니다.");
	}
} // Ex3 end
interface DataAccessObj { // Ex5
	void search();
	void modify();
	void delete();
	void add();
}
class MysqlDao implements DataAccessObj{
	private String name;
	public MysqlDao() {
		this.name = "MySql";
	}
	@Override
	public void search() {
		System.out.println(name+"데이터를 검색합니다.");
	}

	@Override
	public void modify() {
		System.out.println(name+"데이터를 수정합니다.");
	}

	@Override
	public void delete() {
		System.out.println(name+"데이터를 삭재합니다.");
	}

	@Override
	public void add() {
		System.out.println(name+"데이터를 등록합니다.");
	}
}
class OracleDao implements DataAccessObj{
	private String name;
	public OracleDao() {
		this.name = "Oracle";
	}
	@Override
	public void search() {
		System.out.println(name+"데이터를 검색합니다.");
	}

	@Override
	public void modify() {
		System.out.println(name+"데이터를 수정합니다.");
	}

	@Override
	public void delete() {
		System.out.println(name+"데이터를 삭재합니다.");
	}

	@Override
	public void add() {
		System.out.println(name+"데이터를 등록합니다.");
	}
} // Ex5 end