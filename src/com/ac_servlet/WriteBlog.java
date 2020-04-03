package com.ac_servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.bean.Message;
import com.dao.Dao;

/**
 * Servlet implementation class WriteBlog
 */
@WebServlet("/WriteBlog")
public class WriteBlog extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteBlog() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession s = request.getSession();

		Message message = new Message();
		message.setContent(request.getParameter("content"));
		message.setTitle(request.getParameter("title"));
		message.setUser_id(s.getAttribute("id").toString());
		if(Dao.insertMessage(message)) {
			System.out.println("写入成功");
			response.sendRedirect("jsp/user_myblog.jsp");
		}else {
			System.out.println("写入失败");
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
