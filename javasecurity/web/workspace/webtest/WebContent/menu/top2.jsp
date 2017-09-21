<%@ page contentType="text/html; charset=UTF-8" %> 
 
<%
	String root = request.getContextPath();
	String id= (String)session.getAttribute("id");
	String grade= (String)session.getAttribute("grade");

%>
 
<html>
<head>
<style type="text/css">
ul#menu li{
display : inline;
}
ul#menu li a{
background-color: black;
color:white;
pading : 10px 20px;
text-decoration:none;
border-radius:4px 4px 0 0;
}
ul#menu li a:hover{
background-color: orange;
}
.table{
width: 100%;
} 
.table,.td{
border-style: none;
}
</style>
</head>
<body>
<!-- 상단 메뉴 -->
<div style="background-color: #EEEEEE;">
<table class="table">
  <tr>
    <td class="td">
        <img src="<%=root %>/menu/images/main-03.jpg" width='100%' height='50%'>
    </td>
  </tr>
  
  <tr>
    <td class="td">
    <ul id="menu">
    <li><a href="<%=root %>/index.jsp">홈</a></li>
    <%if(id==null) {%>
     <li><a href="<%=root %>/member/agreement.jsp"><span class ="glyphicon glyphicon-ok"></span>회원가입</a></li>
     <li><a href="<%=root %>/member/loginForm.jsp"><span class ="glyphicon glyphicon-ok"></span>로그인</a></li>
     <%}else{%>
     <li><a href="<%=root %>/member/read.jsp"><span class ="glyphicon glyphicon-ok"></span>나의정보</a></li>
     <li><a href="<%=root %>/member/updateForm.jsp"><span class ="glyphicon glyphicon-ok"></span>정보수정</a></li>
     <li><a href="<%=root %>/member/deleteForm.jsp"><span class ="glyphicon glyphicon-ok"></span>회원탈퇴</a></li>
     <li><a href="<%=root %>/member/logout.jsp"><span class ="glyphicon glyphicon-ok"></span>로그아웃</a></li>
     <% } %>
    <%if(id!=null && grade.equals("A"))  {%>
    <li><a href="<%=root %>/member/list.jsp"><span class ="glyphicon glyphicon-ok"></span>회원목록</a></li>
    <%} %>
     <li><a href="<%=root %>/memov3/list.jsp"><span class ="glyphicon glyphicon-ok"></span>메모목록</a></li>
     <li><a href="<%=root %>/memov3/createForm.jsp"><span class ="glyphicon glyphicon-ok"></span>메모등록</a></li>
     <li><a href="<%=root %>/team/list.jsp"><span class ="glyphicon glyphicon-ok"></span>팀목록</a></li>
     <li><a href="<%=root %>/team/createForm.jsp"><span class ="glyphicon glyphicon-ok"></span>팀생성</a></li>   
     <li><a href="<%=root %>/address/list.jsp"><span class ="glyphicon glyphicon-ok"></span>주소록</a></li>
     <li><a href="<%=root %>/address/createForm.jsp"><span class ="glyphicon glyphicon-ok"></span>주소생성</a></li>
     <li><a href="<%=root %>/bbs/list.jsp"><span class ="glyphicon glyphicon-ok"></span>게시판목록</a></li>
     <li><a href="<%=root %>/bbs/createForm.jsp"><span class ="glyphicon glyphicon-ok"></span>게시판생성</a></li>
    
    </ul>
    </td> 
  </tr>
 
</table>
</div>
<!-- 상단 메뉴 끝 -->
<!-- 내용 시작 -->
<div style="width: 100%; padding-top: 10px;">

