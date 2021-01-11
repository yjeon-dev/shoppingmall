package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import vo.JoinBoardsMemberProdVO;

public class JoinBoardsMemberProdDAO {
	Connection conn;
	PreparedStatement pstmt = null;
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	JoinBoardsMemberProdVO vo = null;

	public JoinBoardsMemberProdDAO() {
		conn = MakeConnection.getInstance().getConnection();
	}

	public ArrayList<JoinBoardsMemberProdVO> viewboardAll(int startNo, int endNo, int boardgroup) {
		sb.setLength(0);

		sb.append(" select bno, bdesc ,thumbnailimg , pname, btitle , id , bdate, mno ");
		sb.append(" FROM(  ");
		sb.append(" 	select rownum rn, bno, bdesc ,thumbnailimg , pname, btitle , id , bdate, mno  ");
		sb.append(" 	FROM ( ");
		sb.append(" 			select bno, bdesc ,thumbnailimg , pname, btitle , id , bdate, mno ");
		sb.append(" 	  		from( ");
		sb.append(
				" 			       select bno ,btitle , bdate, boards.mno as mno , pno, bdesc, boardgroup, bcategory, member.id as id ");
		sb.append("					    from boards left join member on boards.mno = member.mno ");
		sb.append("					    where boardgroup= ? ");
		sb.append("				     )btom left join product on btom.pno = product.pno ");
		sb.append("						order by bdate desc");
		sb.append(" 		  )");
		sb.append(" 	WHERE rownum <= ?) ");
		sb.append(" WHERE rn >= ? ");

		ArrayList<JoinBoardsMemberProdVO> list = new ArrayList<JoinBoardsMemberProdVO>();

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, boardgroup);
			pstmt.setInt(2, endNo);
			pstmt.setInt(3, startNo);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				int bno = rs.getInt("bno");
				String bdesc = rs.getString("bdesc");
				String thumbnailimg = rs.getString("thumbnailimg");
				String pname = rs.getString("pname");
				String btitle = rs.getString("btitle");
				String id = rs.getString("id");
				Date bdate = rs.getDate("bdate");
				int mno2 = rs.getInt("mno");

				JoinBoardsMemberProdVO vo = new JoinBoardsMemberProdVO();

				vo.setBno(bno);
				vo.setBdesc(bdesc);
				vo.setThumbnailimg(thumbnailimg);
				vo.setPname(pname);
				vo.setBtitle(btitle);
				vo.setId(id);
				vo.setBdate(bdate);
				vo.setMno(mno2);

				list.add(vo);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;

	}

	public ArrayList<JoinBoardsMemberProdVO> top5(int boardgroup) {
		sb.setLength(0);

		sb.append(" 	select bno, bdesc ,thumbnailimg , pname, btitle , id , bdate, mno  ");
		sb.append(" 	FROM ( ");
		sb.append(" 			select bno, bdesc ,thumbnailimg , pname, btitle , id , bdate, mno ");
		sb.append(" 	  		from( ");
		sb.append(
				" 			       select bno ,btitle , bdate, boards.mno as mno , pno, bdesc, boardgroup, bcategory, member.id as id ");
		sb.append("					    from boards left join member on boards.mno = member.mno ");
		sb.append("					    where boardgroup= ? ");
		sb.append("				     )btom left join product on btom.pno = product.pno ");
		sb.append("						order by bdate desc ");
		sb.append(" 		  ) ");
		sb.append(" 	WHERE rownum <= 5 ");

		ArrayList<JoinBoardsMemberProdVO> list = new ArrayList<JoinBoardsMemberProdVO>();

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, boardgroup);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				int bno = rs.getInt("bno");
				String bdesc = rs.getString("bdesc");
				String thumbnailimg = rs.getString("thumbnailimg");
				String pname = rs.getString("pname");
				String btitle = rs.getString("btitle");
				String id = rs.getString("id");
				Date bdate = rs.getDate("bdate");
				int mno2 = rs.getInt("mno");

				JoinBoardsMemberProdVO vo = new JoinBoardsMemberProdVO();

				vo.setBno(bno);
				vo.setBdesc(bdesc);
				vo.setThumbnailimg(thumbnailimg);
				vo.setPname(pname);
				vo.setBtitle(btitle);
				vo.setId(id);
				vo.setBdate(bdate);
				vo.setMno(mno2);

				list.add(vo);

			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return list;

	}

	public JoinBoardsMemberProdVO getOne(int boardgroup, int bno) {

		sb.setLength(0);
		sb.append(" 			select bno, bdesc ,thumbnailimg , pname, btitle , id , bdate, mno ");
		sb.append(" 	  		from( ");
		sb.append(
				" 			       select bno ,btitle , bdate, boards.mno as mno , pno, bdesc, boardgroup, bcategory, member.id as id ");
		sb.append("					    from boards left join member on boards.mno = member.mno ");
		sb.append("					    where boardgroup= ? ");
		sb.append("				     )btom left join product on btom.pno = product.pno where bno = ? ");
		JoinBoardsMemberProdVO vo = null;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, boardgroup);
			pstmt.setInt(2, bno);
			rs = pstmt.executeQuery();
			rs.next();

			int bno2 = rs.getInt("bno");
			String bdesc = rs.getString("bdesc");
			String thumbnailimg = rs.getString("thumbnailimg");
			String pname = rs.getString("pname");
			String btitle = rs.getString("btitle");
			String id = rs.getString("id");
			Date bdate = rs.getDate("bdate");
			int mno3 = rs.getInt("mno");
			

			 vo = new JoinBoardsMemberProdVO();

			vo.setBno(bno2);
			vo.setBdesc(bdesc);
			vo.setThumbnailimg(thumbnailimg);
			vo.setPname(pname);
			vo.setBtitle(btitle);
			vo.setId(id);
			vo.setBdate(bdate);
			vo.setMno(mno3);

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return vo;

	}

	// ***페이징
	public int getTotalCount(int mno) {
		sb.setLength(0);

		sb.append("select count(*)as cnt from boards ");
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
