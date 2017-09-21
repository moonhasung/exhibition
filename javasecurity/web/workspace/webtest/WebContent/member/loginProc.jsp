<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/member/ssi.jsp"%>
 <%
 	String id = request.getParameter("id");
 	String passwd = request.getParameter("passwd");
 	Map map = new HashMap();
 	map.put("id",id);
 	map.put("passwd",passwd);
 
 	boolean flag = dao.loginCheck(map);
 	
 	if(flag){
 		String grade = dao.getGrade(id);
 		session.setAttribute("id",id);
 		session.setAttribute("grade",grade);
 	}
 
 %>
 
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
</style> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 

 <div class="content">
 <%
 if(flag){
	 out.print("로그인 되었습니다");
 }else{
	 out.print("로그인에 실패하였습니다 아이디/비밀번호를 확인해 주세요");
 }
 %>
 </div>
 

  <DIV class='bottom'>
    <input type='button' value='다시시도'
    onclick="history.back()">
    
    <input type='button' value='홈'
     onclick="location.href='../index.jsp'">
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 