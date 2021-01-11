package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.CommentsVO;

public class CommentsDAO {
	Connection conn;
	PreparedStatement pstmt = null;
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	CommentsVO vo = null;

	public CommentsDAO() {
		// TODO Auto-generated constructor stub
		conn = MakeConnection.getInstance().getConnection();
	}

	public CommentsVO getOne(int bno) {
		sb.setLength(0);
		sb.append("select cno,bno,mno,cdate,cdesc ");
		sb.append("from comments ");
		sb.append("where bno = ?");
		CommentsVO vo = null;

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);

			rs = pstmt.executeQuery();

			rs.next();

			vo = new CommentsVO();

			int cno = rs.getInt("cno");
			int bno2 = rs.getInt("bno");
			int mno = rs.getInt("mno");
			String cdate = rs.getString("cdate");
			String cdesc = rs.getString("cdesc");

			vo.setCno(cno);
			vo.setBno(bno2);
			vo.setMno(mno);
			vo.setCdesc(cdesc);
			vo.setCdate(cdate);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}// getOne() end

	// 1���߰�
	public void add(CommentsVO vo) {
		sb.setLength(0);
		sb.append("insert into comments values (COMMENTS_CNO_SEQ.NEXTVAL, ? , ? ,  SYSDATE , ?  )");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, vo.getBno());
			pstmt.setInt(2, vo.getMno());
			pstmt.setString(3, vo.getCdesc());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// 1�Ǻ���
	public void modify(CommentsVO vo) {
		sb.setLength(0);
		sb.append("update comments set bno = ? , mno = ? , cdesc = ?, cdate = SYSDATE where cno = ?");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, vo.getBno());
			pstmt.setInt(2, vo.getMno());
			pstmt.setString(3, vo.getCdesc());
			pstmt.setInt(4, vo.getCno());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// 1�� ����
	public void delete(int cartno) {
		sb.setLength(0);
		sb.append("delete comments where cno = ?");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, cartno);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// ������ ����

	public void deleteList(int[] m) {

		for (int i = 0; i < m.length; i++) {
			delete(m[i]);
		}
	}

	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (conn != null)
				conn.close();
			if (pstmt != null)
				pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
