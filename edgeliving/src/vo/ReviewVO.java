package vo;

public class ReviewVO {

	int reviewNo, rate;
	String prodReview, reviewDate,orderNo; 
	
	public ReviewVO(){
		
	}

	public ReviewVO(int reviewNo, int rate, String prodReview, String reviewDate, String orderNo) {
		super();
		this.reviewNo = reviewNo;
		this.rate = rate;
		this.prodReview = prodReview;
		this.reviewDate = reviewDate;
		this.orderNo = orderNo;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getRate() {
		return rate;
	}

	public void setRate(int rate) {
		this.rate = rate;
	}

	public String getProdReview() {
		return prodReview;
	}

	public void setProdReview(String prodReview) {
		this.prodReview = prodReview;
	}

	public String getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	
	
}
