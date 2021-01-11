package vo;
// Value Object(VO)
public class DeptVO {
	// 기본적으로 컬럼명을 변수로 만듬
	private int deptno;
	private String dname;
	private String loc;
	
	public DeptVO() {
		// TODO Auto-generated constructor stub
	}
	
	public DeptVO(int deptno, String dname, String loc) {
		super();
		this.deptno = deptno;
		this.dname = dname;
		this.loc = loc;
	}

	public int getDeptno() {
		return deptno;
	}

	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}
	
	
	
}
