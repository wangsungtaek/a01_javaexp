package a02_object.a05_oneVsone;
/*
# 객체를 메서드의 매개변수로 할당하여 사용하기..
1. 클래스내에 객체나 변수 일반적으로 보안적인 문제와 코드 안정성때문에
	접근제어자를 이용하여 접근이 가능한 방법(메서드)으로만 처리를 한다.

2. 객체는 일반적으로 메서드의 매개변수로 할당을 한다.

3. 형식
	1) 클래스 선언..
	2) 메서드의 매개변수를 통해서 할당 처리..
		class Robot {
			String kind;
			Weapon wp;
			void setWeapon(Weapon wp){
				this.wp = wp;
			}
			void setKind(String kind){
				this.kind = kind;
			{
		}
		class Weapon {
			String name;
			int attackPt;
		}
 	main()
 		Robot rb1 = new Robot("MZ");
 		rb1.wp = new Weapon("로켓포",80);
 			// 바로 할당하는 것보다는 메서드를 통해서 할당하고,
 			// 기능 메서드를 통해서 호출한다.
 		rb1.setWeapon(new Weapon("레이져빔",95);
 		rb1.setKind("다간");
 */	
public class Z02_MainExp {
	public static void main(String[] args) {
		A09_Robot robot = new A09_Robot("다간");
		robot.attack();
		System.out.println();
		robot.setWeapon(new A10_Weapon("레이져빔",95));
		robot.setWeapon(new A10_Weapon("로켓포",80));
		
		robot.attack();
		System.out.println();
	}
}
