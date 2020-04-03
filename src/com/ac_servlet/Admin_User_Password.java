package com.ac_servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.bean.*;
import org.apache.coyote.Request;

import com.dao.Dao;

/**
 * Servlet implementation class Admin_User_Password
 */
@WebServlet("/Admin_User_Password")
public class Admin_User_Password extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_User_Password() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Users user = new Users();	
		HttpSession s = request.getSession();	
		user.setId(s.getAttribute("upId").toString());
		user.setPwd(request.getParameter("newpwd"));
		if(Dao.updateUserPwd(user)) {
			System.out.println("密码修改成功");
			response.sendRedirect("jsp/admin_user.jsp");
			
		}else{
			System.out.println("密码修改失败");
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
