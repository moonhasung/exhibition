<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/member/ssi.jsp"%>

<%

	String id = request.getParameter("id");
	if(id==null) id =(String)session.getAttribute("id");
	String oldfile = request.getParameter("oldfile");
	if(oldfile==null){
		oldfile = dao.getFname(id);
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
 
<DIV class="title">회원탈퇴</DIV>
 
<FORM name='frm' method='POST' action='./deleteProc.jsp'>
  <input type="hidden" name="id" value="<%=id%>">
  <input type="hidden" name="oldfile" value="<%=oldfile%>">
  <div class= "content">
 탈퇴를 하시면 더이상 컨텐트를 제공받을 수 없습니다.<br>
 그래도 탈퇴를 원하시면 아래 탈퇴 버튼을 클릭하세요.
  </div>
    
  
  <DIV class='bottom'>
    <input type='submit' value='회원탈퇴'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 