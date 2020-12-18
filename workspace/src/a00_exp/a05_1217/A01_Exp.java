package a00_exp.a05_1217;

/*
1. 예외 퍼리의 기본 형식을 기술하고, String 문자열이 null일때,
 	발생할 예외를 코드화하여 처리하세요.
-> try {

	} catch() {
	
	}
2. 반복문을 통해서 10에서 나누어 5부터 5시작하여 -5까지씩 처리 결과를
	출력하되, /0으로 나눌때, 정상적으로 작동하도록 예외 처리를 하여,
	출력하세요
	ex) 10/5, 10/4, 10/3 .... 10/0 .... 10/5
	
3. 예외의 계층 구조화의 목적을 기술하세요.
4. 예외 처리에서 throw, throws 키워드를 사용할 때, 차이점을 기술하세요.
5. 사용자 정의 예외의 멤버별 특징을 기술하세요..
	생성자의 매개값이 getmessage와 연동 되어 있다든가,
	overriding을 하는 메서드가 주로 어떤 것인지,
	추가 메서드를 통해서 하는 내용.
	그리, 이렇게 정의한 사용자 정의 클래스를 통해서 예외 처리될 때,
	각 멤버별로 어떻게 처리되는지를 설명하면 됨
	
6. 1에서 20까지 처리되는 내용에 있어서 3의 배수마다 사용자 정의 예외를
	발생하게 한다. (ExceptionTriple을 선언하여 재정의(getMessage)와 추가메서드를
	처리하여 출력하도록 히세여.)
7. eclipse를 통한 웹서버 구축과정을 기술하고, 각 단계별로 주의 사항을 설명하도록 하세요.
8. javaexp10 프로젝트를 만들고, Webcontent및 show.html과 show.jsp를 통해
	화면을 구현하고, port번호 3030으로 지정하여 웹서버와 연동하여
	출력한 화면과 서버구축 내용을 캡처하여 전송하세요.
	
 */
public class A01_Exp {
	public static void main(String[] args) {
		
		// Ex1) String null 예외 처리
		System.out.println("Ex1)");
		String s = null;
		try {
			System.out.println(s.toString());
		} catch(NullPointerException e) {
			System.out.println(e.getMessage());
			System.out.println("예외 처리됨");
		}
		System.out.println();
		System.out.println();
		
		// Ex2) 나누기 예외 처리
		System.out.println("Ex2)");
		for(int cnt=5; cnt>=-5; cnt--) {
			try {
				System.out.println("10 나누기 "+cnt+" = "+10/cnt);
			} catch(ArithmeticException e) {
				System.out.println("0으로 나눌 수 없음.");
			}
		}
		System.out.println();
		System.out.println();
		// Ex3) 예외의 계층 구조의 목적
		// 최하위예외 -> 하위 -> 상위 형식으로 예외를 처리해야 정확히 어떤 예외가
		// 발생하였는지 알 수 있게 때문에 계층 구조로 작성해야 한다.
		// 만약 예상하지 못한 예외가 발생했을때를 대비하여 최상위 예외인 Exception을
		// 계층구조 맨 아래에 위치 시킨다.
		
		// Ex4) throws 와 throw 차이점
		// thorws : 예외가 발생하면, 이 예외를 호출한 메서드에서 처리할 수 있도록 
		//			위임하는 것을 말한다. 만약 각기 다른 메서드에서 같은 예외가
		//			발생한다면 이를 모아서 호출한 메서드에서 try/catch를 사용
		//			하여 예외를 한번에 처리할 수 있는 효과를 볼 수 있다.
		// throw : 사용자 정의로 만든 예외를 발생시킬때 사용된다.

		// Ex4) 사용자 정의 예외의 멤버별 특징을 기술
		// 생성자를 통해 메세지를 전달(매개변수를 통해)하면 getMessge()메서드를 통해
		// 메세지를 전달 받을 수 있다.
		// getMessage() 메서드를 오버라이딩하여 시용자가 원하는 메세지를 전달할 수 있다.

		// Ex6) 3의 배수 예외 처리
		System.out.println("Ex6)");
		for(int cnt=1; cnt<=20; cnt++) {
			try {
				if(cnt%3 == 0) {
					throw new ExceptionTriple("3의 배수");
				}
				System.out.println("cnt:"+cnt);
			} catch(ExceptionTriple e) {
				System.out.println(e.getMessage());
				e.call();
			}
		}
		System.out.println();
		System.out.println();
		
		// Ex7) 이클립스를 통한 웹서버 구축과정
		// 1. 구글에 톰캣 사이트를 검색해서 다운로드를 한다.
		// 2. 다운로드된 zip파일을 압축풀어 해당파일을 원하는 디렉토리에 위치 시킨다.
		// 3. 이클립스에서 server 항목을 추가한다 이 과정에서 다운받은 톰캣 버전을 선택한다.
		// 4. 톰캣의 포트를 변경한다. (데이터베이스 서버외 충돌날 수 있기 때문에 (7005/7080으로 변경)
		// 5. 서버를 실행하고, index.html파일을 실행 시킨다.
		
	} // main end
}

class ExceptionTriple extends Exception { // Ex6
	public ExceptionTriple() {
		super("사용자 예외");
	}
	public ExceptionTriple(String msg) {
		super(msg);
	}
	@Override
	public String getMessage() {
		return "[사용자 예외 발생]"+super.getMessage();
	}
	public void call() {
		System.out.println("사용자 정의 메서드입니다.");
	}
}