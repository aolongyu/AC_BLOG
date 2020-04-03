package com.ac_servlet;

import java.io.IOException;
import java.sql.SQLException;

import com.bean.*;
import com.dao.Dao;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

/**
 * Servlet implementation class AC_Servlet
 */
@WebServlet("/LoginAC_Servlet")
public class LoginAC_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginAC_Servlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession s = request.getSession();
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		s.setAttribute("id", id);
		s.setAttribute("pwd", pwd);
		Users user = new Users();
		user.setId(id);
		user.setPwd(pwd);
		Dao db = new Dao();
		 try {
			if(db.getOneUser(user)&&db.getAccess(user).equals("admin")){
				
				 response.sendRedirect("jsp/waiting_admin.jsp");
				 
			 }else if(db.getOneUser(user)&&db.getAccess(user).equals("user")){
				 response.sendRedirect("jsp/waiting_user.jsp");
			 }else{
				 
				 response.sendRedirect("login_fail.jsp");
			 }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
