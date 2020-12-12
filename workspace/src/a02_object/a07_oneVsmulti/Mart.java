package a02_object.a07_oneVsmulti;

import java.util.*;

public class Mart {
	private String name;
	// 1:다중의 데이터를 설정하는 방법..
	// 1) 배열로 설정.'
	private Product[] pArray;
	// 2) AttayList<객체> list
	private ArrayList<Product> plist;
	
	public Mart(String name) {
		super();
		this.name = name;
	}
	public Product[] getpArray() {
		return pArray;
	}

	public void setpArray(Product[] pArray) {
		this.pArray = pArray;
	}

	public ArrayList<Product> getPlist() {
		return plist;
	}

	public void setPlist(ArrayList<Product> plist) {
		this.plist = plist;
	}
	public void buyList() {
		System.out.println("# "+name+" 마트에서 구매한 물건 #");
		int tot = 0;
		if(plist!=null) {
			for(Product p : plist) {
				System.out.print(p.getName()+"\t");
				System.out.print(p.getPrice()+"\t");
				System.out.print(p.getCnt()+"\t");
				tot += p.getPrice() * p.getCnt();
				System.out.println();
			}
			System.out.println("총비용:"+tot);
		} else {
			System.out.println("구매 물건이 없습니다.");
		}
	}
	public void buyArray() {
		System.out.println("# "+name+" 마트에서 구매한 물건 #");
		if(pArray!=null) {
			for(Product p : pArray) {
				System.out.print(p.getName()+"\t");
				System.out.print(p.getPrice()+"\t");
				System.out.print(p.getCnt()+"\t");
			}
		}
	}
}
