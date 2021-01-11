package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.JoinCartMemberProdVO;
import vo.JoinReviewOrderMemProdVO;



public class JoinReviewOrderMemProdDAO {
	Connection conn;
	PreparedStatement pstmt = null;
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	JoinReviewOrderMemProdVO vo = null;
	
	public JoinReviewOrderMemProdDAO() {
		conn = MakeConnection.getInstance().getConnection();
	}
	
	public ArrayList<JoinReviewOrderMemProdVO> reviewAll(int startNo, int endNo) {
		sb.setLength(0);
	
		
		sb.append(" SELECT reviewno,rate,prodreview,reviewdate,id, pname,thumbnailimg  ");
		sb.append(" FROM(  ");
		sb.append(" 	SELECT rownum rn, reviewno,rate,prodreview,reviewdate,id, pname,thumbnailimg  ");
		sb.append(" 	FROM ( ");
		sb.append(" 			select reviewno,rate,prodreview,reviewdate,id, pname,thumbnailimg ");
		sb.append(" 	  		 from (review left join orders on review.orderno = orders.orderno) left join member on orders.mno = member.mno left join product on orders.pno = product.pno ");
		sb.append("				 order by reviewno desc ");
		sb.append(" 		  )");
		sb.append(" 	WHERE rownum <= ?) ");
		sb.append(" WHERE rn >= ? ");
		
		
		ArrayList<JoinReviewOrderMemProdVO> list = new ArrayList<JoinReviewOrderMemProdVO>();
		try {
			pstmt = conn.prepareStatement(sb.toString());
		
			pstmt.setInt(1, endNo);
			pstmt.setInt(2, startNo);
			
		
			rs = pstmt.executeQuery();
			while (rs.next()) {
				
				/// 
				int reviewno = rs.getInt("reviewno");
				int rate = rs.getInt("rate");
		
				String  prodreview= rs.getString("prodreview");
				String  reviewdate= rs.getString("reviewdate");
				String  id= rs.getString("id");
				String  pname= rs.getString("pname");
				String  thumbnailimg= rs.getString("thumbnailimg");
			
				
				JoinReviewOrderMemProdVO vo = new JoinReviewOrderMemProdVO();
				
				vo.setReviewno(reviewno);
				vo.setRate(rate);
				vo.setProdreview(prodreview);
				vo.setReviewdate(reviewdate);
				vo.setId(id);
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
