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
<title>书籍详细信息</title>
</head>
<body>
<%
String ID = request.getParameter("id");
String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://ymiyfylnlmrw.mysql.sae.sina.com.cn:10662/bookdb";
String username = "root";
String password = "189829994";
Class.forName(driver).newInstance();
Connection con = DriverManager.getConnection(url, username, password);
Statement stmt = con.createStatement();
String sql = "select * from book";
ResultSet rs = stmt.executeQuery(sql);
while(rs.next()){
	if(rs.getString("ISBN").equals(ID))
	{
		session.setAttribute("ID", rs.getString("AuthorID"));
		%>
		ISBN:<%=rs.getString("ISBN") %><br>
		书名:<%=rs.getString("Title") %><br>
		作者ID：<%=rs.getString("AuthorID") %><br>
		出版社：<%=rs.getString("Publisher") %><br>
		出版时间：<%=rs.getString("PublishData") %><br>
		价格：<%=rs.getString("Price") %><br>
		
		
		<%
	}
   
}
rs.close();
con.close();

Connection conn = DriverManager.getConnection(url, username, password);
Statement stmtt = conn.createStatement();
String sqll = "select * from author";
ResultSet rss = stmtt.executeQuery(sqll);
while(rss.next()){
	if(rss.getString("AuthorID").equals((String)session.getAttribute("ID")))
	{
	
		%>
		作者姓名:<%=rss.getString("Name") %><br>
		作者年龄:<%=rss.getString("Age") %><br>
		国籍：<%=rss.getString("Country") %><br>
		
		
		<%
	}
   
}
rss.close();
conn.close();

%>

</body>
</html>