package vo;

public class MemberVO {
	int mno;
	String id;
	String pw;
	String mname;
	String dob;
	String gender;
	String email;
	String phone;
	String addrpost;
	String addrbasic;
	int authority;
	int point;
	String addrdetail;
	String tel;
	public MemberVO() {
	}
	public MemberVO(int mno, String id, String pw, String mname, String dob, String gender, String email, String phone,
			String addrpost, String addrbasic, int authority, int point, String addrdetail, String tel) {
		super();
		this.mno = mno;
		this.id = id;
		this.pw = pw;
		this.mname = mname;
		this.dob = dob;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.addrpost = addrpost;
		this.addrbasic = addrbasic;
		this.authority = authority;
		this.point = point;
		this.addrdetail = addrdetail;
		this.tel = tel;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddrpost() {
		return addrpost;
	}
	public void setAddrpost(String addrpost) {
		this.addrpost = addrpost;
	}
	public String getAddrbasic() {
		return addrbasic;
	}
	public void setAddrbasic(String addrbasic) {
		this.addrbasic = addrbasic;
	}
	public int getAuthority() {
		return authority;
	}
	public void setAuthority(int authority) {
		this.authority = authority;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getAddrdetail() {
		return addrdetail;
	}
	public void setAddrdetail(String addrdetail) {
		this.addrdetail = addrdetail;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
}
