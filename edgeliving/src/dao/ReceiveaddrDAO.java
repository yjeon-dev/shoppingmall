package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.ReceiveaddrVO;

public class ReceiveaddrDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@orcl.c6vkvg8hqxfc.ap-northeast-2.rds.amazonaws.com:1521:orcl";
	String user = "scott";
	String password = "tigertiger";
	Connection conn = null;
	PreparedStatement pstmt = null;
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;

	public ReceiveaddrDAO() {

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// -----------------------------------------------------//
	// 1. ����Ʈ�� ��ü ��ȸ getAll
	public ArrayList<ReceiveaddrVO> getAll() {
		sb.setLength(0);
		sb.append("SELECT rno, mno, receiveaddrpost, receiveaddrbasic, status, receiveaddrdetail ");
		sb.append("FROM receiveaddr ");

		ArrayList<ReceiveaddrVO> list = new ArrayList<ReceiveaddrVO>();

		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ReceiveaddrVO vo = new ReceiveaddrVO();

				int rno = rs.getInt("rno");
				int mno = rs.getInt("mno");

				String receiveaddrpost = rs.getString("receiveaddrpost");
				String receiveaddrbasic = rs.getString("receiveaddrbasic");

				int status = rs.getInt("status");
				String receiveaddrdetail = rs.getString("receiveaddrdetail");

				vo.setRno(rno);
				vo.setMno(mno);

				vo.setReceiveaddrpost(receiveaddrpost);
				vo.setReceiveaddrbasic(receiveaddrbasic);

				vo.setStatus(status);
				vo.setReceiveaddrdetail(receiveaddrdetail);

				list.add(vo);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// 김소현 변경 
	public ArrayList<ReceiveaddrVO> getOne2(int mno) {

		sb.setLength(0);
		sb.append("SELECT rno, mno, receiveaddrpost, receiveaddrbasic, status, receiveaddrdetail ");
		sb.append("FROM receiveaddr ");
		sb.append("WHERE mno = ? ");

		
		ArrayList<ReceiveaddrVO> list = new ArrayList<ReceiveaddrVO>();
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, mno);
			rs = pstmt.executeQuery();

			
			while (rs.next()) {
				ReceiveaddrVO vo = new ReceiveaddrVO();

				int rno = rs.getInt("rno");
				int mno2 = rs.getInt("mno");

				String receiveaddrpost = rs.getString("receiveaddrpost");
				String receiveaddrbasic = rs.getString("receiveaddrbasic");

				int status = rs.getInt("status");
				String receiveaddrdetail = rs.getString("receiveaddrdetail");

				vo.setRno(rno);
				vo.setMno(mno2);

				vo.setReceiveaddrpost(receiveaddrpost);
				vo.setReceiveaddrbasic(receiveaddrbasic);

				vo.setStatus(status);
				vo.setReceiveaddrdetail(receiveaddrdetail);

				list.add(vo);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	// 2. getOne �ϳ� ��ȸ�ϱ�
	public ReceiveaddrVO getOne(int rno2) {

		sb.setLength(0);
		sb.append("SELECT rno, mno, receiveaddrpost, receiveaddrbasic, status, receiveaddrdetail ");
		sb.append("FROM receiveaddr ");
		sb.append("WHERE RNO = ? ");

		ReceiveaddrVO vo = new ReceiveaddrVO();

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, rno2);
			rs = pstmt.executeQuery();

			rs.next();
			int rno = rs.getInt("rno");
			int mno = rs.getInt("mno");

			String receiveaddrpost = rs.getString("receiveaddrpost");
			String receiveaddrbasic = rs.getString("receiveaddrbasic");

			int status = rs.getInt("status");
			String receiveaddrdetail = rs.getString("receiveaddrdetail");

			vo.setRno(rno);
			vo.setMno(mno);

			vo.setReceiveaddrpost(receiveaddrpost);
			vo.setReceiveaddrbasic(receiveaddrbasic);

			vo.setStatus(status);
			vo.setReceiveaddrdetail(receiveaddrdetail);

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return vo;
	}

	// 3. insertOne ������ �Է�
	public void insertOne(ReceiveaddrVO vo) {
		sb.setLength(0);
		sb.append("INSERT INTO receiveaddr ");
		sb.append("VALUES(RECEIVEADDR_RNO_SEQ.NEXTVAL, ? , ? , ? , ? , ? ) ");

		try {
			pstmt = conn.prepareStatement(sb.toString());

			pstmt.setInt(1, vo.getMno());
			pstmt.setString(2, vo.getReceiveaddrpost());
			pstmt.setString(3, vo.getReceiveaddrbasic());
			pstmt.setInt(4, vo.getStatus());
			pstmt.setString(5, vo.getReceiveaddrdetail());

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	// 김소현 modify 변경 및추가
	public void modify(int rno, ReceiveaddrVO vo) {
		sb.setLength(0);
		sb.append("UPDATE receiveaddr ");
		sb.append("SET mno=?, receiveaddrpost=?, receiveaddrbasic=?, status=?, receiveaddrdetail=?");
		sb.append("where rno=? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());

			pstmt.setInt(1, vo.getMno());
			pstmt.setString(2, vo.getReceiveaddrpost());
			pstmt.setString(3, vo.getReceiveaddrbasic());
			pstmt.setInt(4, vo.getStatus());
			pstmt.setString(5, vo.getReceiveaddrdetail());
			pstmt.setInt(6, rno);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	// 4. modify ������ ����
	public void modify(ReceiveaddrVO vo) {
		sb.setLength(0);
		sb.append("UPDATE receiveaddr ");
		sb.append("SET mno=?, receiveaddrpost=?, receiveaddrbasic=?, status=?, receiveaddrdetail=?");
		sb.append("where rno=? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());

			pstmt.setInt(1, vo.getMno());
			pstmt.setString(2, vo.getReceiveaddrpost());
			pstmt.setString(3, vo.getReceiveaddrbasic());
			pstmt.setInt(4, vo.getStatus());
			pstmt.setString(5, vo.getReceiveaddrdetail());
			pstmt.setInt(6, vo.getRno());

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	// 5. deleteOne ������ ����
	public void deleteOne(int rno) {
		sb.setLength(0);
		sb.append("DELETE receiveaddr ");
		sb.append("WHERE rno=? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, rno);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 6. deleteList ������ �����
	public void deleteList(int[] m) {
		for (int i = 0; i < m.length; i++) {
			deleteOne(m[i]);
		}
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
			e.printStackTrace();
		}

	}
}
