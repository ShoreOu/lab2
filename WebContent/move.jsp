<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>删除结果！</title>
</head>
<body>
<%
Connection con;	//connection对象conn代表与数据库的链接
Statement stmt;	//statement对象stmt用于将SQL语句发送到数据库中
String ID = request.getParameter("id");
String url = "jdbc:mysql://ymiyfylnlmrw.mysql.sae.sina.com.cn:10662/bookdb";
String driver = "com.mysql.jdbc.Driver";
String username = "root";
String password = "189829994";
Class.forName(driver).newInstance();
con = DriverManager.getConnection(url, username, password);
String sql = "delete from book where ISBN=?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, ID);
ps.executeUpdate();
ps.close();
con.close();
%>
删除图书成功！
</body>
</html>