package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.OrdersVO;

public class OrdersDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@orcl.c6vkvg8hqxfc.ap-northeast-2.rds.amazonaws.com:1521:orcl";
	String user = "scott";
	String password = "tigertiger";
	Connection conn = null;
	PreparedStatement pstmt = null;
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;

	public OrdersDAO() {

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
			

		} catch (ClassNotFoundException e) {
			
		} catch (SQLException e) {
			
		}
	}

	// ----------------------------------------------------//
	// 1. ����Ʈ�� ��ü ��ȸ getAll

	public ArrayList<OrdersVO> getAll() {

		sb.setLength(0);
		sb.append("SELECT orderno, ordername, orderphone, orderreceivepost, "
				+ "orderreceivebasic, orderqty, orderprice,orderdc,orderstatus,mno,pno,"
				+ "ordertel,orderreceivedetail,ordermsg ");
		sb.append("FROM ORDERS ");

		ArrayList<OrdersVO> list = new ArrayList<OrdersVO>();

		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				OrdersVO vo = new OrdersVO();

				String orderno = rs.getString("orderno");
				String ordername = rs.getString("ordername");
				String orderphone = rs.getString("orderphone");
				String orderreceivepost = rs.getString("orderreceivepost");
				String orderreceivebasic = rs.getString("orderreceivebasic");

				int orderqty = rs.getInt("orderqty");
				int orderprice = rs.getInt("orderprice");
				int orderdc = rs.getInt("orderdc");
				int orderstatus = rs.getInt("orderstatus");
				int mno = rs.getInt("mno");
				int pno = rs.getInt("pno");

				String ordertel = rs.getString("ordertel");
				String orderreceivedetail = rs.getString("orderreceivedetail");
				String ordermsg = rs.getString("ordermsg");

				vo.setOrderdc(orderdc);
				vo.setMno(mno);
				vo.setOrdermsg(ordermsg);
				vo.setOrdername(ordername);
				vo.setOrderno(orderno);
				vo.setOrderphone(orderphone);
				vo.setOrderprice(orderprice);
				vo.setOrderqty(orderqty);
				vo.setOrderreceivebasic(orderreceivebasic);
				vo.setOrderreceivedetail(orderreceivedetail);
				vo.setOrderreceivepost(orderreceivepost);
				vo.setOrderstatus(orderstatus);
				vo.setOrdertel(ordertel);
				vo.setPno(pno);

				list.add(vo);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;

	}

	// 2. getOne
	public OrdersVO getOne(String orderno2) {

		sb.setLength(0);
		sb.append("SELECT orderno, ordername, orderphone, orderreceivepost, "
				+ "orderreceivebasic, orderqty, orderprice,orderdc,orderstatus,mno,pno,"
				+ "ordertel,orderreceivedetail,ordermsg ");
		sb.append("FROM ORDERS ");
		sb.append("where orderno = ? ");

		OrdersVO vo = new OrdersVO();

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, orderno2);
			rs = pstmt.executeQuery();

			rs.next();
			String orderno = rs.getString("orderno");
			String ordername = rs.getString("ordername");
			String orderphone = rs.getString("orderphone");
			String orderreceivepost = rs.getString("orderreceivepost");
			String orderreceivebasic = rs.getString("orderreceivebasic");

			int orderqty = rs.getInt("orderqty");
			int orderprice = rs.getInt("orderprice");
			int orderdc = rs.getInt("orderdc");
			int orderstatus = rs.getInt("orderstatus");
			int mno = rs.getInt("mno");
			int pno = rs.getInt("pno");

			String ordertel = rs.getString("ordertel");
			String orderreceivedetail = rs.getString("orderreceivedetail");
			String ordermsg = rs.getString("ordermsg");

			vo.setOrderdc(orderdc);
			vo.setMno(mno);
			vo.setOrdermsg(ordermsg);
			vo.setOrdername(ordername);
			vo.setOrderno(orderno);
			vo.setOrderphone(orderphone);
			vo.setOrderprice(orderprice);
			vo.setOrderqty(orderqty);
			vo.setOrderreceivebasic(orderreceivebasic);
			vo.setOrderreceivedetail(orderreceivedetail);
			vo.setOrderreceivepost(orderreceivepost);
			vo.setOrderstatus(orderstatus);
			vo.setOrdertel(ordertel);
			vo.setPno(pno);

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return vo;
	}

	// 3. insertOne
	public void insertOne(OrdersVO vo) {
		sb.setLength(0);
		sb.append("INSERT INTO ORDERS ");
		sb.append("VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ");

		// int mno = parseInt(request.getParameter());

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getOrderno());
			pstmt.setString(2, vo.getOrdername());
			pstmt.setString(3, vo.getOrderphone());
			pstmt.setString(4, vo.getOrderreceivepost());
			pstmt.setString(5, vo.getOrderreceivebasic());

			pstmt.setInt(6, vo.getOrderqty());
			pstmt.setInt(7, vo.getOrderprice());
			pstmt.setInt(8, vo.getOrderdc());
			pstmt.setInt(9, vo.getOrderstatus());
			pstmt.setInt(10, vo.getMno());
			pstmt.setInt(11, vo.getPno());

			pstmt.setString(12, vo.getOrdertel());
			pstmt.setString(13, vo.getOrderreceivedetail());
			pstmt.setString(14, vo.getOrdermsg());

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 4.modify
	public void modify(OrdersVO vo) {
		sb.setLength(0);
		sb.append("UPDATE ORDERS ");
		sb.append("SET ordername=?, orderphone=?, " + "orderreceivepost=?, orderreceivebasic=?, orderqty=?, "
				+ "orderprice=?, orderdc=?, orderstatus=? ,mno=?, pno=?,  "
				+ "ordertel=? ,orderreceivedetail=? , ordermsg=? ");
		sb.append("where ORDERNO=? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());

			pstmt.setString(1, vo.getOrdername());
			pstmt.setString(2, vo.getOrderphone());
			pstmt.setString(3, vo.getOrderreceivepost());
			pstmt.setString(4, vo.getOrderreceivebasic());

			pstmt.setInt(5, vo.getOrderqty());
			pstmt.setInt(6, vo.getOrderprice());
			pstmt.setInt(7, vo.getOrderdc());
			pstmt.setInt(8, vo.getOrderstatus());
			pstmt.setInt(9, vo.getMno());
			pstmt.setInt(10, vo.getPno());

			pstmt.setString(11, vo.getOrdertel());
			pstmt.setString(12, vo.getOrderreceivedetail());
			pstmt.setString(13, vo.getOrdermsg());

			pstmt.setString(14, vo.getOrderno());

			pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

	// 5. deleteOne
	public void deleteOne(String orderno2) {
		sb.setLength(0);
		sb.append("DELETE ORDERS ");
		sb.append("WHERE ORDERNO=? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());

			pstmt.setString(1, orderno2);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 6. deleteList ������ �����
	public void deleteList(String[] m) {

		for (int i = 0; i < m.length; i++) {
			deleteOne(m[i]);
		}
	}

	//20200109 전누리 추가 . 
	// 주문 전체건
		
	public int getTotalCount() {
		sb.setLength(0);
		sb.append("select count(*)as cnt from orders  ");
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
	
	//20200109 전누리 추가 . 
	// 사용자의 주문 전체건
			
	public int getTotalCount(int mno) {
		sb.setLength(0);
		sb.append("select count(*)as cnt from orders  where mno = ? ");
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
		
	public int getTotalCount(int mno,int orderstatus) {
		sb.setLength(0);
		sb.append("select count(*)as cnt from orders  where mno = ? and orderstatus = ? ");
		int count = 0;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, mno);
			pstmt.setInt(2, orderstatus);
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt("cnt");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
