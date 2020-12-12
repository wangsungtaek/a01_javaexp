package a00_exp.a01_1211;

import java.util.*;

/*
# 한주간을 정리하면..
1. 자바의 핵심 메모리 두가지를 primitive와 객체와 비교하여 할당방법을 설명하세요.
-> 기본형 타입은 스택영역에 할당되며, 객체는 힙영역에 할당된다.
	기본형 타입 변수(byte, short, int, log, float, double, char, boolan)은 데이터가 할당되며,
	참조형 타입 변수는 객체의 주소가 할당된다.

2. String의 메모리 할당의 특성을 비교연산자와 equals를 통해서 기술하세요.
-> 비교 연산자 '=='을 사용하게 되면 객체의 주소를 비교하며,
	equals를 사용하여 비교하게 되면 String클래스에 오버라이딩된 equals메서드를 통해
	문자열을 비교하게 된다.
	때문에, 문자열을 비교하기 위해선 equals를 사용해야 한다.

3. Scanner을 통해서 id와 pass 입력을 하고, himan/7777일 때,
	로그인 성공 그렇지 않을 때, 로그인 실패를 처리하는 프로그램 만들어 보세요.
	
4. 조건문 활용 예제(난이도 중) Scanner을 통해서 나이 이력 받아서 처리..
	* 나이에 따른 할인률 적용.
	* 3세이하, 65세이상 무료
	* 4~7 : 50%할인
	* 8~13 : 40%할인
	* 14~19 : 20%할인
	* 그외에는 전액..
	*
	* 1) 변수 나이에 따른 할인률을 출력하세요.
	* 2) 요금이 50000일때, 할인률 적용된 금액까지 출력하세요.
	* 
5. 버스 클래스를 만들고 필드로 번호, 시작점, 마지막종착점 선언, 생성자를 통해서 해당 필드값을 초기화 처리..
	생성자를 통해서 해당 필드값을 초기화 처리..
	메서드를 통해서 @@번 버스 @@@~@@ 노선.
6. Card :
	필드 : 번호, 모양 	52를 배열을 선언..
		번호 : A 2 3 4 5 .. J, Q, K
		모양 : ♠ ♣ ◈ ♥
	메서드 : show() 번호와 모양을 출력..
	1) ArrayList<Card> 카드 52개 만들기.
	2) 이 중에서 임의로 7장 뽑아서 출력 show()
7. Math.random()을 이용해서 주사위가 1~6번호가 나오게하고, 실행할 때 마다 해당 번호가 나온 확률을 표기하세요.
	반복문으로 6회 실행하여
	나온 번호 : @@
	1 : @@@ % 2: @@ % 3: @@ %, 4 @@ %, 5 @@%, 6 @@%
8. 상위는 학년 하위는 반을 출력하세요 (학년은 1~3) (반은 1~10)
		1학년 1반 ~~~ 1학년 10반
		2학년 1반 ... 2학년 10반..
		3학년 1반 ... 3학년 10반.. (반복문 활용)
9. 컴퓨터와 하는 가위 바위 보
	가위! 바위! 보!(1,2,3) 를 입력하세요!!!
	컴퓨터 vs 나
	@@ : @@
	결과 : 승/무/패
10. # 어서 오세요 행복 반점 입니다 #
	# 메뉴
	1. 짜장면(5000원)
	2. 짬뽕(6000원)
	3. 탕수육(12000원)
	# 주문 번호를 입력하세요(1~3): @@
	# 주문할 수량을 입력하세여(1~) : @@
	@@@를 @@개 주문했습니다.
	계속 주문하시겠습니까?(Y/N): @@
	----------------------
	총비용은 @@@원 입니다.
11. Book 클래스를 만들고,
	생성자로 도서명을 입력받고
	buy(..,..)를 통해서 가격과, 갯수를 입력받아 처리하고.
	tot()을 통해서 총액을 계산을 ruturn 받아 처리하고.
	prn()을 통해서 현재 구매한 도서의 도서명, 가격, 갯수 출력하세요.
	도서를 3권으로 구매 처리하고, 총비용을 출력 하세요.
 */
public class A01_Exp {
	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		
		// Ex3
		System.out.println("Ex3)");
		System.out.print("id를 입력하세요 >>");
		String id = s.next();
		System.out.print("pass를 입력하세요 >>");
		String pass = s.next();
		System.out.println((id.equals("himan") && pass.equals("7777"))? "로그인 성공":"로그인 실패");
		System.out.println();
		System.out.println();

		// Ex4
		System.out.println("Ex4)");
		double fare = 50000;
		double[] discount = {100, 50, 40, 20, 0};
		int disCnt = 4;
		System.out.println("나이를 입력해주세요.");
		int age = s.nextInt();
		if(age <= 3 || age >= 65) {
			fare *= (discount[0]/100);
			disCnt = 0;
		} else if (age >= 4 && age <= 7) {
			fare *= (discount[1]/100);
			disCnt = 1;
		} else if (age >= 8 && age <= 13) {
			fare *= (discount[2]/100);
			disCnt = 2;
		} else if (age >= 14 && age <= 19) {
			fare *= (discount[3]/100);
			disCnt = 3;
		}
		System.out.println("== 요금 ==");
		System.out.println("나이:"+age);
		System.out.println("할인률:"+discount[disCnt]+"%");
		System.out.println("적용된 금액:"+fare);
		System.out.println();
		System.out.println();
		
		// Ex5)
		System.out.println("Ex5)");
		Bus bus = new Bus(11,"개신동","가경동");
		bus.busInfo();
		System.out.println();
		System.out.println();

