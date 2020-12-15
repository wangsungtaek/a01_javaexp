package a02_object.a07_oneVsmulti;

public class Team {
	private String tname;
	private int totPlay;
	private int vic;
	private int eq;
	private int def;

	public Team(String tname) {
		this.tname = tname;
	}
	
	public void play() {
		totPlay++;
		int idx=(int)(Math.random()*3);
		if(idx==0) {
			vic++;
		} else if(idx==1){
			def++;
		} else {
			eq++;
		}
	}
	
	public void showRecord() {
		System.out.print(tname+"\t");
		System.out.print(totPlay+"\t");
		System.out.print(vic+"\t");
		System.out.print(eq+"\t");
		System.out.print(def+"\n");
	}
}
