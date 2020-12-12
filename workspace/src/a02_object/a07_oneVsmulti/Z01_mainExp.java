package a02_object.a07_oneVsmulti;

import java.util.ArrayList;

/*
# 1:다 관계의 객체처리.
1. 생각해봅시다.
	1) 현실에서 1:다관계가 어떤 것이 있을까?
		ex) 버스안에 승객,물건을 구매할 때, 컴퓨터의 구성요소로 여러개으 부품들, 한 반에 여러명의 학생들..
		
	2) 웹프로그래밍에서 치리해야할 1:다관계 어떤 것이 있을까?
		ex) 쇼핑물 웹사이트에서 로그인한 사용자가 여러 개의 물건을 구매할 때,
			영화 예약시스템에서 하나의 상영관에 여러명의 고객이 좌석표를 구매할 때,
			온라인상 기차표 구매시, 하나의 열차에 여러명의 사용자가 티켓을 구매..
			
2. 자바에서 1:다관계의 프로그래밍.
	1) 자바의 객체로 다른 여러개의 객체와 종류는 같지만 여러 리스트형 객체의 처리가
		위의 예제와 같이 필요로 하는 것을 볼 수 있다.
	2) 유형 분류..
		- 하나의 객체 안에 다른 종류의 여러 객체 할당..
			컴퓨터라는 객체 안에 cpu, ram, hdd...
			자동차라는 객체 안에 엔젠, 바퀴, 핸들, 디스프레이...
		- 하나의 객체 안에 각종 종류의 리스형 객체 할당..
			기차예매 시스템에 열차 시간표라는 리스트..
			게시판 게시물 리스트.
			마트에서 구매하는 물품리스트..
 */
public class Z01_mainExp {
	public static void main(String[] args) {
		Mart m1 = new Mart("행복마트");
		m1.buyList();
		ArrayList<Product> plist = new ArrayList<Product>();
		plist.add(new Product("사과",3000,2));
		plist.add(new Product("바나나",4000,2));
		plist.add(new Product("딸기",12000,4));
		m1.setPlist(plist);
		m1.buyList();
	}
}
