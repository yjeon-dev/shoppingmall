package vo;

public class ReceiveaddrVO {
	int rno;
	int mno;

	String receiveaddrpost;
	String receiveaddrbasic;

	int status;
	String receiveaddrdetail;

	public ReceiveaddrVO() {
		
	}
	
	
	public ReceiveaddrVO(int rno, int mno, String receiveaddrpost, String receiveaddrbasic, int status,
			String receiveaddrdetail) {
		super();
		this.rno = rno;
		this.mno = mno;
		this.receiveaddrpost = receiveaddrpost;
		this.receiveaddrbasic = receiveaddrbasic;
		this.status = status;
		this.receiveaddrdetail = receiveaddrdetail;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getReceiveaddrpost() {
		return receiveaddrpost;
	}

	public void setReceiveaddrpost(String receiveaddrpost) {
		this.receiveaddrpost = receiveaddrpost;
	}

	public String getReceiveaddrbasic() {
		return receiveaddrbasic;
	}

	public void setReceiveaddrbasic(String receiveaddrbasic) {
		this.receiveaddrbasic = receiveaddrbasic;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getReceiveaddrdetail() {
		return receiveaddrdetail;
	}

	public void setReceiveaddrdetail(String receiveaddrdetail) {
		this.receiveaddrdetail = receiveaddrdetail;
	}
}
