package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.MemberVO;
public class MemberDAO {
	Connection conn;
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	StringBuffer sb = new StringBuffer();
	MemberVO vo = null;

	public MemberDAO() {
		conn = MakeConnection.getInstance().getConnection();
	}

	// 전누리추가
	// 셀렉트 올
	public ArrayList<MemberVO> selectAll(int startNo, int endNo, String search) {
		sb.setLength(0);

		sb.append(" SELECT mno,id,pw,mname,dob,gender,email,phone,addrpost,addrbasic,autority,point,addrdetail,tel ");
		sb.append(" FROM(  ");
		sb.append(" 	SELECT rownum rn, mno,id,pw,mname,dob,gender,email,phone,addrpost,addrbasic,autority,point,addrdetail,tel  ");
		sb.append(" 	FROM (SELECT mno,id,pw,mname,dob,gender,email,phone,addrpost,addrbasic,autority,point,addrdetail,tel ");
		sb.append(" 		  FROM  member  ");
		sb.append(" 		  where  id like '%" + search + "%' or mname like '%" + search + "%'  ");
		sb.append(" 		  ORDER BY autority DESC ) ");
		sb.append(" 	WHERE rownum <= ?) ");
		sb.append(" WHERE rn >=?  ");
		
		
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, endNo);
			pstmt.setInt(2, startNo);
			
		
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberVO vo = new MemberVO();
				
				int mno = rs.getInt("mno");
				int autority = rs.getInt("autority");
				int point =  rs.getInt("point");
				String dob = rs.getString("dob");
				String addrpost = rs.getString("addrpost");
				String id = rs.getString("id");
				String tel = rs.getString("tel");
				String phone = rs.getString("phone");
				String pw = rs.getString("pw");
				String addrbasic = rs.getString("addrbasic");
				String email = rs.getString("email");
				String addrdetail = rs.getString("addrdetail");
				String gender = rs.getString("gender");
				String mname = rs.getString("mname");
			

				vo.setAuthority(autority);
				vo.setMno(mno);
				vo.setPoint(point);
				vo.setDob(dob);
				vo.setAddrbasic(addrbasic);
				vo.setAddrpost(addrpost);
				vo.setAddrdetail(addrdetail);
				vo.setId(id);
				vo.setTel(tel);
				vo.setPhone(phone);
				vo.setPw(pw);
				vo.setEmail(email);
				vo.setGender(gender);
				vo.setMname(mname);

