package user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UserRegisterServlet")
public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String userName = request.getParameter("userName");
		String userAge = request.getParameter("userAge");
		String userGender = request.getParameter("userGender");
		String userEmail = request.getParameter("userEmail");
		//register()의 경우 정수형으로 값이 반환. write()에서는 정수형 값이 정상적으로 인식x 공백을 붙여줌.
		response.getWriter().write(register(userName, userAge, userGender, userEmail) + "");
	}
	public int register(String userName, String userAge, String userGender, String userEmail) {
		User user = new User();
		try {
			user.setUserName(userName);
			//기본적으로 request로 넘어오는 정보는 String.
			user.setUserAge(Integer.parseInt(userAge));
			user.setUserGender(userGender);
			user.setUserEmail(userEmail);
		} catch (Exception e) {
			return 0;
		}
		//성공적으로 수행되었다면 return값은 1을 반환
		//User객체를 DAO를 이용하여 database안에 접근, 등록.
		return new UserDAO().register(user);
	}
}
