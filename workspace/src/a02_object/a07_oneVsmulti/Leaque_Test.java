package a02_object.a07_oneVsmulti;

import java.util.*;

public class Leaque_Test {
	private String name;
	private ArrayList<Team_test> teams;
	
	public Leaque_Test(String name) {
		this.name = name;
		teams = new ArrayList<>();
	}
	public void addTeam(Team_test t) {
		teams.add(t);
	}
	public void playTeam10() {
		for(int i=0; i<10; i++) {
			for(Team_test t : teams) {
				t.play();
			}
		}
	}
	
	public void teamRecordes() {
		System.out.println(name);
		for(Team_test t : teams) {
			t.showRecorde();
		}
	}
}
