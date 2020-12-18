package a00_exp.a04_1216;

import java.util.ArrayList;

public class A01_Exp {
	public static void main(String[] args) {
		// Ex1) 추상클래스를 상속하는 것과 일반 클래스를 상속하는 궁극적인 차이점을 기술하세요.
		//	-> 추상클래스는 반드시 한 개 이상의 추상메서드를 포함하고 있고, 상속받는 하위 클래스에서 반드시 오버라이딩 해야한다.
		//	일반 클래스 vs 일반 클래스 :
		//		1) 상이 객체는 자체로 객체 생성이 가능하다.
		// 		2) 하위에서 자유롭게 재활용 및 재정의 할 수 있다.
		//	추상클래스 vs 일반 클래스 :
		//		1) 상위 클래스는 자체로 객체 생성을 하지 못 한다.
		//			- 하위 상속 클래스의 통일성 있는 사용을 목적으로 다형성 처리를 위해 만든 것이기 때문이다.
		//		2) 하위 클래스는 상위클래스를 정의된 추상 메서드를 반드시 재정의 하여야지 컴파일이 가능하다.
		//			- 추상 메서드의 강제성을 확보하여 하위 클래스의 재정의 메서드 통일성을 추구할 수 있다.
		
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
		//	실제메서드 : 공통부분을 활용하여, 효과적으로 개발을 할 수 있다.
		//	추상메서드 : 상위 클래스에서 상속받아 하위에서는 기능으로 차이가 필요한 부분을 재정의하여 사용할
		//	수 있다. 하위 객체에서 다형성을 추구할 수 있는 기능적인 내용을 처리한다.

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
		
		Larba l1 = new Dron(); // 첫번째 라바를 통해서 드론을 생성..
		l1.attack(); // 재정의한 메서드
		l1.move(); // 상위 공통 메서드
		ArrayList<Larba> list = new ArrayList<>();
		list.add(new Dron());
		list.add(new Zergling());
		list.add(new Hydra());
		list.add(new Lurker());
		for(Larba li : list) {
			li.move();
			li.attack();
		}
		System.out.println();
		System.out.println();		
		
		// Ex4) 인터페이스와 추상클래스와의 차이를 멤버를 위주로 기술하세요..
		// -> 인터페이스 : public static final 상수타입 상수명 = 데이터;
		//				public abstract 반환타입 메서드명();
		//				public default 반환타입 메서드명(){구현내용}
		//				public static 반환타입 메서드명(){구현내용}
		// -> 추상클래스 : public abstract 반환타입 메서드명();
		//				public 반환타입 메서드명(){구현내용}
		// 인터페이스는 추상메서드, 가능메서드, 정적기능메서드, 정적상수를 멤버로 정의할 수 있으며,
		// 추상메서드는 추상메서드, 기능메서드를 멤버로 정의 할 수 있다.
		// 인터페이스는 목적이 객체의 재활을 위한 내용이 많다.
		// 멤버 :
		// 1) 필드 : 추상메서드는 일반 필드와 동일하게 사용되지만 인터페이스는
		//		항상 public static final이 default로 붙은 것과 동일 작동을 한다.
		//		인터페이스는 static final 상수만 사용할 수 있다.
		// 2) 메서드
		//		- 추상 메서드 : 추상메서드를 활용하는 것은 동일하나,
		//			인터페이스는 public abstract 가 붙은 것과 동일한 작동을 한다. 생략가능하다.
		//		- default 메서드 : 인터페이스는 default로 명시한 메서드가 지원한다.
		//		- static 메서드 : 인터페이스에선 객체생성없이 static 메서드를 사용할 수 있다.
		 
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
		// 추상 클래스나 인터페이스를 상속받는 하위 실제 클래스를 통해서 해당 내용을 사용하는게 일반적이지만,
		// main()나 호출하는 곳에서 바로 이름 없이 정의하여 재정의된 메서드나 공통 메서드를
		// 사용하는 것을 말한다.
		
		
		System.out.println("Ex6)");
		// 상속받은 하위 클래스를 하위 객체 이름없이 바로 선언하여 처리한다.
		// # 주의 - 추상클래스와, 인터페이스가 객체가 생성된 것이 아니고,
		// 폴리모피즘(상위 = 하위)에 의해서 이름없는 실제객체를 정의및 생성해 놓은 것이다.
		// 정의된 내용을 메서드나 생성자를 통해서 사용할 수 있다.
		Larba unit5 = new Larba("울트라") {
			public void attack() {
				System.out.println(getName()+"큰 발톱으로 공격을 합니다.");
			}
		}; // 선언과 동시에 객체 생성..
		unit5.move();
		unit5.attack();
		
		// 안드로이드에서 이벤트(클륵, 마우스 핸들링)에서 쓰이는 프로그래밍 방식이다.
		DataAccessObj dao = new DataAccessObj() {
			@Override
			public void search() {
				System.out.println("익명 DB를 조회하다.");
			}
			@Override
			public void modify() {
				System.out.println("익명 DB를 수정하다.");				
			}
			@Override
			public void delete() {
				System.out.println("익명 DB를 삭제하다.");				
			}
			@Override
			public void add() {
				System.out.println("익명 DB를 추가하다.");				
			}
		};
		dao.search();
		dao.modify();
		dao.delete();
		dao.add();
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
	private String name; // 상속받는 모든 객체에서 사용할 변수 지정.

	public Larba(String name) { //  상위에 생성자를 통해서 할당.
		this.name = name;
		System.out.println("# " + name + "생성 #");
	}
	public abstract void attack(); // 추상메서드가 1개라도 포함되면 추상 클래스가 된다.
	// 공통메서드..
	public void move() {
		System.out.println(name + " 이동히다.");
	}
	
	public String getName() {
		return name;
	}
}
class Dron extends Larba {
	public Dron() {
		super("드론"); // 상위 선언된 생성자에 이 객체가 가지고 있는 이름을 매개변수로
		// 전달하여 kind에 할당하기 위하여 쓰인다.
	}

	@Override
	public void attack() {
		System.out.println("자원 채집을 하고, 공격력은 미약하다!!");
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
	public Hydra(String name) {
		super(name);
	}
	@Override
	public void attack() {
		System.out.println(getName()+"가 독으로 공격합니다.");
	}
}
class Lurker extends Hydra {
	public Lurker() {
		super("럴커");
	}
	@Override
	public void attack() {
		System.out.println(getName()+"가 가시 공격합니다.");
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
	void search(); // public abstract가 생략가능하다.
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