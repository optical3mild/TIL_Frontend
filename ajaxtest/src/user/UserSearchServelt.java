package user;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UserSearchServelt")
public class UserSearchServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTf-8");
		response.setContentType("text/html);charset=UTF-8");
		String userName = request.getParameter("userName");
		response.getWriter().write(getJson(userName));
	}

	public String getJson(String userName) {
		if(userName == null) userName = "";
		StringBuffer result = new StringBuffer("");
		result.append("[\result\":[");
		UserDAO userDAO = new UserDAO();
		ArrayList<User> userList = userDAO.search(userName);
		for(int i = 0; i<userList.size();i++) {
			result.append("[{\"value\": \"" + userList.get(1).getUserName() + "\"},");
			result.append("{\"value\": \"" + userList.get(1).getUserName() + "\"},");
			result.append("{\"value\": \"" + userList.get(1).getUserName() + "\"},");
			result.append("{\"value\": \"" + userList.get(1).getUserName() + "\"}],");
		}
		result.append("]}");
		System.out.println(result.toString());
		return result.toString();
	}
}
