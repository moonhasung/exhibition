<%@ page contentType="text/html; charset=UTF-8" %> 
<% 
	String id = (String)session.getAttribute("id");
	String grade = (String)session.getAttribute("grade");
	String str = "메인페이지 입니다";
	if(id!=null){
		str = "안녕하세요"+id+"님!";
	}
	String title = "나의 여행 블로그";
	if(id!=null && grade.equals("A")){
		title = "관리자 페이지";
	}
%> 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<link href ="css/style.css" rel="stylesheet">
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
</head> 
<body> 
<jsp:include page="/menu/top.jsp"/>
<div class="title"><%=title %></div>
<div class="content">

<h1> <%=str%></h1>
<img src="images/main.jpg" width="50%"><br>
<%if(id==null){ %>
<button type="button" onclick="location.href='member/loginForm.jsp'">로그인</button>
<%}else{ %>
<button type="button" onclick="location.href='member/logout.jsp'">로그아웃</button>
</div>
<%} %>
<br>
<br>

<br>
<jsp:include page="/menu/bottom.jsp"/>
</body> 
</html>