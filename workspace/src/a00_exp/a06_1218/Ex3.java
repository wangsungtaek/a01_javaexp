package a00_exp.a06_1218;


class WriteTool {
	private String name;
	public WriteTool(String name) {
		this.name = name;
	}
	public void using() {
		System.out.println("필기구 "+name+"을 사용하다.");
	}
	public String getName() {
		return name;
	}
	
}
class Note2 {	// 1:1관계 설정..
	private String kind;
	private WriteTool wt;
	public Note2(String kind) {
		super();
		this.kind = kind;
	}
	public void setWt(WriteTool wt) {
		this.wt = wt;
		System.out.println(kind+" 노트에 필기구 "+wt.getName()+" 활용하다.");
	}
	public void writing() {
		System.out.print(kind+" 노트에서 ");
		if(wt!=null) {
			wt.using();
		} else {
			System.out.println(" 필기구가 없습니다..");
		}
	}

}
public class Ex3 {
	public static void main(String[] args) {
		Note2 n = new Note2("A4크기");
		n.writing();
		n.setWt(new WriteTool("고급 샤프"));
		n.writing();
	}
}
