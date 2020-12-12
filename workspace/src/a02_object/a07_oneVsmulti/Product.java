package a02_object.a07_oneVsmulti;

public class Product {
	// 1. field명 일반적으로 접근 제어자가 private;
	private String name;
	private int price;
	private int cnt;
	
	// 2. 생성자는 외부에서 사용하지 때문에 public을 사용된다.
	public Product(String name, int price, int cnt) {
		this.name = name;
		this.price = price;
		this.cnt = cnt;
	}
	// 3. 각각의 field에 입력할 데이터 setXXX,
	//	각각의 field에 있는 데이터를 가져오는 getXXX로 설정처리한다.
	// 	간접적으로 필드에 있은 데이터를 저장하고, 호출하는 메서드를 
	//	구현하고, 각 메서드의 접근제어자 public이기 때문에
	//	외부 패키지에서도 접근할 수 있다.
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
}
