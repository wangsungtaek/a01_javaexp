package a02_object.a07_oneVsmulti;

public class Team_test {
	private String name;
	private int totPlay;
	private int vic;
	private int eq;
	private int def;
	
	public Team_test(String name) {
		this.name = name;
	}
	public void play() {
		int ran = (int)(Math.random()*3);
		if(ran==0) vic++;
		if(ran==1) eq++;
		if(ran==2) def++;
		totPlay++;
	}
	public void showRecorde() {
		System.out.print(name + "\t");
		System.out.print(totPlay + "\t");
		System.out.print(vic + "\t");
		System.out.print(eq + "\t");
		System.out.print(def + "\n");
	}
}
