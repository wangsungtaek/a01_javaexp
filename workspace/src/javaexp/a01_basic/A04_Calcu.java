package javaexp.a01_basic;

public class A04_Calcu {
	public static void main(String[] args) {
		
/*
 # 연산자
 1. 개념
 	1) 데이터를 처리하여 결과를 산출하는 것을 말한다.
 	2) 연산자(Operations) 
 		연산에  사용되는 표시나 기호 ( +, -, *, /, %, =, !=, >=, >, <)
		ex) 25+30, num05 = 75, num01!=num02, num03>num02
	3) 피연산자(Operatnd)
		연산 대상이 되는 데이터(리터럴, 변수)
		ex) sum = num01 + num02;
		+, = : 연산자
		num01, num02, sum : 피연산자.
	4) 연산식(Expression)
		특정한 요구사항에 의해 연산자와 피연산자를 이용하여 연산의 과정을 기술하는 것을 말한다.
		ex) 2000원 단가 하는 사과를 5개 구매 했을때, 비용을 연산식으로 처리하세요..
		int price = 2000;
		int cnt = 5;
		int tot = price*cnt;
 */
// ex1) 테이블 위의 빵 10개가 있고, 곰돌이 3마리에게 각각 빵을 3개씩 배분하고, 나머지를 출력하세요.
		int breadCnt = 10;
		int bearCnt = 3;
		int disBreadCnt = bearCnt*3;
		int restBreadCnt = breadCnt - disBreadCnt;

		System.out.println("남은 빵의 갯수 : " + restBreadCnt);
		
// ex2) 10000원을 용돈을 받아서 교통비 1200 2회, 점심값 5000원 지출하고 나머지를 연삭식을 이용해서 출력하세요.
		int useMoney = 10000;
		int tranPay = 1200;
		int lunchPay = 5000;
		int restMoney = useMoney - (tranPay*2 + lunchPay);
		
		System.out.println("나머지 금액 : " + restMoney);
/*
 # 연산자의 우선 순위
 1. 연산자는 우선 순위에 따라 연산된다.
 	1) () : 소괄호를 씌운 연산자와 피연사자는 가장 먼저 연산을 해준다.
 		ex) (5 + 2)*7
 	2) *,/,% 이 먼저 왼쪽부터 오른쪽으로 수행한다.
 		해당 연산식은 순서에 상관없이 결과가 같으므로 일반적으로 왼쪽부터 오른쪽으로 수행해준다.
 		ex) 5 + 2 * 7 : *이 우선이므로 2*7가 처리된 후, 5를 더해준다.
 	3) +, -
 	4) 단한연산자(++,--,|), 부호연산자(+,-), 대입연산자(+, +=, -=, ...)
 		오른쪽부터 시작해서 왼쪽으로 연산으로 해준다.
 		int num05 = 25; 25라는 데이터를 num05에 할당해준다.
 */
		System.out.println("(5+2)*7 = " + (5+2)*7);
		System.out.println("5+2*7 = " + 5+2*7);
	}
}
