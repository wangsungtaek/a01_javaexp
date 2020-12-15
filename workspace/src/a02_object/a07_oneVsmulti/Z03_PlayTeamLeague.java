package a02_object.a07_oneVsmulti;

public class Z03_PlayTeamLeague {
	public static void main(String[] args) {
		Leaque l1 = new Leaque("프리미어리그(2020~21)");
		l1.addTeam(new Team("토트넘"));
		l1.addTeam(new Team("리버풀"));
		l1.addTeam(new Team("레스터시티"));
		l1.addTeam(new Team("사우샘프턴"));
		l1.addTeam(new Team("첼시"));
		l1.playTeam10();
		l1.teamRecords();
	}
}
