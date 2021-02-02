<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    %>
<% request.setCharacterEncoding("UTF-8");
   String path = request.getContextPath();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
<script>
// 변수를 만듭니다.
var numberFromLiteral = 273;
var numberFromObject = new Number(273);
// 출력합니다.
var output = '';
output += '1. ' + typeof(numberFromLiteral) + '\n';
output += '2. ' + typeof(numberFromObject);
// typeof()를 통한 데이터 변수 확인
console.log(output);
// 자료형을 확인합니다.
// constructor를 통해 확인
if(numberFromLiteral.constructor == Number) {
	console.log('numberFromLiteral은 숫자입니다.');
}
if(numberFromObject.constructor == Number) {
	console.log('numberFromObject는 숫자입니다.');
}
// 변수를 선언합니다.
var stringFromLiteral = 'Hello World..'; // string type
var stringFromConstructor = new String('Hello World..');
// object type
// 변수의 자료형을 출력합니다.
var output = '';
output += "1. " + typeof(stringFromLiteral) + '\n';
output += "2. " + typeof(stringFromConstructor);
console.log(output);
/*
# 문자열 객체
1. 생성
	var 변수명 = "문자열"; // string
	var 변수명 = new String("문자영열"); // object

2. 기본 속성과 메서드
	length : 문자열의 길이 // cf) java에서는 length()
	charAt(위치) : 위치의 문자
	charCodeAt(위치) : 위치의 유니코드 번호
	concat(연결문자)
	indexOf("검색문자", 위치) : 특정한 문자열을 검색해서 해당 위치를 index로 리턴
	lastIndexOf("검색문자", 위치)
	match(정규식표현) : 있는지 여부
	replace(정규식표현, 대체문자)
	search(정규식표현) : 위치
	slice(시작, 마지막) : 배열의 내용을 차용해서 활용 특정한 index위치 추출
	split("구분자", 제한) : 구분자를 통해서 배열을 만듦
	substr(시작, 문자갯수)
	substring(시작, 마지막)
	toLowerCase("변형문자열") : 소문자로 변경
	toUpperCase("변형문자열")  : 대문자로 변경
 */
 /*
ex1) 물건명 [  ] [검색]
	검색을 클릭시, 해당 입력된 글자를 모두 대문자로 변환 처리하자.
ex2) 등록할 데이터[3000,4000,5000][입력]
	입력시, 하단에 가격정보와 함께, 총계가 출력되게 하세요.
 */
	function search() {
		var pnameObj = document.querySelector("table [name=pname]");
		var tranPname = pnameObj.value.toUpperCase();
		pnameObj.value = tranPname;
	}
	function addData() {
		var data02 = document.querySelector("[name=data02]").value;
		var list = data02.split(",");
		var tab = document.querySelector("#tab");
		var addTab = "";
		var tot = 0;
		list.forEach(function(ele,idx){
			addTab += "<tr><td>"+ele+"</td></tr>";
			console.log(typeof(ele));
			tot += Number(ele);
			console.log(typeof(tot));
		});
		tab.innerHTML += addTab;
		document.querySelector("#tot").innerHTML = "총계:" + tot;
	}
	
</script>
</head>
<body>
	<h3>제목</h3>
	사용할 비밀번호를 입력해주세요(6글자 이상)<input name="pass"/><br>
	<input type="button" onclick="checksStr()" value="확인"/><br>
	<table border>
		<tr><th>물건명</th>
			<td><input type="text" name="pname"/></td>
			<td><input type="button" onclick="search()" value="검색"/></td></tr>
	</table>
	등록할 데이터 : <input name="data02"/>
	<input type="button" value="입력" onclick="addData()"/><br>
	<table id="tab"></table>
	<h4 id="tot">총계:</h4>
</body>
<script type="text/javascript">
	function checksStr() {
		// 변수를 선언합니다.
		var characters = document.querySelector("[name=pass]").value;
		// 출력합니다.
		if(characters.length < 6) alert('6글자 이상으로 입력하세요.');
		else alert('잘했어요!');
	}
	// 변수를 선언합니다.
	var string = 'abcdefg';
	// 출력합니다.
	string.toUpperCase();
	console.log(string);
	console.log(string.toUpperCase());
	// 문자열을 만듭니다.
	var string = 'JavaScript';
	var output1 = '';
	output1 += 'anchor: ' + string.anchor() + '<br/>';
	output1 += 'big: ' + string.big() + '<br/>';
	
	output1 += 'bold: ' + string.bold() + '<br/>';
	output1 += 'fixed: ' + string.fixed() + '<br/>';
	output1 += 'string: ' + string.fontcolor('red') + '<br/>';
	output1 += 'fontsize: ' + string.fontsize(15) + '<br/>';
	output1 += 'italics: ' + string.italics() + '<br/>';
	output1 += 'link: ' + string.link('http://hanbit.co.kr') + '<br/>';
	output1 += 'small: ' + string.small() + '<br/>';
	output1 += 'strike: ' + string.strike() + '<br/>';
	output1 += 'sub: ' + string.sub() + '<br/>';
	output1 += 'sup: ' + string.sup() + '<br/>';
	// 출력합니다.
	document.body.innerHTML += output1;
	var data = "사과,바나나,딸기";
	var arry = data.split(",");
	// 특정문자열데이터를 구분자에 의해 배열을 만들어 준다.
	console.log(arry);
</script>
</html>