package a02_object.a05_oneVsone;

public class A05_Product {
	String name;
	int price;
	int cnt;
	
	public A05_Product(String name, int price, int cnt) {
		this.name = name;
		this.price = price;
		this.cnt = cnt;
	}
	
	void showProdInfo() {
		System.out.println("# 물건 정보 #");
		System.out.println("물건명:"+name);
		System.out.println("가격:"+price);
		System.out.println("갯수:"+cnt);
	}
}
