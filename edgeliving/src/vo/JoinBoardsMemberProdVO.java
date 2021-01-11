package vo;

import java.util.Date;

public class JoinBoardsMemberProdVO {
	int bno;
	String bdesc;
	String thumbnailimg;
	String pname;
	String btitle;
	String id;
	Date bdate;
	int mno;
	
	public JoinBoardsMemberProdVO() {
			
	}
	

	public JoinBoardsMemberProdVO(int bno, String bdesc, String thumbnailimg, String pname, String btitle, String id,
			Date bdate, int mno) {
		super();
		this.bno = bno;
		this.bdesc = bdesc;
		this.thumbnailimg = thumbnailimg;
		this.pname = pname;
		this.btitle = btitle;
		this.id = id;
		this.bdate = bdate;
		this.mno = mno;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getBdesc() {
		return bdesc;
	}

	public void setBdesc(String bdesc) {
		this.bdesc = bdesc;
	}

	public String getThumbnailimg() {
		return thumbnailimg;
	}

	public void setThumbnailimg(String thumbnailimg) {
		this.thumbnailimg = thumbnailimg;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getBdate() {
		return bdate;
	}

	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

}
