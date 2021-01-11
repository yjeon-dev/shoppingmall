package vo;


public class OrdersVO {
	String orderno;
	String ordername;
	String orderphone;
	String orderreceivepost;
	String orderreceivebasic;

	int orderqty;
	int orderprice;
	int orderdc;
	int orderstatus;
	int mno;
	int pno;

	String ordertel;
	String orderreceivedetail;
	String ordermsg;
	public OrdersVO() {

	}

	public OrdersVO(String orderno, String ordername, String orderphone, String orderreceivepost,
			String orderreceivebasic, int orderqty, int orderprice, int orderdc, int orderstatus, int mno, int pno,
			String ordertel, String orderreceivedetail, String ordermsg) {
		super();
		this.orderno = orderno;
		this.ordername = ordername;
		this.orderphone = orderphone;
		this.orderreceivepost = orderreceivepost;
		this.orderreceivebasic = orderreceivebasic;
		this.orderqty = orderqty;
		this.orderprice = orderprice;
		this.orderdc = orderdc;
		this.orderstatus = orderstatus;
		this.mno = mno;
		this.pno = pno;
		this.ordertel = ordertel;
		this.orderreceivedetail = orderreceivedetail;
		this.ordermsg = ordermsg;
	}

	public String getOrderno() {
		return orderno;
	}

	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}

	public String getOrdername() {
		return ordername;
	}

	public void setOrdername(String ordername) {
		this.ordername = ordername;
	}

	public String getOrderphone() {
		return orderphone;
	}

	public void setOrderphone(String orderphone) {
		this.orderphone = orderphone;
	}

	public String getOrderreceivepost() {
		return orderreceivepost;
	}

	public void setOrderreceivepost(String orderreceivepost) {
		this.orderreceivepost = orderreceivepost;
	}

	public String getOrderreceivebasic() {
		return orderreceivebasic;
	}

	public void setOrderreceivebasic(String orderreceivebasic) {
		this.orderreceivebasic = orderreceivebasic;
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

	public String getOrdertel() {
		return ordertel;
	}

	public void setOrdertel(String ordertel) {
		this.ordertel = ordertel;
	}

	public String getOrderreceivedetail() {
		return orderreceivedetail;
	}

	public void setOrderreceivedetail(String orderreceivedetail) {
		this.orderreceivedetail = orderreceivedetail;
	}

	public String getOrdermsg() {
		return ordermsg;
	}

	public void setOrdermsg(String ordermsg) {
		this.ordermsg = ordermsg;
	}
}
