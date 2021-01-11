package vo;

public class CommentsVO {
	int cno;
	int bno;
	int mno;
	String cdate;
	String cdesc;
	
	
	public CommentsVO() {

	}


	public CommentsVO(int cno, int bno, int mno, String cdate, String cdesc) {

		this.cno = cno;
		this.bno = bno;
		this.mno = mno;
		this.cdate = cdate;
		this.cdesc = cdesc;
	}


	public int getCno() {
		return cno;
	}


	public void setCno(int cno) {
		this.cno = cno;
	}


	public int getBno() {
		return bno;
	}


	public void setBno(int bno) {
		this.bno = bno;
	}


	public int getMno() {
		return mno;
	}


	public void setMno(int mno) {
		this.mno = mno;
	}


	public String getCdate() {
		return cdate;
	}


	public void setCdate(String cdate) {
		this.cdate = cdate;
	}


	public String getCdesc() {
		return cdesc;
	}


	public void setCdesc(String cdesc) {
		this.cdesc = cdesc;
	}
	
	
}
