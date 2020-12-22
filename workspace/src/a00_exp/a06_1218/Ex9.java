package a00_exp.a06_1218;

public class Ex9 {
/*
9. 예외 처리에서 런타임시 예외와 필수 예외를 처리하는 방법을 기본예제를 통해서 설명하세요.
	1) 런타임 예외는 실행시 발생하는 예외 ex) 객체를 생성하지 않고, 멤버 사용,
		배열이 없는데 호출, /0으로 처리될 때 에러...
	2) 필수 예외는 컴파일 전에 발생하는 예외 : java에서 api로 반드시 처리해야지
		컴파일을 정상적으로 처리할 수 있는 예외 ex) 파일 접근, io 발생..
		네트워크 처리 등이 있다.
	필수 예외는 tool(eclipse)등을 통해서, try{}catch 블럭이 생성된다.
	런타임 예외 일단 예외가 발생하는 코드를 입력하여, 실행 후, 예외 내용을 확인 후,
		그 예외를 catch 블럭의 매개변수로 처리한다.
		- 1단계
		String s = null;
		System.out.println(s.toString());
		- 2단계 : 수행 후, 예외 내용 확인.
		try{
			String s = null;
			System.out.println(s.toString());
		} catch(NullpointerException e) {
			System.out.println("예외발생:"+e.getMessage());
		}
*/
}
