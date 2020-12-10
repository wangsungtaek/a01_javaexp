package a02_object.a03_method;

public class AutoSellingMachine {
	int totMoney;
	// 동전/지폐 slot에 의해서 입력처리 되는 메서드..
	void inputMony(int money) {
		this.totMoney += money;
		displayMoney();
	}
	
	void displayMoney() {
		System.out.println("현재 입력된 금액:"+totMoney);
	}
	void showMenu() {
		System.out.println("# 판매하는 음료");
		System.out.println("1. 콜라(1200)");
		System.out.println("2. 환타(1000)");
		System.out.println("3. 캔커피(800)");
	}
	String choiceButton(int ch) {
		int price=0;
		String retBev="";
		if(ch==1) {
			System.out.println("1번 콜라를 선택했습니다.");
			price = 1200;
			retBev="콜라";
		} else if(ch==2) {
			System.out.println("2번 환타를 선택했습니다.");
			price = 1000;
			retBev="환타";
		} else if(ch==3) {
			System.out.println("3번 캔커피를 선택했습니다.");
			price = 800;
			retBev="캔커피";
		} else {
			System.out.println("선택은 1~3번호만 가능합니다.");
		}
		if(price>0) {
			totMoney -= price;
			if(totMoney<0) {
				System.out.println("잔액이 부족합니다.");
				System.out.println("부족한 금액을 입금해주세요.");
				totMoney += price;
			} else {
				System.out.println("구매가 되었습니다.");
			}
		}
		return retBev;
	}
}
