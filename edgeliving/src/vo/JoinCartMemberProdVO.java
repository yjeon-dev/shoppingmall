package vo;

public class JoinCartMemberProdVO {
	String cartno,cartdate;
	String id,mname;
	String brandname,pname,search,thumbnailimg,largecategory,pdesc;
	int cartqty;
	int mno,autority,point;
	int pno,price,qty,discount;
	public JoinCartMemberProdVO(String cartno, String cartdate, String id, String mname, String brandname, String pname,
			String search, String thumbnailimg, String largecategory, String pdesc, int cartqty, int mno, int autority,
			int point, int pno, int price, int qty, int discount) {
		super();
		this.cartno = cartno;
		this.cartdate = cartdate;
		this.id = id;
		this.mname = mname;
		this.brandname = brandname;
		this.pname = pname;
		this.search = search;
		this.thumbnailimg = thumbnailimg;
		this.largecategory = largecategory;
		this.pdesc = pdesc;
		this.cartqty = cartqty;
		this.mno = mno;
		this.autority = autority;
		this.point = point;
		this.pno = pno;
		this.price = price;
		this.qty = qty;
		this.discount = discount;
	}
	public JoinCartMemberProdVO() {
		super();
	}
	public String getCartno() {
		return cartno;
	}
	public void setCartno(String cartno) {
		this.cartno = cartno;
	}
	public String getCartdate() {
		return cartdate;
	}
	public void setCartdate(String cartdate) {
		this.cartdate = cartdate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getBrandname() {
		return brandname;
	}
	public void setBrandname(String brandname) {
		this.brandname = brandname;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getThumbnailimg() {
		return thumbnailimg;
	}
	public void setThumbnailimg(String thumbnailimg) {
		this.thumbnailimg = thumbnailimg;
	}
	public String getLargecategory() {
		return largecategory;
	}
	public void setLargecategory(String largecategory) {
		this.largecategory = largecategory;
	}
	public String getPdesc() {
		return pdesc;
	}
	public void setPdesc(String pdesc) {
		this.pdesc = pdesc;
	}
	public int getCartqty() {
		return cartqty;
	}
	public void setCartqty(int cartqty) {
		this.cartqty = cartqty;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getAutority() {
		return autority;
	}
	public void setAutority(int autority) {
		this.autority = autority;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	
	
}
