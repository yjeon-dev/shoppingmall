package vo;

import java.util.Date;

public class BoardsVO {
	int bno;
	String btitle;
	String bdesc;
	Date bdate;
	int boardgroup;
	int mno;
	int pno;
	String orderno;
	String bcategory;

	public BoardsVO() {
		super();
	}

	public BoardsVO(int bno, String btitle, String bdesc, Date bdate, int boardgroup, int mno, int pno, String orderno,
			String bcategory) {
		super();
		this.bno = bno;
		this.btitle = btitle;
		this.bdesc = bdesc;
		this.bdate = bdate;
		this.boardgroup = boardgroup;
		this.mno = mno;
		this.pno = pno;
		this.orderno = orderno;
		this.bcategory = bcategory;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getBdesc() {
		return bdesc;
	}

	public void setBdesc(String bdesc) {
		this.bdesc = bdesc;
	}

	public Date getBdate() {
		return bdate;
	}

	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}

	public int getBoardgroup() {
		return boardgroup;
	}

	public void setBoardgroup(int boardgroup) {
		this.boardgroup = boardgroup;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getOrderno() {
		return orderno;
	}

	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}

	public String getBcategory() {
		return bcategory;
	}

	public void setBcategory(String bcategory) {
		this.bcategory = bcategory;
	}

}
