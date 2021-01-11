package vo;

public class ProductVO {
	int pno, price, qty, discount, recommend;
	String brandName, pname, pdate, search, detailDesc,
		   thumbNailImg,largeCategory, pdesc;
	
	public ProductVO(){
		
	}

	public ProductVO(int pno, int price, int qty, int discount, int recommend, String brandName, String pname,
			String pdate, String search, String detailDesc, String thumbNailImg, String largeCategory, String pdesc) {
		super();
		this.pno = pno;
		this.price = price;
		this.qty = qty;
		this.discount = discount;
		this.recommend = recommend;
		this.brandName = brandName;
		this.pname = pname;
		this.pdate = pdate;
		this.search = search;
		this.detailDesc = detailDesc;
		this.thumbNailImg = thumbNailImg;
		this.largeCategory = largeCategory;
		this.pdesc = pdesc;
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

	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPdate() {
		return pdate;
	}

	public void setPdate(String pdate) {
		this.pdate = pdate;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getDetailDesc() {
		return detailDesc;
	}

	public void setDetailDesc(String detailDesc) {
		this.detailDesc = detailDesc;
	}

	public String getThumbNailImg() {
		return thumbNailImg;
	}

	public void setThumbNailImg(String thumbNailImg) {
		this.thumbNailImg = thumbNailImg;
	}

	public String getLargeCategory() {
		return largeCategory;
	}

	public void setLargeCategory(String largeCategory) {
		this.largeCategory = largeCategory;
	}

	public String getPdesc() {
		return pdesc;
	}

	public void setPdesc(String pdesc) {
		this.pdesc = pdesc;
	}
}
