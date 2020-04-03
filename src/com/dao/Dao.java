package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bean.Message;
import com.bean.Users;
import com.bean.Comment;
import com.util.ConnectionUtil;


public class Dao {
	public static boolean deleteUsers(String id) {
		String sql = "delete from user where id = ?";
		Connection connection = null;
		PreparedStatement pStatement = null;
		try {
			connection = ConnectionUtil.getConnection();
			pStatement = connection.prepareStatement(sql);
			pStatement.setString(1, id);

			int count = pStatement.executeUpdate();
			return count > 0 ? true : false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			ConnectionUtil.closePreparedStatement(pStatement);
			ConnectionUtil.closeConnection(connection);
		}
	}
	public static boolean deleteMessage(String blog_id){
		String sql = "delete from message where blog_id ='"+blog_id+"'";
		Connection connection = null;
		PreparedStatement pStatement = null;
		try {
			connection = ConnectionUtil.getConnection();
			pStatement = connection.prepareStatement(sql);

			int count = pStatement.executeUpdate();
			return count > 0 ? true : false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			ConnectionUtil.closePreparedStatement(pStatement);
			ConnectionUtil.closeConnection(connection);
		}
	}
	public static boolean insertUser(Users user) {
		String sql = "insert into user(name,pwd,id,access,sex) values(?,?,?,?,?)";

		int i = 0;
		Connection conn = null;
		PreparedStatement pstmt;
		try {
			conn =ConnectionUtil.getConnection();
			System.out.println(sql);
			pstmt = (PreparedStatement) conn.prepareStatement(sql);

			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getPwd());

			pstmt.setString(3, user.getId());
			pstmt.setString(4, user.getAccess());
			pstmt.setString(5,user.getSex());
			i = pstmt.executeUpdate();
			pstmt.close();
			conn.close();

			return i > 0 ? true : false;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	public static boolean insertComment(Comment comment) {
		String sql = "insert into comment(user_name,text,id,blog_id) values(?,?,?,?)";

		int i = 0;
		Connection conn = null;
		PreparedStatement pstmt;
		try {
			conn =ConnectionUtil.getConnection();
			System.out.println(sql);
			pstmt = (PreparedStatement) conn.prepareStatement(sql);

			pstmt.setString(1, comment.getUser_name());
			pstmt.setString(2, comment.getText());

			pstmt.setInt(3, comment.getId());
			pstmt.setInt(4, comment.getBlog_id());
			i = pstmt.executeUpdate();
			pstmt.close();
			conn.close();

			return i > 0 ? true : false;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	public static boolean updateUser(Users user) {
		String sql = "update user set name=? , pwd = ?  where id = ?";
		Connection connection = null;
		PreparedStatement pStatement = null;
		try {
			connection = ConnectionUtil.getConnection();
			pStatement = connection.prepareStatement(sql);
			pStatement.setString(1, user.getName());
			pStatement.setString(2, user.getPwd());
			pStatement.setString(3, user.getId());
			int count = pStatement.executeUpdate();
			return count > 0 ? true : false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			ConnectionUtil.closePreparedStatement(pStatement);
			ConnectionUtil.closeConnection(connection);
		}
	}
	public static boolean updateUserPwd(Users user) {
		String sql = "update user set  pwd = ?  where id = ?";
		Connection connection = null;
		PreparedStatement pStatement = null;
		try {
			connection = ConnectionUtil.getConnection();
			pStatement = connection.prepareStatement(sql);
			pStatement.setString(1, user.getPwd());
			pStatement.setString(2, user.getId());
			int count = pStatement.executeUpdate();
			return count > 0 ? true : false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			ConnectionUtil.closePreparedStatement(pStatement);
			ConnectionUtil.closeConnection(connection);
		}
	}
	public static boolean updateBrowse(Message message) {
		String sql = "update message set  browse = ?  where blog_id = ?";
		Connection connection = null;
		PreparedStatement pStatement = null;
		try {
			int a =message.getBrowse()+1;
			connection = ConnectionUtil.getConnection();
			pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1, a);
			pStatement.setString(2, message.getBlog_id());
			int count = pStatement.executeUpdate();
			return count > 0 ? true : false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			ConnectionUtil.closePreparedStatement(pStatement);
			ConnectionUtil.closeConnection(connection);
		}
	}
	public static boolean updateMessage(Message message) {
		String sql = "update message set title=? , content= ?  where blog_id = ?";
		Connection connection = null;
		PreparedStatement pStatement = null;
		try {
			connection = ConnectionUtil.getConnection();
			pStatement = connection.prepareStatement(sql);
			pStatement.setString(1, message.getTitle());
			pStatement.setString(2, message.getContent());
			pStatement.setString(3, message.getBlog_id());
			int count = pStatement.executeUpdate();
			return count > 0 ? true : false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			ConnectionUtil.closePreparedStatement(pStatement);
			ConnectionUtil.closeConnection(connection);
		}
	}
	public static boolean insertMessage(Message message) {
		String sql = "insert into message(title,content,user_id) values(?,?,?)";

		int i = 0;
		Connection conn = null;
		PreparedStatement pstmt;
		try {
			conn =ConnectionUtil.getConnection();
			System.out.println(sql);
			pstmt = (PreparedStatement) conn.prepareStatement(sql);

			pstmt.setString(1, message.getTitle());
			pstmt.setString(2, message.getContent());
			pstmt.setString(3, message.getUser_id());
			i = pstmt.executeUpdate();
			pstmt.close();
			conn.close();

			return i > 0 ? true : false;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	public static List<Users> findUsers() {
		String sql = "select * from user where access = ?";
		System.out.println(sql);
		Connection connection = null;
		PreparedStatement pStatement = null;
		ResultSet rs = null;
		List<Users> users = null;
		try {
			connection = ConnectionUtil.getConnection();
			pStatement = connection.prepareStatement(sql);
			pStatement.setString(1, "user");
			rs = pStatement.executeQuery();
			users = new ArrayList<Users>();
			while(rs.next()){
				Users user = new Users();
				user.setId(rs.getString("id"));
				user.setAccess(rs.getString("access"));
				user.setName(rs.getString("name"));
				user.setPwd(rs.getString("pwd"));
				user.setSex(rs.getString("sex"));
				users.add(user);
			}
			return users;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			ConnectionUtil.closeResultSet(rs);
			ConnectionUtil.closePreparedStatement(pStatement);
			ConnectionUtil.closeConnection(connection);
		}
	}
	public Boolean getOneUser(Users user) throws SQLException {

		Connection conn = ConnectionUtil.getConnection();
		String sql = "select * from user where id=? and pwd=?";
		PreparedStatement pstmt;

		pstmt = (PreparedStatement) conn.prepareStatement(sql);
		pstmt.setString(1, user.getId());
		pstmt.setString(2, user.getPwd());
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {

			return true;
		} else {
			return false;
		}
	}
	public String getAccess(Users user) throws SQLException {

	    Connection conn = ConnectionUtil.getConnection();
	    String sql = "select * from user where id=? ";
	    PreparedStatement pstmt;
	   
	        pstmt = (PreparedStatement)conn.prepareStatement(sql);
	        pstmt.setString(1, user.getId());
	        ResultSet rs = pstmt.executeQuery();
	       
	        
	   
	    if(rs.next()){
	    	String access = rs.getString("access");
	        return access;
	     }else {
	     	return null;
	     }
	    
	}
	public static List<Comment> findComment(String blog_id) {
        String sql = "select * from comment where blog_id="+blog_id;
        System.out.println(sql);
        Connection connection = null;
        PreparedStatement pStatement = null;
        ResultSet rs = null;
        List<Comment> Comment= null;
        try {
            connection = ConnectionUtil.getConnection();
            pStatement = connection.prepareStatement(sql);
            rs = pStatement.executeQuery();
            Comment = new ArrayList<Comment>();
            while (rs.next()) {
                Comment comment = new Comment();
                comment.setUser_name(rs.getString("user_name"));
                comment.setText(rs.getString("text"));
                Comment.add(comment);
            }
            return Comment;
        } catch (Exception e) {
        	System.out.println("q");
            e.printStackTrace();
            return null;
        } finally {
            ConnectionUtil.closeResultSet(rs);
            ConnectionUtil.closePreparedStatement(pStatement);
            ConnectionUtil.closeConnection(connection);
        }
    }
	public static List<Message> findMessages() {
        String sql = "select * from message";
        Connection connection = null;
        PreparedStatement pStatement = null;
        ResultSet rs = null;
        List<Message> Message= null;
        try {
            connection = ConnectionUtil.getConnection();
            pStatement = connection.prepareStatement(sql);
            rs = pStatement.executeQuery();
            Message = new ArrayList<Message>();
            while (rs.next()) {
                Message message = new Message();
                message.setContent(rs.getString("content"));
                message.setTitle(rs.getString("title"));
                message.setDate(rs.getString("date"));
                message.setUser_id(rs.getString("user_id"));
                message.setBlog_id(rs.getString("blog_id"));
                message.setBrowse(rs.getInt("browse"));
                Message.add(message);
            }
            return Message;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            ConnectionUtil.closeResultSet(rs);
            ConnectionUtil.closePreparedStatement(pStatement);
            ConnectionUtil.closeConnection(connection);
        }
    }
	public static List<Message> findMessages(String user_id) {
        String sql = "select * from message where user_id='"+user_id+"'";
        System.out.println(user_id);
        System.out.println(sql);
        Connection connection = null;
        PreparedStatement pStatement = null;
        ResultSet rs = null;
        List<Message> Message= null;
        try {
            connection = ConnectionUtil.getConnection();
            pStatement = connection.prepareStatement(sql);
            rs = pStatement.executeQuery();
            Message = new ArrayList<Message>();
            while (rs.next()) {
                Message message = new Message();
                message.setContent(rs.getString("content"));
                message.setTitle(rs.getString("title"));
                message.setDate(rs.getString("date"));
                message.setUser_id(rs.getString("user_id"));
                message.setBlog_id(rs.getString("blog_id"));
                message.setBrowse(rs.getInt("Browse"));
                Message.add(message);
            }
            return Message;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            ConnectionUtil.closeResultSet(rs);
            ConnectionUtil.closePreparedStatement(pStatement);
            ConnectionUtil.closeConnection(connection);
        }
    }
	public static List<Message> findMessage(String content) {
        String sql ="select * from message where content like '%" + content + "%'";
        System.out.println(sql);
        Connection connection = null;
        PreparedStatement pStatement = null;
        ResultSet rs = null;
        List<Message> Message= null;
        try {
            connection = ConnectionUtil.getConnection();
            pStatement = connection.prepareStatement(sql);
            rs = pStatement.executeQuery();
            Message = new ArrayList<Message>();
            while (rs.next()) {
                Message message = new Message();
                message.setContent(rs.getString("content"));
                message.setTitle(rs.getString("title"));
                message.setDate(rs.getString("date"));
                message.setUser_id(rs.getString("user_id"));
                message.setBlog_id(rs.getString("blog_id"));
                message.setBrowse(rs.getInt("Browse"));
                Message.add(message);
            }
            return Message;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            ConnectionUtil.closeResultSet(rs);
            ConnectionUtil.closePreparedStatement(pStatement);
            ConnectionUtil.closeConnection(connection);
        }
    }
	public  Users queryUserById(String id){
		Users user = new Users();
		Connection con=ConnectionUtil.getConnection();;
		String sql="select * from user where id='"+id+"'";
		try {
			PreparedStatement pst=con.prepareStatement(sql);
		ResultSet rs=pst.executeQuery(sql);
		if(rs.next())
		{
			user.setName(rs.getString(1));
			user.setPwd(rs.getString(2));
			user.setId(rs.getString(3));
			user.setAccess(rs.getString(4));
			user.setSex(rs.getString(5));
		}
	 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}
	public  Message queryMessageById(String blog_id){
		Message message = new Message();
		Connection con=ConnectionUtil.getConnection();;
		String sql="select * from message where blog_id='"+blog_id+"'";
		try {
			PreparedStatement pst=con.prepareStatement(sql);
		ResultSet rs=pst.executeQuery(sql);
		if(rs.next())
		{
			message.setTitle(rs.getString(1));
			message.setContent(rs.getString(2));
			message.setDate(rs.getString(3));
			message.setBlog_id(rs.getString(5));
			message.setBrowse(rs.getInt(6));
		
		}
	 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return message;
	}
	public static void main(String[] args) {
		System.out.println(ConnectionUtil.getConnection());
		}
	
 
}

