package com.ac_servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.bean.Users;
import com.dao.Dao;

/**
 * Servlet implementation class UpdateUserPwd
 */
@WebServlet("/UpdateUserPwd")
public class UpdateUserPwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserPwd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Dao dao = new Dao();
		HttpSession s = request.getSession();
		Users user  = dao.queryUserById(s.getAttribute("id").toString());
		if(request.getParameter("pwd1").toString().equals(user.getPwd())) {
			System.out.println("密码正确");
			if(request.getParameter("pwd2").toString().equals(request.getParameter("pwd3"))) {
				System.out.println("新密码验证正确");
				user.setPwd(request.getParameter("pwd2").toString());
				Dao.updateUserPwd(user);
				response.sendRedirect("jsp/user_main.jsp");
			}
			else {
				System.out.println("新密码验证失败");
			}
		}else {
			System.out.println("密码错误");
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
