<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: ; 
  font-size: 24px; 
} 
span{
border: 1px; 
border-style: solid; 
padding:1px 5px; 
color: #888888; 
margin-left: 5px;
}
</style> 
</head> 
<body> 
<DIV style='text-align: center'> 
<% 
int totalRecord = 197; 
int totalPage = (totalRecord/10)+1; // 레코드가 1개 있어도 1페이지에 해당됨으로 +1을 함  
 
for(int i=1; i<totalPage; i++){ 
%>   
  <SPAN><A href='./list.jsp?page=<%=i %>'><%=i %></A></SPAN> 
<% 
} 
%> 
</DIV> 
</body> 
</html> 
