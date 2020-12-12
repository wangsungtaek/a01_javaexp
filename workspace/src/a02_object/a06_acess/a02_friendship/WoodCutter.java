package a02_object.a06_acess.a02_friendship;

public class WoodCutter {
	// 접근제어자 ?? 변수명 cacheDeer;
	// 접근제어자 ?? 변수명 cacheClother;
	// 접근제어자 ?? 변수명 weddingDate;
	// 다른 외부 클래스에서 호출 가능한지 여부를 확인..
	
	String cacheDeer = "숲속에 사슴을 숨김";
	// default 접근제어자..
	private String caceheDeers = "천사옷을 뒷동산 바위 밑에 숨김.";
	// 다른어떤 클래스에서도 접근이 불가능..
	public String weddingDate = "선녀와 대보름날에 결혼을 함!!";
	// 모든 클래스에서 접근이 가능함..
}
