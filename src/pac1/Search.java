package pac1;
import java.sql.ResultSet ;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;
import java.sql.Connection;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import java.sql.DriverManager;


import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
public class Search extends ActionSupport{

	private static final long serialVersionUID = 245806943515360614L;

	private String AuthorName;
	
	public String getAuthorName() {
		return AuthorName;
	}

	public void setAuthorName(String authorName) {
		AuthorName = authorName;
	}



	HttpServletRequest request = ServletActionContext.getRequest();
	Map<String, Object> session;


		
	
	public String execute() throws Exception {
	
		 //Connection con;	//connection����conn���������ݿ������
		// Statement stmt;	//statement����stmt���ڽ�SQL��䷢�͵����ݿ���
		//ResultSet rs;		//�������SQL��������������
		 
		 ActionContext context=ActionContext.getContext();
		 session=context.getSession();
		 
		 session.put("authorname", AuthorName);
		 
		 //������Ϣ��ѯ
		 Vector<Author>authorvec=new Vector<>();	
		 try
		 {
			 Class.forName("com.mysql.jdbc.Driver");
			 String url = "jdbc:mysql://ymiyfylnlmrw.mysql.sae.sina.com.cn:10662:10662/bookdb";
			 String username = "root";
			 String password = "189829994";
			 Connection con;	//connection����conn���������ݿ������
			 Statement stmt;	//statement����stmt���ڽ�SQL��䷢�͵����ݿ���
			ResultSet rs;	
			 con = DriverManager.getConnection(url, username, password);
			  stmt = con.createStatement();
			 String sql="select *from author ";		//SQL���
			 rs=stmt.executeQuery(sql);					//	ִ�в�ѯ���������з������������

			 while(rs.next())
			 {
				 if(rs.getString("Name").equals(AuthorName)){
				 Author authorInfirmation=new Author();
				 authorInfirmation.setAuthorID(rs.getString("AuthorID"));
				 authorInfirmation.setName(rs.getString("Name"));
				 authorInfirmation.setAge(rs.getString("Age"));
				 authorInfirmation.setCountry(rs.getString("Country"));
				 authorvec.add(authorInfirmation);
			 }
			 }
			 con.close();
			 rs.close();
		 } catch (Exception e)
		 {
			e.printStackTrace();
		 }
		 
		 
		 //�����Ϣ��ѯ
		 Map<Book, Author>book_author=new HashMap<>();
		 for(int i=0;i<authorvec.size();i++)
		 {
			 try
			 {
				 String id=authorvec.get(i).getAuthorID();//��ȡ����
				 Class.forName("com.mysql.jdbc.Driver");
				 String url = "jdbc:mysql://localhost:3306/bookdb";
				 String username = "root";
				 String password = "asd123+.";
				 Connection conn;	//connection����conn���������ݿ������
				 Statement stmtn;	//statement����stmt���ڽ�SQL��䷢�͵����ݿ���
				 ResultSet rsn;	
				 conn = DriverManager.getConnection(url, username, password);
				 stmtn=conn.createStatement();				
				 String sql=" select *from book ";		//SQL���
				 rsn=stmtn.executeQuery(sql);					//	ִ�в�ѯ���������з������������

				 while(rsn.next())
				 {
					 if(rsn.getString("AuthorID").equals(id)){
					 Book bookInf=new Book();
					 
					 bookInf.setISBN(rsn.getString("ISBN"));
					 bookInf.setTitle(rsn.getString("Title"));
					 bookInf.setAuthorID(rsn.getString("AuthorID"));
					 bookInf.setPublisher(rsn.getString("Publisher"));
					 bookInf.setPublishDate(rsn.getString("PublishDate"));
					 bookInf.setPrice(rsn.getString("Price"));
					 
					 book_author.put(bookInf,authorvec.get(i));//ÿ�������������ӳ��
					 }
				 }
				 //request.setAttribute("book_author", book_author);
				 conn.close();
				 rsn.close();
				session.put("book_author", book_author);
				
				
			 } catch (Exception e)
			 {
				e.printStackTrace();
			 }
		 }
		 
		 if(authorvec.isEmpty())
		 {
			 return "error";
		 }
		 else 
		 {
			 return "success";
		 }
		
    }

}