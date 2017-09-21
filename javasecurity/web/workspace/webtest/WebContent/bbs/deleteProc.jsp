<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/bbs/ssi.jsp" %>

<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	String passwd = request.getParameter("passwd");
	
 	Map map = new HashMap();
 	map.put("bbsno",bbsno);
 	map.put("passwd",passwd);
 	
 	boolean pflag = dao.passwdCheck(map);
 	
 	boolean flag = false;
 	if(pflag){
 			flag = dao.delete(bbsno);
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
<script type = "text/javascript">
function blist(){
	var url = "list.jsp";
	url += "?col=<%=request.getParameter("col") %>";
	url += "&word=<%=request.getParameter("word")%>";
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
if(!pflag){
	out.print("비밀번호가 일치하지 않아요.");
}else if(flag){
	out.print("글삭제 했어요.");
}else{
	out.print("글삭제를 실패했어요.");
}

%>

</div>  
  <DIV class='bottom'>
  <%if(!pflag){ %>
    <input type='button' value='재시도' onclick="history.back()">
  <%}else{ %>  
    <input type='button' value='계속 등록' onclick="location.href='createForm.jsp'">
  <%} %>  
    <input type='button' value='목록' onclick="blist()">
 </DIV>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 