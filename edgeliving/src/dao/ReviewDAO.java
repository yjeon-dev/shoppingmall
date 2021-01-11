package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.ReviewVO;

public class ReviewDAO {
	ReviewVO vo=null;
	Connection conn;
	PreparedStatement pstmt = null;
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;

	
	public ReviewDAO() {
		conn = MakeConnection.getInstance().getConnection();
	}



	// 1. �ı� �ۼ��ϱ�
	public void insertOne(ReviewVO vo) {
		sb.setLength(0);
		sb.append("insert into review ");
		sb.append("values (review_reviewno_seq.nextval, ?,?,sysdate,?) ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, vo.getRate());
			pstmt.setString(2, vo.getProdReview());
			pstmt.setString(3, vo.getOrderNo());

			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}// insertOne() end

	
	public void modify(ReviewVO vo) {
		sb.setLength(0);
		sb.append("update review ");
		sb.append("set prodReview = ?, reviewDate = sysdate, orderNo = ?");
		sb.append("where reviewno = ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getProdReview());
			pstmt.setString(2, vo.getOrderNo());
			pstmt.setInt(3, vo.getReviewNo());

			pstmt.executeUpdate();
			rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}// modify() end


	public void deleteOne(int reviewNo) {
		sb.setLength(0);
		sb.append("delete review ");
		sb.append("where reviewno = ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, reviewNo);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}// deleteOne() end


	
	public void deleteList(String[] list) {
		sb.setLength(0);
		for (int i = 0; i < list.length; i++) {
			deleteOne(Integer.parseInt(list[i]));
		}
	}

	// ***페이징
	public int getTotalCount() {
		sb.setLength(0);
		
		sb.append("select count(*)as cnt from review ");
		int count = 0;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();

			rs.next();
			count = rs.getInt("cnt");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	// 5. �ڿ��ݳ�
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
	}// close() end
}
