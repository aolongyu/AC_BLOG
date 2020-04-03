package com.ac_servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.Dao;
import com.bean.*;
/**
 * Servlet implementation class CommentAC_Servlet
 */
@WebServlet("/CommentAC_Servlet")
public class CommentAC_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentAC_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Dao dao = new Dao();
		Comment comment = new Comment();
		comment.setText(request.getParameter("text").toString());
		HttpSession s = request.getSession();
		int blog_id = Integer.parseInt(s.getAttribute("blog_id").toString());
		comment.setBlog_id(blog_id);
		String user_name = s.getAttribute("user_name").toString();
		comment.setUser_name(user_name);
		if(dao.insertComment(comment)) {
			response.sendRedirect("jsp/admin_user.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
