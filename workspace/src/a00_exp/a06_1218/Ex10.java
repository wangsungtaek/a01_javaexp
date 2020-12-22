package a00_exp.a06_1218;

import java.util.Scanner;

/*
10. 사용자 정의 예외를 구성하되, Scanner으로 입력한 값이 id, pass가 맞지
	않을 때, 정의된 예외 클래스를 통해서 처리되는 프로그램을 구현하세요.
*/
public class Ex10 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		try {
			System.out.println("아이디를 입력하세요.");
			String id = sc.nextLine();
			System.out.println("패스워드를 입력하세요.");
			String pass = sc.nextLine();
			if(!(id.equals("himan") && pass.equals("7777"))) {
				throw new MemValException(id+"는 인증되지 못했습니다.");
			}
		} catch(MemValException e) {
			System.out.println("인증 오류:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("기타 예외:"+e.getMessage());
		}
	}
}
class MemValException extends Exception{
	MemValException(String msg){
		super(msg);
	}
}