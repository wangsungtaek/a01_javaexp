package a05_exception;

import java.io.IOException;
import java.io.InputStream;
import java.util.Scanner;

/*
# 예외(Exception) ?
1. 사용자의 잘못된 조작 또는 개발자의 잘못된 코딩으로 인한 오류로
	==> error나 예외

2. 에러가 발생하는 것에 대하여 자바에서 api로 정상작동으로 안정성을 확보하는 것을 의미하기도 한다.	
 	==> java내부에 있는 api로 에러나 오류를 보완하는 개념..
 	
3. 지비는 이러한 예외에 대하여, 예외를 처리함으로 프로그램의 안정성과 신뢰성을 확보하고자 한다.
	1) 기본 예외 처리 - 개발자의 코딩에 의한 예외 처리. 실행하는 순간 예외를 발생하는 경우..
		예외 발생 가능성이 있어, api에 있는 예외 클래스를 적용하여 처리.
	2) 필수 예외 처리 - 자바프로그램에서 너무나 자주 발생하는 내용이라 반드시 예외하지 않으면
		컴파일 자체가 되지 않게 처리해 놓은 것을 말한다.
		ex) IO(데이터 input/out가 일어나거나, 파일 전송, 네트웍을 통한 데이터 처리)
			기타 클래스 메모리 로딩 처리시 등등... 
		ex) InputStream
			
		
4. 예외 처리 기본 분석
	try {
		예외가 발생한 가능성 있는 코드(기본예외/필수예외)
		1.
		2. 예외가 발생하면 명시적으로 코딩을 하지 않더라도 catch문에 있는 매개 객체(Exception)를 던진다.
			던지는 순간, 이 다음 라인은 수행되지 않는다. throw 예외
		3. 생략
		4. 생략
	} catch(Exception e) {
		예외가 발생하면 매개변수에 의해 예외받어, Exception 하위에 있는 메서드로 처리하든지..
		예외가 발생했는 처리할 코드 기술..
		
	} finally {
		예외가 발생해도 처리해야할 코드.
		예외가 발생하지 않더라도 처리해야 할 코드.
	}

5. 예외 처리 코딩 프로세스.(사용자 정의 예외 처리 - 실행 시, 결과에 의해 발생하는 내용에 대한 예외처리)
	1) 코드 수행..
	2) 강제로 예외가 나올 수 밖에 없는 코드 기입.
		- 에러가 날 수 있는 코드 실행
	3) 에러에서 예외 Exception클래스를 copy
		- 실행에 의해서 나타난 에러 내용 카피
	4) 위에 기본 예외 처리 block으로 처리한다.
		try {
		
		} catch (){
		
		}
 */

public class A01_Exception {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		String s = sc.next();
		
		InputStream in = System.in;
//		in.read(); // 예외처리 하지 않으면 컴파일 에러발생..
		try {
			in.read(); // Stream 에 의해 입력을 처리하는 메서드 호출,.. IO발생(필수예외처리)
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try {
			System.out.println("수행1");
			System.out.println("수행2");
			System.out.println("수행:"+1/0);
			System.out.println("수행3");
			System.out.println("수행4");
			System.out.println("수행5");
		} catch(ArithmeticException ae) {
			System.out.println("예외발생..");
		} finally {
			System.out.println("예외상관 없이 수행할 내용..");
		}
		System.out.println("수행4");
		System.out.println("수행5");
			
		// ex) 아래 내용으로 예외를 확인하고, try,catch문으로 예외를 처리하세요.
		try {
			String name = null;
			System.out.println("수행6");
			System.out.println(name.toString());
			System.out.println("수행7");
		} catch(NullPointerException e) {
			System.out.println(e);
		} finally {
			System.out.println("예외상관 없이 수행할 내용..");
		}

	}
}
