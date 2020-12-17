package a05_exception;
/*
# 예외의 계층 구조.
1. 예외는 Exception을 상위로 하여, 상속받는 하위의 여러가지 예외 클래스로
	계층구조화 될 수 있다.
2. 이런 계층 구조화된 예외는
	try{
	}catch(최하위 예외){
	}catch(하위 예외){
	}catch(상위 예외){
	} // 형식으로 계층화된 예외를 처리하여야 한다.
 */

public class A02_Hierarchy {
	public static void main(String[] args) {
		System.out.println("# 입력한 과일 #");
		try {
			for(int idx=0; idx<3; idx++) {
				System.out.println(idx+1+"번째 과일:"+args[idx]);
			}
		} catch(ArrayIndexOutOfBoundsException e) {
			System.out.println("예외 처리1:"+ e.getMessage());
		} catch(Exception e) {
			System.out.println("예외 처리2:"+ e.getMessage());
		} finally {
			System.out.println("예외 상관 없이 처리할 내용.!!");
		}
	}
}
