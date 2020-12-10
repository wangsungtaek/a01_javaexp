package a02_object.a03_method;

public class Mart {
	
	void showProduct() {
		System.out.println("== 판매물품 ==");
		System.out.println("1. 컵라면");
		System.out.println("2. 음료");
		System.out.println("3. 제과");
	}
	String buy(int choice) {
		switch(choice) {
			case 1 : 
				return "컵라면";
			case 2 :
				return "음료수";
			case 3 :
				return "제과";
			default :
				System.out.println("해당 제품이 없습니다.");
				return " ";
		}
	}
}
