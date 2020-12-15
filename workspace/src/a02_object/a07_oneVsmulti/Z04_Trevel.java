package a02_object.a07_oneVsmulti;

import java.util.ArrayList;

/*
ex) 1:다 관계의 내용을 아래의 구조로 처리하세요..
	Travel : 필드 - 여행타이틀(여름휴가/취업여행/...),
					ArrayList<Location>
			 메서드 - 여행지 객체 추가 메서드
			 		전체 여행일정 리스트 메서드
	Location(여행지) - 위치, 수단(배, 비행기, 차량), 기간
 */
public class Z04_Trevel {
	public static void main(String[] args) {
		Travel t = new Travel("취업여행");
		t.addLocation(new Location("동남아","비행기","8월"));
		t.showPlan();
	}
}

class Travel {
	private String title;
	private ArrayList<Location> locations;
	
	public Travel(String title) {
		this.title = title;
		locations = new ArrayList<>();
	}
	
	public void addLocation(Location location) {
		locations.add(location);
	}
	public void showPlan() {
		System.out.println(title);
		System.out.println("여행지\t이동수단\t기간");
		for(Location l : locations) {
			l.showLocation();
		}
	}
	
}


class Location {
	private String location;
	private String transport;
	private String period;
	
	public Location(String location, String transport, String period) {
		this.location = location;
		this.transport = transport;
		this.period = period;
	}
	
	public void showLocation() {
		System.out.println(location+"\t"+transport+"\t"+period);
	}
}