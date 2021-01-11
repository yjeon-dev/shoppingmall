package vo;

public class CartVO {
	String cartno;
	int mno;
	int pno;
	int cartquty;
	String cartdate;
	
	public CartVO() {
	
	}
	public CartVO(String cartno, int mno, int pno, int cartquty, String cartdate) {
	
		this.cartno = cartno;
		this.mno = mno;
		this.pno = pno;
		this.cartquty = cartquty;
		this.cartdate = cartdate;
	}
	public String getCartno() {
		return cartno;
	}
	public void setCartno(String cartno) {
		this.cartno = cartno;
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
	public int getCartquty() {
		return cartquty;
	}
	public void setCartquty(int cartquty) {
		this.cartquty = cartquty;
	}
	public String getCartdate() {
		return cartdate;
	}
	public void setCartdate(String cartdate) {
		this.cartdate = cartdate;
	}
	
	
	
}
