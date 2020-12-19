package a00_exp.a06_1218;

import java.util.ArrayList;
import java.util.Scanner;

/*
# 한 주간을 정리하면서..
1. 메서드의 기본 구성요소의 기본 예제와 함께 기술하세요.
2. 
 */
public class A01_Exp {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		/*
		1. 메서드의 기본 구성요소의 기본 예제와 함께 기술하세요. 
			[접근제어자] [반환타입] [메서드명] [매개변수]
			- ex) public String add(String s){
					프로세스처리..
				  	return 결과데이터;
				  }
		*/
		
		/*
		2. 완성도 있는 자판기 프로그램을 구현하세요..
			1) 객체를 이용해서
				생성자 : 자판기명(음료/점심식사..)
				메서드1 : 금액 투입(총금액누적처리)
				메서드2 : 메뉴보이기
				메서드3 : 메뉴 선택 - 투입한 금액과 함께 물건 리턴..
				메서드4 : 잔액 리턴 처리
			2) 기본 자판기 예제를 활용하여 완성도 있게 만들어 보세요..
		*/
//		System.out.println("Ex2)");
//		VendingMachine machine = new VendingMachine();
//		machine.addMenu(new Drink("콜라",1500,3));
//		machine.addMenu(new Drink("사이다",1300,2));
//		machine.addMenu(new Drink("아침햇살",1000,5));
//		
//		while(true) {
//			machine.displayMoney();
//			System.out.println("금액을 투입하시겠습니까?(Y,N)");
//			if(sc.next().equals("Y")) {
//				System.out.println("투입 금액을 입력하세요>>");
//				machine.addMoney(sc.nextInt());
//			}
//			machine.showMenu();
//			System.out.println("메뉴를 선택하세요.");
//			machine.choiceMenu(sc.nextInt()-1);
//			System.out.println("더 구매하시겠습니까?(Y,N)");
//			if(!(sc.next().equals("Y"))) break;
//		}
//		machine.returnMoney();
//		System.out.println();
//		System.out.println();
		/*
		3. 필기구와 노트의 1:1관계로 설정하여
			@@필구를 이용하여 노트에 @@을 기록하다. 객체 1:1관계 설정으로
			프로그램을 처리하세요.
		*/
		System.out.println("Ex3)");
		Note note = new Note("꿈");
		Tool tool = new Tool("만년필");
		System.out.println(tool+"을 이용해서 노트에 "+note+"을 기록하다.");
		System.out.println();
		System.out.println();
		/*
		4. 기차예매표 처리 프로그램 기차객체와 좌석별 내용을 1:다 관계로 설정하세요.
		 	기차클래스 : 서울~부산
		 	좌석클래스 : @@호차 @@번호 예약여부
		 	## 중간에 구간으로 정해서 예매처리.
		*/
		System.out.println("Ex3)");
		Train train = new Train();
 
		/*
		5. final, static의 개념과 기본 예제를 통해 설명하세요.
			1. final
				1) 변수앞에 final이 붙으면 상수라하며, 값을 초기에 한번 할당하고 이후 변경이 불가능하다.
					ex) final String NAME = "왕성택";
				2) 메서드에 final이 붙으면 자손클래스(하위클래스) 오버라이딩 불가능 하다.
					ex) public final void getID(){}
				3) 클레스 앞에 final이 붙으면 상속을 할 수 없다.
					ex) class final Person {}
			2. static
				1) 객체 생성없이 사용할 수 있는 변수 또는 메서드를 호출할 수 있다.
				2) 
		
		
		*/
		
		/*
		6. 접근제어자의 종류와 범위를 기술하되, default, protected에 관련하여
			기본 예제를 만들어 보세요.
		*/
		
		
		/*
		7. 상속의 멤버(생성자, 필드, 메서드) 별로 접근제어자와 재정의에 대하여 기능별로
			기술하세요.
		*/
		
		/*
		8. 상속에서 Robot을 추상클래스로 정의하고 하위에 실제클래스를 TV, Dagan, MZ를
			선언하여 처리할 수 있도록 하되, Interface는 Weapon으로 하위에 여러 무기(로켓,
			레이저빔..등) 처리 할 수 있게 하되, 각 로봇마다 무기를 여러가지를 장착 가능하게
			처리하세요. (오버라이딩, 공통메서드)를 활용하여 처리해보세요.
		*/
		
		/*
		9. 예외 처리에서 런타임시 예외와 필수 예외를 처리하는 방법을 기본예제를 통해서 설명하세요.
		*/
	
		/*
		10. 사용자 정의 예외를 구성하되, Scanner으로 입력한 값이 id, pass가 맞지
			않을 때, 정의된 예외 클래스를 통해서 처리되는 프로그램을 구현하세요.
		*/
		
