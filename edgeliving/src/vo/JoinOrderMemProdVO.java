package vo;

public class JoinOrderMemProdVO {
	String orderno,thumbnailimg, pname;
	int orderqty,orderprice,orderdc,orderstatus,mno,pno;
	public JoinOrderMemProdVO() {
		super();
	}
	public JoinOrderMemProdVO(String orderno, String thumbnailimg, String pname, int orderqty, int orderprice,
			int orderdc, int orderstatus, int mno, int pno) {
		super();
		this.orderno = orderno;
		this.thumbnailimg = thumbnailimg;
		this.pname = pname;
		this.orderqty = orderqty;
		this.orderprice = orderprice;
		this.orderdc = orderdc;
		this.orderstatus = orderstatus;
		this.mno = mno;
		this.pno = pno;
	}
	public String getOrderno() {
		return orderno;
	}
	public void setOrderno(String orderno) {
		this.orderno = orderno;
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
	public int getOrderqty() {
		return orderqty;
	}
	public void setOrderqty(int orderqty) {
		this.orderqty = orderqty;
	}
	public int getOrderprice() {
		return orderprice;
	}
	public void setOrderprice(int orderprice) {
		this.orderprice = orderprice;
	}
	public int getOrderdc() {
		return orderdc;
	}
	public void setOrderdc(int orderdc) {
		this.orderdc = orderdc;
	}
	public int getOrderstatus() {
		return orderstatus;
	}
	public void setOrderstatus(int orderstatus) {
		this.orderstatus = orderstatus;
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
	
	
}