				list.add(vo);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}
	
	// 전누리추가
	// 전체 회원 갯수 조회
	public int getTotalCount() {
		sb.setLength(0);
		sb.append("select count(*)as cnt from member ");
		int count = 0;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt("cnt");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
		
	}
	
	///////////////////////////////////////////////////////////////
	// 1. �α��� //
	/////////////////////////////////////////////////////////////
	
	
	public MemberVO login(String id, String pw) {
		sb.setLength(0);
		sb.append("SELECT mno,id,point,mname,pw,autority FROM MEMBER WHERE id=? AND pw=?");
		MemberVO vo = null;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				int mno = rs.getInt("mno");
				String mid = rs.getString("id");
				int point = rs.getInt("point");
				String mname = rs.getString("mname");
				String mpw = rs.getString("pw");
				int autority = rs.getInt("autority");
				vo = new MemberVO();
				vo.setMno(mno);
				vo.setId(mid);
				vo.setMname(mname);
				vo.setPoint(point);
				vo.setId(id);
				vo.setPw(mpw);
				vo.setAuthority(autority);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;

	}

	///////////////////////////////////////////////////////////////
	// 2. ȸ������ //
	/////////////////////////////////////////////////////////////
	public void insertOne(String id, String pw, String mname, String dob, String gender, String email, String phone,
			String addrpost, String addrbasic, int autority, int point, String addrdetail, String tel) {
		/*
		 * int mno, String id, String pw, String mname, String dob, String gneder,
		 * String email, String phone, String addrpost, String addrbasic, int autority,
		 * int point, String addrdetail, String tel
		 */

		sb.setLength(0);
		sb.append("INSERT INTO MEMBER ");
		sb.append("VALUES (MEMBER_MNO_SEQ.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?,?,?) ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, mname);
			pstmt.setString(4, dob);
			pstmt.setString(5, gender);
			pstmt.setString(6, email);
			pstmt.setString(7, phone);
			pstmt.setString(8, addrpost);
			pstmt.setString(9, addrbasic);
			pstmt.setInt(10, 0);
			pstmt.setInt(11, point);
			pstmt.setString(12, addrdetail);
			pstmt.setString(13, tel);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	///////////////////////////////////////////////////////////////
	// 3.ȸ��Ż�� //
	/////////////////////////////////////////////////////////////
	public void deleteOne(int mno) {
		sb.setLength(0);
		sb.append("DELETE MEMBER WHERE mno=?");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, mno);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	
	// 전누리추가
	public void deleteList(int[] m) {

		
		for(int i = 0; i< m.length; i++) {
			deleteOne(m[i]);
		}
		
	}
	///////////////////////////////////////////////////////////////
	// 4.�������� //
	// vo���� ���� �����ͼ� ���� ������ �ؽ�Ʈ�ʵ忡 �־��ְ� ������ ������ �ٲ� �� �ְ�
	// 
	/////////////////////////////////////////////////////////////

	public void modify(int mno,MemberVO vo) {
		sb.setLength(0);
		sb.append("UPDATE MEMBER ");
		sb.append("SET pw=?,  email=?, phone=?, addrpost=?, addrbasic=?, addrdetail=?, tel=? ");
		sb.append(" ,id =?, mname = ? , dob = ? , gender = ? , point = ?, autority = ? ");
		sb.append("WHERE MNO=?");

		

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getPw());
			pstmt.setString(2, vo.getEmail());
			pstmt.setString(3, vo.getPhone());
			pstmt.setString(4, vo.getAddrpost());
			pstmt.setString(5, vo.getAddrbasic());
			pstmt.setString(6, vo.getAddrdetail());
			pstmt.setString(7, vo.getTel());
			pstmt.setString(8, vo.getId());
			pstmt.setString(9, vo.getMname());
			pstmt.setString(10, vo.getDob());
			pstmt.setString(11, vo.getGender());
			pstmt.setInt(12, vo.getPoint());
			pstmt.setInt(13, vo.getAuthority());
			pstmt.setInt(14, mno);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	///////////////////////////////////////////////////////////////
	//                5. ȸ������ 1�� ��������                                              //
	/////////////////////////////////////////////////////////////

	public MemberVO getOne(int mno) {
	      MemberVO vo = null;
	      sb.setLength(0);
	      sb.append("SELECT * FROM MEMBER ");
	      sb.append("WHERE mno=?");

	      try {
	         pstmt = conn.prepareStatement(sb.toString());
	         pstmt.setInt(1, mno);
	         rs = pstmt.executeQuery();
	    
	         rs.next();
	         vo = new MemberVO();
	         int mno1 = rs.getInt("mno");
	         String id = rs.getString("id");
	         String pw = rs.getString("pw");
	         String mname = rs.getString("mname");
	         String dob = rs.getString("dob");
	         String gender = rs.getString("gender");
	         String email = rs.getString("email");
	         String phone = rs.getString("phone");
	         String addrpost = rs.getString("addrpost");
	         String addrbasic = rs.getString("addrbasic");
	         int authority = rs.getInt("autority");
	         int point = rs.getInt("point");
	         String addrdetail = rs.getString("addrdetail");
	         String tel = rs.getString("tel");

	         vo.setMno(mno1);
	         vo.setId(id);
	         vo.setPw(pw);
	         vo.setMname(mname);
	         vo.setDob(dob);
	         vo.setGender(gender);
	         vo.setEmail(email);
	         vo.setPhone(phone);
	         vo.setAddrpost(addrpost);
	         vo.setAddrbasic(addrbasic);
	         vo.setAuthority(authority);
	         vo.setPoint(point);
	         vo.setAddrdetail(addrdetail);
	         vo.setTel(tel);

	      } catch (SQLException e) {
	         e.printStackTrace();
	      }

	      return vo;
	   }

	public MemberVO findId(String mname, String email) {
		MemberVO vo = null;
		sb.setLength(0);
		sb.append("SELECT id,email,mname FROM MEMBER ");
		sb.append("WHERE mname=? AND email=?");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, mname);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();

			rs.next();
			vo = new MemberVO();
			String id = rs.getString("id");
			String mname2 = rs.getString("mname");
			String email2 = rs.getString("email");
			vo.setId(id);
			vo.setMname(mname2);
			vo.setEmail(email2);

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return vo;
	}

	public MemberVO findPw(String id, String email) {
		sb.setLength(0);
		sb.append("SELECT id, email, pw ");
		sb.append("FROM MEMBER ");
		sb.append("WHERE id=? AND email=?");
		vo = new MemberVO();
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getEmail());

			rs = pstmt.executeQuery();

			if(rs.next()) {
				
			String id2 = rs.getString("id");
			String email2 = rs.getString("email");
			String pw = rs.getString("pw");

			vo.setId(id2);
			vo.setEmail(email2);
			vo.setPw(pw);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return vo;

	}
	
	public ArrayList<MemberVO> getAll() {
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		
		sb.setLength(0);
		sb.append("SELECT * FROM MEMBER ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			/*
			 * int mno, String id, String pw, String mname, String dob, String gneder,
			 * String email, String phone, String addrpost, String addrbasic, int autority,
			 * int point, String addrdetail, String tel
			 */
			while(rs.next()) {
				
			
			int mno = rs.getInt("mno");
			String id = rs.getString("id");
			String pw = rs.getString("pw");
			String mname = rs.getString("mname");
			String dob = rs.getString("dob");
			String gender = rs.getString("gender");
			String email = rs.getString("email");
			String phone = rs.getString("phone");
			String addrpost = rs.getString("addrpost");
			String addrbasic = rs.getString("addrbasic");
			int authority = rs.getInt("autority");
			int point = rs.getInt("point");
			String addrdetail = rs.getString("addrdetail");
			String tel = rs.getString("tel");

			MemberVO vo = new MemberVO(mno, id, pw, mname, dob, gender, email,
					phone, addrpost, addrbasic, authority, point, addrdetail, tel);
			
			list.add(vo);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
	
	// 김소현 추가
	public void modifyMember(int mno,MemberVO vo) {
		sb.setLength(0);
		sb.append("UPDATE MEMBER ");
		sb.append("SET pw=?,  phone=?, addrpost=?, addrbasic=?, addrdetail=? ");
		sb.append("WHERE MNO=?");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getPw());
			pstmt.setString(2, vo.getPhone());
			pstmt.setString(3, vo.getAddrpost());
			pstmt.setString(4, vo.getAddrbasic());
			pstmt.setString(5, vo.getAddrdetail());
			pstmt.setInt(6, mno);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public String IDisExists(String id) {
	      sb.setLength(0);
	      sb.append("select id ");
	      sb.append("from member ");
	      sb.append("where id=?");
	      boolean result = false;
	      
	      try {
	         
	         pstmt = conn.prepareStatement(sb.toString());
	         pstmt.setString(1,  id);
	         rs = pstmt.executeQuery();
	         //true라는건 있다는 것
	         result = rs.next();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	      return result?"true":"false";
	   }
	public String PWisExists(String pw) {
	      sb.setLength(0);
	      sb.append("select pw ");
	      sb.append("from member ");
	      sb.append("where pw=?");
	      boolean result = false;
	      
	      try {
	         
	         pstmt = conn.prepareStatement(sb.toString());
	         pstmt.setString(1,  pw);
	         rs = pstmt.executeQuery();
	         //true라는건 있다는 것
	         result = rs.next();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	      return result?"true":"false";
	   }
	 public String EmailIsExists(String email) {
	      sb.setLength(0);
	      sb.append("select email ");
	      sb.append("from member ");
	      sb.append("where email=?");
	      boolean result = false;
	      
	      try {
	         
	         pstmt = conn.prepareStatement(sb.toString());
	         pstmt.setString(1, email);
	         rs = pstmt.executeQuery();
	         //true라는건 있다는 것
	         result = rs.next();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	      return result?"true":"false";
	   }
	   //
	 //////////////////////////////////////////  
	 // 1/6 길준영 추가
	 /////////////////////////////////////////
	 public MemberVO sendPw(String id) {
		 sb.setLength(0);
		 sb.append("SELECT pw, id FROM MEMBER where id=?");
		 vo = new MemberVO();
		 try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			rs.next();
			String pw = rs.getString("pw");
			
			vo.setPw(pw);
			
			
		 
		 } catch (SQLException e) {
			e.printStackTrace();
		}
		 
		 
		 return vo;
	 }
	public void close() {

		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
