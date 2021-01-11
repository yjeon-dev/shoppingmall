package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import vo.BoardsVO;
public class BoardsDAO {
	 Connection conn;
	   ResultSet rs = null;
	   PreparedStatement pstmt = null;
	   StringBuffer sb = new StringBuffer();
	   BoardsVO vo = null;

	   public BoardsDAO() {
	      conn = MakeConnection.getInstance().getConnection();
	   }
	   
	   
	   /*
	    * public ArrayList<BoardsVO> getAll() { sb.setLength(0); sb.
	    * append("SELECT bno,btitle,bdesc,bdate,boardgroup,mno,pno,orderno,bcategory "
	    * ); sb.append("FROM (SELECT  ");
	    * 
	    * return null; }
	    */
	   
	   
	   //�Խñ� �ۼ� ���
	   public void insertOne(BoardsVO vo) {
	      
	    
	      sb.setLength(0);
	      sb.append("INSERT INTO BOARDS ");
	      sb.append("VALUES (BOARDS_BNO_SEQ.NEXTVAL, ?,?,SYSDATE,?,?,?,?,?) ");

	      try {
	         pstmt = conn.prepareStatement(sb.toString());
	         pstmt.setString(1, vo.getBtitle());
	         pstmt.setString(2, vo.getBdesc());
	         pstmt.setInt(3, vo.getBoardgroup());
	         pstmt.setInt(4, vo.getMno());
	         pstmt.setInt(5, vo.getPno());
	         pstmt.setString(6, vo.getOrderno());
	         pstmt.setString(7, vo.getBcategory());
	         pstmt.executeQuery();

	      } catch (SQLException e) {
	         e.printStackTrace();
	      }

	   }

	   // �Խñ� �Ѱ� ���� �� �ִ� ���
	   public void deleteOne(int bno) {
	      sb.setLength(0);
	      sb.append("delete Boards WHERE bno=?");

	      try {
	         pstmt = conn.prepareStatement(sb.toString());
	         pstmt.setInt(1, vo.getBno());
	         pstmt.executeUpdate();

	      } catch (SQLException e) {
	         e.printStackTrace();
	      }

	   }

	   // �Խ��� ������ ���� �� �ִ� ���
	   public void deleteList(String[] list) {
	      sb.setLength(0);
	      for (int i = 0; i < list.length; i++) {
	         deleteOne(Integer.parseInt(list[i]));
	      }
	   }

		// ***페이징
		public int getTotalCount(int boardgroup) {
			sb.setLength(0);
			
			sb.append("select count(*)as cnt from boards where boardgroup = ? ");
			int count = 0;
			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, boardgroup);
				rs = pstmt.executeQuery();

				rs.next();
				count = rs.getInt("cnt");
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return count;
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
	         e.printStackTrace();
	      }
	   }

}
