package a00_exp.a06_1218;

public class Ex6 {
/*
6. 접근제어자의 종류와 범위를 기술하되, default, protected에 관련하여
	기본 예제를 만들어 보세요.
	
	private : 클래스 내부에서만 사용.
	default(x) : 접근제어자를 붙이지 않을 때, 같은 패키지까지 접근이 가능.
	protected : 상속관계에 있을 때만, 외부패키지 클래스에서 호출 가능.
	public : 외부 패키지의 모든 클래스에서 접근이 가능.
	
	private < default < protected < public
	범위가 넓어지는 것이기때문에 넓은 범위에 있는 내용은 전체적으로 포괄하고 있다.
	패키지1 : WoodCutter, Son2, Daughter, Angel
	패키지2 : Son1(WoodCutter를 상속), Son1Wife
	WoodCutter의 default 접근 제어자가 붙은 String homeEvent="가족저녁외식";
	외부 패키지에 있는 Son1과, Son1Wife는 접근하여 호출 할 수 없고,
	WoodCutter의 protected 접근 제어자 붙은 protected String inherit="상속재산유언장";
	같은 패키지에 있는 모든 클래스(Son2, Daughter, Angel) 뿐만 아니라,
	외부 패키지 상속관계 있는 클래스(Son1)까지 접근이 가능하다.
	단, 상속관계 없는 외부 패키지 클래스 Son1Wife는 접근이 불가능하다.
 */
}
