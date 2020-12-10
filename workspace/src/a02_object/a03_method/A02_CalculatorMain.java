package a02_object.a03_method;

public class A02_CalculatorMain {
	public static void main(String[] args) {
		// ex2) Calculator 클래스를 선언하고, 생성자에 의해 2개의 값을 받아
		// plus, minus, duplix, divide 메서드를 통해 리턴하여 처리하세요.
		// ~ 35
		System.out.println("ex2)");
		Calculator cal = new Calculator();
		System.out.println(cal.plus(5,5));
		System.out.println(cal.minus(10,5));
		System.out.println(cal.multi(5,5));
		System.out.println(cal.divide(10,2));
	}
}
