

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8     ">
<title>图书查询系统</title>
</head>
<body>

<form action="show.jsp" method = "post" onsubmit = "return check(this);">
  <table align="center" width = "450">
    <tr>
        <td align ="center" colspan = "2">
          <h2> 搜索图书信息</h2>
          <hr>
        </td>
    </tr>
    <tr>
        <td align ="right" >作 者 姓 名</td>
        <td><input type = "text" name = "Name"/></td>
    </tr>
    <tr>
        <td align ="center" colspan = "2" >
            <input type = "submit" value = "查 询">
        </td>
    </tr>
  </table>
</form>



</body>
</html>