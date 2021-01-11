package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import vo.CartVO;
import vo.ProductVO;

public class CartDAO {

	Connection conn;
	PreparedStatement pstmt = null;
	StringBuffer sb= new StringBuffer();
	ResultSet rs = null;
	
	public CartDAO() {
		// TODO Auto-generated constructor stub
		conn = MakeConnection.getInstance().getConnection();
	}
		
	
	
	
	//	�μ�Ʈ, ����Ʈ, ������Ʈ�� �ʿ�
	
	// 1���߰�
		public void add(CartVO vo) {
			sb.setLength(0);
			sb.append("insert into cart values (?, ? , ? , ? , SYSDATE  )");

			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, vo.getCartno());
				pstmt.setInt(2, vo.getMno());
				pstmt.setInt(3, vo.getPno());
				pstmt.setInt(4, vo.getCartquty());

				pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		// 1�Ǻ���
		public void modify(CartVO vo) {
			sb.setLength(0);
			sb.append("update cart set mno = ? , pno = ? , cartqty = ?, cartdate = SYSDATE where cartno = ?");

			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, vo.getMno());
				pstmt.setInt(2, vo.getPno());
				pstmt.setInt(3, vo.getCartquty());
				pstmt.setString(4, vo.getCartno());
				pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}


		// 1�� ����
		public void delete(String cartno) {
			sb.setLength(0);
			sb.append("delete cart where cartno = ?");

			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, cartno);
				pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	
		//������ ����
		
		public void deleteList(String[] m) {

			for(int i = 0; i< m.length; i++) {
				delete(m[i]);
			}
		}
		
		//20200106 전누리 추가 . 
		// 장바구니 갯수
			
		public int getTotalCount(int mno) {
					sb.setLength(0);
					sb.append("select count(*)as cnt from cart where mno = ? ");
					int count = 0;
					try {
						pstmt = conn.prepareStatement(sb.toString());
						pstmt.setInt(1, mno);
						rs = pstmt.executeQuery();
						rs.next();
						count = rs.getInt("cnt");
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					return count;
					
				}
		// 20200108 추가
		// getone 추가
		public CartVO getOne(String cartno) {
			sb.setLength(0);
			sb.append("select cartno,mno,pno,cartqty,cartdate ");
			sb.append("from cart ");
			sb.append("where cartno = ?");
			CartVO vo = null;
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, cartno);
				rs = pstmt.executeQuery();
				rs.next();
				
				vo = new CartVO();
				
				
				String cartdate = rs.getString("cartdate");
				int mno = rs.getInt("mno");
				int pno = rs.getInt("pno");
				int cartqty = rs.getInt("cartqty");
			
				vo.setCartno(cartno);
				vo.setMno(mno);
				vo.setPno(pno);
				vo.setCartquty(cartqty);
				vo.setCartdate(cartdate);
		} catch (SQLException e) {
			e.printStackTrace();
		}
			return vo;
		}//getOne() end
		
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
