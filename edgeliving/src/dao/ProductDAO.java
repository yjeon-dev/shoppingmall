package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.MemberVO;
import vo.ProductVO;

// 김소현 작품 ㅎ
public class ProductDAO {
	Connection conn;
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	StringBuffer sb = new StringBuffer();
	ProductVO vo = null;

	
	
	
	
	public ProductDAO() {
		conn = MakeConnection.getInstance().getConnection();
	}//ProductDAO ������ ��
	
	// 20200106 전누리 추가
	// 상위  10 셀렉트
	
	
	
	public ArrayList<ProductVO> top10(String column) {
		sb.setLength(0);

		sb.append("select pno,brandname,pname,price,qty,pdate,discount,recommend,search,detaildesc,thumbnailimg,largecategory,pdesc ");
		sb.append("from (select rownum,pno,brandname,pname,price,qty,pdate,discount,recommend,search,detaildesc,thumbnailimg,largecategory,pdesc ");
		sb.append(" from product  order by "+column+" desc) ");
		sb.append("where rownum <= 10");
		
		
		
		ArrayList<ProductVO> list = new ArrayList<ProductVO>();
		try {
			pstmt = conn.prepareStatement(sb.toString());
	
			
		
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int pno = rs.getInt("pno");
				String brandName = rs.getString("brandName");
				String pname = rs.getString("pname");
				int price = rs.getInt("price");
				int qty = rs.getInt("qty");
				String pdate = rs.getString("pdate");
				int discount = rs.getInt("discount");
				int recommend = rs.getInt("recommend");
				String search2 = rs.getString("search");
				String detailDesc = rs.getString("detailDesc");
				String thumbNailImg = rs.getString("thumbNailImg");
				String largeCategory = rs.getString("largeCategory");
				String pdesc = rs.getString("pdesc");
				ProductVO vo = new ProductVO();
				
				vo.setPno(pno);
				vo.setBrandName(brandName);
				vo.setPname(pname);
				vo.setPrice(price);
				vo.setQty(qty);
				vo.setPdate(pdate);
				vo.setDiscount(discount);
				vo.setRecommend(recommend);
				vo.setSearch(search2);
				vo.setDetailDesc(detailDesc);
				vo.setThumbNailImg(thumbNailImg);
				vo.setLargeCategory(largeCategory);
				vo.setPdesc(pdesc);
				list.add(vo);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	
	// 상위  10 셀렉트
	
		public ArrayList<ProductVO> recommend20() {
			sb.setLength(0);

			sb.append("select pno,brandname,pname,price,qty,pdate,discount,recommend,search,detaildesc,thumbnailimg,largecategory,pdesc ");
			sb.append("from (select rownum,pno,brandname,pname,price,qty,pdate,discount,recommend,search,detaildesc,thumbnailimg,largecategory,pdesc ");
			sb.append(" from product  order by price desc) ");
			sb.append("where rownum <= 20");
			
			
			
			ArrayList<ProductVO> list = new ArrayList<ProductVO>();
			try {
				pstmt = conn.prepareStatement(sb.toString());
				
				
			
				rs = pstmt.executeQuery();
				while (rs.next()) {
					int pno = rs.getInt("pno");
					String brandName = rs.getString("brandName");
					String pname = rs.getString("pname");
					int price = rs.getInt("price");
					int qty = rs.getInt("qty");
					String pdate = rs.getString("pdate");
					int discount = rs.getInt("discount");
					int recommend = rs.getInt("recommend");
					String search2 = rs.getString("search");
					String detailDesc = rs.getString("detailDesc");
					String thumbNailImg = rs.getString("thumbNailImg");
					String largeCategory = rs.getString("largeCategory");
					String pdesc = rs.getString("pdesc");
					ProductVO vo = new ProductVO();
					
					vo.setPno(pno);
					vo.setBrandName(brandName);
					vo.setPname(pname);
					vo.setPrice(price);
					vo.setQty(qty);
					vo.setPdate(pdate);
					vo.setDiscount(discount);
					vo.setRecommend(recommend);
					vo.setSearch(search2);
					vo.setDetailDesc(detailDesc);
					vo.setThumbNailImg(thumbNailImg);
					vo.setLargeCategory(largeCategory);
					vo.setPdesc(pdesc);
					list.add(vo);

				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return list;
		}

		// prodlist 40개씩 페이징 (신상품, 베스트40용)
				public ArrayList<ProductVO> top40(int startNo, int endNo, String orderbycategory , String ordername) {
					sb.setLength(0);

					sb.append(" SELECT pno,brandname,pname,price,qty,pdate,discount,recommend,search,detaildesc,thumbnailimg,largecategory,pdesc ");
					sb.append(" FROM(  ");
					sb.append(" 	SELECT rownum rn, pno,brandname,pname,price,qty,pdate,discount,recommend,search,detaildesc,thumbnailimg,largecategory,pdesc  ");
					sb.append(" 	FROM (SELECT pno,brandname,pname,price,qty,pdate,discount,recommend,search,detaildesc,thumbnailimg,largecategory,pdesc ");
					sb.append(" 		  FROM  product  ");
					sb.append(" 		  ");
					sb.append(" 		  ORDER BY "+orderbycategory +" desc ) ");
					sb.append(" 	WHERE rownum <= ?) ");
					sb.append(" WHERE rn >=? order by " + ordername + " ");
					
					
					ArrayList<ProductVO> list = new ArrayList<ProductVO>();
					try {
						pstmt = conn.prepareStatement(sb.toString());
						pstmt.setInt(1, endNo);
						pstmt.setInt(2, startNo);
						
					
						rs = pstmt.executeQuery();
						while (rs.next()) {
							int pno = rs.getInt("pno");
							String brandName = rs.getString("brandName");
							String pname = rs.getString("pname");
							int price = rs.getInt("price");
							int qty = rs.getInt("qty");
							String pdate = rs.getString("pdate");
							int discount = rs.getInt("discount");
							int recommend = rs.getInt("recommend");
							String search2 = rs.getString("search");
							String detailDesc = rs.getString("detailDesc");
							String thumbNailImg = rs.getString("thumbNailImg");
							String largeCategory = rs.getString("largeCategory");
							String pdesc = rs.getString("pdesc");
							ProductVO vo = new ProductVO();
							
							vo.setPno(pno);
							vo.setBrandName(brandName);
							vo.setPname(pname);
							vo.setPrice(price);
							vo.setQty(qty);
							vo.setPdate(pdate);
							vo.setDiscount(discount);
							vo.setRecommend(recommend);
							vo.setSearch(search2);
							vo.setDetailDesc(detailDesc);
							vo.setThumbNailImg(thumbNailImg);
							vo.setLargeCategory(largeCategory);
							vo.setPdesc(pdesc);
							list.add(vo);

						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

					return list;
				}
		
		
		// prodlist 40개씩 페이징 (브랜드와 대분류로 나눌 수 있도록)
		public ArrayList<ProductVO> top40(int startNo, int endNo, String searchBrand , String searchLargeCategory, String ordername) {
			sb.setLength(0);

			sb.append(" SELECT pno,brandname,pname,price,qty,pdate,discount,recommend,search,detaildesc,thumbnailimg,largecategory,pdesc ");
			sb.append(" FROM(  ");
			sb.append(" 	SELECT rownum rn, pno,brandname,pname,price,qty,pdate,discount,recommend,search,detaildesc,thumbnailimg,largecategory,pdesc  ");
			sb.append(" 	FROM (SELECT pno,brandname,pname,price,qty,pdate,discount,recommend,search,detaildesc,thumbnailimg,largecategory,pdesc ");
			sb.append(" 		  FROM  product  ");
			sb.append(" 		  where  brandname like '%" + searchBrand + "%' and largecategory like '%" + searchLargeCategory + "%'  ");
			sb.append(" 		  ORDER BY pno desc ) ");
			sb.append(" 	WHERE rownum <= ?) ");
			sb.append(" WHERE rn >=? order by " +ordername +" ");
			
			
			ArrayList<ProductVO> list = new ArrayList<ProductVO>();
			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, endNo);
				pstmt.setInt(2, startNo);
				
			
				rs = pstmt.executeQuery();
				while (rs.next()) {
					int pno = rs.getInt("pno");
					String brandName = rs.getString("brandName");
					String pname = rs.getString("pname");
					int price = rs.getInt("price");
					int qty = rs.getInt("qty");
					String pdate = rs.getString("pdate");
					int discount = rs.getInt("discount");
					int recommend = rs.getInt("recommend");
					String search2 = rs.getString("search");
					String detailDesc = rs.getString("detailDesc");
					String thumbNailImg = rs.getString("thumbNailImg");
					String largeCategory = rs.getString("largeCategory");
					String pdesc = rs.getString("pdesc");
					ProductVO vo = new ProductVO();
					
					vo.setPno(pno);
					vo.setBrandName(brandName);
					vo.setPname(pname);
					vo.setPrice(price);
					vo.setQty(qty);
					vo.setPdate(pdate);
					vo.setDiscount(discount);
					vo.setRecommend(recommend);
					vo.setSearch(search2);
					vo.setDetailDesc(detailDesc);
					vo.setThumbNailImg(thumbNailImg);
					vo.setLargeCategory(largeCategory);
					vo.setPdesc(pdesc);
					list.add(vo);

				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return list;
		}
		
		
		//20200106 전누리 추가 . 
		// 브랜드 ,대분류별 토탈 갯수
	
		public int getTotalCount(String brandname, String largecategory) {
			sb.setLength(0);
			sb.append("select count(*)as cnt from product where brandname like '%"+brandname +"%' and largecategory like '%"+ largecategory+"%' ");
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
	//20200106 전누리 추가
    // 브랜드별 대분류 뽑기
		public ArrayList<String> getLaragecategory(String brandname){
			sb.setLength(0);
			sb.append("select largecategory from product where brandname = ? group by largecategory");
			ArrayList<String> list = new ArrayList<String>();
			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, brandname);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					String largecategory = rs.getString("largecategory");
					list.add(largecategory);
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			return list;
				
		}
		
	// 20200107 전누리 추가
		
		public int getTotalCount(String search) {
			sb.setLength(0);
			sb.append("select count(*)as cnt from product where search like '%"+search+"%' ");
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
		// 검색용 제품 리스트
		public ArrayList<ProductVO> prodSearch40(int startNo, int endNo, String search , String ordername) {
			sb.setLength(0);

			sb.append(" SELECT pno,brandname,pname,price,qty,pdate,discount,recommend,search,detaildesc,thumbnailimg,largecategory,pdesc ");
			sb.append(" FROM(  ");
			sb.append(" 	SELECT rownum rn, pno,brandname,pname,price,qty,pdate,discount,recommend,search,detaildesc,thumbnailimg,largecategory,pdesc  ");
			sb.append(" 	FROM (SELECT pno,brandname,pname,price,qty,pdate,discount,recommend,search,detaildesc,thumbnailimg,largecategory,pdesc ");
			sb.append(" 		  FROM  product  ");
			sb.append(" 		  ");
			sb.append(" 		  where search like '%"+search +"%'  ) ");
			sb.append(" 	WHERE rownum <= ?) ");
			sb.append(" WHERE rn >=? order by " + ordername + " ");
			
			
			ArrayList<ProductVO> list = new ArrayList<ProductVO>();
			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, endNo);
				pstmt.setInt(2, startNo);
				
			
				rs = pstmt.executeQuery();
				while (rs.next()) {
					int pno = rs.getInt("pno");
					String brandName = rs.getString("brandName");
					String pname = rs.getString("pname");
					int price = rs.getInt("price");
					int qty = rs.getInt("qty");
					String pdate = rs.getString("pdate");
					int discount = rs.getInt("discount");
					int recommend = rs.getInt("recommend");
					String search2 = rs.getString("search");
					String detailDesc = rs.getString("detailDesc");
					String thumbNailImg = rs.getString("thumbNailImg");
					String largeCategory = rs.getString("largeCategory");
					String pdesc = rs.getString("pdesc");
					ProductVO vo = new ProductVO();
					
					vo.setPno(pno);
					vo.setBrandName(brandName);
					vo.setPname(pname);
					vo.setPrice(price);
					vo.setQty(qty);
					vo.setPdate(pdate);
					vo.setDiscount(discount);
					vo.setRecommend(recommend);
					vo.setSearch(search2);
					vo.setDetailDesc(detailDesc);
					vo.setThumbNailImg(thumbNailImg);
					vo.setLargeCategory(largeCategory);
					vo.setPdesc(pdesc);
					list.add(vo);

				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return list;
		}	
	// 전누리 작업
	// 전누리추가
		// 전체 제품 갯수 조회
		public int getTotalCount() {
			sb.setLength(0);
			sb.append("select count(*)as cnt from product ");
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
		
	// 전누리추가
	// 셀렉트 올
		public ArrayList<ProductVO> selectAll(int startNo, int endNo, String search) {
			sb.setLength(0);

			sb.append(" SELECT pno,brandname,pname,price,qty,pdate,discount,recommend,search,detaildesc,thumbnailimg,largecategory,pdesc ");
			sb.append(" FROM(  ");
			sb.append(" 	SELECT rownum rn, pno,brandname,pname,price,qty,pdate,discount,recommend,search,detaildesc,thumbnailimg,largecategory,pdesc  ");
			sb.append(" 	FROM (SELECT pno,brandname,pname,price,qty,pdate,discount,recommend,search,detaildesc,thumbnailimg,largecategory,pdesc ");
			sb.append(" 		  FROM  product  ");
			sb.append(" 		  where  search like '%" + search + "%'  ");
			sb.append(" 		  ORDER BY pno desc ) ");
			sb.append(" 	WHERE rownum <= ?) ");
			sb.append(" WHERE rn >=?  ");
			
			
			ArrayList<ProductVO> list = new ArrayList<ProductVO>();
			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, endNo);
				pstmt.setInt(2, startNo);
				
			
				rs = pstmt.executeQuery();
				while (rs.next()) {
					int pno = rs.getInt("pno");
					String brandName = rs.getString("brandName");
					String pname = rs.getString("pname");
					int price = rs.getInt("price");
					int qty = rs.getInt("qty");
					String pdate = rs.getString("pdate");
					int discount = rs.getInt("discount");
					int recommend = rs.getInt("recommend");
					String search2 = rs.getString("search");
					String detailDesc = rs.getString("detailDesc");
					String thumbNailImg = rs.getString("thumbNailImg");
					String largeCategory = rs.getString("largeCategory");
					String pdesc = rs.getString("pdesc");
					ProductVO vo = new ProductVO();
					
					vo.setPno(pno);
					vo.setBrandName(brandName);
					vo.setPname(pname);
					vo.setPrice(price);
					vo.setQty(qty);
					vo.setPdate(pdate);
					vo.setDiscount(discount);
					vo.setRecommend(recommend);
					vo.setSearch(search2);
					vo.setDetailDesc(detailDesc);
					vo.setThumbNailImg(thumbNailImg);
					vo.setLargeCategory(largeCategory);
					vo.setPdesc(pdesc);
					list.add(vo);

				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return list;
		}
	
	//1. ��ü��ȸ�ϱ�
	public ArrayList<ProductVO> getAll(){
		ArrayList<ProductVO> list = new ArrayList<ProductVO>();
		sb.setLength(0);
		sb.append("select PNO, BRANDNAME, PNAME, PRICE, QTY, ");
		sb.append("PDATE, DISCOUNT, RECOMMEND, SEARCH, ");
		sb.append("DETAILDESC, THUMBNAILIMG, LARGECATEGORY, PDESC ");
		sb.append("from product ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int pno = rs.getInt("pno");
				String brandName = rs.getString("brandName");
				String pname = rs.getString("pname");
				int price = rs.getInt("price");
				int qty = rs.getInt("qty");
				String pdate = rs.getString("pdate");
				int discount = rs.getInt("discount");
				int recommend = rs.getInt("recommend");
				String search = rs.getString("search");
				String detailDesc = rs.getString("detailDesc");
				String thumbNailImg = rs.getString("thumbNailImg");
				String largeCategory = rs.getString("largeCategory");
				String pdesc = rs.getString("pdesc");
				ProductVO vo = new ProductVO();
				vo.setPno(pno);
				vo.setBrandName(brandName);
				vo.setPname(pname);
				vo.setPrice(price);
				vo.setQty(qty);
				vo.setPdate(pdate);
				vo.setDiscount(discount);
				vo.setRecommend(recommend);
				vo.setSearch(search);
				vo.setDetailDesc(detailDesc);
				vo.setThumbNailImg(thumbNailImg);
				vo.setLargeCategory(largeCategory);
				vo.setPdesc(pdesc);
				list.add(vo);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}//getAll() end
	
	//2. 1�Ǹ� ��ȸ�ϱ�
	public ProductVO getOne(int pno) {
		sb.setLength(0);
		sb.append("select PNO, BRANDNAME, PNAME, PRICE, QTY, ");
		sb.append("PDATE, DISCOUNT, RECOMMEND, SEARCH, ");
		sb.append("DETAILDESC, THUMBNAILIMG, LARGECATEGORY, PDESC ");
		sb.append("from product ");
		sb.append("where pno = ?");
		ProductVO vo = null;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, pno);
			//���������� �������� next�Ʒ��� �������� ����
			rs = pstmt.executeQuery();
			//PK�ϱ� �ݺ����ٰ� ����
			rs.next();
			
			vo = new ProductVO();
			
			String brandName = rs.getString("brandName");
			String pname = rs.getString("pname");
			int price = rs.getInt("price");
			int qty = rs.getInt("qty");
			String pdate = rs.getString("pdate");
			int discount = rs.getInt("discount");
			int recommend = rs.getInt("recommend");
			String search = rs.getString("search");
			String detailDesc = rs.getString("detailDesc");
			String thumbNailImg = rs.getString("thumbNailImg");
			String largeCategory = rs.getString("largeCategory");
			String pdesc = rs.getString("pdesc");
			
			vo.setPno(pno);
			vo.setBrandName(brandName);
			vo.setPname(pname);
			vo.setPrice(price);
			vo.setQty(qty);
			vo.setPdate(pdate);
			vo.setDiscount(discount);
			vo.setRecommend(recommend);
			vo.setSearch(search);
			vo.setDetailDesc(detailDesc);
			vo.setThumbNailImg(thumbNailImg);
			vo.setLargeCategory(largeCategory);
			vo.setPdesc(pdesc);	
	} catch (SQLException e) {
		e.printStackTrace();
	}
		return vo;
	}//getOne() end
	
	//3. �߰��ϱ�
	public void insertOne(ProductVO vo) {
		sb.setLength(0);
		sb.append("insert into product ");
		sb.append("values (product_pno_seq.nextval, ?, ?, ?, ?, sysdate, ?, ?, ?, ?, ?, ?, ?) ");
		
		try {
		pstmt = conn.prepareStatement(sb.toString());
		pstmt.setString(1, vo.getBrandName());
		pstmt.setString(2, vo.getPname());
		pstmt.setInt(3, vo.getPrice());
		pstmt.setInt(4, vo.getQty());
		pstmt.setInt(5, vo.getDiscount());
		pstmt.setInt(6, vo.getRecommend());
		pstmt.setString(7, vo.getSearch());
		pstmt.setString(8, vo.getDetailDesc());
		pstmt.setString(9, vo.getThumbNailImg());
		pstmt.setString(10, vo.getLargeCategory());
		pstmt.setString(11, vo.getPdesc());
		
		pstmt.executeUpdate();
		//rs.next();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}//insertOne() end
	
	//4. �����ϱ�
	//�ϴ� ����, ������, ����ϸ� �ٲٴ°ɷ� �����
	public void modify(ProductVO vo) {
		sb.setLength(0);
		sb.append("update product ");
		sb.append("set price = ?, pdate = sysdate, discount = ? ");
		sb.append("where pno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, vo.getPrice());
			pstmt.setInt(2, vo.getDiscount());
			pstmt.setInt(3, vo.getPno());
			
			pstmt.executeUpdate();
			//rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//modify() end
	
	
	//5. �����ϱ�
	public void deleteOne(int pno) {
		sb.setLength(0);
		sb.append("delete product ");
		sb.append("where pno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, pno);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//deleteOne() end
	//20200109
	// 전누리추가
		public void deleteList(int[] m) {

			
			for(int i = 0; i< m.length; i++) {
				deleteOne(m[i]);
			}
			
		}
	//�ڿ��ݳ�
		// 전예슬 추가
		
		public void raiseLike(int pno) {
			sb.setLength(0);
			sb.append("UPDATE PRODUCT ");
			sb.append("SET recommend=recommend+1");
			sb.append("WHERE PNO = ? ");
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, pno);
				pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
		}
	public void close() {
		try {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}//close() end
}
