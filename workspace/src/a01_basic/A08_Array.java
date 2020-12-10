package a01_basic;

public class A08_Array {
	public static void main(String[] args) {
/*
# 배열
1. 같은 유형의 데이터를 한 메모리에 index로 접근할 수 있는 구조로 만들어진 객체를 말한다.

2. 배열 선언 기본 형식..
	1) 배열의 선언.
		데이터유형 [] 배열명;
		int[] array;
	2) 배열 객체의 생성.
		배열명 = new 데이터유형[크기];
		array = new int[5];
		정수형 5개 데이터를 입력하는 배열 생성..
 	3) 배열의 데이터 할당.
 		배열명[index번호] = 데이터;
 		index번호는 0부터 시작하여 해당 배열의 크기만큼 데이터를 할당 할 수 있다.
 */
		int[] array;
		array = new int[5];
		array[0] = 1000;
		array[1] = 2000;
		array[2] = 3000;
		array[3] = 4000;
		array[4] = 5000;
		System.out.println("배열의 크기:"+array.length);
		for(int idx=0; idx<array.length; idx++) {
			System.out.println(idx+":"+array[idx]);
		}
//	4) 배열의 선언, 생성, 할당
		String[] name = new String[3];	// 선언과 생성..
		double[] records = {0.317, 0.295, 0.325}; // 선언과 생성, 할당.
	
	}
}
