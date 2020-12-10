package a02_object.a03_method;

public class A03_AutoSellingMain {
	public static void main(String[] args) {
		AutoSellingMachine am = new AutoSellingMachine();
		am.inputMony(1000);
		am.inputMony(500);
		am.inputMony(1000);
		am.showMenu();
		String bev = am.choiceButton(2);
		System.out.println("자판기를 통해 나온 음료:"+bev);
		System.out.println("자판기를 통해 나온 음료:"+am.choiceButton(3));
		System.out.println();
		
		
		System.out.println("ex) Mart class");
		Mart m1 = new Mart();
		System.out.println("선택된 메뉴:"+m1.buy(1));
		System.out.println("선택된 메뉴:"+m1.buy(2));
		System.out.println("선택된 메뉴:"+m1.buy(3));
		System.out.println("선택된 메뉴:"+m1.buy(5));
	}
}
