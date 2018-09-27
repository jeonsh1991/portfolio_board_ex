package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.UserDAO;
import user.UserDTO;

/**
 * Servlet implementation class joinAction
 */
@WebServlet("/JA")
public class joinAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public joinAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Action(request, response);
	}

	protected void Action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("loginID");
		String password = request.getParameter("loginPassword1");
		String name = request.getParameter("loginName");
		String Gender = request.getParameter("loginGender");
		String Email = request.getParameter("loginEmail");
		UserDTO dto = new UserDTO();
		dto.setuID(id);
		dto.setuPassword(password);
		dto.setuName(name);
		dto.setuGender(Gender);
		dto.setuEmail(Email);
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(dto);
		response.getWriter().write(result+"");
		System.out.println(result);
		response.sendRedirect("index.jsp");
		
	}
}