		// Ex6) 카드뽑기
		System.out.println("Ex6)");
		ArrayList<Card> deck = new ArrayList<Card>();
		String[] number = {"A","2","3","4","5","6","7","8","9","10","J","Q","K"};
		char[] shape = {'♠','♣','◈','♥'};
		
		for(int i=0; i<shape.length; i++) {
			for(int j=0; j<number.length; j++) {
				deck.add(new Card(number[j],shape[i]));
			}
		}
		for(int i=0; i<7; i++) {
			int ran = (int)(Math.random()*deck.size());
			deck.get(ran).show();
		}
		System.out.println();
		System.out.println();
		
		// Ex7) 확률 구하기
		System.out.println("Ex7)");
		int[] arr = {0,0,0,0,0,0};
		for(int i=0; i<6; i++) {
			int ran = (int)(Math.random()*6);
			arr[ran]++;
		}
		for(int i=0; i<arr.length; i++) {
			System.out.printf("%d이 나온 확률 : %.2f",(i+1),(arr[i]/6.0f)*100);
			System.out.println(" %");
		}
		System.out.println();
		System.out.println();
		
		// Ex8) 학년, 반 출력
		System.out.println("Ex8)");
		for(int i=1; i<4; i++) {
			for(int j=1; j<11; j++) {
				System.out.print(i+"학년 "+j+"반\t\t");
			}
			System.out.println();
		}
		System.out.println();
		System.out.println();

		// Ex9) 가위, 바위, 보
		System.out.println("Ex9)");
		String[] arrStr = {" 가위", " 바위", " 보"};
		String str1 = "";
		System.out.print("가위(1), 바위(2), 보(3)를 입력하세요>>");
		int in = s.nextInt();
		if(in > 3 || in < 0) {
			System.out.println("잘못 입력 하셨습니다.");
		} else {
			int ran = (int)((Math.random()*3)+1);
			switch(in) {
				case 1 : str1 = (ran == 1) ? "동점" : (ran == 2) ? "패배" : "승리"; break;
				case 2 : str1 = (ran == 2) ? "동점" : (ran == 3) ? "패배" : "승리"; break;
				case 3 : str1 = (ran == 3) ? "동점" : (ran == 1) ? "패배" : "승리"; break;
			}
			System.out.println("사용자\tvs\t컴퓨터");
			System.out.println(arrStr[in-1]+"\tvs\t"+arrStr[ran-1]);
			System.out.println("======= "+str1+" =======");
		}
		System.out.println();
		System.out.println();
		
		// Ex10) 행복 반점
		System.out.println("Ex10)");
		ArrayList<Menu> menus = new ArrayList<Menu>();
		menus.add(new Menu("짜장면", 5000));
		menus.add(new Menu("짬뽕", 6000));
		menus.add(new Menu("탕수육", 12000));
		int tot = 0;

		System.out.println("# 어서 오세요 행복 반점 입니다. #");
		while(true) {
			System.out.println("# 메뉴");
			for(int i=0; i<menus.size(); i++)
				System.out.println((i+1)+". "+menus.get(i).name+"("+menus.get(i).price+"원)");
			System.out.print("# 주문 번호를 입력하세요(1~3) > ");
			int menuNum = s.nextInt();
			if(menuNum > 3 || menuNum < 1) {
				System.out.println("해당 메뉴가 없습니다.");
			} else {
				System.out.print("# 주문할 수량을 입력하세요(1~) > ");
				int cntNum = s.nextInt();
				if(cntNum < 1) {
					System.out.println("수량이 잘못 되었습니다.");
				} else {
					tot += (menus.get(menuNum-1).price*cntNum);
					System.out.println(menus.get(menuNum-1).name+"를 "+cntNum+"개 주문했습니다.");
					System.out.print("계속 주문하시겠습니까?(Y/N) > ");
					String inCmd = s.next();
					if(inCmd.equals("N")) break;
				}
			}
		}
		System.out.println("---------------");
		System.out.println("총비용은 "+tot+"원 입니다.");
		System.out.println();
		System.out.println();
		
		// Ex11) 
		System.out.println("Ex11)");
		Book book = new Book("어린왕자");
		book.buy(8000, 3);
		book.prn();
		System.out.println("총비용:"+book.tot());

	} // main end
}
// Ex5) 버스노선
class Bus {
	int number;
	String firstPoint;
	String lastPoint;
	
	public Bus(int number, String firstPoint, String lastPoint) {
		this.number = number;
		this.firstPoint = firstPoint;
		this.lastPoint = lastPoint;
	}
	void busInfo() {
		System.out.println(number+"번 버스 운행정보:"+firstPoint+"~"+lastPoint);
	}
}
// Ex6) 카드뽑기
class Card {
	String number;
	char shape;
	
	public Card(String number, char shape) {
		this.number = number;
		this.shape = shape;
	}

	void show() {
		System.out.print(shape+" "+number + "\t");
	}
}

// ex10) 행복반점
class Menu {
	String name;
	int price;

	public Menu(String name, int price) {
		this.name = name;
		this.price = price;
	}
}

// ex11) book
class Book {
	String name;
	int price;
	int cnt;
	
	public Book(String name) {
		this.name = name;
	}
	void buy(int price, int cnt) {
		this.price = price;
		this.cnt = cnt;
	}
	int tot() {
		return price * cnt;
	}
	void prn() {
		System.out.println("== 구매도서 ==");
		System.out.println("도서명:"+name);
		System.out.println("가격:"+price);
		System.out.println("갯수:"+cnt);
	}
}
