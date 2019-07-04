package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			// ?verifyServerCertificate=false&useSSL=false --> SSL인증 끄기 --> 사용방법??????
			String dbURL = "jdbc:mysql://localhost:3306/ajaxtest?verifyServerCertificate=false&useSSL=false";
			//String dbURL = "jdbc:mysql://localhost:3306/ajaxtest";
			String dbID = "javauser";
			String dbPassword = "javapass";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			
		} catch (Exception e){
			e.printStackTrace();
		}
	}
	
	public ArrayList<User> search(String userName) {
		String sql = "SELECT * FROM USER WHERE userName LIKE '%' ? '%'";
		ArrayList<User> userList = new ArrayList<User>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userName);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				User user = new User();
				user.setUserName(rs.getString(1));
				user.setUserAge(rs.getInt(2));
				user.setUserGender(rs.getString(3));
				user.setUserEmail(rs.getString(4));
				userList.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userList;
		
	}
	
	public int register(User user) {
		String sql = "insert into user values ( ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserName());
			pstmt.setInt(2, user.getUserAge());
			pstmt.setString(3, user.getUserGender());
			pstmt.setString(4, user.getUserEmail());
			//실행되는 결과값 반환 : 성공시 1 반환됨.
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류 시
	}
	
}
