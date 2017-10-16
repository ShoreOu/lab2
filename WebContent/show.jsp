<%@page import="java.util.HashMap"%>
<%@page import="java.util.Vector"%>
<%@page import="pac1.Author"%>
<%@page import="java.util.Map"%>
<%@page import="pac1.Book"%>
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
<title>查询结果展示</title>
</head>
<body>
<center>该作者所著图书如下：</center>
<br>
<%
String name = request.getParameter("Name");
int j = 0;

Vector<Author>authorvec=new Vector<>();	

String url = "jdbc:mysql://ymiyfylnlmrw.mysql.sae.sina.com.cn:10662/bookdb";
String driver = "com.mysql.jdbc.Driver";
String username = "root";
String password = "189829994";
Connection con;	//connection对象conn代表与数据库的链接
Statement stmt;	//statement对象stmt用于将SQL语句发送到数据库中
ResultSet rs;	

Class.forName(driver).newInstance();
con = DriverManager.getConnection(url, username, password);
stmt = con.createStatement();
String sql="select *from author";		//SQL语句
rs=stmt.executeQuery(sql);					//	执行查询，返回所有符合条件的语句

	 while(rs.next())
	 {
		 if(rs.getString("Name").equals(name)){
			 
		 Author authorInfirmation=new Author();
		 authorInfirmation.setAuthorID(rs.getString("AuthorID"));
		 authorInfirmation.setName(rs.getString("Name"));
		 authorInfirmation.setAge(rs.getString("Age"));
		 authorInfirmation.setCountry(rs.getString("Country"));
		 authorvec.add(authorInfirmation);
		 
	
		 }

	 }
//书的信息查询*/
Class.forName(driver).newInstance();
Connection conn;	//connection对象conn代表与数据库的链接
Statement stmtn;	//statement对象stmt用于将SQL语句发送到数据库中
ResultSet rsn;	
for(int i=0;i<authorvec.size();i++)
{
	 
		 String id=authorvec.get(i).getAuthorID();//获取作者
		 conn = DriverManager.getConnection(url, username, password);
		 stmtn=conn.createStatement();				
		 String sqll=" select *from book ";		//SQL语句
		 rsn=stmtn.executeQuery(sqll);					//	执行查询，返回所有符合条件的语句

		 while(rsn.next())
		 {
			 if(rsn.getString("AuthorID").equals(id)){
				 j++;
				 String ISBN = rsn.getString("ISBN");
				 String Title = rsn.getString("Title");
			
			 
			
			 %>
			 <br>    
         <a href="bookm.jsp?id=<%=ISBN%>"><%=Title+"         " %> </a>     
         <a href="move.jsp?id=<%=ISBN %>">删除</a>
<br>		
			 
			 <% 
			
			 }
		 }
		 
		 conn.close();
		 rsn.close();
		 
		 if(j == 0)
		 {
			 %>数据库中没有该作者所著图书<%
		 }
			

}
    

%>   




</body>
</html>