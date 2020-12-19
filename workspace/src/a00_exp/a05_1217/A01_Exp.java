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
		// 1. 실행 예외일 경우, 실행할 내용을 coding하여 실행 후,
		//		예외 내용을 확인한다.
		System.out.println("Ex1)");
		String s = null;
		try {
			System.out.println(s.toString());
		// 2. 예외 내용을 catch 매개변수로 설정한다.
		} catch(NullPointerException e) {
		// 3. 예외 발생시, 처리할 코드를 기술한다.
			System.out.println("# 데이터에 입력값이 NULL입니다. #");
			System.out.println("예외 내용:"+e.getMessage());
		// 4. 그 외의 예외에 대한 선언..
		} catch(Exception e) {
			System.out.println("# 기타 예외 발생 #");
			System.out.println("예외 내용:"+e.getMessage());
		// 5. finally{} 블럭에 예외 상관 없이 처리할 코드를 입력한다.
		} finally {
			System.out.println("예외 상관 없이 처리할 코드");
		}
		System.out.println();
		System.out.println();
		
		// Ex2) 나누기 예외 처리
		System.out.println("Ex2)");
		for(int cnt=5; cnt>=-5; cnt--) {
			try {
				System.out.println("10 나누기 "+cnt+" = "+10/cnt);
			} catch(ArithmeticException e) {
				System.out.println("# 수학적 계산 관련 예외 발샹 #");
				System.out.println("0으로 나눌 수 없음.");
				System.out.println("예외:"+e.getMessage());
			} catch(Exception e) {
				System.out.println("# 기타 예외 발생 #");
				System.out.println("예와:"+e.getMessage());
			} finally {
				// 예외 발생 여부와 관계 없이 수행할 내용이 있으면 코딩..
			}
		}
		System.out.println();
		System.out.println();
		
		// Ex3) 예외의 계층 구조의 목적
		// 최하위예외 -> 하위 -> 상위 형식으로 예외를 처리해야 정확히 어떤 예외가
		// 발생하였는지 알 수 있게 때문에 계층 구조로 작성해야 한다.
		// 만약 예상하지 못한 예외가 발생했을때를 대비하여 최상위 예외인 Exception을
		// 계층구조 맨 아래에 위치 시킨다.
		// 예외도 처리시, 메모리를 효과적으로 사용할려고 한다.
		// 상속관계에서 최상에 있는 예외가 가장 넓은 범위를 수행하여 메모리를 할당한다.
		// 이렇게 되면 최하위에 있는 예외를 먼저 처리하고, 그 예외로 안 잡히면 상위계층에
		// 있는 예외를 잡는 것이 효과적이다.
		// 그래서, 아래의 형식으로 예외를 처리하고 있다.
		// try {
		//
		// } catch(최하위예외) {
		// } catch(중간계층예외) {
		// } catch(최상위예외) {
		// }
		
		
		// Ex4) throws 와 throw 차이점
		// throws : 예외가 발생하면, 이 예외를 호출한 메서드에서 처리할 수 있도록 
		//			위임하는 것을 말한다. 만약 각기 다른 메서드에서 같은 예외가
		//			발생한다면 이를 모아서 호출한 메서드에서 try/catch를 사용
		//			하여 예외를 한번에 처리할 수 있는 효과를 볼 수 있다.
		// throw : 사용자 정의로 만든 예외를 발생시킬때 사용된다.

		// throw는 강제 예외를 처리할 때, 주로 사용되는 구문으로 throw new 예외객체();
		// 로 활용된다. 특정한 조건인 경우에 명시적으로 예외를 던져, catch블럭의 매개변수로
		// 예외객체를 받아 처리하게 한다.
		// throws : 메서드 단위로 예외를 위임하여, 위임한 곳에서 한꺼번에 예외를 처리할 때,
		// 사용하는 keyword로	메서드명() throws 예외클래스1, 예외클래스2..의 형식으로
		// 사용된다.
		
		
		// Ex5) 사용자 정의 예외의 멤버별 특징을 기술
		// 생성자를 통해 메세지를 전달(매개변수를 통해)하면 getMessge()메서드를 통해
		// 메세지를 전달 받을 수 있다.
		// getMessage() 메서드를 오버라이딩하여 시용자가 원하는 메세지를 전달할 수 있다.

		// class 사용정의예외 extends Exception {
		// 		private 필드.. : 사용자 정의에서 사용할 필드 선언
		//		public 사용자정의예외생성자(매개변수) {
		//			super(매개변수); // super(매개변수)는 Exception 클래스의
		//			매개변수가 있는 생성자를 호출하고, 여기에 전달된 문자열은
		//			Exception 클래스 하위에 있는 getMessage()의 리턴값으로
		//			활용된다.
		//		}
		// 		// Exception 클래스의 getMessage() 오버라이딩.
		//		// 재정의 하여, 추가할 내용 처리..
		//		public String getMessage() {
		//			//	super.getMessage() : 상위 Exception의 해당 메서드 사용..
		//			return "[사용자 정의 예외]"+super.getMessage();
		//		}
		//		// 사용자 정의 메서드에서 추가할 메서드 선언.
		//		public void showInfo() {
		//			System.out.printLn("예외의 발생 ~~ 추가 메서드 구현..");
		//		}
		// }
		
		// Ex6) 3의 배수 예외 처리
		System.out.println("Ex6)");
		for(int cnt=1; cnt<=20; cnt++) {
			try {
				System.out.println("cnt:"+cnt);
				if(cnt%3 == 0) {
					throw new ExceptionTriple("3의 배수");
				}
			} catch(ExceptionTriple e) {
				// 재정의한 메서드 호출.
				System.out.println(e.getMessage());
				// 추가 정의한 메서드 호출..
				e.call();
			} catch(Exception e) {
				System.out.println("기타 예외:"+e.getMessage());
			} finally {}
		}
		System.out.println();
		System.out.println();
		
		// Ex7) 이클립스를 통한 웹서버 구축과정
		// 1. 구글에 톰캣 사이트를 검색해서 다운로드를 한다.
		// 2. 다운로드된 zip파일을 압축풀어 해당파일을 원하는 디렉토리에 위치 시킨다.
		// 3. 이클립스에서 server 항목을 추가한다 이 과정에서 다운받은 톰캣 버전을 선택한다.
		// 4. 톰캣의 포트를 변경한다. (데이터베이스 서버외 충돌날 수 있기 때문에 (7005/7080으로 변경)
		// 5. 서버를 실행하고, index.html파일을 실행 시킨다.
		
		// 1) 웹 어플리케이션 서버 다운로드
		//		tomcat download
		// 2) 버전확인 다운로드 압축해제...
		// 3) eclipe 하단 servers 메뉴를 통해서 해당 다운된 버젼 tomcat 설정과
		//		위치 지정.
		// 4) eclipse Dynamic Web 프로젝트 생성..
		// 5) 프로젝트와 tomcat 연동
		// 6) tomcat port의 변경
		// 7) web프로젝트 하위 폴드에 WebContent 폴드에 index.html 이나,
		//		index.jsp 등 웹관련 파일 생성..
		// 8) tomcat 시작 해당 파일을 통해 실행 처리..
		
	} // main end
}

class ExceptionTriple extends Exception { // Ex6
	private int num;
	public ExceptionTriple() {
		super("사용자 예외"); // 기본 예외 내용
	}
	public ExceptionTriple(String msg) {
		super(msg); // 지정한 메시지로 예외 처리.
	}
	public ExceptionTriple(String msg, int num) {
		super(msg); // 지정한 메시지로 예외 처리.
		this.num = num;
	}
	@Override
	public String getMessage() {
		return "[사용자 정의 3의 배수 예외]"+super.getMessage();
	}
	// 추가 메서드 정의
	public void call() {
		System.out.println("3의 배수 메서드 처리 - 번호"+num+" 의 예외 발생~~");
	}
}