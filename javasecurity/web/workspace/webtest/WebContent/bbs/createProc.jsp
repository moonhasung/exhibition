<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/bbs/ssi.jsp" %>
 <jsp:useBean id="dto" class="bbs.BbsDTO"/>
 <jsp:setProperty name = "dto" property="*"/>
 <%
 	boolean flag = dao.create(dto);
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
<script type = "text/javascript">
function blist(){
	var url = "list.jsp";
	location.href=url;
}

</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">처리결과</DIV>

<div class="content">
<%
if(flag){
	out.print("글이 등록되었습니다.");
}else{
	out.print("글 등록 실패");
}

%>

</div>
  
  <DIV class='bottom'>
    <input type='button' value='계속 등록' onclick="location.href='createForm.jsp'">
    <input type='button' value='목록' onclick="blist()">
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 