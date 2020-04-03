package com.ac_servlet;
import com.dao.Dao;
import com.bean.Users;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegAC_Servlet
 */
@WebServlet("/RegAC_Servlet")
public class RegAC_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegAC_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("PK_ID");
		String name = request.getParameter("name");
		String pwd1 = request.getParameter("pwd1");
		String pwd2 = request.getParameter("pwd2");
		String sex  =  request.getParameter("sex");
		if (pwd1.equals(pwd2)) {
			Users user = new Users();
			user.setId(id);
			user.setName(name);
			user.setPwd(pwd1);
			user.setAccess("user");
			user.setSex(sex);
			Dao db = new Dao();
			if (db.insertUser(user)) {
				
				response.sendRedirect("reg_success.jsp");
				
			} else {
				response.sendRedirect("reg_fail.jsp");
			}
		}else{//两次输入密码的不对
			response.sendRedirect("jsp/reg.jsp");
		}	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
