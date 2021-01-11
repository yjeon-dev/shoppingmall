package vo;

public class JoinReviewOrderMemProdVO {
	int reviewno,rate;
	String prodreview,reviewdate;
	String id,pname,thumbnailimg;
	
	public JoinReviewOrderMemProdVO() {
		super();
	}

	public JoinReviewOrderMemProdVO(int reviewno, int rate, String prodreview, String reviewdate, String id,
			String pname, String thumbnailimg) {
		super();
		this.reviewno = reviewno;
		this.rate = rate;
		this.prodreview = prodreview;
		this.reviewdate = reviewdate;
		this.id = id;
		this.pname = pname;
		this.thumbnailimg = thumbnailimg;
	}

	public int getReviewno() {
		return reviewno;
	}

	public void setReviewno(int reviewno) {
		this.reviewno = reviewno;
	}

	public int getRate() {
		return rate;
	}

	public void setRate(int rate) {
		this.rate = rate;
	}

	public String getProdreview() {
		return prodreview;
	}

	public void setProdreview(String prodreview) {
		this.prodreview = prodreview;
	}

	public String getReviewdate() {
		return reviewdate;
	}

	public void setReviewdate(String reviewdate) {
		this.reviewdate = reviewdate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getThumbnailimg() {
		return thumbnailimg;
	}

	public void setThumbnailimg(String thumbnailimg) {
		this.thumbnailimg = thumbnailimg;
	}

	
	
}
