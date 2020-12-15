package a02_object.a07_oneVsmulti;

public class Test {
	public static void main(String[] args) {
		Leaque_Test lg = new Leaque_Test("동계 올림픽");
		lg.addTeam(new Team_test("전북"));
		lg.addTeam(new Team_test("청주"));
		lg.addTeam(new Team_test("포항"));
		lg.addTeam(new Team_test("서울"));
		lg.playTeam10();
		lg.teamRecordes();
	}
}
