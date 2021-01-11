package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MakeConnection {
	private static MakeConnection mc;
	private final static String DRIVER ="oracle.jdbc.driver.OracleDriver";
	// �ڱ� DB�ּ� ���ּ���
	private final static String URL ="jdbc:oracle:thin:@orcl.c6vkvg8hqxfc.ap-northeast-2.rds.amazonaws.com:1521:orcl";
	// DB���� ���̵� 
	private final static String USER = "scott";
	// DB���� �н����� Ȯ�����ּ���
	private final static String PASSWORD ="tigertiger";
	Connection conn = null;
	PreparedStatement pstmt = null;
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	
private MakeConnection(){
		
	}
	
	public static MakeConnection getInstance() {
		if(mc == null) {
		 mc = new MakeConnection();
		}else {
		}
		return mc;
		
	}
	
	public Connection getConnection() {
		if(conn==null) {
			try {
				Class.forName(DRIVER);
				conn = DriverManager.getConnection(URL, USER, PASSWORD);
				System.out.println("conn : " + conn);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			
			}
		}
		return conn;
	}
}
