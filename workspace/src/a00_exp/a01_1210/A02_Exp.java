package a00_exp.a01_1210;

/*
# 1:1 관련 연습예제.
1. 사람(이름, 주소, 핸드폰) vs 핸드폰(전화번호, 제조사)
	메서드 할당하는데까지 처리해서 출력해 주세요..

2. 컴퓨터(종류, 제조사, cpu) vs cpu(클럭속도, 제조사)
	메서드로 할당하고, CPU 장착 여부에 대한 처리..

3. Person(이름, Friend) VS Friend(이름, 좋은기억)
 */

class Human {
	String name;
	String address;
	Handphone handPhone;
	
	public Human(String name, String address) {
		this.name = name;
		this.address = address;
	}
	
	void myPhone(Handphone handPhone) {
		this.handPhone = handPhone;
	}
	
	void showInfo() {
		System.out.println("== "+name+"의 정보 ==");
		System.out.println("이름:"+name);
		System.out.println("주소:"+address);
		if(handPhone != null) {
			handPhone.phoneInfo();
		} else {
			System.out.println("핸드폰이 없습니다.");
		}
		System.out.println();
	}
}

class Handphone {
	String number;
	String making;
	
	public Handphone(String number, String making) {
		this.number = number;
		this.making = making;
	}
	
	void phoneInfo() {
		System.out.println("핸드폰 번호:"+number);
		System.out.println("핸드폰 제조사:"+making);
	}
} // ex1 end.

class Computer {
	String kind;
	String compnay;
	Cpu cpu;
	Ram ram;
	
	public Computer(String kind, String compnay) {
		this.kind = kind;
		this.compnay = compnay;
	}
	
	public void setCpu(Cpu cpu) {
		this.cpu = cpu;
	}
	public void setRam(Ram ram) {
		this.ram = ram;
	}

	void show() {
		System.out.println("컴퓨터의 종류:"+kind);
		System.out.println("제조사:"+compnay);
		if(cpu != null) {
			cpu.info();
		} else {
			System.out.println("CPU가 장착되지 않았습니다.");
		}
		if(ram != null) {
			ram.info();
		} else {
			System.out.println("RAM이 장착되지 않았습니다.");
		}
		System.out.println();
	}
} 
class Cpu {
	double clockSpeed;
	String compnay;

	public Cpu(double clockSpeed, String compnay) {
		this.clockSpeed = clockSpeed;
		this.compnay = compnay;
	}
	void info() {
		System.out.println("# CPU 정보 #");
		System.out.println("클럭속도:"+clockSpeed+"GHZ");
		System.out.println("제조사:"+compnay);
	}
}
class Ram {
	String compnay;
	int memory;

	public Ram(String compnay, int memory) {
		this.compnay = compnay;
		this.memory = memory;
	}

	void info() {
		System.out.println("# RAM 정보 #");
		System.out.println("메모리 용량:"+memory+"G");
		System.out.println("제조사:"+compnay);
	}
} // ex2 end.

class Person1 {
	String name;
	Freind freind;
	
	public Person1(String name) {
		this.name = name;
	}
	
	void myFreind(Freind freind) {
		this.freind = freind;
	}
	
	void showMemory() {
		System.out.println("== "+name+"의 친구 ==");
		
		if(freind != null) {
			freind.goodMemory();
		} else {
			System.out.println("친구가 없습니다..ㅠ");	
		}
		System.out.println();
	}
	
}
class Freind {
	String name;
	String memory;
	
	public Freind(String name, String memory) {
		this.name = name;
		this.memory = memory;
	}
	void goodMemory() {
		System.out.println("친구이름:"+name);
		System.out.println("좋은기억:"+memory);
	}
} // ex3 end

public class A02_Exp {
	public static void main(String[] args) {
		// ex1)
		System.out.println("ex1)");
		Human humanWang = new Human("왕성택","개신동");
		humanWang.showInfo();
		humanWang.handPhone = new Handphone("010-5555-3333","삼성");
		humanWang.showInfo();
	
		// ex2)
		System.out.println("ex2)");
		Computer c1 = new Computer("데스크탑","MAC");
		c1.show();
		c1.setCpu(new Cpu(3.6,"인텔"));
		c1.setRam(new Ram("삼성전자",16));
		c1.show();
		
		// ex3)
		System.out.println("ex3)");
		Person1 sungtaek = new Person1("왕성택");
		sungtaek.showMemory();
		sungtaek.myFreind(new Freind("이영진","미국여행"));
		sungtaek.showMemory();
	}
}
