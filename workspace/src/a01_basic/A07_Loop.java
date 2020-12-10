package a01_basic;

import java.util.Scanner;

public class A07_Loop {
	public static void main(String[] args) {
/*
# 반복문
1. 반복적인 처리를 위한 사용되는 구문을 말한다.
2. 종류
	1) for(초기값설정;반복조건;증감연산자){
			반복할 코드 : 선언한 연산자와 함께 증가/감소하는 처리를 하는 반복문..
		}
	2) 반복문에 사용되는 키워드.
		break; continue; 조건문과 함께 반복처리를 효과적으로 해준다.
		break 문 : 반복을 중단시켜준다.
		continue 문 : 해당 단위 프로세스만 반복을 수행을 중지했다가 다음 프로세스에서는
			반복 수행을 계속해 주는 처리를 한다.
*/
		System.out.println("# 1부터 10까지 반복 #");
		for(int cnt=1;cnt<10;cnt++) {
			System.out.print(" 카운트!! " + cnt);
		}
		System.out.println();
		
		// break문 사용 5일때, 중단 처리.
		System.out.println("# break문 사용 #");
		for(int cnt=1;cnt<10;cnt++) {
			if(cnt == 5) {
				break;
			}
			System.out.print(" 카운트!! " + cnt);
		}
		System.out.println();
		System.out.println();
		// ex1) break연습 1에서부터 2씩 증가하면서 100까지 출력하되, 1~100중에 임의의
		// 숫자에서 중단 처리되게 하세요.. 중단합니다. 표시
		int num01 = (int)(Math.random()*100+1);
		System.out.println("ex1) num01 : "+num01);
		for(int cnt=1;cnt<=100;cnt+=2) {
			if(cnt == num01) {
				System.out.println("중단합니다.!!");
				break;
			}
			System.out.print(cnt + ",");
		}
		System.out.println();
		
		// continue 문 사용 5일때만, 중단하고 계속 수행 처리
		System.out.println("# continue문 사용 #");
		for(int cnt=1;cnt<10;cnt++) {
			if(cnt == 5) {
				continue;
			}
			System.out.print(" 카운트!! " + cnt);
		}
		System.out.println();
		System.out.println();
		
		// ex2) continue 50~100까지 출력하되, continue를 이용해서 짝수는 제외하여
		//	출력하세요..
		System.out.println("ex2)");
		for(int cnt=50;cnt<=100;cnt++) {
			if(cnt%2 == 0) {
				continue;
			}
			System.out.print(cnt + ",");
		}
		System.out.println();
		System.out.println();
		
		// ex3) 1부터 시작하여 3,6,9게임 형식으로 해당 번호가 나왔을 때, 숫자가 아닌 짝이 표기
		//	되게 하세요.
		System.out.println("ex3)");
		for(int cnt=1;cnt<=100;cnt++) {
			int cal = cnt%10;
			if(cal%3 == 0 &&(!(cal==0))) {
				System.out.print("짝" + " ");
				continue;
			}
			System.out.print(cnt + " ");
		}
		System.out.println();
		System.out.println();
/*
 # for문의 index를 통한 배열 데이터 접근..
 	1) 배열은 index로 접근할 수 있기 때문에..
 	2) 배열명.length 배열의 index한계를 설정할 수 있고,
 		idx < 배열명.length
 	3) 각배열의 데이터는 index형식으로 접근하여 처리할 수 있다.
 		배열명[index번호]
# for의 단위데이터 처리 형식..
 */
		String fruits[] = {"(사과)","(바나나)","(딸기)"};
		// fruits[index번호] : 각가의 개별데이터 접근.
		// fruits[0] fruits[1] fruits[2]
		// fruits.length : 배열의 길이, index번호는 배열의 길이 보다 1작다.
		// 		위 데이터에서 배열의 길이는 3이지만, 인덱스번호는 2까지 있다.
		for(int idx=0; idx<fruits.length; idx++) {
			System.out.print(idx+1+"번째 과일 : ");
			System.out.println(fruits[idx]);
		}
		System.out.println();
		
		//ex) 과일의 가격을 정수 배열로 선언하고, 해당 과일명과 가격을 출력하세요..
		System.out.println("ex)");
		int prices[] = {1000,3000,4000};
		for(int idx=0; idx<fruits.length; idx++) {
			System.out.println(idx+1 +"번 과일 " +fruits[idx] + " : " + prices[idx]);
		}
		System.out.println();
/*
# for(단위 데이터 : 배열형데이터)
 */
		System.out.println("# for의 두번째 형식");
		for(String fruit:fruits) {
			System.out.println(fruit);
		}
		// 객체형 배열 선언.
		Fruit frus[] = {new Fruit("사과",3000,2),new Fruit("바나나",4000,3),new Fruit("딸기",12000,5)};
		
		for(Fruit f : frus) {
			System.out.print(f.name + " ");
			System.out.print(f.price + " ");
			System.out.print(f.cnt + " ");
			System.out.print(", ");
		}
		System.out.println();
		System.out.println();
/*
 ex) 학생 3명의 이름, 국어, 영어, 수학 점수를 각각의 배열로 만들어서..
 아래의 형식으로 출력 하세요..
 
 		이름		국어		영어		수학		총점		평균
 		홍길동	70		80		90		240		80
 		김길동	80		90		95		240		80
 		신길동	60		80		90		240		80
 */
		String[] names = {"홍길동","김길동","신길동"};
		int[] kors = {70,80,60};
		int[] ens = {80,90,90};
		int[] maths = {90,95,90};
		
		System.out.println("이름\t국어\t영어\t수학\t총점\t평균");
		for(int i=0; i<names.length; i++) {
			int sum = kors[i] + ens[i] + maths[i];
			float avg = sum/(float)kors.length;
			System.out.println(names[i]+"\t"+kors[i]+"\t"+ens[i]+"\t"+maths[i]+"\t"+sum+"\t"+avg);
		}
/*
 	while(boolean조건){
 		boolean조건이 true일 때, 반복수행할 내용..
 	}
 	do {
 		// 최소 한번은 수행하고, 반복 가능여부를 check
 	} 
 */

		// System.in : jvm에서 기본적으로 입력하는 객체
		// Scanner(입력스트림) : console창에서 데이터를 입력 받아 처리할 수 있음
		Scanner sc =new Scanner(System.in);
		// .neqxtLine() : 줄단위 문자열 입력..
		int pay = 0;
		while(true) {
			System.out.println("# 현재 구매한 금액 #");
			pay += 2000;
			System.out.println("현재 구매 금액 : "+pay);
			System.out.print("구매를 그만하시려면 Y 입력하세요:");
			if(sc.nextLine().equals("Y")) {
				System.out.println("안녕히 가세요!! Good bye!!!");
				break;
			}
		}
		System.out.println("프로그램 종료!!");
		
		// ex) Meeting!!
		//		1번 만남!!
		//		그만 만나시겠습니까?(Y)
		//		2번 만남!!
		//		3번 만남!!
		//		Y를 누르는 순간.. Say Good bye~
		int meet = 0;
		Scanner s = new Scanner(System.in);
		while(true) {
			System.out.println(++meet + "번째 만남!!");
			System.out.println("그만 만나시겠습니까?(Y)");
			if(s.nextLine().equals("Y")) {
				System.out.println("Say Good bye~");
				break;
			}
		}
		
	}
}

class Fruit {
	String name;
	int price;
	int cnt;
	Fruit(String name, int price, int cnt) {
		this.name = name;
		this.price = price;
		this.cnt = cnt;
	}
}
