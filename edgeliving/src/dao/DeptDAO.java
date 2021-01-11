package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import vo.DeptVO;

public class DeptDAO {
	// ������� DB����
	

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null; //select�� �ƴϸ� �Ⱦ�
	StringBuffer sb = new StringBuffer();
	DeptVO vo = null;
	public DeptDAO() {
		// TODO Auto-generated constructor stub
		Context initCtx;
		try {
			initCtx = new InitialContext();
			Context envCtx = (Context)initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource)envCtx.lookup("jdbc/orcl");
			Connection conn = ds.getConnection();
			System.out.println("conn : " + conn);
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}// ������ ��!
	
	
	// ��ü ��ȸ
	public ArrayList<DeptVO> selectAll() {
		sb.setLength(0);
		sb.append("select deptno ,dname, loc ");
		sb.append("from dept");
		ArrayList<DeptVO> list  = new ArrayList<DeptVO>();
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int deptno = rs.getInt("deptno");
				String dname = rs.getString("dname");
				String loc = rs.getString("loc");
				DeptVO vo = new DeptVO();
				vo.setDeptno(deptno);
				vo.setDname(dname);
				vo.setLoc(loc);
				list.add(vo);
				//System.out.println("list : " + list);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
		
		
	}
	
	// 1�� ��ȸ (10�� �μ����� ��������)
	public DeptVO selectOne(int deptno) { // �޼ҵ�� 1���� ���ۿ� ��������. �ٵ� dept���� ��ȣ, �μ���, ��ġ�� �־
										//DeptVO�� ���ؼ� �׸�° �Ѱ��ٷ��� �����
		sb.setLength(0); // ������ �ִ� StringBuffer ������ ����
		vo = new DeptVO();
		//4 sql�� �ۼ�
		sb.append("SELECT deptno, dname, loc ");
		sb.append("from dept ");
		sb.append("where deptno = ? ");
		
		
		//5 ���� ��ü ����
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, deptno);
			rs = pstmt.executeQuery();
			rs.next();
			String dname = rs.getString("dname");
			String loc = rs.getString("loc");
//			System.out.println("�μ���ȣ : " + deptno);
//			System.out.println("�μ���    : " + dname);
//			System.out.println("�μ���ġ : " + loc);
			vo.setDeptno(deptno);
			vo.setDname(dname);
			vo.setLoc(loc);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//6 ���� 
		return vo;
	}
	
	
	//�߰� �޼���
	public void insertOne(String dname, String loc) {
		sb.setLength(0); // ������ �ִ� StringBuffer ������ ����
		sb.append("insert into dept ");
		sb.append("values (DEPT_DEPTNO.NEXTVAL , ? , ? ) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, dname);
			pstmt.setString(2, loc);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	// delete �޼���
	
	public void deleteOne(int deptno) {
		sb.setLength(0);
		sb.append("delete dept where deptno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, deptno);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	// update �޼���
	
	public void updateone(int deptno, String dname , String loc ) {
		sb.setLength(0);
		sb.append("update dept ");
		sb.append("set dname = ? , loc = ?");
		sb.append("where deptno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(3, deptno);
			pstmt.setString(1, dname);
			pstmt.setString(2, loc);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}
	
	// �ڿ� �ݳ�
	
	public void close() {
		try {
			if(rs != null )rs.close();
			if(conn != null )conn.close();
			if(pstmt != null )pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
