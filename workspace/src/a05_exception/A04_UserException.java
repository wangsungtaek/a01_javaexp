package a05_exception;
/*
# 사용자 정의 예외 처리..
1. 자바의 표준 API에서 제공하지 않는 개발자가 새로 정의하여 만든 예외를 말한다.
2. 개발자에 의해 정의된 애플리케이션 서비스와 관련된 예외를 처리한다.
3. 기본형식
	1) 클래스를 통해서 사용자 정의 예외 선언
		Exception 클래스를 상속하여 처리한다..
		class 사용자정의 클래스 extends Exception {
			생성자명(){}
			생성자명(String msg) { // 매개변수로 받은 문자열의
			// 예외 클래스의 생성자의 매개변수로 넘김..
			 	super(msg); 	// Exception의 생성자 매개변수
			}
			public String getMessage() {
				return super.getMessage()+"[사용자 정의 메서드 재정의]";
			}
			// 추가할 메서드 선언..
		}
	2) 사용자 정의 예외 클래스 호출.
		예외를 처리할 내용을...
		try {
			if(조건){
				throw new 사용자정의 예외 생성자(매개데이터);
			}
		} catch(사용자정의 예외 클래스 e) {
			System.out.println("사용자 정의 예외 발생");
			System.out.println(e.getMessage());
			System.out.println(e.선언한기능메서드());
			
		}
 */
public class A04_UserException {
	public static void main(String[] args) {
		try {
			for(int cnt=1; cnt<10; cnt++) {
				if(cnt==5) {
					// 생성의 매개변수로 전달한 메시지는 getMessage()를 통해서 가져올 수 있다.
					throw new UserException("숫자 5일때 예외발생!!");
				}
				System.out.println("카운트:"+cnt);
			}
		} catch(UserException e) {
			System.out.println(e.getMessage());
			e.call();
		}
		System.out.println();

		for(int cnt=1; cnt<10; cnt++) {
			System.out.println("카운트:"+cnt);
			try {
				if(cnt%2 == 0) {
					throw new UserException2("짝수일때 예외발생!");
				}
			} catch(UserException2 e) {
				System.out.println(e.getMessage());
				e.call2();
			}
		}
// ex) UserException2로 사용자 정의 예외를 만들고,
//		생성자 매개변수로 문자열을 전달,
//		getMessage() Overoding 으로 "사용자정의2" 추가 처리..
//		추가메서드 call2()로 출력물표기..
//		main()에서 반복을 통해서 짝수일때, 해당 내용 호출 처리..
	}
}
class UserException2 extends Exception {
	public UserException2(String msg){
		super(msg);
	}

	@Override
	public String getMessage() {
		return "[사용자정의2]"+super.getMessage();
	}
	public void call2() {
		System.out.println("두번째 예외클래스입니다.");
	}
}


// 1. 사용자 정의 선언.
//		1) Exception클래스를 상속한다.
class UserException extends Exception {
//		2) 사용하게 될 생성자를 선언한다.
	public UserException(){
		//매개변수가 없는 생성자..
		super("기본예외(사용자정의)");
	}
	public UserException(String msg) {
		super(msg);
	}
//		3) 메서드 재정의
	@Override
	public String getMessage() {
		return "[사용자 정의 예외]"+super.getMessage();
	}
//		4) 사용자 정의 메서드 추가..
	public void call() {
		System.out.println("사용자 정의 처리 추가 메서드입니다!!");
	}
}