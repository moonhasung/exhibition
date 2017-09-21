<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
div{
  text-align: center; 
  margin-top: 20px; 
  margin-bottom: 20px;
}
table{
  width: 60%;
  margin: 0 auto;
}
table,th,td{
border:1px solid black;
border-collapse:collapse;
}

</style> 
</head> 
<body> 
<div>등록</div>
<form name="frm" method="POST" action="./createProc.jsp">
<table>
<tr>
<th>제목</th>
<td>
<input type="text" name="title" size="45" value="두시회의"/>
</td>
</tr>
<tr>
<th>내용</th>
<td>
<textarea rows="10" cols="45" name="content">SQL 관련</textarea>
</td>
</tr>
</table>
<div>
<input type="submit" value="전송">
</div>
</form>
</body> 
</html>