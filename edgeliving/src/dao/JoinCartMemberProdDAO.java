package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.JoinCartMemberProdVO;
import vo.ProductVO;

public class JoinCartMemberProdDAO {
	Connection conn;
	PreparedStatement pstmt = null;
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	JoinCartMemberProdVO vo = null;
	
	public JoinCartMemberProdDAO() {
		conn = MakeConnection.getInstance().getConnection();
	}
	
	
	// prodlist 40개씩 페이징 (신상품, 베스트40용)
	public ArrayList<JoinCartMemberProdVO> viewcartAll(int startNo, int endNo, int mno) {
		sb.setLength(0);
	
		
		sb.append(" SELECT cartno, mno ,  pno, cartqty, cartdate,id,mname,autority,point, brandname, pname, price,qty,discount,search,thumbnailimg,largecategory,pdesc  ");
		sb.append(" FROM(  ");
		sb.append(" 	SELECT rownum rn, cartno, mno , pno, cartqty, cartdate,id,mname,autority,point, brandname, pname, price,qty,discount,search,thumbnailimg,largecategory,pdesc  ");
		sb.append(" 	FROM ( ");
		sb.append(" 			select cartno, mno , product.pno as pno, cartqty, cartdate, ");
		sb.append("			     	   id,mname,autority,point, ");
		sb.append("				 	   brandname, pname, price,qty,discount,search,thumbnailimg,largecategory,pdesc ");
		sb.append(" 	  		from( ");
		sb.append(" 			       select cartno, cart.mno as mno , pno, cartqty, cartdate, ");
		sb.append("					          id,mname,autority,point  ");
		sb.append("					    from cart left join member on cart.mno = member.mno ");
		sb.append("					    where cart.mno= ? ");
		sb.append("				     )ctom left join product on ctom.pno = product.pno ");
		sb.append("						order by cartdate desc");
		sb.append(" 		  )");
		sb.append(" 	WHERE rownum <= ?) ");
		sb.append(" WHERE rn >= ? ");
		
		
		ArrayList<JoinCartMemberProdVO> list = new ArrayList<JoinCartMemberProdVO>();
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, mno);
			pstmt.setInt(2, endNo);
			pstmt.setInt(3, startNo);
			
		
			rs = pstmt.executeQuery();
			while (rs.next()) {
				
				/// 
				int cartqty = rs.getInt("cartqty");
				int mno2 = rs.getInt("mno");
				int autority= rs.getInt("autority");
				int point= rs.getInt("point");
				int pno= rs.getInt("pno");
				int price= rs.getInt("price");
				int qty= rs.getInt("qty");
				int discount= rs.getInt("discount");
								
				String  cartno= rs.getString("cartno");
				String  cartdate= rs.getString("cartdate");
				String  id= rs.getString("id");
				String  mname= rs.getString("mname");
				String  brandname= rs.getString("brandname");
				String  pname= rs.getString("pname");
				String  search= rs.getString("search");
				String  thumbnailimg= rs.getString("thumbnailimg");
				String  largecategory= rs.getString("largecategory");
				String  pdesc= rs.getString("pdesc");
				
				JoinCartMemberProdVO vo = new JoinCartMemberProdVO();
				
				vo.setCartqty(cartqty);
				vo.setMno(mno2);
				vo.setAutority(autority);
				vo.setPoint(point);
				vo.setPno(pno);
				vo.setPrice(price);
				vo.setQty(qty);
				vo.setDiscount(discount);
				vo.setCartno(cartno);
				vo.setCartdate(cartdate);
				vo.setId(id);
				vo.setMname(mname);
				vo.setBrandname(brandname);
				vo.setPname(pname);
				vo.setSearch(search);
				vo.setThumbnailimg(thumbnailimg);
				vo.setLargecategory(largecategory);
				vo.setPdesc(pdesc);
			
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
