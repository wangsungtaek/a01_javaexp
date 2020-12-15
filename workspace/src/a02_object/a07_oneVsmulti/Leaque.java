package a02_object.a07_oneVsmulti;

import java.util.*;

public class Leaque {
	private String lname;
	private ArrayList<Team> tlist;
	
	public Leaque(String lname) {
		super();
		this.lname = lname;
		tlist = new ArrayList<Team>();
	}
	public void addTeam(Team t) {
		tlist.add(t);
	}
	
	public void playTeam10() {
		for(Team t:tlist) {
			for(int cnt=1; cnt<=10; cnt++) {
				t.play();
			}
		}
	}
	
	public void teamRecords() {
		System.out.println("팀명\t경기수\t승\t무\t패");
		for(Team t:tlist) {
				t.showRecord();
		}
	}
}
