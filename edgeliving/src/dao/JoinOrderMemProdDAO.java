package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import vo.JoinOrderMemProdVO;
import vo.JoinReviewOrderMemProdVO;

public class JoinOrderMemProdDAO {
	Connection conn;
	PreparedStatement pstmt = null;
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	JoinOrderMemProdVO vo = null;
	
	public JoinOrderMemProdDAO() {
		conn = MakeConnection.getInstance().getConnection();
	}
	
	public ArrayList<JoinOrderMemProdVO> orderlistOne(int startNo, int endNo,int mno) {
		sb.setLength(0);
	
		
		sb.append(" SELECT orderno, orderqty,orderprice,orderdc,orderstatus,mno, pno, thumbnailimg, pname  ");
		sb.append(" FROM(  ");
		sb.append(" 	SELECT rownum rn, orderno, orderqty,orderprice,orderdc,orderstatus,mno,pno, thumbnailimg, pname  ");
		sb.append(" 	FROM ( ");
		sb.append(" 			select orderno, orderqty,orderprice,orderdc,orderstatus,aaa.mno,product.pno pno, product.thumbnailimg thumbnailimg, pname ");
		sb.append(" 	  		 from (select orderno, orderqty,orderprice,orderdc,orderstatus,orders.mno,orders.pno  from orders left join member on orders.mno = member.mno where orders.mno = ? )aaa  ");
		sb.append("				 left join product on aaa.pno = product.pno ");
		sb.append(" 		  )");
		sb.append(" 	WHERE rownum <= ?) ");
		sb.append(" WHERE rn >= ? ");
		
		
		ArrayList<JoinOrderMemProdVO> list = new ArrayList<JoinOrderMemProdVO>();
		try {
			pstmt = conn.prepareStatement(sb.toString());
		
			pstmt.setInt(1, mno);
			pstmt.setInt(2, endNo);
			pstmt.setInt(3, startNo);
			
		
			rs = pstmt.executeQuery();
			while (rs.next()) {
				
				/// 
				
				int mno2 = rs.getInt("mno");
				int pno = rs.getInt("pno");
				int orderqty = rs.getInt("orderqty");
				int orderprice = rs.getInt("orderprice");
				int orderdc = rs.getInt("orderdc");
				int orderstatus = rs.getInt("orderstatus");
				
		
				String  orderno= rs.getString("orderno");
				String  pname= rs.getString("pname");
				String  thumbnailimg= rs.getString("thumbnailimg");
			
				
				JoinOrderMemProdVO vo = new JoinOrderMemProdVO();
				
				vo.setMno(mno2);
				vo.setPno(pno);
				vo.setOrderqty(orderqty);
				vo.setOrderprice(orderprice);
				vo.setOrderdc(orderdc);
				vo.setOrderstatus(orderstatus);
				vo.setOrderno(orderno);
				vo.setPname(pname);
				vo.setThumbnailimg(thumbnailimg);
				
				list.add(vo);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	public ArrayList<JoinOrderMemProdVO> orderlistAll(int startNo, int endNo) {
		sb.setLength(0);
	
		
		sb.append(" SELECT orderno, orderqty,orderprice,orderdc,orderstatus,mno, pno, thumbnailimg, pname  ");
		sb.append(" FROM(  ");
		sb.append(" 	SELECT rownum rn, orderno, orderqty,orderprice,orderdc,orderstatus,mno,pno, thumbnailimg, pname  ");
		sb.append(" 	FROM ( ");
		sb.append(" 			select orderno, orderqty,orderprice,orderdc,orderstatus,aaa.mno,product.pno pno, product.thumbnailimg thumbnailimg, pname ");
		sb.append(" 	  		 from (select orderno, orderqty,orderprice,orderdc,orderstatus,orders.mno,orders.pno  from orders left join member on orders.mno = member.mno )aaa  ");
		sb.append("				 left join product on aaa.pno = product.pno ");
		sb.append(" 		  )");
		sb.append(" 	WHERE rownum <= ?) ");
		sb.append(" WHERE rn >= ? ");
		
		
		ArrayList<JoinOrderMemProdVO> list = new ArrayList<JoinOrderMemProdVO>();
		try {
			pstmt = conn.prepareStatement(sb.toString());
		
			
			pstmt.setInt(1, endNo);
			pstmt.setInt(2, startNo);
			
		
			rs = pstmt.executeQuery();
			while (rs.next()) {
				
				/// 
				
				int mno2 = rs.getInt("mno");
				int pno = rs.getInt("pno");
				int orderqty = rs.getInt("orderqty");
				int orderprice = rs.getInt("orderprice");
				int orderdc = rs.getInt("orderdc");
				int orderstatus = rs.getInt("orderstatus");
				
		
				String  orderno= rs.getString("orderno");
				String  pname= rs.getString("pname");
				String  thumbnailimg= rs.getString("thumbnailimg");
			
				
				JoinOrderMemProdVO vo = new JoinOrderMemProdVO();
				
				vo.setMno(mno2);
				vo.setPno(pno);
				vo.setOrderqty(orderqty);
				vo.setOrderprice(orderprice);
				vo.setOrderdc(orderdc);
				vo.setOrderstatus(orderstatus);
				vo.setOrderno(orderno);
				vo.setPname(pname);
				vo.setThumbnailimg(thumbnailimg);
				
				list.add(vo);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	
	
	public void close() {
		try {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
