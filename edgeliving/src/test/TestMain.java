package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dao.MakeConnection;
import dao.MemberDAO;
import vo.MemberVO;

public class TestMain {
	
	public static void main(String[] args) {
		Connection conn;
		PreparedStatement pstmt = null;
		StringBuffer sb= new StringBuffer();
		ResultSet rs = null;
		
		conn = MakeConnection.getInstance().getConnection();	
		
		/*
		 * MemberDAO dao = new MemberDAO(); MemberVO vo = dao.getOne(3);
		 */
		
		String strphone = "010-1234-5647"; 
			
		String[] arrphone = strphone.split("-");
		
		System.out.println(arrphone[0]);
		System.out.println(arrphone[1]);
		System.out.println(arrphone[2]);
	}
	
}
