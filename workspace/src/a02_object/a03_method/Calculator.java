package a02_object.a03_method;

public class Calculator {
	
	int plus(int num01, int num02) {
		System.out.println(" plus 메서드 호출 ");
		return num01 + num02;
	}
	
	int minus(int num01, int num02) {
		System.out.println(" minus 메서드 호출 ");
		return num01 - num02;
	}
	
	int multi(int num01, int num02) {
		System.out.println(" multi 메서드 호출 ");
		return num01 * num02;
	}
	double divide(int num01, int num02) {
		System.out.println(" divide 메서드 호출 ");
		return num01 / (double)num02;
	}
}
