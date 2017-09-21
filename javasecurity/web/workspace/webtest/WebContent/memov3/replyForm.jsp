<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/memov3/ssi.jsp" %>
<%
	int memono = Integer.parseInt(request.getParameter("memono"));
	MemoDTO dto = dao.replyRead(memono);
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
div{
	text-align:center;
	margin-top:20px;
	margin-bottom:20px;
}
table{
width:50%;
margin: 0 auto;
}
table,th,td{
border:1px solid black;
border-collapse:collapse;
}



</style> 
<link href = "<%=root %>/css/style.css" rel = "stylesheet" type = "text/css">
</head> 
<body> 
<jsp:include page="/menu/top.jsp"/>
<div class="title">답변</div>
<form name="frm" method="post" action="./replyProc.jsp">
<input type="hidden" name="memono" value="<%=memono %>">
<input type="hidden" name="grpno" value="<%=dto.getGrpno() %>">
<input type="hidden" name="indent" value="<%=dto.getIndent() %>">
<input type="hidden" name="ansnum" value="<%=dto.getAnsnum() %>">
<table>
<tr>
<th>제목</th>
<td>
<input type="text" name="title" size="30" value="<%=dto.getTitle()%>"/>
</td>
</tr>
<tr>
<th>내용</th>
<td>
<textarea rows="10" cols="30" name="content" ></textarea>
</td>
</tr>
</table>
<div class="bottom">
<input type="submit"value="전송">
</div>
</form>
<jsp:include page="/menu/bottom.jsp"/>
</body> 
</html> 