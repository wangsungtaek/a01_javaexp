package a01_basic;

public class A03_PriData {
	public static void main(String[] args) {
		
/*
 # 기본 데이터 타입..
 1. byte
 2. short
 3. int : 정수형 default 데이터 유형..
 4. char : 문자형 데이터 'a' 저장은 정수형으로 되어 있다.
 		unicode값에 의해서 문자를 불러온다. int과 type casting으로
 		문자와 숫자를 확인할 수 있다.
 		==> char[] (문자배열) ==> String (데이터유형 추가)
 		ex) id, pass 의 분실 시, 임시패스워드 발송시, 숫자
 		문자를 random ==> 알파벳 유니코드값 범위. 64(a) ~ (Z)

 5. long : 정수형에서 가장 큰 데이터 유형..
 
 6. float : 실수형 데이터 유형..
 7. double : 실수형 default 데이터 유형..
 8. boolean : true/false로 데이터를 할당하는 데이터 유형.
 */
		System.out.println("문자 uni 코드 번호");
		System.out.println("a:"+(int)'a');
		System.out.println("z:"+(int)'z');
		System.out.println("A:"+(int)'A');
		System.out.println("Z:"+(int)'Z');
		for(int cnt=1; cnt<=8; cnt++) {
			int ran=(int)(Math.random()*26+65);
			System.out.print((char)ran);
		}
		System.out.println();
		System.out.println();
		
		byte num01 = 25; 	// 1bit ==> 8bits ==> 1byte
		short num02 = 50;
		char ch01 = 'A';
		char ch02 = '안';
		
		System.out.println("num01 : " + num01);
		System.out.println("num02 : " + num02);
		System.out.println("ch01 : " + ch01);
		System.out.println("ch02 : " + ch02);
		int ch02Num = ch02;
		System.out.println("문자에 대한 유니코드값 : " + ch02Num);
		int num03 = 64;
		char ch03 = (char)num03; // 코드에 맞는 문자를 확인
		System.out.println("64번 코드의 문자 : " + ch03);
		// 정수형의 데이터 long에 대한 할당.
		long num04 = 90L; // long을 식별하여 데이터를 할당하려면 L를 붙여 int형과
		// 구분하여 데이터를 할당한다..
		float num05 = 175.5F; // float유형의 데이터를 할당할 때는 f라고 구분하여
		// 입력한다.
		System.out.println("실수형 num05 : " + num05);
		double num06 = 3.1457;
		System.out.println("실수형 num06 : " + num06);
		System.out.println();
/*
 ex) 기본 유형의 데이터를 이용해서, 국어, 영어, 수학의 점수와 총점과 평균값, 학점등급을 할당하여
 		출력하세요..
 */
		byte kor = 70;
		short eng = 92;
		int math = 80;
		long tot = kor+eng+math;
		double avg = tot/3.0; // 실수로 연산을 해야지 정확한 실수값으로 처리가 된다.
		
		System.out.println("국어 : " + kor);
		System.out.println("영어 : " + eng);
		System.out.println("수학 : " + math);
		System.out.println("총점 : " + tot);
		System.out.println("평균값 : " + avg);
		
/*
 # 형변환
  1. 데이터의 유형의 작은 유형에서 큰 유형으로 변경이 일어나거나(할당, promote), 큰 유형에서
  	작은 유형으로 변경을 할 때 발생한다.(할당, casting)
 */
		int num07 = 35;
		double num08 = num07; // promote
		System.out.println("promote가 일어난 데이터 : " + num08);
		double num09 = 37.5;
		int num10 = (int)num09; // 큰데이터 유형은 명시적으로 castion하지 않으면,
		// 데이터를 사용할 수 없다.
		System.out.println("캐스팅한 데이터 : " + num10);
		System.out.println();
/*
 ex) byte유형으로 물건가격과 갯수를 선언하고,
 	int 유형으로 promote를 할당한 총계를 출력하세요.
	임의의 소숫점 1자리까지 있는 3명의 평점의 평균을 캐스팅하여 출력하세요..
*/
		byte price = 100;
		byte cnt = 6;
		int tot1 = price*cnt;
		System.out.println("총계 : " + tot1);
		System.out.println();

		// 임의의 숫자.. 0.0 <= Math.random() < 1.0
		double p1 = Math.random()*1001;
		double p2 = Math.random()*1001;
		double p3 = Math.random()*1001;
		
		int avg1 = (int)((p1+p2+p3)/3.0);
		System.out.println("p1 : " + p1);
		System.out.println("p2 : " + p2);
		System.out.println("p3 : " + p2);
		System.out.println("평균 점수(정수형) : " + avg1);
	}
}