		/*
		11. 데이터베이스 설치 관련 내용을 캡처를 통해 설치되는 절차를 정리하여 ppt파일로
			만들어 보세요.
		*/			
			
	}
}
class VendingMachine { // Ex2
	private int inputMoney;
	private ArrayList<Drink> drinks;
	
	public VendingMachine() {
		drinks = new ArrayList<>();
	}
	public void addMoney(int inputMoney) {
		this.inputMoney += inputMoney;
		displayMoney();
	}
	public void displayMoney() {
		System.out.println("투입 금액:"+inputMoney);
	}
	public void showMenu() {
		System.out.println("# 자판기 메뉴 #");
		if(drinks != null) {
			int i=1;
			for(Drink d : drinks) {
				System.out.println(i+"."+d.getName()+"("+d.getPrice()+"), "+d.getCnt()+"개");
				i++;
			}
		}
	}
	public void addMenu(Drink drink) {
		drinks.add(drink);
	}
	public void choiceMenu(int num) {
		if(!(num > drinks.size())) {
			if(inputMoney >= drinks.get(num).getPrice()) { // 투입금액 > 음료가격
				if(drinks.get(num).getCnt() > 0) { // 해당 메뉴가 있으면
					drinks.get(num).setCnt((drinks.get(num).getCnt()-1)); // 메뉴 --
					inputMoney -= drinks.get(num).getPrice();
					System.out.println(drinks.get(num).getName()+"를 구매하였습니다.");
					displayMoney();
				} else {
					System.out.println("해당 메뉴는 품절 되었습니다.");
				} 
			} else {
				System.out.println("투입금액이 모자랍니다.");
			}
		} else {
			System.out.println("해당 메뉴는 존재하지 않습니다.");
		}
	}
	public void returnMoney() {
		System.out.println("거스름돈 : "+inputMoney);
		int[] moneys = {10000, 5000, 1000, 500, 100, 50, 10};
		for(int i=0; i<moneys.length; i++) {
			if(inputMoney/moneys[i]>0) {
				System.out.print(moneys[i]+"원:"+inputMoney/moneys[i]+"개  ");
			}
			inputMoney %= moneys[i];
		}
	}
}
class Drink {
	private String name;
	private int price;
	private int cnt;
	
	public Drink(String name, int price, int cnt) {
		this.name = name;
		this.price = price;
		this.cnt = cnt;
	}
	@Override
	public String toString() {
		return name;
	}
	public String getName() {
		return name;
	}
	public int getPrice() {
		return price;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
} // Ex2 end

class Tool { // Ex3
	private String kind;
	public Tool(String kind) {
		this.kind = kind;
	}
	@Override
	public String toString() {
		return kind;
	}
}
class Note {
	private String record;
	public Note(String record) {
		this.record = record;
	}
	@Override
	public String toString() {
		return record;
	}
} // Ex3 end

class Train { // Ex4
	private String name;
	private ArrayList<Seat> seats;
	
	public Train() {
		this.name = "부산행 ktx";
		seats = new ArrayList<>();
	}
	@Override
	public String toString() {
		return name;
	}
	public void setSeats(Seat seats) {
		this.seats.add(seats);
	}
	public ArrayList<Seat> getSeats() {
		return seats;
	}
}
class Seat {
	private String name;
	protected boolean[] status;
	public Seat(String name) {
		status = new boolean[30];
	}
	public boolean[] getStatus() {
		return status;
	}
	public void setStatus(boolean[] status) {
		this.status = status;
	}
	public void checkSeat(int index) {
		if(status[index-1]) {
			System.out.println(name+"호차 "+index+"번 좌석은 이미 예매 되었습니다.");
		} else {
			System.out.println(name+"호차 "+index+"번 좌석은 예매 가능합니다.");
		}
	}
	public void reserve(int index) {
		if(status[index-1] == false) {
			System.out.println(name+"호차 "+index+"번 좌석을 예매합니다.");
			status[index-1] = true;
		} else {
			System.out.println(name+"호차 "+index+"번 좌석은 이미 예매 되었습니다.");
		}
	}
	public void showSeat() {
		System.out.println("### "+name+"호차 좌석정보 ###");
		System.out.println("예매완료 좌석");
		for(int cnt=0; cnt<status.length; cnt++) {
			if(status[cnt]) {
				System.out.print((cnt+1)+"  ");
			}
		}
		System.out.println();
		System.out.println("예매가능 좌석");
		for(int cnt=0; cnt<status.length; cnt++) {
			if(!status[cnt]) {
				System.out.print((cnt+1)+"  ");
			}
		}
		System.out.println();
	}
}
class FirstCar extends Seat {
	public FirstCar(String name) {
		super(name);
	}
}
class SecondCar extends Seat {
	public SecondCar(String name) {
		super(name);
	}
}
class ThirdCar extends Seat {
	public ThirdCar(String name) {
		super(name);
	}
} // Ex4 end
