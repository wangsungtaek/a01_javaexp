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
	String making;
	Cpu cpu;
	
	public Computer(String kind, String making) {
		this.kind = kind;
		this.making = making;
	}
	
	void mountCpu(Cpu cpu) {
		this.cpu = cpu;
	}
	
	void computerStatus() {
		System.out.println("이 "+kind+"는 "+making+"에서 만들었습니다.");
		if(cpu != null) {
			System.out.println("== cpu 장착 ==");
			cpu.cpuInfo();
		} else {
			System.out.println("cpu가 존재하지 않습니다.");
		}
		System.out.println();
	}
} 
class Cpu {
	String clockSpeed;
	String making;

	public Cpu(String clockSpeed, String making) {
		this.clockSpeed = clockSpeed;
		this.making = making;
	}
	void cpuInfo() {
		System.out.println("cpu 클럭속도:"+clockSpeed);
		System.out.println("cpu 제조사:"+making);
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
		Computer computer = new Computer("노트북","Apple");
		computer.computerStatus();
		computer.mountCpu(new Cpu("1.4GHz","Apple"));
		computer.computerStatus();
	
		// ex3)
		System.out.println("ex3)");
		Person1 sungtaek = new Person1("왕성택");
		sungtaek.showMemory();
		sungtaek.myFreind(new Freind("이영진","미국여행"));
		sungtaek.showMemory();
	}
}
